<html>
<head>

<!-- 
https://developers.google.com/identity/sign-in/web/sign-in
https://developers.google.com/api-client-library/javascript/samples/samples#authorizing-and-making-authorized-requests	
 -->


</head>
<body>

<p>Twitter SignIn</p>

<script type="text/javascript" src="js/codebird-js-develop/codebird.js"></script>

<script type="text/javascript">
	
	

	
	function authenticate(){
	var cb = new Codebird;
	//cb.setConsumerKey("YOURKEY", "YOURSECRET");
	//cb.setConsumerKey("Ma2GQOGw1SoHM7sxeMcK4G2pz", "YOURSECRET");
	
	var consumerKey ='Ma2GQOGw1SoHM7sxeMcK4G2pz';
	cb.setConsumerKey("Ma2GQOGw1SoHM7sxeMcK4G2pz", "970980458656825344-EEMylTEGLO5AcLsDWbjlhxfmRqvIell");
	
	var auth_url = 'https://api.twitter.com/oauth/authenticate?force_login=true';
	//cb.setUrl=auth_url ;
	
	/*
	cb.oauth_authenticate({force_login: true}, function (a) {
	    t.equal(
	      a, "https://api.twitter.com/oauth/authenticate?oauth_token="+consumerKey+"&force_login=1"
	    )
	  });
	*/
		
	
	/**/
	cb._url(auth_url);
	cb.__call(
		    "oauth_requestToken",
		    {oauth_callback: "oob"},
		    function (reply,rate,err) {
		        if (err) {
		            console.log("error response or timeout exceeded" + err.error);
		        }
		        if (reply) {
		            // stores it
		            cb.setToken(reply.oauth_token, reply.oauth_token_secret);	
		
		            // gets the authorize screen URL
		            cb.__call(
		                "oauth_authorize",
		                {},
		                function (auth_url) {
		                    window.codebird_auth = window.open(auth_url);
		                }
		            );
		        }
		    }
		);
	
	cb.__call(
		    "oauth_accessToken",
		    {oauth_verifier: document.getElementById("PINFIELD").value},
		    function (reply) {
		        // store the authenticated token, which may be different from the request token (!)
		        cb.setToken(reply.oauth_token, reply.oauth_token_secret);

		        // if you need to persist the login after page reload,
		        // consider storing the token in a cookie or HTML5 local storage
		    }
		);
	}
	
	// $cb->call('_sign', ['GET', 'search/tweets', $params]);
	
</script>
	<input type="text" name="PINFIELD" id="PINFIELD"/>

    <button id="signin-button" onclick="authenticate()">Sign In</button>
    <button id="signout-button" onclick="handleSignOutClick()">Sign Out</button>
</body>
</html>