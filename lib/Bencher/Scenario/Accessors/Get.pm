package Bencher::Scenario::Accessors::Get;

# AUTHORITY
# DATE
# DIST
# VERSION

use 5.010001;
use strict;
use warnings;

use Bencher::ScenarioUtil::Accessors;

my $classes = \%Bencher::ScenarioUtil::Accessors::classes;

our $scenario = {
    summary => 'Benchmark attribute read/get',
    modules => {
        # include the generator modules here so we can show their versions in
        # sample benchmark results produced by PWP:Bencher::Scenario
        (map { $_=>0 } grep {defined} map { $classes->{$_}{generator} }
             keys %$classes),
    },
    participants => [
        (map {
            my $spec = $classes->{$_};
            my $supports_setters = $spec->{supports_setters} // 1;
            +{
                name => $spec->{generator} || $spec->{name},
                module => $_,
                code_template => $supports_setters ?
                    "state \$o = do { my \$o = ${_}->new; \$o->".($spec->{setter_name} // "attr1")."(42); \$o }; \$o->attr1" :
                    "state \$o = do { my \$o = ${_}->new(attr1 => 42); \$o }; \$o->attr1",
            };
        } grep { !$classes->{$_}{immutable} } keys %$classes),

        # also compare with raw hash & array access
        {
            name => 'raw hash access',
            module => 'Perl::Examples::Accessors::Hash',
            code_template => "state \$o = do { my \$o = Perl::Examples::Accessors::Hash->new; \$o->attr1(42); \$o }; \$o->{attr1}",
        },
        {
            name => 'raw array access',
            module => 'Perl::Examples::Accessors::Array',
            code_template => "state \$o = do { my \$o = Perl::Examples::Accessors::Array->new; \$o->attr1(42); \$o }; \$o->[0]",
        },
    ],
    result => 42,
};

1;
# ABSTRACT:

=head1 SEE ALSO
