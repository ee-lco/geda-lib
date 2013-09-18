#!/usr/bin/perl
use strict;
use warnings;

foreach my $t ("005", "01", "02", "03", "04", "06", "08", "10") {
    my $pn = sprintf("DF%sM", $t);

    my $fh;
    open($fh, ">", "Fairchild/${pn}");
    print $fh <<"EOT";
attr    footprint=edip-4.fp
attr    pinmap=P=1
attr    pinmap=N=2
attr    pinmap=AC1=3
attr    pinmap=AC2=4
attr    manuf=Fairchild
attr    manuf-pn=${pn}
attr    digikey-pn=${pn}-ND
attr    mouser-pn=512-${pn}
EOT
    close($fh);
}
