
/*
 * 
 * Requerimientos: 
 * 
 * Jquery
 * 
 * 
 * Gehitu 
 * 
 * 
 * */


RrssLogin = {
	  
		appIdFacebook:'1032860123528371', //'158515688188591',
		appIdGoogle:'548619655932-8fe6m83av908jgqfnv462rauo2hk417m.apps.googleusercontent.com',
		
	initRssLogin: function (callbackLoged){
		console.log ("initRrssLoginFacebook...");
		RrssLogin.initRrssLoginFacebook(callbackLoged);
		console.log ("initRssLoginGoogle...");
//		RrssLogin.initRssLoginGoogle(callbackLoged);
		console.log ("Done");
	},

	initRrssLoginFacebook :function (callbackLoged){
		var div =$(document).find("#rrssLogin");
		
		var btn = $(document).find("#loginWithFacebookBtn");
		
		if (btn==undefined|| (btn!=undefined && btn==null)){
			//Gehitu Facebook-en botoia
			var divContent = $("<div>");
			divContent.append('<div id="loginWithFacebookBtn" class="fb-login-button" data-width="50" data-max-rows="1" data-size="small" data-button-type="login_with" data-show-faces="false" data-auto-logout-link="false" data-use-continue-as="false" data-scope="email"></div>');
			div.append(divContent.html());
			btn = document.find("#loginWithFacebookBtn");
		}
		
		$(btn).click(function(e){
			console.log("facebookButtonClik!!!!!");
			RrssLogin.loginFacebook();
			e.preventDefault();
		});
		
//		var script = $("<script>").html("function FB.getLoginStatus(status){ RrssLogin.callbackFacebook(status)}").appendTo(div);

		//document.head.appendChild(script);
		
		
		 // Gehitu Facebook-en SDK.
		 // Frogatu ondo geitzen dela kodean.
		
		  (function(d, s, id){
		     var js, fjs = d.getElementsByTagName(s)[0];
		     if (d.getElementById(id)) {return;}
		     js = d.createElement(s); js.id = id;
		     js.src = "https://connect.facebook.net/en_US/sdk.js";
		     fjs.parentNode.insertBefore(js, fjs);
		   }(document, 'script', 'facebook-jssdk'));	
		  
		  var facebookConnected =false;

		  window.fbAsyncInit = function() {
		    FB.init({
		      appId      : RrssLogin.appIdFacebook,
		      cookie     : true,
		      xfbml      : true,
		      version    : 'v2.12'
		    });
		    
		  }
			
	},
	
	loginFacebook: function(callback){
		console.log("loginFacebook");
		FB.login(function(response) {
			  console.log("response FB:"+JSON.stringify(response));
			  callback(response);
			}, {scope: 'public_profile,email'});
	},
	
	extractUserDataFacebook: function(){
		var userData = new Object();
		userData['type']='facebook';
	    //FB.AppEvents.logPageView();
		  //Callback
		  	FB.getLoginStatus(function(response) {
		
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
	return userData;
	},
	
	setStatusFacebook: function (name, avatar){
		
		$("#loginWithFacebookBtn").append(name).append($("img",{src:avatar}));
		
	}, 	
	initRssLoginGoogle: function (callbackLogedName){
		var div =$(document).find("#rrssLogin");
		div.append('<script src="https://apis.google.com/js/platform.js" async defer></script>')
		var name = callbackLogedName!=undefined && callbackLogedName!=null?callbackLogedName:"onSignIn";
		
		div.append('<div id="loginWithGoogle" class="g-signin2" data-onsuccess="'+name+'"></div>');
		
		div.append('<a href="#" onclick="signOut();">Sign out from Google</a>');
		
		var head =$(document).find("head");
		head.append('<meta name="google-signin-client_id" content="'+RrssLogin.appIdGoogle+'">');
		
	},
	
	extractUserDataGoogle: function (googleUser) {
		  var profile = googleUser.getBasicProfile();
		  var userData = new Object();
		  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
		  console.log('Name: ' + profile.getName());
//		  console.log('Image URL: ' + profile.getImageUrl());
//		  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
		  userData['type']='google';
		  userData['ID']=profile.getId();
		  userData['name']=profile.getName();
		  userData['firstName']=profile.getGivenName();
		  userData['lastName']=profile.getFamilyName();
		  userData['avatar']=profile.getImageUrl();
		  userData['email']=profile.getEmail();
		  //userInfo=userData;
		  return userData;
		},
		
	setStatusGoogle: function(googleUser){
		console.log("setStatusGoogle");
		$("#loginWithGoogle").append(googleUser["name"]).append(  $("<img/>",{src:googleUser["avatar"]}));
	}
		
	
}



