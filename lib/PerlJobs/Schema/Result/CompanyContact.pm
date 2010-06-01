package PerlJobs::Schema::Result::CompanyContact;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp", "EncodedColumn");

=head1 NAME

PerlJobs::Schema::Result::CompanyContact

=cut

__PACKAGE__->table("company_contact");

=head1 ACCESSORS

=head2 company_id

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 contact_id

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "company_id",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "contact_id",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("company_id", "contact_id");


# Created by DBIx::Class::Schema::Loader v0.07000 @ 2010-06-01 12:40:01
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:i3GoLITETBZAQpzr25jMmw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
