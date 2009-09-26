use inc::Module::Install;

name 'PerlJobs';
all_from 'lib\PerlJobs.pm';

requires 'Catalyst::Runtime' => '5.80007';
requires 'Catalyst::Plugin::ConfigLoader';
requires 'Catalyst::Plugin::Static::Simple';
requires 'Catalyst::Action::RenderView';
requires 'YAML'; # This should reflect the config file format you've chosen
                 # See Catalyst::Plugin::ConfigLoader for supported formats

requires 'Catalyst::Plugin::StackTrace';

requires (
        'Catalyst::Plugin::Authentication' => '0',
        'Catalyst::Plugin::Session' => '0',
        'Catalyst::Plugin::Session::Store::FastMmap' => '0',
        'Catalyst::Plugin::Session::State::Cookie' => '0',
);

catalyst;

install_script glob('script/*.pl');
auto_install;
WriteAll;
