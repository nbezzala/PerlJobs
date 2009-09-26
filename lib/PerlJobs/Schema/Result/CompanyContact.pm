package PerlJobs::Schema::Result::CompanyContact;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp", "EncodedColumn", "Core");
__PACKAGE__->table("company_contact");
__PACKAGE__->add_columns(
  "company_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "contact_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
);
__PACKAGE__->set_primary_key("company_id", "contact_id");
__PACKAGE__->add_unique_constraint("company_contact_pkey", ["company_id", "contact_id"]);
__PACKAGE__->belongs_to(
  "contact_id",
  "PerlJobs::Schema::Result::Contact",
  { id => "contact_id" },
);
__PACKAGE__->belongs_to(
  "company_id",
  "PerlJobs::Schema::Result::Company",
  { id => "company_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-09-23 17:14:31
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:UDoY93tK/38CwTnUe0hDKw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
