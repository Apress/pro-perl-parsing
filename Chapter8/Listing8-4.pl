use Text::Balanced qw(extract_codeblock);

($text=<<'MYCODE');
    # code
    for($i=0;$i<=5;$i++){
       for($j=0;$j<=10;$j++){
         # more code
       }
    }
    # more code
MYCODE

$delim='{}';

#substring capturing used to
#get code that leads into codeblock
if($text=~/(for\s*?\(.*?\))/sg){
   $for=$1;
   ($extracted,$remainder)=extract_codeblock($text,$delim);

   print "Extracted= " . $for . $extracted . "\n";
}
