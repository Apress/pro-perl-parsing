#!/usr/bin/perl -w
 
 use strict;
 use XML::RSS::Parser;
 use LWP::Simple;
 
 my $rssfile='whatsnew.xml';
 my $url = 'http://www.apress.com/rss/whatsnew.xml';
 getstore($url,$rssfile);
 
 my $parser = new XML::RSS::Parser;
 my $feed = $parser->parsefile($rssfile);
        
 my $title = XML::RSS::Parser->ns_qualify('title',$feed->rss_namespace_uri);
 print "item count: ".$feed->item_count()."\n\n";
 foreach my $i ( $feed->items ) {
        map { print $_->name.": ".$_->value."\n" } $i->children;
        print "\n";
 }
