use LWP::Simple;
use HTML::TreeBuilder;

$html=get("http://www.apress.com");

my $tree=HTML::TreeBuilder->new;
$tree->parse($html);
$tree->eof;
@pnodes=$tree->look_down(_tag=>'a', href=>qr{http://blogs\.apress\.com/archives/\d+\.html});

# Creates HTML file output will be written to
open(OFile, ">Blogout.html");



foreach $node(@pnodes){
    $url=$node->attr('href');
    $text=$node{_content}[0];
    print OFile "<h1><a href=\"$url\">$text</a></h1> \n";
}
$tree->delete;
