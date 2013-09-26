#!/usr/bin/perl
use strict;
use warnings;

my %e_values = (
    6      => [ 10, 15, 22, 33, 47, 68, ],
    12     => [ 10, 12, 15, 18, 22, 27, 33, 39,
                47, 56, 68, 82, ],
    24     => [ 10, 11, 12, 13, 15, 16, 18, 20,
                22, 24, 27, 30, 33, 36, 39, 43,
                47, 51, 56, 62, 68, 75, 82, 91, ],
    48     => [ 100, 105, 110, 115, 121, 127, 133, 140,
                147, 154, 162, 169, 178, 187, 196, 205,
                215, 226, 237, 249, 261, 274, 287, 301,
                316, 332, 348, 365, 383, 402, 422, 442,
                464, 487, 511, 536, 562, 590, 619, 649,
                681, 715, 750, 787, 825, 866, 909, 953, ],
    96     => [ 100, 102, 105, 107, 110, 113, 115, 118,
                121, 124, 127, 130, 133, 137, 140, 143,
                147, 150, 154, 158, 162, 165, 169, 174,
                178, 182, 187, 191, 196, 200, 205, 210,
                215, 221, 226, 232, 237, 243, 249, 255,
                261, 267, 274, 280, 287, 294, 301, 309,
                316, 324, 332, 340, 348, 357, 365, 374,
                383, 392, 402, 412, 422, 432, 442, 453,
                464, 475, 487, 499, 511, 523, 536, 549,
                562, 576, 590, 604, 619, 634, 649, 665,
                681, 698, 715, 732, 750, 768, 787, 806,
                825, 845, 866, 887, 909, 931, 953, 976, ],
    192    => [ 100, 101, 102, 104, 105, 106, 107, 109,
                110, 111, 113, 114, 115, 117, 118, 120,
                121, 123, 124, 126, 127, 129, 130, 132,
                133, 135, 137, 138, 140, 142, 143, 145,
                147, 149, 150, 152, 154, 156, 158, 160,
                162, 164, 165, 167, 169, 172, 174, 176,
                178, 180, 182, 184, 187, 189, 191, 193,
                196, 198, 200, 203, 205, 208, 210, 213,
                215, 218, 221, 223, 226, 229, 232, 234,
                237, 240, 243, 246, 249, 252, 255, 258,
                261, 264, 267, 271, 274, 277, 280, 284,
                287, 291, 294, 298, 301, 305, 309, 312,
                316, 320, 324, 328, 332, 336, 340, 344,
                348, 352, 357, 361, 365, 370, 374, 379,
                383, 388, 392, 397, 402, 407, 412, 417,
                422, 427, 432, 437, 442, 448, 453, 459,
                464, 470, 475, 481, 487, 493, 499, 505,
                511, 517, 523, 530, 536, 542, 549, 556,
                562, 569, 576, 583, 590, 597, 604, 612,
                619, 626, 634, 642, 649, 657, 665, 673,
                681, 690, 698, 706, 715, 723, 732, 741,
                750, 759, 768, 777, 787, 796, 806, 816,
                825, 835, 845, 856, 866, 876, 887, 898,
                909, 920, 931, 942, 953, 965, 976, 988, ],
);

my %fp = (
    "2.5" => "c-radial-100.fp",
    "5.0" => "c-radial-200.fp",
);
my %case = (
    "28" => [ "4.0", "5.5", "2.5", "5.0" ],
    "24" => [ "4.5", "5.5", "2.5", "5.0" ],
    "26" => [ "5.5", "6.0", "3.5", "5.0" ],
    "20" => [ "5.5", "7.0", "4.0", "5.0" ],
    "22" => [ "7.5", "8.0", "4.0", "5.0" ],
    "18" => [ "4.0", "5.5", "2.5", "2.5" ],
    "14" => [ "4.5", "5.5", "2.5", "2.5" ],
    "16" => [ "5.5", "6.0", "3.5", "2.5" ],
    "11" => [ "5.5", "7.0", "4.0", "2.5" ],
);
my %tempco = (
    "C0G" => "0±30ppm/°C",
    "X7R" => "±15%",
    "X7S" => "±22%",
);
my %voltage = (
    "2A" => "100V",
    "2E" => "250V",
    "2J" => "630V",
);
my %tolerance = (
    "J" => "±5%",
    "K" => "±10%",
);

my %valid = (
    "FK11C0G2A153J" => 1,
    "FK11C0G2A223J" => 1,
    "FK11C0G2A333J" => 1,
    "FK11C0G2A473J" => 1,
    "FK11X7R2A105K" => 1,
    "FK11X7R2A155K" => 1,
    "FK11X7R2A225K" => 1,
    "FK11X7R2A334K" => 1,
    "FK11X7R2A474K" => 1,
    "FK11X7R2A684K" => 1,
    "FK11X7S2A335K" => 1,
    "FK11X7S2A475K" => 1,
    "FK14C0G2A102J" => 1,
    "FK14C0G2A122J" => 1,
    "FK14C0G2A152J" => 1,
    "FK14C0G2A182J" => 1,
    "FK14C0G2A222J" => 1,
    "FK14C0G2A272J" => 1,
    "FK14C0G2A332J" => 1,
    "FK14C0G2A392J" => 1,
    "FK14C0G2A472J" => 1,
    "FK14C0G2E102J" => 1,
    "FK14C0G2E122J" => 1,
    "FK14C0G2E152J" => 1,
    "FK14C0G2E182J" => 1,
    "FK14C0G2E222J" => 1,
    "FK14C0G2E272J" => 1,
    "FK14C0G2E821J" => 1,
    "FK14X7R2A102K" => 1,
    "FK14X7R2A103K" => 1,
    "FK14X7R2A104K" => 1,
    "FK14X7R2A152K" => 1,
    "FK14X7R2A153K" => 1,
    "FK14X7R2A222K" => 1,
    "FK14X7R2A223K" => 1,
    "FK14X7R2A332K" => 1,
    "FK14X7R2A333K" => 1,
    "FK14X7R2A472K" => 1,
    "FK14X7R2A473K" => 1,
    "FK14X7R2A682K" => 1,
    "FK14X7R2A683K" => 1,
    "FK14X7R2E102K" => 1,
    "FK14X7R2E103K" => 1,
    "FK14X7R2E152K" => 1,
    "FK14X7R2E153K" => 1,
    "FK14X7R2E222K" => 1,
    "FK14X7R2E223K" => 1,
    "FK14X7R2E332K" => 1,
    "FK14X7R2E472K" => 1,
    "FK14X7R2E682K" => 1,
    "FK14X7S2A105K" => 1,
    "FK14X7S2A154K" => 1,
    "FK14X7S2A224K" => 1,
    "FK14X7S2A334K" => 1,
    "FK14X7S2A474K" => 1,
    "FK14X7S2A684K" => 1,
    "FK16C0G2A103J" => 1,
    "FK16C0G2A392J" => 1,
    "FK16C0G2A472J" => 1,
    "FK16C0G2A562J" => 1,
    "FK16C0G2A682J" => 1,
    "FK16C0G2A822J" => 1,
    "FK16X7R2A104K" => 1,
    "FK16X7R2A105K" => 1,
    "FK16X7R2A154K" => 1,
    "FK16X7R2A224K" => 1,
    "FK16X7R2A333K" => 1,
    "FK16X7R2A334K" => 1,
    "FK16X7R2A473K" => 1,
    "FK16X7R2A474K" => 1,
    "FK16X7R2A683K" => 1,
    "FK16X7R2A684K" => 1,
    "FK16X7S2A155K" => 1,
    "FK16X7S2A225K" => 1,
    "FK18C0G2A101J" => 1,
    "FK18C0G2A102J" => 1,
    "FK18C0G2A121J" => 1,
    "FK18C0G2A122J" => 1,
    "FK18C0G2A151J" => 1,
    "FK18C0G2A181J" => 1,
    "FK18C0G2A221J" => 1,
    "FK18C0G2A271J" => 1,
    "FK18C0G2A331J" => 1,
    "FK18C0G2A391J" => 1,
    "FK18C0G2A471J" => 1,
    "FK18C0G2A561J" => 1,
    "FK18C0G2A681J" => 1,
    "FK18C0G2A821J" => 1,
    "FK18C0G2E101J" => 1,
    "FK18C0G2E121J" => 1,
    "FK18C0G2E151J" => 1,
    "FK18C0G2E181J" => 1,
    "FK18C0G2E221J" => 1,
    "FK18C0G2E271J" => 1,
    "FK18C0G2E331J" => 1,
    "FK18C0G2E391J" => 1,
    "FK18C0G2E471J" => 1,
    "FK18C0G2E561J" => 1,
    "FK18C0G2E681J" => 1,
    "FK18X7R2A102K" => 1,
    "FK18X7R2A103K" => 1,
    "FK18X7R2A152K" => 1,
    "FK18X7R2A153K" => 1,
    "FK18X7R2A222K" => 1,
    "FK18X7R2A223K" => 1,
    "FK18X7R2A332K" => 1,
    "FK18X7R2A472K" => 1,
    "FK18X7R2A682K" => 1,
    "FK18X7S2A104K" => 1,
    "FK18X7S2A333K" => 1,
    "FK18X7S2A473K" => 1,
    "FK18X7S2A683K" => 1,
    "FK20C0G2A153J" => 1,
    "FK20C0G2A223J" => 1,
    "FK20C0G2A333J" => 1,
    "FK20C0G2A473J" => 1,
    "FK20C0G2E103J" => 1,
    "FK20C0G2E153J" => 1,
    "FK20C0G2J392J" => 1,
    "FK20C0G2J472J" => 1,
    "FK20C0G2J562J" => 1,
    "FK20C0G2J682J" => 1,
    "FK20X7R2A105K" => 1,
    "FK20X7R2A155K" => 1,
    "FK20X7R2A225K" => 1,
    "FK20X7R2A334K" => 1,
    "FK20X7R2A474K" => 1,
    "FK20X7R2A684K" => 1,
    "FK20X7R2E104K" => 1,
    "FK20X7R2E154K" => 1,
    "FK20X7R2E224K" => 1,
    "FK20X7R2J473K" => 1,
    "FK20X7R2J683K" => 1,
    "FK20X7S2A335K" => 1,
    "FK20X7S2A475K" => 1,
    "FK22C0G2A104J" => 1,
    "FK22C0G2A683J" => 1,
    "FK22C0G2E223J" => 1,
    "FK22C0G2E333J" => 1,
    "FK22C0G2E473J" => 1,
    "FK22C0G2J103J" => 1,
    "FK22C0G2J153J" => 1,
    "FK22C0G2J223J" => 1,
    "FK22C0G2J822J" => 1,
    "FK22X7R2A105K" => 1,
    "FK22X7R2A155K" => 1,
    "FK22X7R2A225K" => 1,
    "FK22X7R2A684K" => 1,
    "FK22X7R2E154K" => 1,
    "FK22X7R2E224K" => 1,
    "FK22X7R2E334K" => 1,
    "FK22X7R2E474K" => 1,
    "FK22X7R2J104K" => 1,
    "FK24C0G2A102J" => 1,
    "FK24C0G2A122J" => 1,
    "FK24C0G2A152J" => 1,
    "FK24C0G2A182J" => 1,
    "FK24C0G2A222J" => 1,
    "FK24C0G2A272J" => 1,
    "FK24C0G2A332J" => 1,
    "FK24C0G2A392J" => 1,
    "FK24C0G2A472J" => 1,
    "FK24C0G2E102J" => 1,
    "FK24C0G2E122J" => 1,
    "FK24C0G2E152J" => 1,
    "FK24C0G2E182J" => 1,
    "FK24C0G2E222J" => 1,
    "FK24C0G2E272J" => 1,
    "FK24C0G2E821J" => 1,
    "FK24X7R2A102K" => 1,
    "FK24X7R2A103K" => 1,
    "FK24X7R2A104K" => 1,
    "FK24X7R2A152K" => 1,
    "FK24X7R2A153K" => 1,
    "FK24X7R2A222K" => 1,
    "FK24X7R2A223K" => 1,
    "FK24X7R2A332K" => 1,
    "FK24X7R2A333K" => 1,
    "FK24X7R2A472K" => 1,
    "FK24X7R2A473K" => 1,
    "FK24X7R2A682K" => 1,
    "FK24X7R2A683K" => 1,
    "FK24X7R2E102K" => 1,
    "FK24X7R2E103K" => 1,
    "FK24X7R2E152K" => 1,
    "FK24X7R2E153K" => 1,
    "FK24X7R2E222K" => 1,
    "FK24X7R2E223K" => 1,
    "FK24X7R2E332K" => 1,
    "FK24X7R2E472K" => 1,
    "FK24X7R2E682K" => 1,
    "FK24X7S2A105K" => 1,
    "FK24X7S2A154K" => 1,
    "FK24X7S2A224K" => 1,
    "FK24X7S2A334K" => 1,
    "FK24X7S2A474K" => 1,
    "FK24X7S2A684K" => 1,
    "FK26C0G2A103J" => 1,
    "FK26C0G2A392J" => 1,
    "FK26C0G2A472J" => 1,
    "FK26C0G2A562J" => 1,
    "FK26C0G2A682J" => 1,
    "FK26C0G2A822J" => 1,
    "FK26C0G2E332J" => 1,
    "FK26C0G2E392J" => 1,
    "FK26C0G2E472J" => 1,
    "FK26C0G2E562J" => 1,
    "FK26C0G2E682J" => 1,
    "FK26C0G2E822J" => 1,
    "FK26C0G2J101J" => 1,
    "FK26C0G2J102J" => 1,
    "FK26C0G2J121J" => 1,
    "FK26C0G2J122J" => 1,
    "FK26C0G2J151J" => 1,
    "FK26C0G2J152J" => 1,
    "FK26C0G2J181J" => 1,
    "FK26C0G2J182J" => 1,
    "FK26C0G2J221J" => 1,
    "FK26C0G2J222J" => 1,
    "FK26C0G2J271J" => 1,
    "FK26C0G2J272J" => 1,
    "FK26C0G2J331J" => 1,
    "FK26C0G2J332J" => 1,
    "FK26C0G2J391J" => 1,
    "FK26C0G2J471J" => 1,
    "FK26C0G2J561J" => 1,
    "FK26C0G2J681J" => 1,
    "FK26C0G2J821J" => 1,
    "FK26X7R2A104K" => 1,
    "FK26X7R2A105K" => 1,
    "FK26X7R2A154K" => 1,
    "FK26X7R2A224K" => 1,
    "FK26X7R2A333K" => 1,
    "FK26X7R2A334K" => 1,
    "FK26X7R2A473K" => 1,
    "FK26X7R2A474K" => 1,
    "FK26X7R2A683K" => 1,
    "FK26X7R2A684K" => 1,
    "FK26X7R2E104K" => 1,
    "FK26X7R2E153K" => 1,
    "FK26X7R2E223K" => 1,
    "FK26X7R2E333K" => 1,
    "FK26X7R2E473K" => 1,
    "FK26X7R2E683K" => 1,
    "FK26X7R2J102K" => 1,
    "FK26X7R2J103K" => 1,
    "FK26X7R2J152K" => 1,
    "FK26X7R2J153K" => 1,
    "FK26X7R2J222K" => 1,
    "FK26X7R2J223K" => 1,
    "FK26X7R2J332K" => 1,
    "FK26X7R2J333K" => 1,
    "FK26X7R2J472K" => 1,
    "FK26X7R2J682K" => 1,
    "FK26X7S2A155K" => 1,
    "FK26X7S2A225K" => 1,
    "FK28C0G2A101J" => 1,
    "FK28C0G2A102J" => 1,
    "FK28C0G2A121J" => 1,
    "FK28C0G2A122J" => 1,
    "FK28C0G2A151J" => 1,
    "FK28C0G2A181J" => 1,
    "FK28C0G2A221J" => 1,
    "FK28C0G2A271J" => 1,
    "FK28C0G2A331J" => 1,
    "FK28C0G2A391J" => 1,
    "FK28C0G2A471J" => 1,
    "FK28C0G2A561J" => 1,
    "FK28C0G2A681J" => 1,
    "FK28C0G2A821J" => 1,
    "FK28C0G2E101J" => 1,
    "FK28C0G2E121J" => 1,
    "FK28C0G2E151J" => 1,
    "FK28C0G2E181J" => 1,
    "FK28C0G2E221J" => 1,
    "FK28C0G2E271J" => 1,
    "FK28C0G2E331J" => 1,
    "FK28C0G2E391J" => 1,
    "FK28C0G2E471J" => 1,
    "FK28C0G2E561J" => 1,
    "FK28C0G2E681J" => 1,
    "FK28X7R2A102K" => 1,
    "FK28X7R2A103K" => 1,
    "FK28X7R2A152K" => 1,
    "FK28X7R2A153K" => 1,
    "FK28X7R2A222K" => 1,
    "FK28X7R2A223K" => 1,
    "FK28X7R2A332K" => 1,
    "FK28X7R2A472K" => 1,
    "FK28X7R2A682K" => 1,
    "FK28X7S2A104K" => 1,
    "FK28X7S2A333K" => 1,
    "FK28X7S2A473K" => 1,
    "FK28X7S2A683K" => 1,

    "FK24C0G2A222J" => 1,
);


foreach my $cas (keys %case) {
    foreach my $tc (keys %tempco) {
        foreach my $volt (keys %voltage) {
            foreach my $m (1, 2, 3, 4) {
                foreach my $e (@{$e_values{12}}) {
                    foreach my $tol (keys %tolerance) {
                        my $pn = "FK${cas}${tc}${volt}${e}${m}${tol}";
                        if ($valid{$pn}) {
                            my $c = $e * (10 ** $m);
                            if ($m < 4) {
                                $c = sprintf("%dp", ${c});
                            } else {
                                $c = sprintf("%0.1fµ", ${c} / 1000000);
                            }

                            my $fh;
                            open($fh, ">", "TDK/${pn}");
                            print $fh <<"EOT";
attr    footprint=${fp{${case{$cas}[3]}}}
attr    capacitance=${c}
attr    tolerance=${tolerance{$tol}}
attr    voltage-rating=${voltage{$volt}}
attr    temp-char=${tc}
attr    temp-co=${tempco{$tc}}
attr    case-style=axial
attr    case-length=${case{$cas}[0]}mm
attr    case-width=${case{$cas}[2]}mm
attr    case-height=${case{$cas}[1]}mm
attr    lead-spacing=${case{$cas}[3]}mm
attr    manuf=TDK
attr    manuf-pn=${pn}
attr    mouser-pn=810-${pn}
EOT
                            close($fh);
                        }
                    }
                }
            }
        }
    }
}

