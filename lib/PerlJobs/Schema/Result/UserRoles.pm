package PerlJobs::Schema::Result::UserRoles;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp", "EncodedColumn");

=head1 NAME

PerlJobs::Schema::Result::UserRoles

=cut

__PACKAGE__->table("user_roles");

=head1 ACCESSORS

=head2 user_id

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 role_id

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "user_id",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "role_id",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("user_id", "role_id");


# Created by DBIx::Class::Schema::Loader v0.07000 @ 2010-06-01 12:40:01
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:AlM3NLwi9fy58f0DLCg6Yw


# You can replace this text with custom content, and it will be preserved on regeneration
__PACKAGE__->add_unique_constraint("user_roles_pkey", ["user_id", "role_id"]);
__PACKAGE__->belongs_to(
  "user_id",
  "PerlJobs::Schema::Result::Users",
  { id => "user_id" },
);
__PACKAGE__->belongs_to(
  "role_id",
  "PerlJobs::Schema::Result::Roles",
  { id => "role_id" },
);

1;
