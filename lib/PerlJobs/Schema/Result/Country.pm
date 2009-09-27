package PerlJobs::Schema::Result::Country;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp", "EncodedColumn", "Core");
__PACKAGE__->table("country");
__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    default_value => "nextval('country_id_seq'::regclass)",
    is_nullable => 0,
    size => 4,
  },
  "country",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->add_unique_constraint("country_pkey", ["id"]);
__PACKAGE__->has_many(
  "addresses",
  "PerlJobs::Schema::Result::Address",
  { "foreign.country" => "self.id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-09-27 14:52:30
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:pMEIAx31kPBZU4NepWzWyg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
