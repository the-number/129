
use strict;
use Test;

BEGIN { plan  tests => 5, todo => [1, 3, 5]}

print "# Step two: using the frame that is provided to do tests\n";

ok(0); # fail
ok(1); # pass

ok('good','bad'); # fail
ok('yes','yes');  # pass, yes

skip(
  $^O =~ m/linux/ ? 0 : "Skip unless linux",
  1,2 # the argument
);


