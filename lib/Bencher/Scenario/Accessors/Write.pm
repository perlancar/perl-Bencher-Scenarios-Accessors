package Bencher::Scenario::Accessors::Write;

# DATE
# VERSION

use Bencher::ScenarioUtil::Accessors;

my $classes = \%Bencher::ScenarioUtil::Accessors::classes;

our $scenario = {
    summary => 'Benchmark attribute read',
    modules => {
    },
    participants => [
        map {
            my $spec = $classes->{$_};
            +{
                name => $_,
                module => $_,
                code_template => "state \$o = do { my \$o = ${_}->new; \$o }; \$o->attr1(42)",
            };
        } grep { !$classes->{$_}{immutable} } keys %$classes,
    ],
};

1;
# ABSTRACT:

=head1 SEE ALSO
