<%@ include file="/html/init.jsp"%>
 
<portlet:resourceURL var="eventListingVar" id="eventListingResource"/>
<portlet:renderURL var="Listing"></portlet:renderURL>  
<portlet:renderURL var="addEvent">
<portlet:param name="render" value="addEvent" />  
</portlet:renderURL> 
<portlet:renderURL var="editEventLink">
<portlet:param name="render" value="showEditEvent" />  
</portlet:renderURL>

<%	User user1 = (User) request.getAttribute(WebKeys.USER);
    String roles= RoleLocalServiceUtil.getUserRoles(user1.getUserId()).toString();
    JSONArray ja=new JSONArray(request.getAttribute("return").toString());
    JSONArray jsonstd=new JSONArray(request.getAttribute("jsonstd").toString());
   %>
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
              <li>Events</li>
            </ul>
            <div class="search-block">
              <div class="fL"><h1>Events</h1></div>
              <div class="fR">
                <span class="search-bar"> 
                  <input type="text" class="tetxBox" id="searchEvent" placeholder="Search by event name"> <i class="fa fa-search">&nbsp;</i>
                </span>
              </div>
            </div>
          </div>
        </div>

        <div class="table-block">
          <div class="container">
            <div class="top-patch">
              <div class="clearfix">
                <div class="fR">
                
                 
                
                <%if (roles.contains("Events Manager") || roles.contains("Administrator") || roles.contains("Site Admin")){ %>
                <select name="studioSelection" class="selectMenu eventList" id="selectStd">
                	<option value="0"> Select Studio</option>
              		 <option value="0" selected="selected"> Select Studio</option>
                <% for(int n = 0; n < jsonstd.length(); n++){
            	    JSONObject stdlist = jsonstd.getJSONObject(n); %>
                
                    <option value='<%=stdlist.get("STD_ID")%>'> <%=stdlist.get("STD_NAME") %></option> 
                  
                    <%} %>
                   </select>  
                <%
                }else
                {
                	String stdId=portletSession.getAttribute("stdId", PortletSession.APPLICATION_SCOPE).toString();
                %>   
                	<select name="studioSelection" class="selectMenu eventList hideStd" id="selectStd">
                	 <option value='<%=stdId%>'> <%=user1.getFirstName() %></option> 
                	  </select>
                <%} %>
                  
                  <select name="eventSelection" class="selectMenu eventList" id="selecteventType">
                    <option value="S">SELECT EVENTS</option>
                  	<option value="ALL" selected="selected">All Events</option>
                    <option value="U">Upcoming Events</option>
                    <option value="C">Completed Events</option>
                  </select>
                 
                  <button onclick="addEvent('<%=addEvent.toString()%>')" class="button button-primary button-mini">
                    <i class="fa fa-plus-circle">&nbsp;</i>&nbsp; Add event
                  </button>
                </div>
              </div>
            </div>
            <table class="list-table" width="100%" id="eventajax">
              <thead>
                <tr>
                  <th width="30%">EVENT NAME</th>
                  <th width="30%">STUDIO</th>
                  <th width="15%">EVENT DATE</th>
                  <th width="15%">EXPIRY DATE</th>
                  <th width="10%">&nbsp;</th>
                </tr>
              </thead>
              <tbody>
     
               <%for(int n = 0; n < ja.length(); n++)
              {
            	    JSONObject object = ja.getJSONObject(n);
            	    PortletURL actionUrlFromJSP = renderResponse.createRenderURL();
 					actionUrlFromJSP.setWindowState(LiferayWindowState.NORMAL);
 					actionUrlFromJSP.setPortletMode(LiferayPortletMode.VIEW);
 					actionUrlFromJSP.setParameter("render", "showEditEvent");
 					actionUrlFromJSP.setParameter("staId",object.get("STA_ID").toString());
 					
 					String date=object.get("STA_START_DATE").toString();
 					DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
 					Date stadate=df.parse(date);
 					df=new SimpleDateFormat("dd MMM yyyy");
 					
 					
 					String date1=object.get("STA_EXPIRY_DATE").toString().equals("null")?"0000-00-00":object.get("STA_EXPIRY_DATE").toString();
 				   	DateFormat df1=new SimpleDateFormat("yyyy-MM-dd");
 				  	Date exdate =df1.parse(date1); 
 				  	df1=new SimpleDateFormat("dd MMM yyyy");
 				 	
					%>
                <tr>
                  <td><a href="<%=actionUrlFromJSP%>"><%=object.get("STA_NAME") %></a></td>
                  <td><%=object.get("STD_NAME") %></td>
                  <td><%=df.format(stadate) %></td>
                  <td><%=df1.format(exdate) %></td>
                  <%  if(object.get("STA_STATUS").equals("ACTIVE")) {%>  
                  <td><button class="button button-small button-active"><span>Active</span></button></td>
                 	<%}else{ %>
                  <td><button class="button button-small button-deactive"><span>Inactive</span></button></td>
                   <%} %>  
                </tr>
              <% } %>   
             </tbody>
            </table>
            
    	<% if(pages>1 ){ %>
         <div class="pagination-block">
              <div class="pagination">
                <ul>
                <li class="active">
                    <span><a href="<%=Listing.toString()+"&_events_WAR_fiternityserviceimplportlet_pageNo="+leftIndex %>"><i class="fa fa-chevron-left"></i></a></span>
                  </li>
                  <%for(int i=1;i<=pages;i++){ %>
                  <li <%if(pageNo==i){%>class="active" <%}%>><a href="<%=Listing.toString()+"&_events_WAR_fiternityserviceimplportlet_pageNo="+i %>"><%=i %></a></li>
                  <%} %>
                  <li>
                    <span><a href="<%=Listing.toString()+"&_events_WAR_fiternityserviceimplportlet_pageNo="+rightIndex %>"><i class="fa fa-chevron-right"></i></a></span>
                  </li>
                </ul>
              </div>
            </div>
             <%} %>
          </div>
        </div>
      </section>
      
<script type="text/javascript">

function addEvent(url) {
    window.location.href = url;
}
$(function(){
	$( ".eventList" ).selectmenu({
		  select: function( event, ui ) {
			  ajaxcall();             
		  }
		});
	
	$('#searchEvent').on('change', function(){
		  ajaxcall();
	});
	
	function ajaxcall(){	
	 	var selectStd = document.getElementById("selectStd");
		var studioId = selectStd.options[selectStd.selectedIndex].value;   
		var selecteventType = document.getElementById("selecteventType");
		var eventId = selecteventType.options[selecteventType.selectedIndex].value;
		var searchquery = document.getElementById("searchEvent").value;
		var editlink = "${editEventLink}";
		
		$.ajax({ 
			url : "${eventListingVar}",
			type : 'GET',
			data : {	
			stdId:studioId,
			eventType:eventId,	
			searchString:searchquery	
			},
			async : false,
			success : function(serverResponse) {	
			var myArray=$.parseJSON(serverResponse);
			$('#eventajax tbody').html('');
			for(i=0; i<myArray.length;i++)
			{
				if(myArray[i].STA_ID>0){
				var editlink1=editlink+"&_events_WAR_fiternityserviceimplportlet_staId="+myArray[i].STA_ID;
				var eventName='<td><a href="'+editlink1+'">'+myArray[i].STA_NAME +'</a></td>';
				var stadate=getFormattedDate(myArray[i].STA_START_DATE);
				var exdate=getFormattedDate(myArray[i].STA_EXPIRY_DATE)
				if(myArray[i].STA_STATUS=="ACTIVE"){ var currentStatus='<td><button class="button button-small button-active"><span>Active</span></button></td>'}
				else{var currentStatus='<td><button class="button button-small button-deactive"><span>Inactive</span></button></td>'}

				$('#eventajax tbody').append('<tr>'+ eventName +'<td>'+myArray[i].STD_NAME +' </td><td> '+stadate +'</td><td> '+exdate +'<td>'+currentStatus +'</tr>');
			}
			}
			 $('.pagination-block').html('');
			},
			error:function(errorStatus){
			alert(errorStatus);	
			}
			});
		}
	

	
});
</script>