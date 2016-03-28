package Bencher::ScenarioUtil::Accessors;

# DATE
# VERSION

our %classes = (
    'Perl::Examples::Accessors::Hash'                 => {backend=>'hash'  , immutable=>0, generator=>undef},
    'Perl::Examples::Accessors::Array'                => {backend=>'array' , immutable=>0, generator=>undef},
    'Perl::Examples::Accessors::Scalar'               => {backend=>'scalar', immutable=>1, generator=>undef},
    'Perl::Examples::Accessors::Mo'                   => {backend=>'hash'  , immutable=>0, generator=>'Mo'},
    'Perl::Examples::Accessors::Moo'                  => {backend=>'hash'  , immutable=>0, generator=>'Moo'},
    'Perl::Examples::Accessors::Moose'                => {backend=>'hash'  , immutable=>0, generator=>'Moose'},
    'Perl::Examples::Accessors::Mouse'                => {backend=>'hash'  , immutable=>0, generator=>'Mouse'},
    'Perl::Examples::Accessors::ClassAccessor'        => {backend=>'hash'  , immutable=>0, generator=>'Class::Accessor'},
    'Perl::Examples::Accessors::ClassAccessorArray'   => {backend=>'array' , immutable=>0, generator=>'Class::Accessor::Array'},
    #'Perl::Examples::Accessors::ClassAccessorArrayGlob' => {backend=>'array' , immutable=>0, generator=>'Class::Accessor::Array::Glob'},
    #'Perl::Examples::Accessors::ClassBuildArrayGlob'  => {backend=>'array'  , immutable=>0, generator=>'Class::Build::Array::Glob'},
    'Perl::Examples::Accessors::ClassXSAccessor'      => {backend=>'hash'  , immutable=>0, generator=>'Class::XSAccessor'},
    'Perl::Examples::Accessors::ClassXSAccessorArray' => {backend=>'array' , immutable=>0, generator=>'Class::XSAccessor::Array'},
);

our %attrs = (
    attr1 => {is=>'rw'},
);

1;
# ABSTRACT: Utility routines
