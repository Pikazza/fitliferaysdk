
<%@page import="java.util.List"%>
<%@page import="com.liferay.portlet.expando.model.ExpandoBridge"%>
<%@page import="com.liferay.portal.model.Contact"%>
<%@page import="com.liferay.portal.service.PhoneLocalServiceUtil"%>
<%@page import="com.liferay.portal.model.Phone"%>
<%@page import="com.liferay.portal.model.User"%>
<%@page import="com.liferay.portal.service.UserLocalServiceUtil"%>
<%@page import="com.liferay.portal.NoSuchPhoneException"%>
 <%@ include file="/html/init.jsp"%>
 
  <portlet:resourceURL var="moderatorListingVar" id="moderatorListingResource"/> 
   <portlet:renderURL var="Listing"></portlet:renderURL>
  <portlet:renderURL var="addModerator">
  	<portlet:param name="render" value="addModerator" />  
  </portlet:renderURL>  

  <portlet:actionURL var="editlink">
      <portlet:param name="action" value="showeditModerator" />  
  </portlet:actionURL>

   
       <% List<User> usrList = (List) renderRequest.getAttribute("result"); %>   
       <%
    int pages=Integer.parseInt(request.getAttribute("pages").toString());
    int pageNo=Integer.parseInt(request.getAttribute("pageNo").toString());
    String leftIndex=String.valueOf(pageNo==1?1:pageNo-1);
    String rightIndex=String.valueOf(pageNo==pages?pages:pageNo+1);
  %>    
         
       <section class="wrapper">
        <div class="title-block">
          <div class="container"> 
            <ul class="breadcrumb">
            
            
              <li><a href="<%=PortalUtil.getPortalURL(request) +"/group/fiternity/admin-panel" %>">Admin panel</a></li>
              <li>Moderator</li>
            </ul>
           
            <div class="search-block">
              <div class="fL"><h1>Moderators</h1></div>
              <div class="fR"> 
                <span class="search-bar"><input type="text" class="tetxBox" placeholder="Search by moderators name" id="searchName"> <i class="fa fa-search"></i></span>
                 <button  onclick="addModerator('<%=addModerator.toString()%>')"  class="button button-primary button-mini" >
                  <i class="fa fa-plus-circle"></i>&nbsp; Add Moderator
                </button>
              </div>
            </div>
            
          </div>
        </div>

        <div class="table-block">
          <div class="container">
            <table class="list-table" width="100%" id="tblajax">
              <thead>
                <tr>
                  <th width="32%">User NAME</th>
                  <th width="32%">Eamil</th>
                  <th width="21%">Phone</th>
                  <th width="15%">&nbsp;</th>
                </tr>
              </thead>
              
              <tbody>
              
              <%--   <p> the ruturned object is  <%=ja %> </p> <br> --%>





              <%
              System.out.println("length of list"+usrList.size());
              for(User u : usrList)
              {           	    
            	
    PortletURL actionUrlFromJSP = renderResponse.createActionURL();
 	actionUrlFromJSP.setWindowState(LiferayWindowState.NORMAL);
 	actionUrlFromJSP.setPortletMode(LiferayPortletMode.VIEW);
 	actionUrlFromJSP.setParameter("action", "showeditModerator");
 	actionUrlFromJSP.setParameter("usrId",String.valueOf(u.getUserId())); 
 	
 	
 	 ExpandoBridge eb = u.getExpandoBridge();
 	 String phoneno = null;
 	 
 	 List<Phone> plist = PhoneLocalServiceUtil.getPhones(u.getCompanyId(), Contact.class.getName(), u.getContactId());
 	  String phonenos = null; 	
 	  	if(plist != null)
 	  	{
 	  		for(Phone p : plist )
 	  		{
 	  			System.out.print("phone:::::"+phonenos); 	  			
 	  			phonenos = p.getNumber();
 	  		}
 	  	}
 	  	
       
 	
	%>
                <tr>
                  <td><a href="<%=actionUrlFromJSP%>"><%= u.getFirstName().toString() %></a></td>
                  <td><%= u.getEmailAddress().toString() %></td>
                  <td><%= phonenos %></td>
                 <%  if(u.getStatus()==0) {%>
                  <td><button  class="button button-small button-active" >Active</button></td>
                  <% }else{ %>
                  <td><button  class="button button-small button-deactive">inactive</button></td>
                  <%} %>
                </tr>
                <% }%>
              </tbody>
              
            </table>
            
       </table>
             <% if(pages>1){ %>
              <div class="pagination-block">
              <div class="pagination">
                <ul>
                <li class="active">
                    <span><a href="<%=Listing.toString()+"&_moderators_WAR_fiternityserviceimplportlet_pageNo="+leftIndex %>"><i class="fa fa-chevron-left"></i></a></span>
                  </li>
                  <%for(int i=1;i<=pages;i++){ %>
                  <li <%if(pageNo==i){%>class="active" <%}%>><a href="<%=Listing.toString()+"&_moderators_WAR_fiternityserviceimplportlet_pageNo="+i %>"><%=i %></a></li>
                  <%} %>
                  <li>
                    <span><a href="<%=Listing.toString()+"&_moderators_WAR_fiternityserviceimplportlet_pageNo="+rightIndex %>"><i class="fa fa-chevron-right"></i></a></span>
                  </li>
                </ul>
              </div>
            </div>
             <%} %>
          </div>
        </div>
      </section>
 


   <script type="text/javascript">
function addModerator(url) {
    window.location.href = url;
}

$(function(){

    function ajaxcall(){	    	 	
			var searchquery = document.getElementById("searchName").value;			
			var editlink = "${editlink}";
			
			$.ajax({ 
				url : "${moderatorListingVar}",
				type : 'GET',
				data : {					
				searchString:searchquery	
				},
				async : false,
				success : function(serverResponse) {				
				var myArray=$.parseJSON(serverResponse);
				
				$('#tblajax tbody').html('');
				for(i=0; i<myArray.length;i++)
				{
					if(myArray[i].USR_ID>0){
					var editlink1=editlink+"&_moderators_WAR_fiternityserviceimplportlet_usrId="+myArray[i].USR_ID;
					var usrName='<td><a href="'+editlink1+'">'+myArray[i].USR_NAME +'</a></td>';
					var usrEmail='<td>'+myArray[i].USR_EMAIL +'</a></td>';
					var usrPhone='<td>'+myArray[i].USR_PHONE +'</a></td>';
					if(myArray[i].USR_STATUS=="ACTIVE"){ var currentStatus='<td><button class="button button-small button-active"><span>Active</span></button></td>'}
					else{var currentStatus='<td><button class="button button-small button-deactive"><span>Inactive</span></button></td>'}

					$('#tblajax tbody').append('<tr>'+ usrName +'<td>'+myArray[i].USR_EMAIL +' </td><td>'+myArray[i].USR_PHONE +'</td>'+currentStatus +'</tr>');
				}
				}	
				 $('.pagination-block').html('');
				},
				error:function(errorStatus){
				alert(errorStatus);	
				}
				});
			} 
    	
    	
    	$('#searchName').on('change', function(){
    		ajaxcall();
    	});
});
</script>