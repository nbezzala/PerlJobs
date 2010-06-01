package PerlJobs::Schema::Result::Address;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp", "EncodedColumn");

=head1 NAME

PerlJobs::Schema::Result::Address

=cut

__PACKAGE__->table("address");

=head1 ACCESSORS

=head2 id

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 line1

  data_type: 'text'
  is_nullable: 1

=head2 line2

  data_type: 'text'
  is_nullable: 1

=head2 city

  data_type: 'text'
  is_nullable: 1

=head2 state

  data_type: 'text'
  is_nullable: 1

=head2 country

  data_type: 'integer'
  is_nullable: 1

=head2 zip

  data_type: 'text'
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
  "line1",
  { data_type => "text", is_nullable => 1 },
  "line2",
  { data_type => "text", is_nullable => 1 },
  "city",
  { data_type => "text", is_nullable => 1 },
  "state",
  { data_type => "text", is_nullable => 1 },
  "country",
  { data_type => "integer", is_nullable => 1 },
  "zip",
  { data_type => "text", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07000 @ 2010-06-01 12:40:01
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:q/NMWamxPSJ1p3f5eBfQlA


# You can replace this text with custom content, and it will be preserved on regeneration
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

1;
