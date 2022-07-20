#!/usr/bin/perl
use strict;
use warnings;

my ($line1,$line2_1,$line2_2,$line2_3,$line2_4);
my $usage = "perl $0 <IN1> <IN2> <OUT>
<IN1>:R2_head.txt
<IN2>:R1_fq.gz
<OUT>:fastq.gz";
open IN1,"cat $ARGV[0]|" or die $!;
open IN2,"zcat $ARGV[1]|" or die $!;
open OUT,"| gzip > $ARGV[2]" or die $!;
#-get the reads and corresponding information in each 4 lines


my %hash;

while (1){

	my $line2_1 = <IN2>;
	my $line2_2 = <IN2>;
	my $line2_3 = <IN2>;
	my $line2_4 = <IN2>;
	#check the end of the file
	
	last unless defined($line2_1);
	chomp ($line2_1,$line2_2,$line2_3,$line2_4);
	
	my @a = split /\s+/,$line2_1;
	#print $a[0]."\n";
	$hash{$a[0]} = $line2_1."\n".$line2_2."\n".$line2_3."\n".$line2_4."\n";

}

while (<IN1>)
{
	chomp;
	if (exists($hash{$_})){
		#print "OK";
		print OUT $hash{$_} ;
	}
}
close IN1;close IN2;close OUT;
