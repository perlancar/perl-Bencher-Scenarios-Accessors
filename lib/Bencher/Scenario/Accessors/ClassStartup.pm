package Bencher::Scenario::Accessors::ClassStartup;

# DATE
# VERSION

use Bencher::ScenarioUtil::Accessors;

my $classes = \%Bencher::ScenarioUtil::Accessors::classes;

our $scenario = {
    summary => 'Benchmark startup of classes using various accessor generators',
    module_startup => 1,
    modules => {
    },
    participants => [
        map {
            #my $spec = $classes->{$_};
            +{ module=>$_ };
        } keys %$classes,
    ],
};

1;
# ABSTRACT:

=head1 SEE ALSO
