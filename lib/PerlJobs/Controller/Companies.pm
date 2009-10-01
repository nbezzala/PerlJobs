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
    $c->log->debug('*** INSIDE Company BASE METHOD ***');
}

=head2 edit

Create or edit a company.

=cut

sub edit : Local {
    my ( $self, $c, $company_id ) = @_;

    $c->stash( template => 'companies/edit.tt2',
               form => $self->form ); 

    # Validate and insert/update database 
    return unless $self->form->process( item_id => $company_id,
       params => $c->req->parameters,
       schema => $c->model('DB')->schema ); 

    # Form validated, return to the companies list
    $c->flash->{status_msg} = 'Company saved';
    $c->res->redirect($c->uri_for("list"));
}
=head2 list 

Lists all the companies.
 
=cut

sub list : Local {
    my ( $self, $c ) = @_;

    $c->stash->{companies} = [$c->model('DB::Company')->all];
    $c->stash->{template} = 'companies/list.tt2';
}

=head2 index 

Company default page. Not sure if we really need this...

=cut

sub index : Private {
    my ( $self, $c ) = @_;

    $c->res->redirect($c->uri_for("list"));
}


=head2 list
    
Returns plain text company list.
Used for autocomplete, on Create Contact page.

=cut

sub autocomplete :Chained('base') :PathPart('list') :Args(0) {
    my ($self, $c) = @_;

    my $qs = $c->request->params->{qs};
    $qs =~ s/^.*=//g ;
    
    $qs .= "%";
    my $return_text;
    
    my @companies = $c->model('DB::Company')->search( { name => { -like => $qs } } );
        
    foreach my $company (@companies){
        $return_text .= $company->name . "\t" . $company->id . "\n";
    }
    
    if (!$return_text) {
            $return_text = " ";
    }
    $c->log->debug("*** INSIDE list METHOD *** $#companies  *** $qs");    
    $c->response->body($return_text);
}

=head2 contacts 

Lists all the contacts of the company.

=cut

sub contacts :Chained('base') :PathPart('contacts') :Args(1) {
    my ( $self, $c, $company_id ) = @_;

    $c->stash->{form} = $self->form;
    $c->stash->{contacts} = [$c->model('DB::Company')->find($company_id)->contacts];
    $c->stash->{template} = 'companies/main.tt2';
    return unless $self->form->process( item_id => $company_id,
    params => $c->req->parameters,
    schema => $c->model('DB')->schema ); 

}


=head1 AUTHOR

Nitish Bezzala (nbezzala@yahoo.com)

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
