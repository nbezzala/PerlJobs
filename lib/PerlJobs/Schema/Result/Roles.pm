package PerlJobs::Schema::Result::Roles;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp", "EncodedColumn", "Core");
__PACKAGE__->table("roles");
__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    default_value => "nextval('roles_id_seq'::regclass)",
    is_nullable => 0,
    size => 4,
  },
  "role",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->add_unique_constraint("roles_pkey", ["id"]);
__PACKAGE__->has_many(
  "user_roles",
  "PerlJobs::Schema::Result::UserRoles",
  { "foreign.role_id" => "self.id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-09-29 22:09:33
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:1bWl4M6ko3AuUAnSKDqoYA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
