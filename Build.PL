
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  "build_requires" => {
    "Module::Build" => "0.3601"
  },
  "configure_requires" => {
    "Module::Build" => "0.3601"
  },
  "dist_abstract" => "Convert TBX-Min to TBX-Basic\r",
  "dist_author" => [
    "Nathan Glenn <garfieldnate\@gmail.com>"
  ],
  "dist_name" => "Convert-TBX-Min",
  "dist_version" => "0.05",
  "license" => "perl",
  "module_name" => "Convert::TBX::Min",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "Exporter::Easy" => 0,
    "TBX::Min" => "0.06",
    "XML::Twig" => 0,
    "XML::Writer" => 0,
    "perl" => "5.006",
    "strict" => 0,
    "warnings" => 0
  },
  "script_files" => [
    "bin/min2basic"
  ],
  "test_requires" => {
    "Capture::Tiny" => 0,
    "Data::Section::Simple" => 0,
    "Devel::FindPerl" => 0,
    "File::Find" => 0,
    "File::Temp" => 0,
    "FindBin" => 0,
    "Path::Tiny" => 0,
    "Test::Base" => 0,
    "Test::LongString" => 0,
    "Test::More" => "0.88",
    "Test::NoWarnings" => 0,
    "Test::XML" => 0
  }
);


unless ( eval { Module::Build->VERSION(0.4004) } ) {
  my $tr = delete $module_build_args{test_requires};
  my $br = $module_build_args{build_requires};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
