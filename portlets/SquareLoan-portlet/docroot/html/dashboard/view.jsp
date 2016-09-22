<%@ include file="/html/init.jsp" %>
<%@ include file="/html/dashboard/pleasewait.jsp" %>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<portlet:actionURL var="redirectURL">
<portlet:param name="action" value="redirect"/>
</portlet:actionURL>
<%
String decisionVal=(String)renderRequest.getAttribute("decision");
System.out.println("--------------------decisionVal----"+decisionVal);
System.out.println("path "+request.getContextPath());
%>

<form id="redirect" action="<%=redirectURL%>" method="post">
<input type="hidden" id="decision" name="decision" value=""/>
</form>

<script>
$( document ).ready(function() {
	ajaxindicatorstart(".....Please Wait.....");
	$('#decision').val('<%=decisionVal%>');
	document.getElementById('redirect').submit();
});
</script>