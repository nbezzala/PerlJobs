package PerlJobs::Schema::Result::UserRoles;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp", "EncodedColumn", "Core");
__PACKAGE__->table("user_roles");
__PACKAGE__->add_columns(
  "user_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "role_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
);
__PACKAGE__->set_primary_key("user_id", "role_id");
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


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-09-23 17:14:31
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:igld8Hl2TKliqw/GgGDMnA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
