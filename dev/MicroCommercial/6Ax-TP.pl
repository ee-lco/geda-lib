#!/usr/bin/perl
use strict;
use warnings;

foreach my $t ("05", "1", "2", "4", "6", "8", "10") {
    my $pn = sprintf("6A%s-TP", $t);

    my $fh;
    open($fh, ">", "MicroCommercial/${pn}");
    print $fh <<"EOT";
attr    footprint=D_AXIAL_800.fp
attr    pinmap=A=1
attr    pinmap=K=2
attr    manuf=Micro Commercial Components
attr    manuf-pn=${pn}
attr    digikey-pn=${pn}MSCT-ND
attr    mouser-pn=833-${pn}
EOT
    close($fh);
}
