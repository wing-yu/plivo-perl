#!/usr/bin/perl 

use HTTP::Request;
use LWP::UserAgent;
use CGI;

my $auth_id = "XXX";
my $auth_token = "YYY";
my $json = qq|{"src":"18059999999","dst":"16269999999","text":"TESTING - 123"}|;


my $req = HTTP::Request->new();
$req->method('POST');
$req->header('Content_Type' => 'application/json');
$req->authorization_basic($auth_id, $auth_token);
$req->uri("https://api.plivo.com/v1/Account/$auth_id/Message/");
$req->content($json);

my $useragent = LWP::UserAgent->new();
my $result = $useragent->request($req);

my $q = new CGI;
print $q->header().qq|Result:|.$result->content;

exit 1;


