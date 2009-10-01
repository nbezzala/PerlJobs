package PerlJobs::Schema::Result::Resume;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp", "EncodedColumn", "Core");
__PACKAGE__->table("resume");
__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    default_value => "nextval('resume_id_seq'::regclass)",
    is_nullable => 0,
    size => 4,
  },
  "candidate_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "resume",
  {
    data_type => "bytea",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->add_unique_constraint("resume_pkey", ["id"]);
__PACKAGE__->belongs_to(
  "candidate_id",
  "PerlJobs::Schema::Result::Candidate",
  { id => "candidate_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-09-29 22:09:32
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:aCGp5HPwZHAMR6oyfcQqfg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
