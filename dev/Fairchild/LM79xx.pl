#!/usr/bin/perl
use strict;
use warnings;

foreach my $v (5, 8, 9, 10, 12, 15, 18) {
    foreach my $t ("CT") {

        my $pn = sprintf("LM79%02d%s", $v, $t);

        my $fh;
        open($fh, ">", "Fairchild/${pn}");
        print $fh <<"EOT";
attr    footprint=TO220AB.fp
attr    pinmap=GND=1
attr    pinmap=INP=2
attr    pinmap=OUT=3
attr    manuf=Fairchild
attr    manuf-pn=${pn}
attr    digikey-pn=${pn}-ND
attr    mouser-pn=512-${pn}
EOT
        close($fh);
    }
}

