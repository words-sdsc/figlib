#!/bin/perl

# fis.pl om-n-mobo-c 20221116.193000 Willowfire

use Time::Local;

$cam=$ARGV[0];
$time=$ARGV[1];
$tag=$ARGV[2];

if($tag eq ""){$tag="FIRE";}

(@v)=split('-',$cam);
$imager=pop(@v);
if(($imager eq "c")||($imager eq "m")){$I=1;}

if($time eq ""){
 printf" fis.pl -- create FIgLib Image Series for fire ignitions\n\n";
 printf" Use \"camera time tag\" for parameters\n";
 printf"  \"camera\" needs the imager chip as part of the name, e.g., wc-e-mobo-c\n";
 printf"  \"time\" of event - needs to read as YYYYMMDD.HHmmss, using a 24 hour clock\n";
 printf"  \"tag\" should be a single-word explanation, preferablty the fire name\n";
 printf"    if \"tag\" is not specified, \"FIRE\" will be used instead\n\n";
 printf" Example: \"fis.pl om-n-mobo-c 20221116.192000)\n";
}

$todir="/Users/iperezx/Documents/figlib/New";
$mlimit=40;             # -/+ minutes
$slimit=$mlimit*60;     # -/+ seconds
$rcount=0;
$nmax=0;
$pmax=0;

($yr,$mo,$dy,$t,$hr,$mi,$sc)=unpack("a4a2a2aa2a2a2",$time);
$tstamp=timelocal($sc,$mi,$hr,$dy,$mo,$yr);
$dstamp=sprintf"%.4d%.2d%.2d",$yr,$mo,$dy;
$qtag=sprintf"Q%d",int($hr/3)+1;
$odir="$todir/$dstamp-$tag-$cam";
system("mkdir -p $todir/$dstamp-$tag-$cam");

if(((($hr/3)-int($hr/3)) == 0) && ($mi < 55)){   # 55-40=15 minutes extra
 $otstamp=$tstamp-(3*60*60);
 ($sc,$mi,$hr,$dy,$mo,$yr,$wday,$yday,$isdat) = localtime($otstamp);
 $odstamp=sprintf"%.4d%.2d%.2d",$yr+1900,$mo,$dy;
 $oqtag=sprintf"Q%d",int($hr/3)+1;
 $O=1;
}

if((($hr/3) - int($hr/3) > 0.5) and ($mi > 5)){  # 60-5-40=15 minutes extra
 $ntstamp=$tstamp+(3*60*60);
 ($sc,$mi,$hr,$dy,$mo,$yr,$wday,$yday,$isdat) = localtime($ntstamp);
 $ndstamp=sprintf"%.4d%.2d%.2d",$yr+1900,$mo,$dy;
 $nqtag=sprintf"Q%d",int($hr/3)+1;
 $N=1;
}

#printf"using $odir\n";
#printf" | $odstamp $oqtag | $dstamp $qtag | $ndstamp $nqtag |\n";

if($O == 1){
 printf "wget -q -e robots=off -r --no-parent -A '*jpg' -nd -P $odir https://hpwren.ucsd.edu/cameras/LTA/$cam/large/$odstamp/$oqtag\n";
 system("wget -q -e robots=off -r --no-parent -A '*jpg' -nd -P $odir https://hpwren.ucsd.edu/cameras/LTA/$cam/large/$odstamp/$oqtag/");
}

printf "wget -q -e robots=off -r --no-parent -A '*jpg' -nd -P $odir https://hpwren.ucsd.edu/cameras/LTA/$cam/large/$dstamp/$qtag\n";
system("wget -q -e robots=off -r --no-parent -A '*jpg' -nd -P $odir https://hpwren.ucsd.edu/cameras/LTA/$cam/large/$dstamp/$qtag/");

if($N == 1){
 printf "wget -q -e robots=off -r --no-parent -A '*jpg' -nd -P $odir https://hpwren.ucsd.edu/cameras/LTA/$cam/large/$ndstamp/$nqtag\n";
 system("wget -q -e robots=off -r --no-parent -A '*jpg' -nd -P $odir https://hpwren.ucsd.edu/cameras/LTA/$cam/large/$ndstamp/$nqtag/");
}

#printf"labelem.py --bbfile bb.csv --image=\"$odir/*.jpg\" &\n";
system("labelem.py --bbfile bb.csv --image=\"$odir/*.jpg\" &");
printf"Enter ignition time as HHmmss (e.g., 172021): ";
$igtime=<STDIN>;
chomp($igtime);

#printf"Ignition at $dstamp $igtime\n";

($iyear,$imonth,$iday)=unpack("A4A2A2",$dstamp);
($ihour,$imin,$isec)=unpack("A2A2A2",$igtime);
$itstamp=timelocal($isec,$imin,$ihour,$iday,$imonth-1,$iyear);
#printf"$dstamp - $igtime: $iyear,$imonth,$iday,$ihour,$imin,$isec - $itstamp\n";

opendir(dir,$odir)||die("$!");
while (($infname = readdir(dir)) ne ""){
 if($infname !~ ".jpg"){next;}
 ($ftstamp,$ext,@r)=split('\.',$infname);
 if($ftstamp =~ ":"){next;}
# printf"$infname $ftstamp - $odir\n";
 if ($ext eq "jpg"){
  if($ftstamp > 1000000000){
   $offset=$ftstamp-$itstamp;
   if($offset > $slimit){
    unlink("$odir/$infname");
   }elsif($offset < -$slimit){
    unlink("$odir/$infname");
   }else{
    if($nmax > $offset){$nmax=$offset;}
    if($pmax < $offset){$pmax=$offset;}
    if($offset >= 0){
     $nfname=sprintf("%d_+%05d.jpg",$ftstamp,$offset);
    }else{
     $nfname=sprintf("%d_%06d.jpg",$ftstamp,$offset);
    }
    rename("$odir/$infname","$odir/$nfname");
    $rcount++;

    printf"$itstamp - $ftstamp - $ftstamp.$ext - $offset - $nfname\n";
   }
  }
 }
}

printf"Total number of retained images is $rcount: $nmax to $pmax seconds\n";

system("ffmpeg -framerate 4 -pattern_type glob -i \"$odir/*.jpg\" -vcodec libx264 -pix_fmt yuv420p -crf 21 -threads 0 -metadata title=HPWREN $odir/$dstamp-$tag-$cam.mp4");
