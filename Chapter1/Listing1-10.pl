#!/usr/bin/perl -w
use Regexp::Common qw /pattern/;

pattern name=>[qw(phone)],
    create=>q/(?k:\s?(\(\d{3}\))[-\s.](\d{3}[-.]\d{4}))/;
    
    
while(<>){
    /$RE{phone}{-keep}/ and print "$1\n";
}
