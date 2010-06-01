package PerlJobs::Schema::Result::Candidate;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp", "EncodedColumn");

=head1 NAME

PerlJobs::Schema::Result::Candidate

=cut

__PACKAGE__->table("candidate");

=head1 ACCESSORS

=head2 id

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 user_id

  data_type: 'integer'
  is_nullable: 1

=head2 job_title

  data_type: 'text'
  is_nullable: 1

=head2 address_id

  data_type: 'integer'
  is_nullable: 1

=head2 notes

  data_type: 'text'
  is_nullable: 1

=head2 experience

  data_type: 'decimal'
  is_nullable: 1
  size: [2,0]

=head2 created_at

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0

=head2 updated_at

  data_type: 'timestamp'
  default_value: '0000-00-00 00:00:00'
  is_nullable: 0

=head2 created_by

  data_type: 'integer'
  is_nullable: 1

=head2 updated_by

  data_type: 'integer'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "bigint",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "user_id",
  { data_type => "integer", is_nullable => 1 },
  "job_title",
  { data_type => "text", is_nullable => 1 },
  "address_id",
  { data_type => "integer", is_nullable => 1 },
  "notes",
  { data_type => "text", is_nullable => 1 },
  "experience",
  { data_type => "decimal", is_nullable => 1, size => [2, 0] },
  "created_at",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 0,
  },
  "updated_at",
  {
    data_type     => "timestamp",
    default_value => "0000-00-00 00:00:00",
    is_nullable   => 0,
  },
  "created_by",
  { data_type => "integer", is_nullable => 1 },
  "updated_by",
  { data_type => "integer", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07000 @ 2010-06-01 12:40:01
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:uZKxleA8bKOUhGVXlIL//w


# You can replace this text with custom content, and it will be preserved on regeneration
__PACKAGE__->add_unique_constraint("candidate_pkey", ["id"]);
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
__PACKAGE__->belongs_to(
  "address_id",
  "PerlJobs::Schema::Result::Address",
  { id => "address_id" },
);
__PACKAGE__->belongs_to(
  "updated_by",
  "PerlJobs::Schema::Result::Users",
  { id => "updated_by" },
);
__PACKAGE__->has_many(
  "resumes",
  "PerlJobs::Schema::Result::Resume",
  { "foreign.candidate_id" => "self.id" },
);

1;
