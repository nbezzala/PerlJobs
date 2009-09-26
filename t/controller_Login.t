use strict;
use warnings;
use Test::More tests => 3;

BEGIN { use_ok 'Catalyst::Test', 'PerlJobs' }
BEGIN { use_ok 'PerlJobs::Controller::Login' }

ok( request('/login')->is_success, 'Request should succeed' );


