package PerlJobs::Schema::Result::Address;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp", "EncodedColumn", "Core");
__PACKAGE__->table("address");
__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    default_value => "nextval('address_id_seq'::regclass)",
    is_nullable => 0,
    size => 4,
  },
  "line1",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "line2",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "city",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "state",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "country",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "zip",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->add_unique_constraint("address_pkey", ["id"]);
__PACKAGE__->belongs_to(
  "country",
  "PerlJobs::Schema::Result::Country",
  { id => "country" },
);
__PACKAGE__->has_many(
  "candidates",
  "PerlJobs::Schema::Result::Candidate",
  { "foreign.address_id" => "self.id" },
);
__PACKAGE__->has_many(
  "companies",
  "PerlJobs::Schema::Result::Company",
  { "foreign.address_id" => "self.id" },
);
__PACKAGE__->has_many(
  "contacts",
  "PerlJobs::Schema::Result::Contact",
  { "foreign.address_id" => "self.id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-09-29 22:09:32
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Q0vHYHJOpQMWhMeXFuvc8w


# You can replace this text with custom content, and it will be preserved on regeneration
1;
