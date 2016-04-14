package Bencher::Scenario::Accessors::Construction;

# DATE
# VERSION

use Bencher::ScenarioUtil::Accessors;

my $classes = \%Bencher::ScenarioUtil::Accessors::classes;

our $scenario = {
    summary => 'Benchmark object construction',
    modules => {
        'Perl::Examples::Accessors' => {version=>0.05},
    },
    participants => [
        map {
            my $spec = $classes->{$_};
            +{
                name => $spec->{generator} || $spec->{name},
                module => $_,
                code_template => "${_}->new",
            };
        } keys %$classes,
    ],
    include_result_size => 1,
};

1;
# ABSTRACT:

=head1 SEE ALSO
