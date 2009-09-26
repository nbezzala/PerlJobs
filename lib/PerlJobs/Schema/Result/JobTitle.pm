package PerlJobs::Schema::Result::JobTitle;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp", "EncodedColumn", "Core");
__PACKAGE__->table("job_title");
__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    default_value => "nextval('job_title_id_seq'::regclass)",
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
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->add_unique_constraint("job_title_pkey", ["id"]);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-09-23 17:14:31
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:o2gkZZhq2DbrPFr10dx5Kw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
