# Fire Ignition Library
This page provides access to the HPWREN Fire Ignition image Library (FIgLib), usually based on sequences of wildland fire images as seen from fixed cameras at HPWREN sites. It contains hundreds of such sequences of different fires or different cameras, where a camera may even be separate imagers for color, or monochrome with more light and near-IR sensitivity.

This data is provided as-is, no guarantees for anything is included.

The primary purpose of this large archive, many gigabytes in size, is the creation of baseline data sets for 40 minutes before and after individual fire ignitions for neural network training, specifically AI-based detections of wildland fire ignitions based of content within a single or across multiple images. For illustration purposes full resolution MP4 video animations per individual data set are included as well. The image file names for the principal data set are:

origin_timestamp _ offset_(sec)_from_visible_plume_appearance .jpg
While we are making the data publicly available, its use requires a credit reference to "http://hpwren.ucsd.edu/" in derivative work. We encourage people and projects working with the data to contact us via the feedback form on the main HPWREN web site about what the archive is being used for.

Reference: http://hpwren.ucsd.edu/HPWREN-FIgLib/

## Command Line Interface Usage
Currently we have [Hans-Werber Braun's](http://hpwren.ucsd.edu/~hwb/bio.html) Pearl command line interface tool to get images from [HPWREN](http://hpwren.ucsd.edu/).

Basic usage:
```
perl fis.pl CAMERA TIME FIRE_NAME
```
where the input command line arguments are the following:
- CAMERA: HPWREN camera following the same naming convetion as [LTA](https://hpwren.ucsd.edu/cameras/LTA/)
- TIME: YYYYMMDD.HHmmss, using a 24 hour clock
- FIRE_NAME: name of the current fire (user-defined)

Example:
```
perl fis.pl om-n-mobo-c 20221116.193000 Willowfire
```

Expected behavior:
- Run a wget command
- Download all the images from query (CAMERA and TIME)
- Prompts the user with the ignition time in the following format: HHmmss
- Change the name of each jpg file with _+/- based on the ignition time
- Generate a mp4 from all the images (+/- 40 from the igition time)

Example of successful output:
```
perl fis.pl om-n-mobo-c 20221116.193000 Willowfire 
wget -q -e robots=off -r --no-parent -A '*jpg' -nd -P ~/figlib/New/20221116-Willowfire-om-n-mobo-c https://hpwren.ucsd.edu/cameras/LTA/om-n-mobo-c/large/20221116/Q7
Enter ignition time as HHmmss (e.g., 172021): sh: labelem.py: command not found
1930000
1668655800 - 1668657235 - 1668657235.jpg - 1435 - 1668657235_+01435.jpg
1668655800 - 1668656274 - 1668656274.jpg - 474 - 1668656274_+00474.jpg
1668655800 - 1668655794 - 1668655794.jpg - -6 - 1668655794_-00006.jpg
1668655800 - 1668653454 - 1668653454.jpg - -2346 - 1668653454_-02346.jpg
1668655800 - 1668654893 - 1668654893.jpg - -907 - 1668654893_-00907.jpg
1668655800 - 1668655193 - 1668655193.jpg - -607 - 1668655193_-00607.jpg
1668655800 - 1668655554 - 1668655554.jpg - -246 - 1668655554_-00246.jpg
1668655800 - 1668657353 - 1668657353.jpg - 1553 - 1668657353_+01553.jpg
1668655800 - 1668654114 - 1668654114.jpg - -1686 - 1668654114_-01686.jpg
1668655800 - 1668654713 - 1668654713.jpg - -1087 - 1668654713_-01087.jpg
1668655800 - 1668653875 - 1668653875.jpg - -1925 - 1668653875_-01925.jpg
1668655800 - 1668656514 - 1668656514.jpg - 714 - 1668656514_+00714.jpg
1668655800 - 1668655974 - 1668655974.jpg - 174 - 1668655974_+00174.jpg
1668655800 - 1668654473 - 1668654473.jpg - -1327 - 1668654473_-01327.jpg
1668655800 - 1668656933 - 1668656933.jpg - 1133 - 1668656933_+01133.jpg
1668655800 - 1668655433 - 1668655433.jpg - -367 - 1668655433_-00367.jpg
1668655800 - 1668657054 - 1668657054.jpg - 1254 - 1668657054_+01254.jpg
1668655800 - 1668655913 - 1668655913.jpg - 113 - 1668655913_+00113.jpg
1668655800 - 1668654953 - 1668654953.jpg - -847 - 1668654953_-00847.jpg
1668655800 - 1668654774 - 1668654774.jpg - -1026 - 1668654774_-01026.jpg
1668655800 - 1668655133 - 1668655133.jpg - -667 - 1668655133_-00667.jpg
1668655800 - 1668653754 - 1668653754.jpg - -2046 - 1668653754_-02046.jpg
1668655800 - 1668655494 - 1668655494.jpg - -306 - 1668655494_-00306.jpg
1668655800 - 1668656994 - 1668656994.jpg - 1194 - 1668656994_+01194.jpg
1668655800 - 1668653813 - 1668653813.jpg - -1987 - 1668653813_-01987.jpg
1668655800 - 1668655735 - 1668655735.jpg - -65 - 1668655735_-00065.jpg
1668655800 - 1668656214 - 1668656214.jpg - 414 - 1668656214_+00414.jpg
1668655800 - 1668654413 - 1668654413.jpg - -1387 - 1668654413_-01387.jpg
1668655800 - 1668657293 - 1668657293.jpg - 1493 - 1668657293_+01493.jpg
1668655800 - 1668655254 - 1668655254.jpg - -546 - 1668655254_-00546.jpg
1668655800 - 1668654835 - 1668654835.jpg - -965 - 1668654835_-00965.jpg
1668655800 - 1668653633 - 1668653633.jpg - -2167 - 1668653633_-02167.jpg
1668655800 - 1668654174 - 1668654174.jpg - -1626 - 1668654174_-01626.jpg
1668655800 - 1668656574 - 1668656574.jpg - 774 - 1668656574_+00774.jpg
1668655800 - 1668656035 - 1668656035.jpg - 235 - 1668656035_+00235.jpg
1668655800 - 1668656814 - 1668656814.jpg - 1014 - 1668656814_+01014.jpg
1668655800 - 1668656633 - 1668656633.jpg - 833 - 1668656633_+00833.jpg
1668655800 - 1668653993 - 1668653993.jpg - -1807 - 1668653993_-01807.jpg
1668655800 - 1668654233 - 1668654233.jpg - -1567 - 1668654233_-01567.jpg
1668655800 - 1668656154 - 1668656154.jpg - 354 - 1668656154_+00354.jpg
1668655800 - 1668654594 - 1668654594.jpg - -1206 - 1668654594_-01206.jpg
1668655800 - 1668655853 - 1668655853.jpg - 53 - 1668655853_+00053.jpg
1668655800 - 1668657113 - 1668657113.jpg - 1313 - 1668657113_+01313.jpg
1668655800 - 1668654354 - 1668654354.jpg - -1446 - 1668654354_-01446.jpg
1668655800 - 1668655314 - 1668655314.jpg - -486 - 1668655314_-00486.jpg
1668655800 - 1668653573 - 1668653573.jpg - -2227 - 1668653573_-02227.jpg
1668655800 - 1668656393 - 1668656393.jpg - 593 - 1668656393_+00593.jpg
1668655800 - 1668656754 - 1668656754.jpg - 954 - 1668656754_+00954.jpg
1668655800 - 1668657474 - 1668657474.jpg - 1674 - 1668657474_+01674.jpg
1668655800 - 1668655673 - 1668655673.jpg - -127 - 1668655673_-00127.jpg
1668655800 - 1668655074 - 1668655074.jpg - -726 - 1668655074_-00726.jpg
1668655800 - 1668656693 - 1668656693.jpg - 893 - 1668656693_+00893.jpg
1668655800 - 1668654053 - 1668654053.jpg - -1747 - 1668654053_-01747.jpg
1668655800 - 1668656453 - 1668656453.jpg - 653 - 1668656453_+00653.jpg
1668655800 - 1668656335 - 1668656335.jpg - 535 - 1668656335_+00535.jpg
1668655800 - 1668654534 - 1668654534.jpg - -1266 - 1668654534_-01266.jpg
1668655800 - 1668653514 - 1668653514.jpg - -2286 - 1668653514_-02286.jpg
1668655800 - 1668655373 - 1668655373.jpg - -427 - 1668655373_-00427.jpg
1668655800 - 1668657174 - 1668657174.jpg - 1374 - 1668657174_+01374.jpg
1668655800 - 1668655015 - 1668655015.jpg - -785 - 1668655015_-00785.jpg
1668655800 - 1668656093 - 1668656093.jpg - 293 - 1668656093_+00293.jpg
1668655800 - 1668657414 - 1668657414.jpg - 1614 - 1668657414_+01614.jpg
1668655800 - 1668654653 - 1668654653.jpg - -1147 - 1668654653_-01147.jpg
1668655800 - 1668654294 - 1668654294.jpg - -1506 - 1668654294_-01506.jpg
1668655800 - 1668655613 - 1668655613.jpg - -187 - 1668655613_-00187.jpg
1668655800 - 1668653934 - 1668653934.jpg - -1866 - 1668653934_-01866.jpg
1668655800 - 1668656873 - 1668656873.jpg - 1073 - 1668656873_+01073.jpg
Total number of retained images is 67: -2346 to 1674 seconds
ffmpeg version 5.1.2 Copyright (c) 2000-2022 the FFmpeg developers
  built with Apple clang version 14.0.0 (clang-1400.0.29.102)
  configuration: --prefix=/usr/local/Cellar/ffmpeg/5.1.2 --enable-shared --enable-pthreads --enable-version3 --cc=clang --host-cflags= --host-ldflags= --enable-ffplay --enable-gnutls --enable-gpl --enable-libaom --enable-libbluray --enable-libdav1d --enable-libmp3lame --enable-libopus --enable-librav1e --enable-librist --enable-librubberband --enable-libsnappy --enable-libsrt --enable-libtesseract --enable-libtheora --enable-libvidstab --enable-libvmaf --enable-libvorbis --enable-libvpx --enable-libwebp --enable-libx264 --enable-libx265 --enable-libxml2 --enable-libxvid --enable-lzma --enable-libfontconfig --enable-libfreetype --enable-frei0r --enable-libass --enable-libopencore-amrnb --enable-libopencore-amrwb --enable-libopenjpeg --enable-libspeex --enable-libsoxr --enable-libzmq --enable-libzimg --disable-libjack --disable-indev=jack --enable-videotoolbox
  libavutil      57. 28.100 / 57. 28.100
  libavcodec     59. 37.100 / 59. 37.100
  libavformat    59. 27.100 / 59. 27.100
  libavdevice    59.  7.100 / 59.  7.100
  libavfilter     8. 44.100 /  8. 44.100
  libswscale      6.  7.100 /  6.  7.100
  libswresample   4.  7.100 /  4.  7.100
  libpostproc    56.  6.100 / 56.  6.100
Input #0, image2, from '/Users/iperezx/Documents/figlib/New/20221116-Willowfire-om-n-mobo-c/*.jpg':
  Duration: 00:00:16.75, start: 0.000000, bitrate: N/A
  Stream #0:0: Video: mjpeg (Baseline), yuvj420p(pc, bt470bg/unknown/unknown), 3072x2048 [SAR 72:72 DAR 3:2], 4 fps, 4 tbr, 4 tbn
Stream mapping:
  Stream #0:0 -> #0:0 (mjpeg (native) -> h264 (libx264))
Press [q] to stop, [?] for help
[swscaler @ 0x7fbd60120000] [swscaler @ 0x7fbd480f0000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd60120000] [swscaler @ 0x7fbd28318000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd60120000] [swscaler @ 0x7fbd28340000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd60120000] [swscaler @ 0x7fbd28350000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd60120000] [swscaler @ 0x7fbd28360000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd60120000] [swscaler @ 0x7fbd28370000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd60120000] [swscaler @ 0x7fbd28380000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd60120000] [swscaler @ 0x7fbd28390000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd60120000] [swscaler @ 0x7fbd283a0000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd60120000] [swscaler @ 0x7fbd283b0000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd60120000] [swscaler @ 0x7fbd283c0000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd60120000] [swscaler @ 0x7fbd283d0000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd60120000] [swscaler @ 0x7fbd283e0000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd60120000] [swscaler @ 0x7fbd283f0000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd60120000] [swscaler @ 0x7fbd28400000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd60120000] [swscaler @ 0x7fbd28410000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd60120000] [swscaler @ 0x7fbd28420000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd60120000] [swscaler @ 0x7fbd58708000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd60120000] [swscaler @ 0x7fbd58718000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd60120000] [swscaler @ 0x7fbd58728000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd60120000] [swscaler @ 0x7fbd58738000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd60120000] [swscaler @ 0x7fbd58748000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd60120000] [swscaler @ 0x7fbd58758000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd60120000] [swscaler @ 0x7fbd58768000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd60120000] [swscaler @ 0x7fbd58778000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd60120000] [swscaler @ 0x7fbd58788000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd60120000] [swscaler @ 0x7fbd58798000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd60120000] [swscaler @ 0x7fbd587a8000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd60120000] [swscaler @ 0x7fbd587b8000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd60120000] [swscaler @ 0x7fbd587c8000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd60120000] [swscaler @ 0x7fbd587d8000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd60120000] [swscaler @ 0x7fbd18008000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd60120000] [swscaler @ 0x7fbd18030000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd60120000] [swscaler @ 0x7fbd480f0000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd480f0000] [swscaler @ 0x7fbd68158000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd480f0000] [swscaler @ 0x7fbd68040000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd480f0000] [swscaler @ 0x7fbd68050000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd480f0000] [swscaler @ 0x7fbd68060000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd480f0000] [swscaler @ 0x7fbd68180000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd480f0000] [swscaler @ 0x7fbd68190000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd480f0000] [swscaler @ 0x7fbd681a0000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd480f0000] [swscaler @ 0x7fbd681b0000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd480f0000] [swscaler @ 0x7fbd681c0000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd480f0000] [swscaler @ 0x7fbd681d0000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd480f0000] [swscaler @ 0x7fbd681e0000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd480f0000] [swscaler @ 0x7fbd681f0000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd480f0000] [swscaler @ 0x7fbd68200000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd480f0000] [swscaler @ 0x7fbd68210000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd480f0000] [swscaler @ 0x7fbd68220000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd480f0000] [swscaler @ 0x7fbd68230000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd480f0000] [swscaler @ 0x7fbd58708000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd58708000] [swscaler @ 0x7fbd500b0000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd58708000] [swscaler @ 0x7fbd500d8000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd58708000] [swscaler @ 0x7fbd500e8000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd58708000] [swscaler @ 0x7fbd500f8000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd58708000] [swscaler @ 0x7fbd50108000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd58708000] [swscaler @ 0x7fbd50118000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd58708000] [swscaler @ 0x7fbd50128000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd58708000] [swscaler @ 0x7fbd50138000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd58708000] [swscaler @ 0x7fbd50148000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd58708000] [swscaler @ 0x7fbd50158000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd58708000] [swscaler @ 0x7fbd50168000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd58708000] [swscaler @ 0x7fbd50178000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd58708000] [swscaler @ 0x7fbd50188000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd58708000] [swscaler @ 0x7fbd50198000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd58708000] [swscaler @ 0x7fbd501a8000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd58708000] [swscaler @ 0x7fbd18030000] deprecated pixel format used, make sure you did set range correctly
[swscaler @ 0x7fbd58708000] [swscaler @ 0x7fbd18020000] deprecated pixel format used, make sure you did set range correctly
[libx264 @ 0x7fbd777120c0] using SAR=1/1
[libx264 @ 0x7fbd777120c0] using cpu capabilities: MMX2 SSE2Fast SSSE3 SSE4.2 AVX FMA3 BMI2 AVX2
[libx264 @ 0x7fbd777120c0] profile High, level 5.1, 4:2:0, 8-bit
[libx264 @ 0x7fbd777120c0] 264 - core 164 r3095 baee400 - H.264/MPEG-4 AVC codec - Copyleft 2003-2022 - http://www.videolan.org/x264.html - options: cabac=1 ref=3 deblock=1:0:0 analyse=0x3:0x113 me=hex subme=7 psy=1 psy_rd=1.00:0.00 mixed_ref=1 me_range=16 chroma_me=1 trellis=1 8x8dct=1 cqm=0 deadzone=21,11 fast_pskip=1 chroma_qp_offset=-2 threads=24 lookahead_threads=4 sliced_threads=0 nr=0 decimate=1 interlaced=0 bluray_compat=0 constrained_intra=0 bframes=3 b_pyramid=2 b_adapt=1 b_bias=0 direct=1 weightb=1 open_gop=0 weightp=2 keyint=250 keyint_min=4 scenecut=40 intra_refresh=0 rc_lookahead=40 rc=crf mbtree=1 crf=21.0 qcomp=0.60 qpmin=0 qpmax=69 qpstep=4 ip_ratio=1.40 aq=1:1.00
Output #0, mp4, to '/Users/iperezx/Documents/figlib/New/20221116-Willowfire-om-n-mobo-c/20221116-Willowfire-om-n-mobo-c.mp4':
  Metadata:
    title           : HPWREN
    encoder         : Lavf59.27.100
  Stream #0:0: Video: h264 (avc1 / 0x31637661), yuv420p(tv, bt470bg/unknown/unknown, progressive), 3072x2048 [SAR 1:1 DAR 3:2], q=2-31, 4 fps, 16384 tbn
    Metadata:
      encoder         : Lavc59.37.100 libx264
    Side data:
      cpb: bitrate max/min/avg: 0/0/0 buffer size: 0 vbv_delay: N/A
frame=   67 fps=7.8 q=-1.0 Lsize=   16969kB time=00:00:16.00 bitrate=8688.2kbits/s speed=1.86x    
video:16967kB audio:0kB subtitle:0kB other streams:0kB global headers:0kB muxing overhead: 0.010590%
[libx264 @ 0x7fbd777120c0] frame I:2     Avg QP:11.62  size:343930
[libx264 @ 0x7fbd777120c0] frame P:20    Avg QP:12.54  size:247457
[libx264 @ 0x7fbd777120c0] frame B:45    Avg QP:14.07  size:260819
[libx264 @ 0x7fbd777120c0] consecutive B-frames:  9.0%  3.0%  4.5% 83.6%
[libx264 @ 0x7fbd777120c0] mb I  I16..4: 10.1% 86.2%  3.7%
[libx264 @ 0x7fbd777120c0] mb P  I16..4: 12.6% 60.3%  0.7%  P16..4: 11.6%  7.4%  4.9%  0.0%  0.0%    skip: 2.5%
[libx264 @ 0x7fbd777120c0] mb B  I16..4:  1.1% 41.3%  0.5%  B16..8: 16.8% 16.7%  7.4%  direct:12.8%  skip: 3.3%  L0:52.5% L1:40.5% BI: 7.1%
[libx264 @ 0x7fbd777120c0] 8x8 transform intra:89.8% inter:92.1%
[libx264 @ 0x7fbd777120c0] coded y,uvDC,uvAC intra: 80.2% 68.3% 39.5% inter: 47.7% 62.9% 18.9%
[libx264 @ 0x7fbd777120c0] i16 v,h,dc,p: 85% 10%  5%  1%
[libx264 @ 0x7fbd777120c0] i8 v,h,dc,ddl,ddr,vr,hd,vl,hu: 17% 18% 53%  3%  1%  1%  1%  2%  3%
[libx264 @ 0x7fbd777120c0] i4 v,h,dc,ddl,ddr,vr,hd,vl,hu: 39% 32% 15%  3%  2%  2%  2%  2%  2%
[libx264 @ 0x7fbd777120c0] i8c dc,h,v,p: 46% 27% 25%  2%
[libx264 @ 0x7fbd777120c0] Weighted P-Frames: Y:0.0% UV:0.0%
[libx264 @ 0x7fbd777120c0] ref P L0: 39.6%  2.8% 33.5% 24.1%
[libx264 @ 0x7fbd777120c0] ref B L0: 60.7% 29.4% 10.0%
[libx264 @ 0x7fbd777120c0] ref B L1: 81.1% 18.9%
[libx264 @ 0x7fbd777120c0] kb/s:8297.96
```
