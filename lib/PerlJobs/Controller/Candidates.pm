package PerlJobs::Controller::Candidates;

use strict;
use warnings;
use base 'Catalyst::Controller';

=head1 NAME

PerlJobs::Controller::Candidates - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index 

=cut

sub index : Private {
    my ( $self, $c ) = @_;

    $c->response->body('Matched PerlJobs::Controller::Candidates in Candidates.');
}

=head2 list 

=cut

sub list : Local {
    my ( $self, $c ) = @_;

	$c->stash->{candidates} = [$c->model('DB::Candidate')->all];
	$c->stash->{template} = 'candidates/list.tt2';
}

=head2 form_create
    
Display form to collect information for book to create

=cut

sub form_create :Chained('base') :PathPart('form_create') :Args(0) {
    my ($self, $c) = @_;

    $c->stash->{template} = 'candidates/form_create.tt2';
}

=head2 base

Can place common logic to start chained dispatch here

=cut

sub base :Chained('/') :PathPart('candidates') :CaptureArgs(0) {
    my ($self, $c) = @_;

    # Store the ResultSet in stash so it's available for other methods
    $c->stash->{resultset} = $c->model('DB::Candidate');

    # Print a message to the debug log
    $c->log->debug('*** INSIDE BASE METHOD ***');
}

=head2 form_create_do

Take information from form and add to database

=cut

sub form_create_do :Chained('base') :PathPart('form_create_do') :Args(0) {
    my ($self, $c) = @_;

    # Retrieve the values from the form
    my $first_name    = $c->request->params->{first_name}    || '';
    my $last_name = $c->request->params->{last_name} || '';
    my $job_title      = $c->request->params->{job_title}      || '';
    my $email_address  = $c->request->params->{email_address}      || '';
    my $line1    = $c->request->params->{line1}    || '';
    my $line2 = $c->request->params->{line2} || '';
    my $city      = $c->request->params->{city}      || '';
    my $state  = $c->request->params->{state}      || '';
    my $country  = $c->request->params->{country};
    my $zip  = $c->request->params->{zip}      || '';
        
    # Create the Candidate
    my $user = $c->model('DB::Users')->create({
            first_name   => $first_name,
            last_name   => $last_name,
            email_address   => $email_address,
        });

    my $address = $c->model('DB::Address')->create({
        line1  =>       $line1,
        line2  =>       $line2,
        city    =>       $city,
        state   =>       $state,
        country =>       $country,
        zip     =>       $zip,
    });

    my $candidate = $c->model('DB::Candidate')->create({
	    job_title  => $job_title,
            user_id => $user->id,
            address_id => $address->id
        });
    # Handle relationship with author
#    $book->add_to_book_authors({author_id => $author_id});
    # Note: Above is a shortcut for this:
    # $book->create_related('book_authors', {author_id => $author_id});

    # Store new model object in stash
    $c->stash->{candidate} = $candidate;

    # Avoid Data::Dumper issue mentioned earlier
    # You can probably omit this
    $Data::Dumper::Useperl = 1;

    # Set the TT template to use
    $c->stash->{template} = 'candidates/form_create.tt2';
}


=head1 AUTHOR

A clever guy

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
