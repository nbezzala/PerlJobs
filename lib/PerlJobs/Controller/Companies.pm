package PerlJobs::Controller::Companies;

use Moose;

BEGIN { extends 'Catalyst::Controller' };
use PerlJobs::Form::Company;

=head1 NAME

PerlJobs::Controller::Companies - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut

 has 'form' => ( isa => 'PerlJobs::Form::Company', is => 'rw',
       lazy => 1, default => sub { PerlJobs::Form::Company->new } );


=head2 base

Can place common logic to start chained dispatch here

=cut

sub base :Chained('/') :PathPart('companies') :CaptureArgs(0) {
    my ($self, $c) = @_;

    # Store the ResultSet in stash so it's available for other methods
    $c->stash->{resultset} = $c->model('DB::Company');

    # Print a message to the debug log
    $c->log->debug('*** INSIDE BASE METHOD ***');
}

sub edit : Local {
    my ( $self, $c, $company_id ) = @_;

    $c->stash( template => 'companies/edit.tt2',
               form => $self->form ); 

    # Validate and insert/update database 
    return unless $self->form->process( item_id => $company_id,
       params => $c->req->parameters,
       schema => $c->model('DB')->schema ); 

    # Form validated, return to the books list
    $c->flash->{status_msg} = 'Company saved';
    $c->res->redirect($c->uri_for('list'));
}



=head2 index 

=cut

sub index : Private {
    my ( $self, $c ) = @_;

    $c->stash->{companies} = [$c->model('DB::Company')->all];
    $c->stash->{template} = 'companies/list.tt2';
}


=head2 list
    
Display form to collect information for book to create

=cut

sub list :Chained('base') :PathPart('list') :Args(0) {
    my ($self, $c) = @_;

    my $qs = $c->request->params->{qs};
    $qs =~ s/^.*=//g ;
    $qs .= "%";
    
    my $return_text;
    $c->response->body($return_text) unless $qs;

    
#    my @companies = $c->model('DB::Company')->search_like( { name => $qs } );
#    $c->log->debug("*** INSIDE list METHOD *** $#companies");
#    return 1 unless ( $#companies > 0 );
#        
#    foreach my $company (@companies){
#        $return_text .= $company->name . "\t" . $company->id . "\n";
#    }
#
#    $c->response->body($return_text);
    $c->stash->{companies} = [$c->model('DB::Company')->search_like({name => $qs})];
    $c->stash->{template} = 'companies/list.tt2';

}


=cut



=head2 form_create
    
Display form to collect information for book to create

=cut

sub form_create :Chained('base') :PathPart('form_create') :Args(0) {
    my ($self, $c) = @_;

    $c->stash->{template} = 'companies/form_create.tt2';
}


=head2 form_create_do

Take information from form and add to database

=cut

sub form_create_do :Chained('base') :PathPart('form_create_do') :Args(0) {
    my ($self, $c) = @_;

    # Retrieve the values from the form
    my $name    = $c->request->params->{name};

    my $line1    = $c->request->params->{line1}    || '';
    my $line2 = $c->request->params->{line2} || '';
    my $city      = $c->request->params->{city}      || '';
    my $state  = $c->request->params->{state}      || '';
    my $country  = $c->request->params->{country};
    my $zip  = $c->request->params->{zip}      || '';
        
    # Create the Company

    my $address = $c->model('DB::Address')->create({
        line1  	=>       $line1,
        line2  	=>       $line2,
        city    =>       $city,
        state   =>       $state,
        country =>       $country,
        zip     =>       $zip,
    });

    my $company = $c->model('DB::Company')->create({
	    name  => $name,
            address_id => $address->id
        });

    # Store new model object in stash
    $c->stash->{company} = $company;

    # Set the TT template to use
    $c->stash->{template} = 'companies/form_create.tt2';
}


=head1 AUTHOR

A clever guy

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
