package PerlJobs::Model::DB;

use strict;
use base 'Catalyst::Model::DBIC::Schema';

__PACKAGE__->config(
    schema_class => 'PerlJobs::Schema',
    
    connect_info => {
        dsn => 'dbi:mysql:dbname=perljobs',
        user => 'catappuser',
        password => 'nitish',
    }
);

=head1 NAME

PerlJobs::Model::DB - Catalyst DBIC Schema Model

=head1 SYNOPSIS

See L<PerlJobs>

=head1 DESCRIPTION

L<Catalyst::Model::DBIC::Schema> Model using schema L<PerlJobs::Schema>

=head1 GENERATED BY

Catalyst::Helper::Model::DBIC::Schema - 0.29

=head1 AUTHOR

A clever guy

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
