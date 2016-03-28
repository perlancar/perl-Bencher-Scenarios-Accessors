package Bencher::Scenario::Accessors::Construction;

# DATE
# VERSION

use Bencher::ScenarioUtil::Accessors;

my $classes = \%Bencher::ScenarioUtil::Accessors::classes;

our $scenario = {
    summary => 'Benchmark object construction',
    modules => {
    },
    participants => [
        map {
            my $spec = $classes->{$_};
            +{
                name => $_,
                module => $_,
                code_template => "${_}->new",
            };
        } keys %$classes,
    ],
};

1;
# ABSTRACT:

=head1 SEE ALSO
