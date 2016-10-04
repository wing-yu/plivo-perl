use Plack;
use TestApi;

my $api = new TestAPI;

my $app = sub {
 my $env = shift;
 my $req = Plack::Request->new($env); 
 
 return $api->handleRequest($req); // Returns Plack::Response
};
