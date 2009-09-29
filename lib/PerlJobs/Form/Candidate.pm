package PerlJobs::Form::Candidate;

=head1 NAME

PerlJobs::Controller::Companies - Catalyst Controller

=head1 DESCRIPTION

Create and Edit Candidate.

=head1 METHODS

=cut


use HTML::FormHandler::Moose;
extends 'HTML::FormHandler::Model::DBIC';
with 'HTML::FormHandler::Render::Table';

has '+item_class' => ( default => 'Candidate' );

has_field 'user_id' => ( type => '+PerlJobs::Form::Field::User', label => 'User' );
has_field 'address_id' => ( type => '+PerlJobs::Form::Field::Address', label => 'Address' );
has_field 'job_title' => ( type => 'Text' );


has_field 'submit' => ( type => 'Submit', value => 'Submit' );

no HTML::FormHandler::Moose;

=head1 AUTHOR

Nitish Bezzala (nbezzala@yahoo.com)

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;