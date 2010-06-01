package PerlJobs::Schema::Result::Users;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp", "EncodedColumn");

=head1 NAME

PerlJobs::Schema::Result::Users

=cut

__PACKAGE__->table("users");

=head1 ACCESSORS

=head2 id

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 username

  data_type: 'text'
  is_nullable: 1

=head2 password

  data_type: 'text'
  is_nullable: 1

=head2 email_address

  data_type: 'text'
  is_nullable: 1

=head2 first_name

  data_type: 'text'
  is_nullable: 1

=head2 last_name

  data_type: 'text'
  is_nullable: 1

=head2 active

  data_type: 'integer'
  is_nullable: 1

=head2 created

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 0

=head2 updated

  data_type: 'timestamp'
  default_value: '0000-00-00 00:00:00'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "bigint",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "username",
  { data_type => "text", is_nullable => 1 },
  "password",
  { data_type => "text", is_nullable => 1 },
  "email_address",
  { data_type => "text", is_nullable => 1 },
  "first_name",
  { data_type => "text", is_nullable => 1 },
  "last_name",
  { data_type => "text", is_nullable => 1 },
  "active",
  { data_type => "integer", is_nullable => 1 },
  "created",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 0,
  },
  "updated",
  {
    data_type     => "timestamp",
    default_value => "0000-00-00 00:00:00",
    is_nullable   => 0,
  },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07000 @ 2010-06-01 12:40:01
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:zkRvWrcfCwD2TTir446l3g


# You can replace this text with custom content, and it will be preserved on regeneration
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
  "job_updated_bies",
  "PerlJobs::Schema::Result::Job",
  { "foreign.updated_by" => "self.id" },
);
__PACKAGE__->has_many(
  "job_created_bies",
  "PerlJobs::Schema::Result::Job",
  { "foreign.created_by" => "self.id" },
);
__PACKAGE__->has_many(
  "user_roles",
  "PerlJobs::Schema::Result::UserRoles",
  { "foreign.user_id" => "self.id" },
);

1;
