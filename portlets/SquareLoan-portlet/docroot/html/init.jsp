<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@page import="javax.portlet.WindowState"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://liferay.com/tld/theme" prefix="theme" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<theme:defineObjects/>
 
<portlet:defineObjects />

 <portlet:renderURL var="changeLoan" windowState="<%=WindowState.NORMAL.toString()%>"  >
</portlet:renderURL> 

<%@page import="com.liferay.portlet.journalcontent.util.JournalContentUtil"%>
<%@page import="com.liferay.util.portlet.PortletProps"%>
<%@page import="com.liferay.portal.kernel.util.StringPool"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.liferay.portal.kernel.util.ListUtil"%>
<%@page import="com.squaretoday.model.FinancialTransaction"%>
<%@page import="java.util.List"%>
<%@page import="com.liferay.portal.kernel.util.ParamUtil"%>
<%@page import="com.liferay.portal.util.PortalUtil"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui"%>
<%@taglib uri="http://liferay.com/tld/portlet" prefix="liferay-portlet"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
	

<portlet:renderURL var="dashboardURL"/>
<portlet:renderURL var="getStartedUrl"  windowState="<%=WindowState.MAXIMIZED.toString()%>"  >
<portlet:param name="id" value="getstarted"/>
<portlet:param name="pagename" value="getstarted"/>
<portlet:param name="borrowamount" value="brwamt"/>

	<portlet:param name="term" value="trm"/>
	<portlet:param name="monthlyrepay" value="mnrpy"/>
	<portlet:param name="totalrepay" value="totrpy"/>
	<portlet:param name="action" value="getStarted"/>
</portlet:renderURL>
<portlet:actionURL var ="aboutyouurl" windowState="<%=WindowState.MAXIMIZED.toString()%>">
<portlet:param name="action" value="aboutyou"/>
</portlet:actionURL>
<portlet:renderURL var="cancelurl" windowState="<%=WindowState.NORMAL.toString()%>"  >
<portlet:param name="redirect" value="getStarted"/>
<portlet:param name="amount" value=""/>
	<portlet:param name="term" value=""/>
	<portlet:param name="monthlyrepay" value=""/>
	<portlet:param name="totalrepay" value=""/>
	<portlet:param name="action" value="cancel"/>
</portlet:renderURL>
 
<portlet:renderURL var="paymentURL">
<portlet:param name="action" value="financialPayment"/>
</portlet:renderURL>
<portlet:renderURL var="updateViewUrl">
<portlet:param name="action" value="updateView"/>
</portlet:renderURL>
<portlet:renderURL var="mydocumentUrl">
<portlet:param name="action" value="documentView"/>
</portlet:renderURL>
<portlet:renderURL var="makePaymentURL">
<portlet:param name="action" value="makePayment"/>
</portlet:renderURL>
<portlet:resourceURL var="viewDocumetURL" id="viewDocument"/>