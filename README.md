# clibook

Command-line access to Facebook graph.

To set up token:

1. Set up an app in Facebook - see https://developers.facebook.com/docs/apps/register 

2. Set yourself as a developer on the app.

3. Take note of your app ID and app secret in the app dashboard.

4. Visit
https://www.facebook.com/dialog/oauth?client_id=[app id]&redirect_uri=https://www.facebook.com/connect/login_success.html
Get a code from the end of the URL (may have to click back button)

5. Visit
https://graph.facebook.com/v2.3/oauth/access_token?
    client_id=[app id]
   &redirect_uri=https://www.facebook.com/connect/login_success.html
   &client_secret=[app secret]
   &code=[code from step 4]
This returns
{"access_token":[token],"token_type":"bearer","expires_in":[number of seconds]}

6. If you want to verify the token and its expiry:
graph.facebook.com/debug_token?input_token=[token from step 5]
&access_token=[same token from step 5]
The expiry date from resulting JSON is a Unix timestamp.

7. Store the token in a file called .clibook-token in your home directory.