package PerlJobs::Controller::Contacts;

use Moose;

BEGIN { extends 'Catalyst::Controller' };
use PerlJobs::Form::Contact;

=head1 NAME

PerlJobs::Controller::Contacts - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut

has 'form' => ( isa => 'PerlJobs::Form::Contact', is => 'rw',
       lazy => 1, default => sub { PerlJobs::Form::Contact->new } );


=head2 index 

=cut

sub index : Private {
    my ( $self, $c ) = @_;

	$c->stash->{contacts} = [$c->model('DB::Contact')->all];
	$c->stash->{templates} = 'contacts/index.tt2';
}

=head2 base

Can place common logic to start chained dispatch here

=cut

sub base :Chained('/') :PathPart('contacts') :CaptureArgs(0) {
    my ($self, $c) = @_;

    # Store the ResultSet in stash so it's available for other methods
    $c->stash->{resultset} = $c->model('DB::Contact');

    # Print a message to the debug log
    $c->log->debug('*** INSIDE BASE METHOD ***');
}


=head2 edit

Create or edit a contact.

=cut

sub edit : Local {
    my ( $self, $c, $contact_id ) = @_;

    $c->stash( template => 'contacts/edit.tt2',
               form => $self->form ); 
 
    # Validate and insert/update database 
    return unless $self->form->process( item_id => $contact_id,
       params => $c->req->parameters,
       schema => $c->model('DB')->schema ); 

    # Form validated, return to the books list
    $c->flash->{status_msg} = 'Contact saved';
    $c->res->redirect($c->uri_for('contacts'));
}



=head1 AUTHOR

A clever guy

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
