package PerlJobs::Form::Field::Address;

use HTML::FormHandler::Moose;
extends 'HTML::FormHandler::Field::Compound';

has_field 'line1' => ( type => 'Text' );
has_field 'line2' => ( type => 'Text' );
has_field 'city' => ( type => 'Text' );
has_field 'state' => ( type => 'Text' );
has_field 'country' => ( type => 'Text' );
has_field 'zip' => ( type => 'Text' );

no HTML::FormHandler::Moose;
1;