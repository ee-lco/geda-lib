#!/usr/bin/perl
use strict;
use warnings;

foreach my $v (5, 6, 8, 9, 10, 12, 15, 18, 24) {
    foreach my $t ("CT", "ACT") {

        my $pn = sprintf("LM78%02d%s", $v, $t);

        my $fh;
        open($fh, ">", "Fairchild/${pn}");
        print $fh <<"EOT";
attr    footprint=to220ab.fp
attr    pinmap=INP=1
attr    pinmap=GND=2
attr    pinmap=OUT=3
attr    manuf=Fairchild
attr    manuf-pn=${pn}
attr    digikey-pn=${pn}-ND
attr    mouser-pn=512-${pn}
EOT
        close($fh);
    }
}

