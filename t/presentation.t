use Test2::V0;
use Test2::Tools::Explain;

use Test2::Require::EnvVar 'LIVE_TEST_JENKINS_URL';
# Set LIVE_TEST_JENKINS_URL if you want to run these tests against a live jenkins server.
# Set LIVE_TEST_JENKINS_API_KEY and LIVE_TEST_JENKINS_API_PASS if your server requires authentication.

use Jenkins::API;
my $url = $ENV{LIVE_TEST_JENKINS_URL};
my $apiKey = $ENV{LIVE_TEST_JENKINS_API_KEY};
my $apiPass = $ENV{LIVE_TEST_JENKINS_API_PASS};

my $api = Jenkins::API->new(base_url => $url,
							api_key => $apiKey,
							api_pass => $apiPass);

my $v = $api->check_jenkins_url;
ok $v, 'Jenkins running on ' . $url;
note '$api->check_jenkins_url;';
note explain $v;

my $status = $api->current_status;
note '$api->current_status;';
note explain($status);

done_testing;
