<html>
<head>

<!-- 
https://developers.facebook.com/docs/facebook-login/web/login-button
 -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
</head>
<body>


<script lang="text/javscript">
		var userInfo = null;
</script>



<!--  Facebook button -->
	<div class="fb-login-button" data-width="50" data-max-rows="1"
		data-size="small" data-button-type="login_with"
		data-show-faces="false" data-auto-logout-link="false"
		data-use-continue-as="false" data-scope="email"></div>


<script lang="text/javscript">

var facebookConnected =false;

  window.fbAsyncInit = function() {
    FB.init({
      appId      : '158515688188591',
      cookie     : true,
      xfbml      : true,
      version    : 'v2.12'
    });
    
    FB.AppEvents.logPageView();   
      
  //Callback
  	FB.getLoginStatus(function(response) {
  		console.log ("getLoginStatus");
  	    //statusChangeCallback(response);
  	    console.log(response);
  	    if (response['status']=='connected'){
  	    	console.log("connected");
  	    	var userId = response['authResponse']['userID'];
  	    	console.log("userId:"+userId);
  	    	var accessToken = response['authResponse']['accessToken'];
  	    	var signedRequest = response['authResponse']['signedRequest'];
  	    	var expiresIn = response['authResponse']['expiresIn'];
  	    	facebookConnected =true;
  	    	var userData = new Object();
  	    	
  	    	
  	    	/*
  	    	FB.api('/me', {fields: 'last_name'}, function(response) {
  	    	  console.log(response);
  	    	});
  	    	*/
  	    	

  	  	  	FB.api(
  						'/me/permissions',
  					  'GET',
  					  {scope: 'email'},
  					  function(resp) {
  					      	console.log ("response: "+JSON.stringify(resp));
  					  }
  					);
  	  	FB.api(
					'/me?fields=id,name,first_name,last_name,email,picture',
				  'GET',
				  {scope: 'email'},
				  function(resp) {
				      	console.log ("response: "+JSON.stringify(resp));
				      	
				      	userData['name']=resp['name'];
						
						userData['firstName']=resp['first_name'];
						userData['lastName']=resp['last_name'];
						userData['email']=resp['email'];
						userData['avatar']=resp['picture']['data']['url']; // eremu gehiago daude width, height, is_silhouette
						
						console.log ("userData: "+JSON.stringify(userData));
						
				  }
				);
  

  	    }
  	},{scope: 'email'});
  
  
  
  };
	
	
	/*
	{
status: 'connected',
authResponse: {
  accessToken: '...',
  expiresIn:'...',
  signedRequest:'...',
  userID:'...'
}
}
	
	*/
	

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "https://connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
</script>



      
</body>
</html>