package PerlJobs::View::TT;

use strict;
use base 'Catalyst::View::TT';

__PACKAGE__->config(
		TEMPLATE_EXTENSION => '.tt2',
		INCLUDE_PATH => [ PerlJobs->path_to('root', 'src') ],
		WRAPPER => 'wrapper.tt2',
		);

=head1 NAME

PerlJobs::View::TT - TT View for PerlJobs

=head1 DESCRIPTION

TT View for PerlJobs. 

=head1 SEE ALSO

L<PerlJobs>

=head1 AUTHOR

A clever guy

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
