use Text::Balanced qw(extract_bracketed);

$text=q{((efg)hi)jk};
$delim='()';

($extracted,$remainder)=extract_bracketed($text,$delim);

print "Extracted= " . $extracted . "\n";
print "Remainder= " . $remainder;
