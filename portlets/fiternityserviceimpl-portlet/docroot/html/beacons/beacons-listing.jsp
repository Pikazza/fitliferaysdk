<%@ include file="/html/init.jsp"%>

<portlet:resourceURL var="beaconListingVar" id="beaconListingResource"/> 
<portlet:renderURL var="editlink">
<portlet:param name="render" value="showEditBeacon" />  
</portlet:renderURL>
<portlet:renderURL var="Listing"></portlet:renderURL>
<portlet:renderURL var="addBeacon">
<portlet:param name="render" value="addBeacon" />  
</portlet:renderURL>
  
<%	User user1 = (User) request.getAttribute(WebKeys.USER);
    String roles= RoleLocalServiceUtil.getUserRoles(user1.getUserId()).toString();
    JSONArray ja=new JSONArray(request.getAttribute("return").toString());
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
              <li>Manage Beacons</li>
            </ul>
            <div class="search-block">
              <div class="fL"><h1>Manage Beacons</h1></div>
              <div class="fR">
                <span class="search-bar"><input type="text" class="tetxBox" id="searchBeacon" placeholder="Search by studio name, beacon id" > <i class="fa fa-search">&nbsp;</i></span>              
              <button  onclick="addBeacon('<%=addBeacon.toString()%>')"  class="button button-primary button-mini" >
                  <i class="fa fa-plus-circle"></i>&nbsp; Add beacon
                </button>
              </div>
            </div>
          </div>
        </div>

        <div class="table-block">
          <div class="container">
            <table class="list-table" width="100%" id="beaconajax">
              <thead>
                <tr>
                  <th width="20%">Beacon ID</th>
                  <th width="16%">Beacon Site</th>
                  <th width="16%">Studio</th>
                  <th width="16%">Activity</th>
                  <th width="16%">Beacon use</th>
                  <th width="16%">&nbsp;</th>
                </tr>
              </thead>
              <tbody>
               <%for(int n = 0; n < ja.length(); n++)
              {
            	    JSONObject object = ja.getJSONObject(n);
            	    PortletURL actionUrlFromJSP = renderResponse.createRenderURL();
 					actionUrlFromJSP.setWindowState(LiferayWindowState.NORMAL);
 					actionUrlFromJSP.setPortletMode(LiferayPortletMode.VIEW);
 					actionUrlFromJSP.setParameter("render", "showEditBeacon");
 					actionUrlFromJSP.setParameter("beaId",object.get("BCON_ID").toString());
 					actionUrlFromJSP.setParameter("stdId",object.get("BCON_STD_ID").toString());
 				   %>
                <tr>
                  <td><a href="<%=actionUrlFromJSP%>" ><%=object.get("BCON_ID") %></a></td>
                   <td><%=object.get("BCON_SITE") %></td>
                  <td><%=object.get("STD_NAME") %></td>
                  <td><%=object.get("STA_TYPE") %></td>
                   <td><%=object.get("BCON_DETECT_TYPE") %></td>  
                  <%if(object.get("BCON_STATUS").equals("ACTIVE")) {%>  
                  <td><button class="button button-small button-active"><span>Active</span></button></td>
                 <%}else{ %>
                  <td><button class="button button-small button-deactive"><span>Inactive</span></button></td>
                   <%} %>  
                </tr>
                
               <% } %>
              </tbody>
            </table>
            
			<% if(pages>1){ %>
            <div class="pagination-block">
              <div class="pagination">
                <ul>
                <li class="active">
                    <span><a href="<%=Listing.toString()+"&_beacons_WAR_fiternityserviceimplportlet_pageNo="+leftIndex %>"><i class="fa fa-chevron-left"></i></a></span>
                  </li>
                  <%for(int i=1;i<=pages;i++){ %>
                  <li <%if(pageNo==i){%>class="active" <%}%>><a href="<%=Listing.toString()+"&_beacons_WAR_fiternityserviceimplportlet_pageNo="+i %>"><%=i %></a></li>
                  <%} %>
                  <li>
                    <span><a href="<%=Listing.toString()+"&_beacons_WAR_fiternityserviceimplportlet_pageNo="+rightIndex %>"><i class="fa fa-chevron-right"></i></a></span>
                  </li>
                </ul>
              </div>
            </div>
 			<%} %>
          </div>
        </div>
      </section>

<script type="text/javascript">

function addBeacon(url) {
    window.location.href = url;
}
$(function(){
	$('#searchBeacon').on('change', function(){
		var searchquery = document.getElementById("searchBeacon").value;
		var editlink = "${editlink}";
		$.ajax({ 
			url : "${beaconListingVar}",
			type : 'GET',
			data : {	
			searchString:searchquery
			},
			async : false,
			success : function(serverResponse) {
			var myArray=$.parseJSON(serverResponse);
			$('#beaconajax tbody').html('');
			for(i=0; i<myArray.length;i++)
			{
				if(myArray[i].BCON_STD_ID>0){
				var editlink1=editlink+"&_beacons_WAR_fiternityserviceimplportlet_beaId="+myArray[i].BCON_ID+"&_beacons_WAR_fiternityserviceimplportlet_stdId="+myArray[i].BCON_STD_ID;
				var beaconId='<td><a href="'+editlink1+'">'+myArray[i].BCON_ID+'</a></td>';
				if(myArray[i].BCON_STATUS=="ACTIVE"){ var currentStatus='<td><button class="button button-small button-active"><span>Active</span></button></td>'}
				else{var currentStatus='<td><button class="button button-small button-deactive"><span>Inactive</span></button></td>'}

				$('#beaconajax tbody').append('<tr>'+ beaconId +'<td>'+myArray[i].STD_NAME+'</td><td>'+myArray[i].STA_TYPE +' </td> '+currentStatus +'</tr>');
				
			}
			}	
			
			
			 $('.pagination-block').html('');
			/*  var ulstart='<div class="pagination-block" > <div class="pagination"><ul>';
			 var ulend='</ul></div></div>';
			 var previous='<li class="active"><span><a href="'+repagelink+"&_customers_WAR_fiternityserviceimplportlet_pageNo="+pageNo==1?1:pageNo-1 +'"><i class="fa fa-chevron-left"></i></a></span></li>';
			 var next='<li> <span><a href="'+repagelink+"&_customers_WAR_fiternityserviceimplportlet_pageNo="+pageNo==pages?pages:pageNo+1 +'"><i class="fa fa-chevron-right"></i></a></span></li> ';
			 var listart='<li><a href="#">';
			 var liend=' </li>';
			 
			 
			 $('#pageblock').append(
					 ulstart+previous);
			 
			 for (j=1;j<=pages;j++)
             {    
				 
				$(listart + j +liend).insertAfter('#pageblock ul li:last-child');
		     }
			 
			 $('#pageblock ul').append(next+ulend); */
			 
			},
			error:function(errorStatus){  
			alert(errorStatus);	
			}
			});
	});
	
	
});
</script>