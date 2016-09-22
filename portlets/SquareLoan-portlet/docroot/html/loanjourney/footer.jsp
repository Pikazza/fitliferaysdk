     <%@page import="com.liferay.portlet.journalcontent.util.JournalContentUtil"%>
<%@page import="com.liferay.util.portlet.PortletProps"%>
<%@page import="com.liferay.portal.kernel.util.StringPool"%>
 <%@ include file="/html/init.jsp" %> 
<%
String detailcontent1 = StringPool.BLANK;
try{ 
	
String articleid = PortletProps.get("footer.article");

detailcontent1 = JournalContentUtil.getContent(themeDisplay.getLayout().getGroupId(), articleid, null,themeDisplay.getLocale().toString() , themeDisplay);

}catch(Exception e){
	
	
	detailcontent1 = "Please configure eligbilty content";
}
%>

<%= detailcontent1 %>