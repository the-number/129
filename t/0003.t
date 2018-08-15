
use strict;
use Test;

BEGIN { plan  tests => 5, todo => [3,4,5]}

print "# Do something\n";

ok "0003", "0003";

ok sub {
   open(A, ">0003.dat") || die $!;
   print A "\x{e0000}";
   close A;
   my $b = -s '0003.dat';
   unlink '0003.dat' or warn "Can't unlink : $!";
   return $b;
},
4
;

ok(1,2);
ok(2,4);
ok(3,5);


