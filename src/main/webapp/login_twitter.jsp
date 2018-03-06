<html>
<head>

<!-- 
https://dev.twitter.com/web/sign-in
 -->


<!-- GOOGLE app id -->
<meta name="google-signin-client_id" content="YOUR_CLIENT_ID.apps.googleusercontent.com">


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
	
	<!--  Google Login -->
	<script src="https://apis.google.com/js/platform.js" async defer></script>
</head>
<body>
<!--  Facebook button -->
	<div class="fb-login-button" data-width="50" data-max-rows="1"
		data-size="small" data-button-type="login_with"
		data-show-faces="false" data-auto-logout-link="false"
		data-use-continue-as="false"></div>


	<!--  Google button -->
<div class="g-signin2" data-onsuccess="onSignIn"></div>
	<!-- 
user: <input type="text" id="user"/>
pwd: <input type="password" id="pwd"/>
<input type="button" value="login"/> -->







	<script lang="text/javscript">
		$(document).ready(function() {
			console.log("jquery");
		});

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
			js.src = "https://connect.facebook.net/eu_ES/sdk.js";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
	</script>
</body>
</html>