<%@page import="javax.portlet.RenderRequest"%>
<%@page import="java.util.List"%>
<%@ page import="com.liferay.asset.kernel.model.AssetCategory"%>

<%
	List<com.liferay.asset.kernel.model.AssetCategory> categorias = renderRequest.getAttribute("categories");
%>


<c:set var="categorias" value=<%=categorias%> />

<jsp:useBean id=""></jsp:useBean>
<div id="gaia" class="step-content" style="display: block;">
	<div class="ph4 pv4">
		<div class="center mw6 cf tc">
			<div class="f3 d mb2">1 / 3</div>
			<h2 class="f5 d ma0 pa0 lh-title"><liferay-ui:message key="idatziZureIdeia" /></h2>
		</div>
	</div>
	<div id="form-step-0" role="form" data-toggle="validator">
		<div class="ph4 pv5 pv6-l bg-ee-gray">
			<div class="center mw6 cf">
				<div class="form-group">
					<ul class="list flex-ns flex-wrap-ns ma0 pa0">
						
						<c:forEach var="categoria" items="${categorias}" varStatus="idx">
							<input type="radio" value="${categoria.descripcion}" data-id="${categoria.id}" />
								
							<li class="w-50-ns mb2">
								<input type="radio" name="category${idx.index}" id="category${idx.index}" value="${categoria.descripcion}" data-id="${categoria.id}" required="" />
								<label class="f4" for="category${idx.index}">${categoria.descripcion}</label>
							</li>
							
						</c:forEach>
						
						<!-- 
							<li class="w-50-ns mb2">
								<input type="radio" name="category"
								id="ciberseguridad" value="ciberseguridad" required=""><label
								class="f4" for="ciberseguridad">Ciberseguridad</label></li>
						<li class="w-50-ns mb2"><input type="radio" name="category"
							id="conciliacion" value="conciliacion"><label class="f4"
							for="conciliacion">Conciliación</label></li>
						<li class="w-50-ns mb2"><input type="radio" name="category"
							id="envejecimiento" value="envejecimiento"><label
							class="f4" for="envejecimiento">Envejecimiento</label></li>
						<li class="w-50-ns mb2"><input type="radio" name="category"
							id="economia" value="economia" required=""><label
							class="f4" for="economia">Economía</label></li>
						<li class="w-50-ns mb2"><input type="radio" name="category"
							id="participacion" value="participacion"><label
							class="f4" for="participacion">Participación</label></li>
						<li class="w-50-ns mb2"><input type="radio" name="category"
							id="movilidad" value="movilidad"><label class="f4"
							for="movilidad">Movilidad</label></li>
						<li class="w-50-ns mb2"><input type="radio" name="category"
							id="igualdad" value="igualdad"><label class="f4"
							for="igualdad">Igualdad</label></li>
						<li class="w-50-ns mb2"><input type="radio" name="category"
							id="cambioclimatico" value="cambioclimatico"><label
							class="f4" for="cambioclimatico">Cambio climático</label></li>
							 -->
					</ul>
					<div class="help-block with-errors"></div>
				</div>
			</div>
		</div>
	</div>
</div>


