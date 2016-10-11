use LWP;

my $request;
my $response;
my $query;
my $i=0;
$query=join(" ", @ARGV);

my $url="http://www.ncbi.nlm.nih.gov/entrez/query.fcgi";

$request=LWP::UserAgent->new();
$response=$request->post($url,['db'=>"pubmed", 'term'=>$query]);
my $results= $response->content;
die unless $response->is_success;
while($results=~/<td colspan="2">(.*?)</g){
    print "$1 \n";
}
