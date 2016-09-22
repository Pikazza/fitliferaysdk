<%-- <%@page import="com.square.service.DayBuyBackLocalServiceUtil"%>
<%@page import="com.square.service.PawnBrokingEnquiryLocalServiceUtil"%>
<%@page import="com.square.model.PawnBrokingEnquiry"%>
<%@page import="com.square.model.DayBuyBack"%>
<%@ include file="/html/init.jsp" %>
<%@page import="com.square.model.Squaresubscription"%>
<%@page
	import="com.square.service.SquaresubscriptionLocalServiceUtil"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<%@ taglib uri="http://liferay.com/tld/theme" prefix="theme"%>
<portlet:defineObjects />
<theme:defineObjects/>
<portlet:resourceURL var="exportCSVURLPawn" id="pawnBroking"/>
<portlet:resourceURL var="exportCSVURLDay" id="dayBuyBack"/>
	

<%@taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui"%>
<%

String pageName=themeDisplay.getLayout().getName(themeDisplay.getLocale());
System.out.println("pageName : "+pageName);
%>



<portlet:renderURL var="iteratorURL">

</portlet:renderURL>
<%
		if(pageName.trim().equalsIgnoreCase("pawn broking")){%>
<liferay-ui:search-container emptyResultsMessage="there-are-no-students"
	headerNames="Reference No,Title,Name,Email,Phone,Above18,Address,Condition,Type,carat,weight,Url" delta="5"
	deltaConfigurable="true">
	<liferay-ui:search-container-results>
		<%
		
			total = PawnBrokingEnquiryLocalServiceUtil.getPawnBrokingEnquiriesCount();
		results= PawnBrokingEnquiryLocalServiceUtil.getPawnBrokingEnquiries(searchContainer.getStart(), searchContainer.getEnd());
		searchContainer.setTotal(total);
		searchContainer.setResults(results);
		
		
		%>
		</liferay-ui:search-container-results>
	
	<liferay-ui:search-container-row
		className="com.square.model.PawnBrokingEnquiry"
		keyProperty="referenceNo" modelVar="pawnBrokingEnquiry">
		<liferay-ui:search-container-column-text name="Reference Number" property="referenceNo" />
			<liferay-ui:search-container-column-text name="Title"
			property="title" />
			<liferay-ui:search-container-column-text name="Name"
			property="name" />
			<liferay-ui:search-container-column-text name="Email"
			property="emailAddress" />
			<liferay-ui:search-container-column-text name="Phone"
			property="phoneNumber" />
			<liferay-ui:search-container-column-text name="Above18"
			property="above18" />
			<liferay-ui:search-container-column-text name="Address"
			property="address" />
			<liferay-ui:search-container-column-text name="Item Condition"
			property="itemCondition" />
			<liferay-ui:search-container-column-text name="Desc"
			property="itemDescription" />
			<liferay-ui:search-container-column-text name="Age of item"
			property="ageofItem" />
			<liferay-ui:search-container-column-text name="Type"
			property="type" />
			<liferay-ui:search-container-column-text name="Carat"
			property="carat" />
			<liferay-ui:search-container-column-text name="Weight"
			property="weight" />
			<liferay-ui:search-container-column-text name="Image Url" 
			property="imageUrl" href="<%=pawnBrokingEnquiry.getImageUrl() %>" />		
	</liferay-ui:search-container-row>
	
	
	<liferay-ui:search-iterator searchContainer="<%=searchContainer%>"
		paginate="true" />
</liferay-ui:search-container>
<button type="button" onclick="exportAsCsv('${exportCSVURLPawn}')">Download as CSV</button>
<%}else{ %>
<liferay-ui:search-container emptyResultsMessage="there-are-no-students"
	headerNames="Reference No,Title,Name,Email,Phone,Above18,Address,Condition,Type,carat,weight,Url," delta="5"
	deltaConfigurable="true">
	<liferay-ui:search-container-results>
	<%
	
	total = DayBuyBackLocalServiceUtil.getDayBuyBacksCount();
	results= DayBuyBackLocalServiceUtil.getDayBuyBacks(searchContainer.getStart(), searchContainer.getEnd());
	searchContainer.setTotal(total);
	searchContainer.setResults(results);
	%>
	</liferay-ui:search-container-results>
	<liferay-ui:search-container-row
		className="com.square.model.DayBuyBack"
		keyProperty="referenceNo" modelVar="dayBuyBack">
		<liferay-ui:search-container-column-text name="Reference Number" property="referenceNo" />
		<liferay-ui:search-container-column-text name="Title"
			property="title" />
			<liferay-ui:search-container-column-text name="Name"
			property="name" />
			<liferay-ui:search-container-column-text name="Email"
			property="emailAddress" />
			<liferay-ui:search-container-column-text name="Phone"
			property="phoneNumber" />
			<liferay-ui:search-container-column-text name="Above18"
			property="above18" />
			<liferay-ui:search-container-column-text name="Address"
			property="address" />
			<liferay-ui:search-container-column-text name="Item Condition"
			property="itemCondition" />
			<liferay-ui:search-container-column-text name="Desc"
			property="itemDescription" />
			<liferay-ui:search-container-column-text name="Age of item"
			property="ageofItem" />
			<liferay-ui:search-container-column-text name="Type"
			property="type" />
			<liferay-ui:search-container-column-text name="Carat"
			property="carat" />
			<liferay-ui:search-container-column-text name="Weight"
			property="weight" />
			<liferay-ui:search-container-column-text name="Image Url"
			property="imageUrl" href="<%=dayBuyBack.getImageUrl() %>" />


	</liferay-ui:search-container-row>
	<liferay-ui:search-iterator searchContainer="<%=searchContainer%>"
		paginate="true" />
</liferay-ui:search-container>
<button type="button" onclick="exportAsCsv('${exportCSVURLDay}')">Download as CSV</button>
	

<%} %>
<script type="text/javascript">
<!--
	//-->
	function exportAsCsv(urlPawn) {
		window.location.href = urlPawn;
	}
</script>
 --%>