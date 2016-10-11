#!/usr/bin/perl

# PREP (Perl RegExps for Pubmed) is a script that allows the use of 
# Perl regexs in the searching of Pubmed records, providing the ability to search 
# records for textual patterns as well as keywords

# Copyright 2005- Christopher M. Frenz
# This script is free sofware it may be used, copied, redistributed, and/or modified
# under the terms laid forth in the Perl Artisic License 

# Please cite this script in any publication in which literature cited within the
# publication was located using the PREP.pl script.  

# Usage: perl PREPv1-0.pl PubmedQueryTerms

# Usage of this script requires the LWP and XML::LibXML modules are installed
use LWP;
use XML::LibXML; #Version 1.58 used for development and testing

# Change the variable below to set the text pattern that Perl 
# will seek to match in the returned results
my $regex='[ARNDCEQGHILKMFPSTWYV]\d+[ARNDCEQGHILKMFPSTWYV]';

my $request;
my $response;
my $query;

# Concatenates arguments passed to script to form Pubmed query
$query=join(" ", @ARGV);

# Creates the URL to search Pubmed
my $baseurl="http://www.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi?";
my $url=$baseurl . "db=Pubmed&retmax=1&usehistory=y&term=" . $query;


# Searches Pubmed and Returns the number of results
# as well as the session information needed for results retrieval
$request=LWP::UserAgent->new();
$response=$request->get($url);
my $results= $response->content;
die unless $response->is_success;
print "PubMed Search Results \n";
$results=~/<Count>(\d+)<\/Count>/;
   my $NumAbstracts=$1;
$results=~/<QueryKey>(\d+)<\/QueryKey>/;
   my $QueryKey=$1;
$results=~/<WebEnv>(.*?)<\/WebEnv>/;
   my $WebEnv=$1;
print "$NumAbstracts are Available \n";
print "Query Key= $QueryKey \n";
print "WebEnv= $WebEnv \n";

# Opens a file for output
open(OFile, ">PREPout.html");

my $parser=XML::LibXML->new;

my $retmax=500; #Number of records to be retrieved per request-Max 500
my $retstart=0; #Record number to start retreival from

# Creates the URL needed to retrieve results
$baseurl="http://www.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?";
my $url2="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=pubmed&dopt=Abstract&list_uids=";

my $Count=0;
# Retreives results in XML format
for($retstart=0;$retstart<=$NumAbstracts;$retstart+=$retmax){
   print "Processing record # $retstart \n";
   $url=$baseurl . "rettype=abstract&retmode=xml&retstart=$retstart&retmax=$retmax&db=Pubmed&query_key=$QueryKey&WebEnv=$WebEnv";

   $response=$request->get($url);
   $results=$response->content;
   die unless $response->is_success;

   # Uses a DOM based XML parser to process returned results
   my $domtree=$parser->parse_string($results);
   @Records=$domtree->getElementsByTagName("PubmedArticle"); 
   my $i=0;
   foreach(@Records){
# Extracts element data for regex processing and output formatting
      $titles=$Records[$i]->getElementsByTagName("ArticleTitle");
      $journals=$Records[$i]->getElementsByTagName("MedlineTA");
      $volumes=$Records[$i]->getElementsByTagName("Volume");
      $pgnums=$Records[$i]->getElementsByTagName("MedlinePgn");
      $abstracts=$Records[$i]->getElementsByTagName("AbstractText");
      $IDS=$Records[$i]->getElementsByTagName("PMID");


       # Processes title and abstract for pattern match and if a match occurs
       # data is written to output
       if($titles=~/($regex)/ or $abstracts=~/($regex)/){
           print OFile "<h1>Pattern Match: $1 </h1>\n";
           print OFile "<h3><a href=\"$url2$IDS\">$titles </a></h3> \n";
           print OFile "<p>$journals $volumes, $pgnums </p>\n";
           print OFile "<p>$abstracts </p>\n\n";
           $Count=$Count+1;
       }
       $i=$i+1;
   }
}
close OFile;
print "$Count records matched the pattern";
