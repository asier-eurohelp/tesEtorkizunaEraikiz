<%@ include file="/WEB-INF/jsp/init.jsp"%>

<form action='<portlet:actionURL/>' id="ideiaSortuFrm" enctype="multipart/form-data" method="post" role="form" data-toggle="validator" accept-charset="utf-8" class="ma0">
	<ul class="list ma0 pa0 nav nav-tabs step-anchor">
		<li class="active"><a href="#gaia"><liferay-ui:message key="gaia" /></a></li>
		<li><a href="#ideia"><liferay-ui:message key="ideia" /></a></li>
		<li><a href="#bidali"><liferay-ui:message key="publikatu" /></a></li>
	</ul>
	<div class="sw-container tab-content" style="min-height: 510px;">
		<%@ include file="gaia.jsp"%>
		<%@ include file="ideia.jsp"%>
		<%@ include file="bidali.jsp"%>
		<%@ include file="nabigazioa.jsp"%>
	</div>
</form>

<script type="text/javascript">

function erakutsiGaia(){
	$("#ideia").hide();
	$("#bidali").hide();
	$("#gaia").show();
}

function erakutsiIdeia(){
	$("#bidali").hide();
	$("#gaia").hide();
	$("#ideia").show();
}

function erakutsiBidali(){
	$("#ideia").hide();
	$("#gaia").hide();
	$("#bidali").show();
}

	$(document).ready(function() {
		erakutsiGaia();
	});
	
</script>
