package PerlJobs::Schema::Result::Contact;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp", "EncodedColumn", "Core");
__PACKAGE__->table("contact");
__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    default_value => "nextval('contact_id_seq'::regclass)",
    is_nullable => 0,
    size => 4,
  },
  "user_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "job_title",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "address_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "created_at",
  {
    data_type => "timestamp without time zone",
    default_value => "now()",
    is_nullable => 0,
    size => 8,
  },
  "updated_at",
  {
    data_type => "timestamp without time zone",
    default_value => undef,
    is_nullable => 1,
    size => 8,
  },
  "created_by",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "updated_by",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->add_unique_constraint("contact_pkey", ["id"]);
__PACKAGE__->has_many(
  "company_contacts",
  "PerlJobs::Schema::Result::CompanyContact",
  { "foreign.contact_id" => "self.id" },
);
__PACKAGE__->belongs_to(
  "updated_by",
  "PerlJobs::Schema::Result::Users",
  { id => "updated_by" },
);
__PACKAGE__->belongs_to(
  "address_id",
  "PerlJobs::Schema::Result::Address",
  { id => "address_id" },
);
__PACKAGE__->belongs_to(
  "created_by",
  "PerlJobs::Schema::Result::Users",
  { id => "created_by" },
);
__PACKAGE__->belongs_to(
  "user_id",
  "PerlJobs::Schema::Result::Users",
  { id => "user_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-09-27 14:52:30
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:F+zWxQduywXPSuYIpA1pgA


# You can replace this text with custom content, and it will be preserved on regeneration
__PACKAGE__->many_to_many(
  "company_contacts" => "PerlJobs::Schema::Result::CompanyContact",
  "contact_id"
);

1;
