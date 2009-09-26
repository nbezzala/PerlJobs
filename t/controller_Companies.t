use strict;
use warnings;
use Test::More tests => 3;

BEGIN { use_ok 'Catalyst::Test', 'PerlJobs' }
BEGIN { use_ok 'PerlJobs::Controller::Companies' }

ok( request('/companies')->is_redirect, 'Request should succeed' );


