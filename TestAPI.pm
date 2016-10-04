package TestAPI;

use HTTP::Request;
use LWP::UserAgent;
use CGI;
use JSON;

sub handleRequest {
 my ($req) = @_;

 my $auth_id = "XXX";
 my $auth_token = "YYY";
 my $json = encode_json({ 
  "src" => "18059999999",
  "dst" => "16269999999",
  "text" => "TESTING - 123"
 });


 my $req = new HTTP::Request;
 $req->method('POST');
 $req->header('Content_Type' => 'application/json');
 $req->authorization_basic($auth_id, $auth_token);
 $req->uri("https://api.plivo.com/v1/Account/$auth_id/Message/");
 $req->content($json);

 my $useragent = new LWP::UserAgent->new();
 my $result = $useragent->request($req);

 my $res = new Plack::Response(200);
 $res->content_type('text/html');
 $res->body('Result: ' . $result->content);
 return $res->finalize;
}

1;


