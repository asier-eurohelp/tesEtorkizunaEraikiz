<html>
<head>

<!-- 
https://dev.twitter.com/web/sign-in
 -->


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!--   script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9-1/crypto-js.js"></script -->	
	
<!--  script src="https://cdnjs.cloudflare.com/ajax/libs/require.js/2.3.5/require.js"></script -->
<!--  script src="js/oauth2-client.js"></script -->		
<!--  script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9-1/crypto-js.js"></script -->

<script src="js/login-with-twitter-master/index.js"></script>	<!-- Node server side lib -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/hmac-sha1.js"></script>		

</head>
<body>


HTTP Header OAUTH data:

OAuth oauth_consumer_key="xvz1evFS4wEEPTGEFPHBog",
oauth_nonce="kYjzVBB8Y0ZFabxSWbWovY3uYSQ2pTgmZeNu2VS4cg",
oauth_signature="tnnArxj06cWHq44gCs1OSKk%2FjLY%3D",
oauth_signature_method="HMAC-SHA1",
oauth_timestamp="1318622958",
oauth_token="370773112-GmHxMAgYyLbNEtIKZeRNFsMKPR9EyMZeS9weJAEb",
oauth_version="1.0"

<script lang="text/javascript">

function authenticate (){
	var LoginWithTwitter = new LoginWithTwitter();
	
	const tw = LoginWithTwitter({
	  consumerKey: 'Ma2GQOGw1SoHM7sxeMcK4G2pz',
	  //970980458656825344-EEMylTEGLO5AcLsDWbjlhxfmRqvIell
	  consumerSecret: 'EEMylTEGLO5AcLsDWbjlhxfmRqvIell',
	  callbackUrl: 'http://localhost:8080/ExternalLogin_mvn/login_twitterLib.jsp'
	})
}
</script>


<button onclick="authenticate();">Login Twitter</button>
</body>
</html>