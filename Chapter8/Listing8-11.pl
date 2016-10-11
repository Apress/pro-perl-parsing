use Data::Dumper;
use Math::Expression;

$parser=new Math::Expression;
$tree=$parser->Parse("a-b*6+sin(x)/f-3");

print Dumper($tree);
