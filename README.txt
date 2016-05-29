
NRK-OPPTAK / NRK-RECORDER

README

=============================================================================

INSTALL
REQUIREMENTS
NOTES
  Linux
  Mac
  Windows
FILES
LICENSE AND SOURCE CODE
USAGE

=============================================================================

Download videos/audio from tv.nrk.no, radio.nrk.no, nrk.no/skole and
www.nrk.no. Creates mp4 or mkv video files with embedded subtitles and
chapters where available.

This script comes in three versions:

  nrk-recorder    English
  nrk-opptak      Norwegian nynorsk
  nrk-opptaker    Norwegian bokmål

You can install all three or just the one in your favourite language.

-----------------------------------------------------------------------------
INSTALL

The following scripts should be put somewhere in the search path ($PATH):

  nrk-opptak
  nrk-opptaker
  nrk-recorder
  AdobeHDS.php

A good place would be /usr/local/bin.
They can also run from the current directory.

You can run this command to get a list of possible instal locations:

  ./nrk-opptak t

or:

  perl nrk-opptak t


You also need to install FFmpeg (or avconv), MP4Box (GPAC) and mkvmerge
(MKV ToolNix). See notes below.

The programs ffmpeg, MP4Box and mkvmerge must be somewhere in PATH,
in the current directory or in the same location as the nrk-* scripts.


-----------------------------------------------------------------------------
REQUIREMENTS

See notes for packages and binaries.

Video:
  AdobeHDS.php (bundled)
    https://raw.github.com/K-S-V/Scripts/master/AdobeHDS.php
  php (with curl)
    http://php.org/

MP4:
  ffmpeg or avconv
    avconv (Libav) is used debian/ubuntu instead of ffmpeg.
    http://ffmpeg.org/
  MP4Box (GPAC)
    Optional but recommended for MP4 files. Used for subtitles and chapters.
    http://gpac.wp.mines-telecom.fr/

MKV:
  ffmpeg or avconv
    avconv (Libav) is used debian/ubuntu instead of ffmpeg.
    http://ffmpeg.org/
  mkvmerge (MKV ToolNix).
    http://www.bunkus.org/videotools/mkvtoolnix/

Other:
  If mediainfo is available we use this to get the duration of the video.
  If not we try ffmpeg.

The script will try to auto-detect what dependencies are available.
This includes the following:
    php
    AdobeHDS.php
    ffmpeg
    mkvmerge
    MP4Box
    mediainfo

 Search for these are done in this order:
    Current directory
    which (executable somewhere in $PATH, not on Windows)
    Script directory (where this script is located)
    ~/bin
    ~
    /
    C:/

We also try to detect avconv before searching for ffmpeg.
avconv *must* be in $PATH to work.

PHP is also searched for in /PHP and C:/PHP.  

On Mac we also search for mkvmerge and MP4Box in the Mkvtoolnix and Osmo4
apps in /Applications and ~/Applications.
     

-----------------------------------------------------------------------------
NOTES

General

Place AdobeHDS.php in the same folder
as this script (like /usr/local/bin or somewhere else).

Programs (php, perl, ffmpeg/avconv, mkvmerge, MP4Box, mediainfo) should be 
in PATH or in one of the directories listed above. For linux 
and mac we try to fail gracefully when a program is not available. If
ffmpeg/avconv is missing we will fallback to keeping the flv file. If mkvmerge
or MP4Box are not found we will not be able to embed subtitles/chapters in the
mp4 and/or mkv files.


Linux

Should work. For Debian/Ubuntu we try to detect and
use avconv before falling back to ffmpeg.

Tested on Ubuntu 12.04 LTS.

On Debian and Ubuntu the following command will install all dependencies:

  sudo apt-get install php5 php5-curl libav-tools gpac mkvtoolnix mediainfo


Mac

Bundle available. But here's the details:

Get ffmpeg here: http://ffmpegmac.net 
        or here: http://www.evermeet.cx/ffmpeg/

The MacPorts version of mkvmerge (mkvtoolnix) is currently broken. But you
can get a binary from here: http://www.downloadbestsoft.com/MKVToolNix.html

MP4Box (GPAC) is available here: http://gpac.wp.mines-telecom.fr/

I think all perl modules currently in use comes with OS X. If not then you need
to do this in a terminal window:

  sudo cpan -i LWP::UserAgent HTML::Entities Text::Wrap Term::ANSIColor URI::Escape

You'll need Xcode installed (from AppStore).

PHP is most likely already installed.

Mac users can get mediainfo from here:
http://mediainfo.sourceforge.net/en/Download/Mac_OS
MediaInfo from AppStore will not work.

Tested on MacOSX 10.8 (Mountain Lion)


Windows

No gracefullness or fallbacks. If something is missing the result is undefined.
I don't have a windows computer so I can't do any testing.

FFmpeg, MKV ToolNix, MP4Box and mediainfo should be easy to install. 
PHP and Perl might be a bigger issue, I don't know.


-----------------------------------------------------------------------------
FILES - MacOSX Bundle

README.txt
CHANGES.txt
COMPAT.txt
License.txt
bin:
  nrk-opptak
  nrk-opptaker
  nrk-recorder
  AdobeHDS.php


-----------------------------------------------------------------------------
LICENSE AND SOURCE CODE

NRK-Opptaker is released under the GNU General Public License version 3
(GPLv3). Source code is self-contained.

The source code for the following third party applications are available
at these locations:

  AdobeHDS.php (GPL, self-contained)
  https://github.com/K-S-V/
  
  FFmpeg (GPL)
  http://ffmpeg.org/
  
  MKVToolNix (GPL)
  http://www.bunkus.org/videotools/mkvtoolnix/
  
  GPAC (LGPL)
  http://gpac.wp.mines-telecom.fr/
  
  MediaInfo (LGPLv2)
  http://mediainfo.sourceforge.net




