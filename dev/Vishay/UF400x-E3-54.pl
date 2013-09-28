#!/usr/bin/perl
use strict;
use warnings;

foreach my $t ("1", "2", "3", "4", "5", "6", "7") {
    my $pn = sprintf("UF400%s", $t);

    my $fh;
    open($fh, ">", "Vishay/${pn}-E3-54");
    print $fh <<"EOT";
attr    footprint=D_DO_41.fp
attr    pinmap=A=1
attr    pinmap=K=2
attr    manuf=Vishay General Semiconductor
attr    manuf-pn=${pn}-E3/54
attr    digikey-pn=${pn}-E3/54GICT-ND
attr    mouser-pn=625-${pn}-E3
EOT
    close($fh);
}
