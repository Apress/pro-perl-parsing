#!/usr/bin/perl

use Data::Mining::AssociationRules;

my %TransactionMap;
my $File="Data.txt";
my $Support=1;
my $OFilePrefix="Data";

read_transaction_file(\%transaction_map, $File);

generate_frequent_sets(\%transaction_map, $OFilePrefix, $Support);

generate_rules($OFilePrefix, $Support);
