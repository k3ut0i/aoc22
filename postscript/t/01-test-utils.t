# -*- mode: perl -*-
use strict;
use warnings;

use Test::More;
my $testutils_cmd = "gsnd -q -dNOSAFER -- ./t/testutils.ps";
chomp(my $testutils_arg = qx{$testutils_cmd hey man howdy});
is($testutils_arg, "(man)", "testutils: argument test");
chomp(my $testutils_def = qx{$testutils_cmd});
is($testutils_def, "/hey-got-default-argument", "testutils: argument default");
done_testing();
