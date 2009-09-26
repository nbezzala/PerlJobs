use strict;
use warnings;
use Test::More tests => 3;

BEGIN { use_ok 'Catalyst::Test', 'PerlJobs' }
BEGIN { use_ok 'PerlJobs::Controller::Logout' }

ok( request('/logout')->is_redirect, 'Request should succeed' );


