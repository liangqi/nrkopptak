#!/usr/bin/perl

use strict;

##############################################################################

my $NAME = 'NRK-OPPTAK';

my $INSTALL_LOCATION = '/usr/local/bin';

my %FILES = (
  'nrk-opptak'      => { update=>1 },
  'nrk-opptaker'    => { update=>1 },
  'nrk-recorder'    => { update=>1 },
  'AdobeHDS.php'    => { update=>1 },
  'ffmpeg'          => { update=>0, skip_if_which=>1 },
  'mediainfo'       => { update=>0, skip_if_which=>1 },
);

my $DIR = 'bin';

my $TRY_SUDO = 1;

##############################################################################

my $script_path = $0;
$script_path =~ s/^(.*)\/.*?$/$1/;

`clear`;
print "\n";

print "This will install $NAME in $INSTALL_LOCATION.\n\n";


if ($ENV{USER} ne 'root' && $TRY_SUDO) {
  print "This installer must be run as an Administrator.\n";
  print "Type in your password and press ENTER.\n";
  print "\n>>> You will not see your password as you type <<<\n";
  system(qq( sudo $0 ));
  exit;
}

die "You must run this installation script as an Administrator ($ENV{USER}).\n\n"
  unless $ENV{USER} eq 'root';


print "$NAME\n\n";
print "Installing to $INSTALL_LOCATION\n\n";


# Can we find our 'bin' directory?
die "Can't find files to install. Directory 'bin' is missing.\n"
  unless -d "$script_path/bin";
  

# Make sure INSTALL_LOCATION exists
unless (-e $INSTALL_LOCATION) {
  mkdir ($INSTALL_LOCATION);
}

my $errors;


foreach my $file (sort keys %FILES) {

  printf("%30s: ", $file);

  my $sourcefile = "$script_path/$DIR/$file";
  my $destfile = "$INSTALL_LOCATION/$file";

  if (!-e $sourcefile) {
    warn "Error.\nCould not find file $sourcefile. Skipping this file.\n";
    $errors++;
    next;
  }

  if ($FILES{$file}{skip_if_which}) {
    my $which = `which "$file"`;
    chomp $which;
    if ($which) {
      print "Already installed as $which. Skipping.\n";
      next;
    }
  }

  if (-e $destfile) {
    if ($FILES{$file}{update}) {
      print "Updating $destfile\n";
    } else {
      warn "Already installed. Skipping.\n";
      next;
    }
  } else {
    print "Installing.\n";
  }
  
  if ( system(qq( cp "$sourcefile" "$destfile" )) != 0 ) {
    warn "\nError copying $sourcefile to $destfile!\n\n";
    $errors++;
  }

}

print "\n";

if ($errors) {
  warn "\n> > > $errors ERRORS! This did not work out as planned! < < <\n\n"
} else {
  print "No errors.\n";
}

print "\nDone.\n\n";

print "                    === Remember to also install MKV ToolNix ===\n\n"
  unless -e '/Applications/Mkvtoolnix.app/Contents/MacOS/mkvmerge';

print "                    === Remember to also install MP4Box (GPAC) ===\n\n"
  unless -e '/Applications/Osmo4.app/Contents/MacOS/MP4Box';





