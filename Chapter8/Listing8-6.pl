use Text::Balanced qw(extract_variable);

($text=<<'MYCODE');
    $myvar[$i][$j]=500;
    # more code
MYCODE

($extracted)=extract_variable($text);

print "Extracted= " . $extracted . "\n";
