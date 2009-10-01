package PerlJobs::Schema::Result::Job;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp", "EncodedColumn", "Core");
__PACKAGE__->table("job");
__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    default_value => "nextval('job_id_seq'::regclass)",
    is_nullable => 0,
    size => 4,
  },
  "job_title",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "company_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "contact_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "notes",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "description",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "experience",
  {
    data_type => "numeric",
    default_value => undef,
    is_nullable => 1,
    size => "0,2",
  },
  "no_required",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "no_filled",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "status",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
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
__PACKAGE__->add_unique_constraint("job_pkey", ["id"]);
__PACKAGE__->belongs_to(
  "contact_id",
  "PerlJobs::Schema::Result::Contact",
  { id => "contact_id" },
);
__PACKAGE__->belongs_to(
  "updated_by",
  "PerlJobs::Schema::Result::Users",
  { id => "updated_by" },
);
__PACKAGE__->belongs_to(
  "created_by",
  "PerlJobs::Schema::Result::Users",
  { id => "created_by" },
);
__PACKAGE__->belongs_to(
  "company_id",
  "PerlJobs::Schema::Result::Company",
  { id => "company_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-09-29 22:09:32
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:adG3+rjKmdh3cboGGl0UjA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
