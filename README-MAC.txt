
NRK-OPPTAK / NRK-RECORDER

README - Mac Bundle

=============================================================================

AUTOMATIC INSTALLATION
HELPER COMMANDS
MANUAL INSTALLATION
REQUIREMENTS
FILES
LICENSE AND SOURCE CODE

=============================================================================

Download videos/audio from tv.nrk.no, radio.nrk.no, nrk.no/skole and
www.nrk.no.

This script comes in three versions:

  nrk-recorder    English
  nrk-opptak      Norwegian nynorsk
  nrk-opptaker    Norwegian bokmål

You can install all three or just the one in your favourite language.


-----------------------------------------------------------------------------
AUTOMATIC INSTALLATION

1. Double-click the GPAC package and copy Osmo4.app to the Applications
   folder. Optional, but highly recommended for MP4 files.

2. Double-click the Mkvtoolnix package and copy Mkvtoolnix.app to the
   Applications folder. Optional, but recommended for MKV files.   
   
3. Double-click the MacInstaller.command (or run it in a Terminal window).

4. Optionally install one or more of the helper commands (see below).

This will install nrk-recorder in /usr/local/bin.

The installer will not install ffmpeg and mediainfo if you have this
installed already.


-----------------------------------------------------------------------------
HELPER COMMANDS

In the folder 'helpers' there are three commands (one for each version of
the script). These opens a terminal window in the folder where they are
placed, and displays a helper screen.

Drag these (or the one you'd like) into the folder you want to use for the
downloads.


-----------------------------------------------------------------------------
MANUAL INSTALLATION

The following scripts/programs should be put somewhere in your search path:

  nrk-opptak
  nrk-opptaker
  nrk-recorder
  AdobeHDS.php
  ffmpeg
  mediainfo

A good place would be /usr/local/bin.
They can also run from the current directory.

Change directory to the bin folder and try running this command to get a
list of possible instal locations (labelled 'Search paths'):

  ./nrk-opptak t

You also need to install MKV ToolNix. Double click the Mkvtoolnix package and
copy Mkvtoolnix.app to the /Applications folder.

You also need to install GPAC (MP4Box). Double click the GPAC package and
copy Osmo4.app to the /Applications folder.


-----------------------------------------------------------------------------
REQUIREMENTS

Video:
  AdobeHDS.php
    https://raw.github.com/K-S-V/Scripts/master/AdobeHDS.php
  php (with curl)
    http://php.org/

MP4:
  ffmpeg
    http://ffmpeg.org/
  MP4Box (GPAC)
    Optional but recommended for MP4 files. Used for subtitles and chapters.

MKV:
  ffmpeg
    http://ffmpeg.org/
  mkvmerge (MKV ToolNix)
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
FILES - MacOSX Bundle

README.txt
CHANGES.txt
License.txt
MacInstaller.command
MKVToolNix (installer)
GPAC (installer)
bin:
  nrk-opptak
  nrk-opptaker
  nrk-recorder
  AdobeHDS.php
  ffmpeg
  mediainfo
helpers:
  NRK-Opptak.command
  NRK-Opptaker.command
  NRK-Recorder.command


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

