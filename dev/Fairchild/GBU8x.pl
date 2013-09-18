#!/usr/bin/perl
use strict;
use warnings;

foreach my $t ("A", "B", "D", "G", "J", "K", "M") {
    my $pn = sprintf("GBU8%s", $t);

    my $fh;
    open($fh, ">", "Fairchild/${pn}");
    print $fh <<"EOT";
attr    footprint=d-gbu.fp
attr    pinmap=P=1
attr    pinmap=AC1=2
attr    pinmap=AC2=3
attr    pinmap=N=4
attr    manuf=Fairchild
attr    manuf-pn=${pn}
attr    digikey-pn=${pn}FS-ND
attr    mouser-pn=512-${pn}
EOT
    close($fh);
}
