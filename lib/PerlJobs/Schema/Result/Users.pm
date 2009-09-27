package PerlJobs::Schema::Result::Users;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp", "EncodedColumn", "Core");
__PACKAGE__->table("users");
__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    default_value => "nextval('users_id_seq'::regclass)",
    is_nullable => 0,
    size => 4,
  },
  "username",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "password",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "email_address",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "first_name",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "last_name",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "active",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "created",
  {
    data_type => "timestamp without time zone",
    default_value => "now()",
    is_nullable => 0,
    size => 8,
  },
  "updated",
  {
    data_type => "timestamp without time zone",
    default_value => undef,
    is_nullable => 1,
    size => 8,
  },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->add_unique_constraint("users_pkey", ["id"]);
__PACKAGE__->has_many(
  "candidate_created_bies",
  "PerlJobs::Schema::Result::Candidate",
  { "foreign.created_by" => "self.id" },
);
__PACKAGE__->has_many(
  "candidate_user_ids",
  "PerlJobs::Schema::Result::Candidate",
  { "foreign.user_id" => "self.id" },
);
__PACKAGE__->has_many(
  "candidate_updated_bies",
  "PerlJobs::Schema::Result::Candidate",
  { "foreign.updated_by" => "self.id" },
);
__PACKAGE__->has_many(
  "company_updated_bies",
  "PerlJobs::Schema::Result::Company",
  { "foreign.updated_by" => "self.id" },
);
__PACKAGE__->has_many(
  "company_created_bies",
  "PerlJobs::Schema::Result::Company",
  { "foreign.created_by" => "self.id" },
);
__PACKAGE__->has_many(
  "contact_updated_bies",
  "PerlJobs::Schema::Result::Contact",
  { "foreign.updated_by" => "self.id" },
);
__PACKAGE__->has_many(
  "contact_created_bies",
  "PerlJobs::Schema::Result::Contact",
  { "foreign.created_by" => "self.id" },
);
__PACKAGE__->has_many(
  "contact_user_ids",
  "PerlJobs::Schema::Result::Contact",
  { "foreign.user_id" => "self.id" },
);
__PACKAGE__->has_many(
  "user_roles",
  "PerlJobs::Schema::Result::UserRoles",
  { "foreign.user_id" => "self.id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-09-27 14:52:30
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:kN9SKAsWxeTfdoRX1/gTag


# You can replace this text with custom content, and it will be preserved on regeneration
1;
