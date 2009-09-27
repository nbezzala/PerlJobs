package PerlJobs::Form::Field::User;

use HTML::FormHandler::Moose;
extends 'HTML::FormHandler::Field::Compound';

has_field 'first_name' => ( type => 'Text' );
has_field 'last_name' => ( type => 'Text' );
has_field 'email_address' => ( type => 'Email' );
has_field 'username' => ( type => 'Text' );

no HTML::FormHandler::Moose;
1;