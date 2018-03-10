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

function createOauthSignatureBaseString (url, params){
	var signatureBaseString='';
	var httpMethod='POST';
	var paramString="";
	// proocol must match teh one from the request. HTTP://-HTPPS:// 
	var baseUrl='https://api.twitter.com/1.1/statuses/update.json';
	var protocolBase = baseUrl.split("/")[0];
	var protocolUrl = url.split("/")[0];
	if (protocolBase != protocolUrl){
		alert("Protocol mismatch on HTTP Header.");
	}else{
		//Collect parameters
		var sortedParams = Object.keys(params).sort();
		console.log ("sortedParams: "+JSON.stringify(sortedParams));
		
		
		var i=0;
		for (var key in sortedParams){
				var val= sortedParams[key];
				paramString= paramString+(i==0?'':'&')+key+"="+val;
				i++;
		}	
	}
	// The full param string should be percentEncoded only 2 & characters should be visile.
	signatureBaseString=encodeURIComponent(httpMethod)+'&'+encodeURIComponent(baseUrl)+'&'+encodeURIComponent(paramString);
	console.log (signatureBaseString);
	return signatureBaseString;
 }
 
 function createOauthSignature(consumerSecret, oauthSecret, url, params){
	 var signingKey=consumerSecret+'&'+oauthSecret;
	 var signatureBase =createOauthSignatureBaseString(url, params);
	 
	 //var crypto = require('crypto');
	 //hmacSha1 = new HmacSha1();
	 //var signature =hmacSha1.digest(signingKey, signatureBase);
	 
	 console.log ("signatureBase:"+signatureBase+" signingKey:"+signingKey);
	 var signature =CryptoJS.HmacSHA1(signatureBase, signingKey);
	 var strSignature = signature.toString(); //CryptoJS.enc.Utf8
	 console.log ("strSignature:"+strSignature);
	 return signature;
 }

function createOauthHeader(consumerSecret, oauthSecret, url, params){

	var signatureParams = new Object();
	for (var key in params){
		var val= params[key];
		signatureParams[key]=val;
		i++;
	}	

	signatureParams["include_entities"]=true;
	signatureParams["oauth_consumer_key"]=consumerSecret;
	signatureParams["oauth_nonce"]=Math.random().toString(36).slice(2);;
	signatureParams["oauth_signature_method"]='HMAC-SHA1';
	signatureParams["oauth_timestamp"]=Date.now();
	signatureParams["oauth_token"]=oauthSecret;
	signatureParams["oauth_version"]="1.0";
	signatureParams["oauth_signature"]= createOauthSignature(consumerSecret, oauthSecret, url, signatureParams);	
	return signatureParams;
}

function authenticate (){
// 	var url = 'https://api.twitter.com/oauth/authenticate'; //?force_login=true
	var headers =createOauthHeader (consumerSecret, oauthSecret, url);
	var strAuth = $.map(Object.getOwnPropertyNames(headers), function(k) { return [k, headers[k]].join(':') }).join(',');
	$.ajax({
		"url":url,
		"method": "POST",
		crossDomain: true,
		  headers: { 
			  'Access-Control-Allow-Origin': 'http://127.0.0.1',
			  'Access-Control-Allow-Methods': 'POST',
			  'Access-Control-Allow-Headers': 'Content-Type, Accept, X-Requested-With, Session',
			  "Authorization": "OAuth " + strAuth
			  }
		} ).done (function (res){
			console.log ("done");
	});
}


function postRequest(url, params){
	var authHeader = createOauthHeader(url, params);
}


var consumerSecret = 'Ma2GQOGw1SoHM7sxeMcK4G2pz';
var oauthSecret = '970980458656825344-EEMylTEGLO5AcLsDWbjlhxfmRqvIell';

$(document).ready(function (){
	var params = new Object();
	
	//var accessToken = authenticateTwitter();
	
	var oauthTokenSecret ='';
	var oauth_callback ='';
	
	//postRequest();
});



function authenticateTwitter(){
	var OAuth = require('@zalando/oauth2-client-js');
	//var OAuth = new Oauth2();
	var twitter = new OAuth.Provider({
	    id: 'twitter',   // required
	    authorization_url: 'https://api.twitter.com/oauth/authenticate?force_login=true' // required
	});
	// create request
	var request = new OAuth.Request({
	    client_id: 'my_client_id',  // required
	    redirect_uri: 'https://gipuzkoa.sare.gipuzkoa.net/eu/web/oauthCallback'
	});
	
	var uri = twitter.requestToken(request);
	twitter.remember(request);
	window.location.href = uri;
	var accessToken=twitter.getAccessToken();
	return accessToken;
}


/*
#Onak:

OAuth oauth_consumer_key="Ma2GQOGw1SoHM7sxeMcK4G2pz",

#Generate random alphanumeric String, removing non word data.
var oauth_nonce =Math.random().toString(36).slice(2);
oauth_nonce="kYjzVBB8Y0ZFabxSWbWovY3uYSQ2pTgmZeNu2VS4cg",

#OAuth 1.0a HMAC-SHA1 

oauth_signature="tnnArxj06cWHq44gCs1OSKk%2FjLY%3D",
oauth_signature_method="HMAC-SHA1",
oauth_timestamp="1318622958",
oauth_token="370773112-GmHxMAgYyLbNEtIKZeRNFsMKPR9EyMZeS9weJAEb",
oauth_version="1.0"
*/

</script>


<button onclick="authenticate();">Login Twitter</button>
</body>
</html>