<nav class="sw-toolbar sw-toolbar-bottom">
	<div class="cf ph4 pv4 sw-btn-group pull-none" role="group">
		<input id="atzeraBtn" class="input-reset bn bg-ee sw-btn-prev fl disabled" type="button">
			
		<input id="aurreraBtn" class="input-reset bn bg-ee sw-btn-next fr" type="button">
	</div>
</nav>



<script lang="text/javascript">

$(document).ready(function(){
	$("#aurreraBtn").click(function (e){
		e.preventDefault();
		if ($("#gaia").is(":visible")){
			erakutsiIdeia();
		}else if ($("#ideia").is(":visible")){
			erakutsiBidali();
		}else if ($("#bidali").is(":visible")){
			gordeIdeia();
		}
	});
	
	$("#atzeraBtn").click(function (e){
		e.preventDefault();
		if ($("#gaia").is(":visible")){
			garbitu();
		}else if ($("#ideia").is(":visible")){
			erakutsiGaia();
		}else if ($("#bidali").is(":visible")){
			kanpokoLogin();
		}	
	});
});

function garbitu(){
	console.log("garbitu");
	$("#gaia").find("radio:selected").removeAttr("selected");
	$("#ideiaTestua").txt("");
	$("#ideiaFitxategia").val(null);
}

</script>

 

 