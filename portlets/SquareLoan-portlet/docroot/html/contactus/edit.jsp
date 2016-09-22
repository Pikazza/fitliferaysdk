<%@page import="com.square.service.ContactUsEnquiryLocalServiceUtil"%>

<%@page import="com.square.model.ContactUsEnquiry"%>


<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<%@ taglib uri="http://liferay.com/tld/theme" prefix="theme"%>
<portlet:defineObjects />
<theme:defineObjects/>
<portlet:resourceURL var="exportCSVURL" id="contactUsCSV"/>
	

<%@taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui"%>




<portlet:renderURL var="iteratorURL">

</portlet:renderURL>
<liferay-ui:search-container emptyResultsMessage="there-are-no-students"
	headerNames="Reference Number,First Name,First Name,Email,Address,Query" delta="5"
	deltaConfigurable="true">
	<liferay-ui:search-container-results>
		<%
		
	
			total = ContactUsEnquiryLocalServiceUtil.getContactUsEnquiriesCount();
		results=  ContactUsEnquiryLocalServiceUtil.getContactUsEnquiries(searchContainer.getStart(), searchContainer.getEnd());
		searchContainer.setTotal(total);
		searchContainer.setResults(results);
		%>
	</liferay-ui:search-container-results>
	<liferay-ui:search-container-row
		className="com.square.model.ContactUsEnquiry"
		keyProperty="referenceNo" modelVar="currentStudent">


		<liferay-ui:search-container-column-text name="Reference Number" property="referenceNo" />

		<liferay-ui:search-container-column-text name="First Name"
			property="firstName" />
			<liferay-ui:search-container-column-text name="First Name"
			property="lastName" />
			<liferay-ui:search-container-column-text name="Email"
			property="emailAddress" />
			<liferay-ui:search-container-column-text name="Address"
			property="address" />
			<liferay-ui:search-container-column-text name="Query"
			property="query" />


	</liferay-ui:search-container-row>
	<liferay-ui:search-iterator searchContainer="<%=searchContainer%>"
		paginate="true" />
</liferay-ui:search-container>
<button type="button" onclick="exportAsCsv()">Download as CSV</button>

<script type="text/javascript">
<!--
	//-->
	function exportAsCsv() {
		window.location.href = "${exportCSVURL}";
	}
</script>
