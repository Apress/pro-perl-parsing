$html=q{
   <h1>Apress Weblinks</h1>
   <dl>
   <dt><a href="http://www.apress.com/">Apress Website</a></dt>
   <dd>Apress sells high quality computer books</dd>
   <dt><a href="http://www.apress.com/about.index.html/">About Apress</a></dt>
   <dd>You can learn about Apress at this link</dd>
   <dt><a href="http://www.apress.com/author/authorDisplay.html?aID=37">Chris Frenz's Apress Books</a></dt>
   <dd>See all the books written by Chris Frenz here</dd>
   </dl>
   };

use HTML::TreeBuilder;

my $tree=HTML::TreeBuilder->new;

$tree->parse($html);
$tree->eof;
$tree->dump;
$tree->delete;
