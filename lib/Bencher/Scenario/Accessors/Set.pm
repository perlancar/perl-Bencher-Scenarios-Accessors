package Bencher::Scenario::Accessors::Set;

# DATE
# VERSION

use Bencher::ScenarioUtil::Accessors;

my $classes = \%Bencher::ScenarioUtil::Accessors::classes;

our $scenario = {
    summary => 'Benchmark attribute write/set',
    modules => {
    },
    participants => [
        (map {
            my $spec = $classes->{$_};
            +{
                name => $spec->{generator} || $spec->{name},
                module => $_,
                code_template => "state \$o = do { my \$o = ${_}->new; \$o }; \$o->attr1(42)",
            };
        } grep { !$classes->{$_}{immutable} } keys %$classes),

        # also compare with raw hash & array access
        {
            name => 'raw hash access',
            module => 'Perl::Examples::Accessors::Hash',
            code_template => "state \$o = do { my \$o = Perl::Examples::Accessors::Hash->new; \$o }; \$o->{attr1} = 42",
        },
        {
            name => 'raw array access',
            module => 'Perl::Examples::Accessors::Array',
            code_template => "state \$o = do { my \$o = Perl::Examples::Accessors::Array->new; \$o }; \$o->[0] = 42",
        },
    ],
};

1;
# ABSTRACT:

=head1 SEE ALSO
