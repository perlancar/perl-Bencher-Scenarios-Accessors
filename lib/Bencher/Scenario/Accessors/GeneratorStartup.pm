package Bencher::Scenario::Accessors::GeneratorStartup;

# DATE
# VERSION

use Bencher::ScenarioUtil::Accessors;

my $classes = \%Bencher::ScenarioUtil::Accessors::classes;

our $scenario = {
    summary => 'Benchmark startup of various accessor generators',
    module_startup => 1,
    modules => {
    },
    participants => [
        map {
            my $spec = $classes->{$_};
            +{ (module=>$spec->{generator}) x !!$spec->{generator} };
        } keys %$classes,
    ],
};

1;
# ABSTRACT:

=head1 SEE ALSO
