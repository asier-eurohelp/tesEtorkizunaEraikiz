<div id="bidali" class="step-content" style="display: block;">
	<div class="ph4 pv4">
		<div class="center mw6 cf tc">
			<div class="f3 d mb2">3 / 3</div>
			<h2 class="f5 d ma0 pa0 lh-title"><liferay-ui:message key="identifikatuZureIdeiaPublikatzeko" /></h2>
		</div>
	</div>
	<div id="form-step-2" role="form" data-toggle="validator">
		<div class="ph4 pv5 pv6-l bg-ee-gray">
			<div class="center mw7 tc cf">
				<ul class="list flex flex-wrap justify-between ma0 pa0">
					<li class="mb3 w-40 w-auto-ns"><a href="#"
						class="f7 bg-google d white bn db dib-ns ph5-ns pv3 br-pill lh-solid h-white dim">Google</a></li>
					<li class="mb3 w-40 w-auto-ns"><a href="#"
						class="f7 bg-facebook d white bn db dib-ns ph5-ns pv3 br-pill lh-solid h-white dim">Facebook</a></li>
					<!--   <li class="mb3 w-40 w-auto-ns"><a href="#"
						class="f7 bg-twitter d white bn db dib-ns ph5-ns pv3 br-pill lh-solid h-white dim">Twitter</a></li> -->
					<!-- <li class="mb3 w-40 w-auto-ns"><a href="#" class="f7 bg-gray d white bn db dib-ns ph5-ns pv3 br-pill lh-solid h-white">E-mail</a></li> -->
				</ul>
				<input id="izena" name="izena" type="hidden" />
				<input id="abizenak" name="abizenak" type="hidden" />
				<input id="email" name="email" type="hidden" />
				<input id="avatar" name="avatar" type="hidden" />
				<input id="loginMota" name="loginMota" type="hidden" />
				<input id="idLogin" name="idLogin" type="hidden" />
				
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">
	var userInfoRrssLoged=null;

	$(document).ready(function(){
		RrssLogin.initRrssLoginFacebook();

		RrssLogin.initRssLoginGoogle('callbackOnSignIn');
		
	});
	
	function callbackOnSignIn(googleUser) {
		console.log ("callbackOnSignIn:"+JSON.stringify(googleUser));
		var userData= RrssLogin.extractUserDataGoogle(googleUser);
		RrssLogin.setStatusGoogle(userData);
	}
	
	function loginFb(){
		console.log("loginFb");
		RrssLogin.loginFacebook(function (response){
			console.log("callback site: "+JSON.stringify(response));
			var userData = RrssLogin.extractUserDataFacebook();
			RrssLogin.setStatusFacebook(userData)
			gordeIdeia();
		});
	}
	
	function gordeIdeia(){
		if (userInfoRrssLoged!=undefined && userInfoRrssLoged!=null){
			
			$("#izena").text(userInfoRrssLoged["firstName"]);
			$("#abizenak").text(userInfoRrssLoged["lastName"]);
			$("#email").text(userInfoRrssLoged["email"]);
			$("#avatar").text(userInfoRrssLoged["avatar"]);
			$("#loginMota").text(userInfoRrssLoged['type']);
			$("#idLogin").text(userInfoRrssLoged['ID']);
			
			console.log("gordeIdeia");
			$("#ideiaSortuFrm").submit();
		}
	}
	
	function kanpokoLogin(){
		
	}
	
</script>
