<%@page import="com.liferay.portal.kernel.util.StringUtil"%>
<%@page import="com.squaretoday.util.SquareLoanUtil"%>
<%@ include file="/html/init.jsp" %>



<% 

String	content = SquareLoanUtil.getContent(themeDisplay.getLayout().getGroupId(),  ParamUtil.getString(request,"contentid"), themeDisplay);
content =  StringUtil.replace( content,	new String[] {  "[$REDIRECT_URL$]"},new String[] {  ParamUtil.getString(request,"redirecturl")});

%>

<%=content %>