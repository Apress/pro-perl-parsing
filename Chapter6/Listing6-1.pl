use LWP;

my $request;
my $response;
my $query=$ARGV[0];

my $url="http://www.weather.com/outlook/health/allergies/local/". ($query);

$request=LWP::UserAgent->new();
$response=$request->get($url);
my $content= $response->content;
die unless $response->is_success;

if($content=~/CLASS=obsTempTextA>(\d+)&deg;F/){
    print "It is currently $1 degrees Fahrenheit at $query";
}
