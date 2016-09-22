   
 <%@ include file="/html/init.jsp"%>
 
<portlet:resourceURL var="advertListingVar" id="advertListingResource"/>
<portlet:renderURL var="Listing"></portlet:renderURL>
<portlet:renderURL var="addAdvert">
<portlet:param name="render" value="addAdvert" />  
</portlet:renderURL> 
<portlet:renderURL var="editAdvertLink">
<portlet:param name="render" value="showEditAdvert" />  
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
              <li>Beacon Content</li>
            </ul>
            <div class="search-block">
              <div class="fL"><h1>Beacon Content</h1></div>
              <div class="fR">
                <span class="search-bar">
                  <input type="text" id="searchAdvert" class="tetxBox" placeholder="Search by Beacon Content"> <i class="fa fa-search">&nbsp;</i>
                </span>
                <button onclick="addReward('<%=addAdvert.toString()%>')" class="button button-primary button-mini">
                  <i class="fa fa-plus-circle">&nbsp;</i>&nbsp; Add Beacon Content
                </button>
              </div>
            </div>
          </div>
        </div> 

        <div class="table-block">
          <div class="container">
            <table class="list-table" width="100%" id="advertajax">
              <thead> <tr>
                  <th width="45%">NAME</th>
                  <th width="45%">STUDIO</th>
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
 					actionUrlFromJSP.setParameter("render", "showEditAdvert");
 					actionUrlFromJSP.setParameter("ofrId",object.get("OFR_ID").toString());
 				   %>
 				   
 				   <tr>
                  <td><a href="<%=actionUrlFromJSP%>"><%= object.get("OFR_DESCRIPTION").toString().length()<=40?object.get("OFR_DESCRIPTION").toString():object.get("OFR_DESCRIPTION").toString().substring(0, 40) %></a></td>
                  <td><%=object.get("STD_NAME") %></td>                 
                  <%if(object.get("OFR_STATUS").equals("ACTIVE")) {%>  
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
                    <span><a href="<%=Listing.toString()+"&_adverts_WAR_fiternityserviceimplportlet_pageNo="+leftIndex %>"><i class="fa fa-chevron-left"></i></a></span>
                  </li>
                  <%for(int i=1;i<=pages;i++){ %>
                  <li <%if(pageNo==i){%>class="active" <%}%>><a href="<%=Listing.toString()+"&_adverts_WAR_fiternityserviceimplportlet_pageNo="+i %>"><%=i %></a></li>
                  <%} %>
                  <li>
                    <span><a href="<%=Listing.toString()+"&_adverts_WAR_fiternityserviceimplportlet_pageNo="+rightIndex %>"><i class="fa fa-chevron-right"></i></a></span>
                  </li>
                </ul>
              </div>
            </div>
             <%} %>
            
          </div>
        </div>
      </section>
           
                 <script type="text/javascript">

function addReward(url) {
    window.location.href = url;
}

$(function(){
	
	$('#searchAdvert').on('change', function(){
		
		
		var searchquery = document.getElementById("searchAdvert").value;
		var editlink = "${editAdvertLink}";
		
		$.ajax({ 
			url : "${advertListingVar}",
			type : 'GET',
			data : {	
			searchString:searchquery	
			},
			async : false,
			success : function(serverResponse) {	
			var myArray=$.parseJSON(serverResponse);
			$('#advertajax tbody').html('');
			for(i=0; i<myArray.length;i++)
			{
				if(myArray[i].OFR_ID>0){
				var editlink1=editlink+"&_adverts_WAR_fiternityserviceimplportlet_ofrId="+myArray[i].OFR_ID;
				var offDesc='<td><a href="'+editlink1+'">'+myArray[i].OFR_DESCRIPTION.substring(0, 40) +'</a></td>';
				if(myArray[i].OFR_STATUS=="ACTIVE"){ var currentStatus='<td><button class="button button-small button-active"><span>Active</span></button></td>'}
				else{var currentStatus='<td><button class="button button-small button-deactive"><span>Inactive</span></button></td>'}

				$('#advertajax tbody').append('<tr>'+ offDesc +'<td>'+myArray[i].STD_NAME +' </td> '+currentStatus +'</tr>');
			}
			}	
			 $('.pagination-block').html('');
			},
			error:function(errorStatus){  
			alert(errorStatus);	
			}
			});
	});
	
});



</script>