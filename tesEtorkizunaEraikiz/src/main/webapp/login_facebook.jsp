<html>
<head>

<!-- 
https://developers.facebook.com/docs/facebook-login/web/login-button
 -->



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
</head>
<body>
<!--  Facebook button -->
	<div class="fb-login-button" data-width="50" data-max-rows="1"
		data-size="small" data-button-type="login_with"
		data-show-faces="false" data-auto-logout-link="false"
		data-use-continue-as="false"></div>



	<script lang="text/javscript">
	

		window.fbAsyncInit = function() {
			FB.init({
				appId : 'your-app-i	d',
				autoLogAppEvents : true,
				xfbml : true,
				version : 'v2.12'
			});
		};
		
		// Facebook
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id)) {
				return;
			}
			js = d.createElement(s);
			js.id = id;
			js.src = "https://connect.facebook.net/en_US/sdk.js";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
		
		//Callback
		FB.getLoginStatus(function(response) {
			  if (response.status === 'connected') {
			    console.log('Logged in.');
			    
			    FB.getAuthResponse(function(accessToken ){
					console.log(accessToken)	
				})
				
			  }
			  else {
			    FB.login();
			  }
			});
		
		
		
	</script>
</body>
</html>