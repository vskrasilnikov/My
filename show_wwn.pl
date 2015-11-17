#!/usr/bin/perl

use Socket;
use Sys::Hostname;

$adapters = `lsdev -Cc adapter`;
@list = split(/\s+/,$adapters);
@result = grep /fcs/i, @list;
$host = hostname();
print "$host\n";

foreach (@result) {
        $arg = $_;
        @adapterprop = `lscfg -vpl $arg`;
        @wwn0 = grep /Network/, @adapterprop;
        $wwn1 = $wwn0[0];
        @wwn2 = split /[.]/,$wwn1 ;
        $wwn3 = @wwn2[13];
        @wwn4 = split //,$wwn3;
        print "$arg  @wwn4[0]@wwn4[1]:@wwn4[2]@wwn4[3]:@wwn4[4]@wwn4[5]:@wwn4[6]@wwn4[7]:@wwn4[8]@wwn4[9]:@wwn4[10]@wwn4[11]:@wwn4[12]@wwn4[13]:@wwn4[14]@wwn4[15]\n";

