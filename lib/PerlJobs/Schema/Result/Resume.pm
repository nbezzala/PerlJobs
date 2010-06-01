package PerlJobs::Schema::Result::Resume;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp", "EncodedColumn");

=head1 NAME

PerlJobs::Schema::Result::Resume

=cut

__PACKAGE__->table("resume");

=head1 ACCESSORS

=head2 id

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 candidate_id

  data_type: 'integer'
  is_nullable: 1

=head2 resume

  data_type: 'blob'
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
  "candidate_id",
  { data_type => "integer", is_nullable => 1 },
  "resume",
  { data_type => "blob", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07000 @ 2010-06-01 12:40:01
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:aoH+5X0yXiNEzDz52duF7w


# You can replace this text with custom content, and it will be preserved on regeneration
__PACKAGE__->add_unique_constraint("resume_pkey", ["id"]);
__PACKAGE__->belongs_to(
  "candidate_id",
  "PerlJobs::Schema::Result::Candidate",
  { id => "candidate_id" },
);

1;
