use ExtUtils::MakeMaker;
WriteMakefile(
    DISTNAME     => 'String-Charcount',
    NAME         => 'String::Charcount',
    VERSION_FROM => 'lib/String/Charcount.pm',
    PREREQ_PM    => { Exporter => 0 },
    'dist'       => { COMPRESS => 'gzip', SUFFIX => 'gz' },
    ($] >= 5.005 
      ? (ABSTRACT_FROM => 'lib/String/Charcount.pm') : ()
    ),
);
