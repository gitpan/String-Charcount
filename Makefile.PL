use ExtUtils::MakeMaker;
WriteMakefile(
    NAME         => 'String::Charcount',
    VERSION_FROM => 'lib/String/Charcount.pm',
    PREREQ_PM    => { Exporter => 0 },
    ($] >= 5.005 
      ? (ABSTRACT_FROM => 'lib/String/Charcount.pm') : ()
    ),
);
