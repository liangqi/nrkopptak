#!/usr/bin/perl
######################
#
#
#     Open
#     Terminal
#     App
#
#
######################

use strict;
use Term::ANSIColor;

my $cwd = $0;
$cwd =~ s/^(.*)\/(.*?)\.command$/$1/;
my $name = $2;

chdir($cwd);

my $c1 = color('bold red');
my $c0 = color('reset');

my $cmd;
if ($name !~ /^TermApp$/i) {
  $cmd = lc($name);
}

my $homebin = "$ENV{HOME}/bin";
my $path = $ENV{PATH};
$path = "$homebin:$path";

system(qq(
  PATH="$path"
  echo \$PATH
  echo 
  $cmd
  echo "$c1$name"
  pwd
  echo "----------------------------------------------------------------------"
  echo "$c0"
  bash
));


