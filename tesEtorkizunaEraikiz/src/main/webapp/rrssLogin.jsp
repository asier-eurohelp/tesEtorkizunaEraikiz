
<script lang="text/javscript">
		var userInfo = null;
</script>




	<!--  Facebook button -->
	<div class="fb-login-button" data-width="50" data-max-rows="1"
		data-size="small" data-button-type="login_with"
		data-show-faces="false" data-auto-logout-link="false"
		data-use-continue-as="false"></div>



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
	      
	  /* Callback */
	  	FB.getLoginStatus(function(response) {
	  	    console.log(response);
	  	    if (response['status']=='connected'){
	  	    	console.log("connected");
	  	    	var userID = response['userID'];
	  	    	console.log("userID:"+userID);
	  	    	var accessToken = response['accessToken'];
	  	    	var signedRequest = response['signedRequest'];
	  	    	var expiresIn = response['expiresIn'];
	  	    	facebookConnected =true;
		  	    	
		  	    userData['type']='facebook';
				userData['ID']=response['userID'];
				userData['Name']=profile.getName();
				userData['avatar']=profile.getName();
				userData['email']=profile.getName();
				
				
	  	    }
	  	});
	  
	  /* https://developers.facebook.com/docs/graph-api/reference/user/picture/ */
		    function  getUserInfo(userId){
	
				FB.api(
						  '/'+userId+'/picture',
						  'GET',
						  {},
						  function(response) {
						      console.log ("response: "+response);
						      
						  }
						);

				$fb = new Facebook\Facebook([
				  'app_id' => '158515688188591',
				  'app_secret' => 'b366fd917f922f21df82d563d1c68a3e',
				  'default_graph_version' => 'v2.12',
				  ]);

				try {
				  // Returns a `Facebook\FacebookResponse` object
				  $response = $fb->get('/me?fields=id,name', '{access-token}');
				} catch(Facebook\Exceptions\FacebookResponseException $e) {
				  echo 'Graph returned an error: ' . $e->getMessage();
				  exit;
				} catch(Facebook\Exceptions\FacebookSDKException $e) {
				  echo 'Facebook SDK returned an error: ' . $e->getMessage();
				  exit;
				}

				$user = $response->getGraphUser();

				echo 'Name: ' . $user['name'];
				// OR
				// echo 'Name: ' . $user->getName();				
		  }
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
	
	
	