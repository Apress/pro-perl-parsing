use LWP::Simple;
use HTML::TreeBuilder;

$html=get("http://www.apress.com");

my $tree=HTML::TreeBuilder->new;
$tree->parse($html);
$tree->eof;
@pnodes=$tree->find_by_tag_name('p');


foreach node(@pnodes){
    $node->dump;

}

$tree->delete;
