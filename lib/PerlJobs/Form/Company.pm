package PerlJobs::Form::Company;

use HTML::FormHandler::Moose;
extends 'HTML::FormHandler::Model::DBIC';
with 'HTML::FormHandler::Render::Table';

has_field 'name' => ( type => 'Text' );

has_field 'address_id' => ( type => '+PerlJobs::Form::Field::Address', label => 'Address' );

has_field 'submit' => ( type => 'Submit', value => 'Submit' );

no HTML::FormHandler::Moose;
1;