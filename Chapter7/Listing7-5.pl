#!/usr/bin/perl

use RPC::XML;
use RPC::XML::Client;

$MyClient=RPC::XML::Client->new('http://time.xmlrpc.com/RPC2');

$Response=$MyClient->send_request('currentTime.getCurrentTime');

print $Response->value;
