<%@ include file="/WEB-INF/jsp/init.jsp" %>
<div id="configuration">

 <%@ taglib uri="http://liferay.com/tld/portlet" prefix="liferay-portlet" %> 
 <%@ page import="com.liferay.portal.kernel.util.*" %>
 <%@ page import="com.liferay.portal.kernel.util.*" %>
 <%@ page import="com.liferay.portlet.*" %>
  
<%@ page import="javax.portlet.*" %> 

<portlet:defineObjects />

<% 
	String result = (String)renderRequest.getAttribute("result");
	
PortletPreferences prefs = renderRequest.getPreferences();
String portletResource = ParamUtil.getString(request, "portletResource");

if (Validator.isNotNull(portletResource)) {
    prefs = PortletPreferencesFactoryUtil.getPortletSetup(request, portletResource);
}

String idCategoria = (String)prefs.getValue("idCategoria","");

%>

<div>
	<% if ("OK".equals(result)) {%>
	 <!--  SessionMessages.add(actionRequest, "successfully-handled-some-action");
  SessionErrors.add(actionRequest, "problem-occurred");
  -->
		<liferay-ui:sucess key="success" message=""/>
	<%} else{%>
		
	<%} %>
</div>

<form action="<liferay-portlet:actionURL portletConfiguration="true" ><portlet:param name="action" value="savePreferences"/></liferay-portlet:actionURL>" 
	method="post" name="<portlet:namespace />form">    
    <liferay-ui:message key="kategoriIda"/>: <input size="50" type="number" value="<%=idCategoria%>" name="<portlet:namespace>idCategoria" /><br/><br/>    
    
    <input type="hidden" name="action" value="save">
    <input type="button" value="Save" onClick="submitForm(document.<portlet:namespace />form);" /><br/><br/>             
</form>

</div>