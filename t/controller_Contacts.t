use strict;
use warnings;
use Test::More tests => 3;

BEGIN { use_ok 'Catalyst::Test', 'PerlJobs' }
BEGIN { use_ok 'PerlJobs::Controller::Contacts' }

ok( request('/contacts')->is_success, 'Request should succeed' );


