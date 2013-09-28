#!/usr/bin/perl
use strict;
use warnings;

#foreach my $t ("6", "8", "10") {
foreach my $t ("6", "8") {
    my $pn = sprintf("TYN%s40", $t);

    my %dkpn = ("TYN640" => "497-2422-5-ND", "TYN840" => "497-3792-5-ND");

    my $fh;
    open($fh, ">", "ST/${pn}RG");
    print $fh <<"EOT";
attr    footprint=TO220AB.fp
attr    pinmap=A=1
attr    pinmap=K=2
attr    pinmap=G=3
attr    manuf=ST
attr    manuf-pn=${pn}RG
attr    digikey-pn=$dkpn{${pn}}
attr    mouser-pn=511-${pn}
EOT
    close($fh);
}
