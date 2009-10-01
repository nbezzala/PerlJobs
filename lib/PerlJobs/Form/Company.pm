package PerlJobs::Form::Company;

=head1 NAME

PerlJobs::Controller::Companies - Catalyst Controller

=head1 DESCRIPTION

Create and Edit Company Form.

=head1 METHODS

=cut


use HTML::FormHandler::Moose;
extends 'HTML::FormHandler::Model::DBIC';
with 'HTML::FormHandler::Render::Table';

has '+item_class' => ( default => 'Company' );

has_field 'name' => ( type => 'Text' );

has_field 'address_id' => ( type => '+PerlJobs::Form::Field::Address', label => 'Address' );

has_field 'notes' => ( type => 'TextArea' );

has_field 'submit' => ( type => 'Submit', value => 'Submit' );

no HTML::FormHandler::Moose;

=head1 AUTHOR

Nitish Bezzala (nbezzala@yahoo.com)

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;