<html>
<head>

<!-- 
https://developers.google.com/identity/sign-in/web/sign-in
 -->
 
<!-- GOOGLE app id -->
<meta name="google-signin-client_id" content="548619655932-8fe6m83av908jgqfnv462rauo2hk417m.apps.googleusercontent.com">


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
	
	<!--  Google Login -->
	<script src="https://apis.google.com/js/platform.js" async defer></script>
</head>
<body>


<p>Google SignIn</p>

	<!--  Google button -->
<div class="g-signin2" data-onsuccess="onSignIn"></div>

<a href="#" onclick="signOut();">Sign out</a>
	<!-- 
user: <input type="text" id="user"/>
pwd: <input type="password" id="pwd"/>
<input type="button" value="login"/> -->


	<script lang="text/javscript">
		$(document).ready(function() {
			console.log("jquery");
		});

		
		function onSignIn(googleUser) {
			  var profile = googleUser.getBasicProfile();
			  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
			  console.log('Name: ' + profile.getName());
			  console.log('Image URL: ' + profile.getImageUrl());
			  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
			}
		
		function signOut() {
		    var auth2 = gapi.auth2.getAuthInstance();
		    auth2.signOut().then(function () {
		      console.log('User signed out.');
		    });
		  }
	
	</script>
</body>
</html>