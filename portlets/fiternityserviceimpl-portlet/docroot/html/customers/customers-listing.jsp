<%@ include file="/html/init.jsp"%>

<portlet:resourceURL var="cutomerListingVar" id="customerListingResource"/> 
 
  <portlet:renderURL var="editlink">
      <portlet:param name="render" value="showEditCustomer" />  
  </portlet:renderURL>
  
  <portlet:renderURL var="Listing"></portlet:renderURL>
  
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
              <li>Customers</li>
            </ul>
            <div class="search-block">
              <div class="fL"><h1>Customers</h1></div>
              <div class="fR">
                <span class="search-bar"><input type="text" class="tetxBox" id="searchCustomer" placeholder="Search by name, email or phone" > <i class="fa fa-search">&nbsp;</i></span>              
              </div>
            </div>
          </div>
        </div>

        <div class="table-block">
          <div class="container">
            <table class="list-table" width="100%" id="customerajax">
              <thead>
                <tr>
                  <th width="32%">user NAME</th>
                  <th width="32%">Email</th>
                  <th width="21%">Phone</th>
                  <th width="15%">&nbsp;</th>
                </tr>
              </thead>
              <tbody>
               <%for(int n = 0; n < ja.length(); n++)
              {
            	    JSONObject object = ja.getJSONObject(n);
            	    PortletURL actionUrlFromJSP = renderResponse.createRenderURL();
 					actionUrlFromJSP.setWindowState(LiferayWindowState.NORMAL);
 					actionUrlFromJSP.setPortletMode(LiferayPortletMode.VIEW);
 					actionUrlFromJSP.setParameter("render", "showEditCustomer");
 					actionUrlFromJSP.setParameter("ptyId",object.get("PTY_ID").toString());
 				   %>
                <tr>
                  <td><a href="<%=actionUrlFromJSP%>" ><%=object.get("PTY_NAME") %></a></td>
                  <td><%=object.get("PTY_EMAIL").toString().equals("null")?"-":object.get("PTY_EMAIL") %></td>
                  <td><%=object.get("PTY_MOBILE").toString().equals("null")?"-":object.get("PTY_MOBILE") %></td> 
                  <%if(object.get("PTY_STATUS").equals("ACTIVE")) {%>  
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
                    <span><a href="<%=Listing.toString()+"&_customers_WAR_fiternityserviceimplportlet_pageNo="+leftIndex %>"><i class="fa fa-chevron-left"></i></a></span>
                  </li>
                  <%for(int i=1;i<=pages;i++){ %>
                  <li <%if(pageNo==i){%>class="active" <%}%>><a href="<%=Listing.toString()+"&_customers_WAR_fiternityserviceimplportlet_pageNo="+i %>"><%=i %></a></li>
                  <%} %>
                  <li>
                    <span><a href="<%=Listing.toString()+"&_customers_WAR_fiternityserviceimplportlet_pageNo="+rightIndex %>"><i class="fa fa-chevron-right"></i></a></span>
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
	$('#searchCustomer').on('change', function(){
		var searchquery = document.getElementById("searchCustomer").value;
		var editlink = "${editlink}";
		$.ajax({ 
			url : "${cutomerListingVar}",
			type : 'GET',
			data : {	
			searchString:searchquery
			},
			async : false,
			success : function(serverResponse) {
			var myArray=$.parseJSON(serverResponse);
			$('#customerajax tbody').html('');
			for(i=0; i<myArray.length;i++)
			{
				
				if(myArray[i].PTY_ID>0){
				var editlink1=editlink+"&_customers_WAR_fiternityserviceimplportlet_ptyId="+myArray[i].PTY_ID;
				var ptyName='<td><a href="'+editlink1+'">'+myArray[i].PTY_NAME+'</a></td>';
				if(myArray[i].PTY_STATUS=="ACTIVE"){ var currentStatus='<td><button class="button button-small button-active"><span>Active</span></button></td>'}
				else{var currentStatus='<td><button class="button button-small button-deactive"><span>Inactive</span></button></td>'}

				$('#customerajax tbody').append('<tr>'+ ptyName +'<td>'+myArray[i].PTY_EMAIL+'</td><td>'+myArray[i].PTY_MOBILE +' </td> '+currentStatus +'</tr>');
				
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