<%@ include file="/html/init.jsp"%> 
    
<%	User user1 = (User) request.getAttribute(WebKeys.USER);
    String roles= RoleLocalServiceUtil.getUserRoles(user1.getUserId()).toString();
    JSONArray ja=new JSONArray(request.getAttribute("return").toString());
    %>
<%if( ja.length()>0){ 
	JSONObject resourceObj = ja.getJSONObject(0);
  	%>
           
<portlet:resourceURL var="participantWinnerVar" id="participantWinnerResource" >
<portlet:param name="staBadge" value='<%=resourceObj.get("STA_BADGE").toString() %>'/>
<portlet:param name="stdId" value='<%=resourceObj.get("STD_ID").toString() %>'/> 
</portlet:resourceURL>
<portlet:resourceURL var="participantListingVar" id="participantListingResource"/>
<%} %>

<section class="wrapper">
        <div class="title-block">
          <div class="container"> 
            <ul class="breadcrumb">
              <li><a href="<%=PortalUtil.getPortalURL(request) +"/group/fiternity/admin-panel" %>">Admin panel</a></li>
              <li><a href="<%=PortalUtil.getPortalURL(request) +"/group/fiternity/challenges" %>">Challenges</a></li>
              <li>Participants</li>
            </ul>
            <div class="search-block">
              <div class="fL"><h1>Participants</h1></div>
              <div class="fR">
                <span class="search-bar">
                  <input type="text" id="searchParty" class="tetxBox" placeholder="Search by participant name"> <i class="fa fa-search"></i>
                </span>
              </div>
            </div>
          </div>
        </div>

        <div class="table-block">
          <div class="container">
            <table class="list-table participant-list" width="100%" id="partyajax">
              <thead>
                <tr>
                  <th width="45%">NAME of Challengers</th>
                  <th width="35%">Class Attended</th>
                  <th width="20%">&nbsp;</th>
                </tr>
              </thead>
              <tbody>
                 <%for(int n = 0; n < ja.length(); n++){  
                	 JSONObject object = ja.getJSONObject(n);%>
                <tr>
                  <td><%=object.get("PTY_NAME") %></td>
                  <td><%=object.get("ATTEND")%>/<%=object.get("STA_NO_OF_DAYS")%></td>
                    <%  if(object.getInt("ATTEND")>=(object.getInt("STA_NO_OF_DAYS")) && object.getInt("WINNER")==0) {%>  
                  <td><button  class="button button-small button-active" onclick="setwinner(<%=object.get("PTY_ID")%>)"><span>Select winner</span></button></td>
                 <% }else if(object.get("ATTEND").equals(object.get("STA_NO_OF_DAYS")) && object.getInt("WINNER")>=1) {%>  
                 <td><button  class="button button-small button-active green-btn" disabled  onclick="setwinner(<%=object.get("PTY_ID")%>)"><span>winner</span></button></td>
                 <%}else{ %>
                  <td><button  class="button button-small button-deactive"><span>Challenge in progress</span></button></td>
                   <%} %>  
                </tr>
                <% } %> 
              </tbody>
            </table>
             
           <!--  
            <div class="pagination-block">
              <div class="pagination">
                <ul>
                  <li class="active">
                    <span><a href="#"><i class="fa fa-chevron-left"></i></a></span>
                  </li>
                  <li><a href="#">1</a></li>
                  <li><a href="#">2</a></li>
                  <li><a href="#">3</a></li>
                  <li><a href="#">4</a></li>
                  <li><a href="#">5</a></li>
                  <li>
                    <span><a href="#"><i class="fa fa-chevron-right"></i></a></span>
                  </li>
                </ul>
              </div>
            </div> -->
            
            
          </div>
        </div>
      </section>
      
      
<script type="text/javascript">
function setwinner(ptyId){
	

	
	$.ajax({ 
		url : "${participantWinnerVar}",
		type : 'GET',
		data : {					
		ptyId:ptyId
		},
		async : false,
		success : function(serverResponse) {
		},
		error:function(errorStatus){
		alert(errorStatus);	
		}
		}); 
}


$('#searchParty').on('change', function(){
	

	var searchquery = document.getElementById("searchParty").value;
	
	$.ajax({ 
		url : '${participantListingVar}',
		type : 'GET',
		data : {	
		searchString:searchquery	
		},
		async : false,
		success : function(serverResponse) {	
		var myArray=$.parseJSON(serverResponse);
		$('#partyajax tbody').html('');
		for(i=0; i<myArray.length;i++)
		{
			if(myArray[i].STA_ID>0){
			var ptyName='<td>'+myArray[i].PTY_NAME +'</td>';
			var classes='<td>'+myArray[i].ATTEND+'/'+myArray[i].STA_NO_OF_DAYS+'</td>';
			if(myArray[i].ATTEND==myArray[i].STA_NO_OF_DAYS && myArray[i].WINNER==0){
				var currentStatus='<td><button class="button button-small button-active" onclick="setwinner('+myArray[i].PTY_ID+')" ><span>Select winner</span></button></td>';
			}else if(myArray[i].ATTEND==myArray[i].STA_NO_OF_DAYS && myArray[i].WINNER==1){
				var currentStatus='<td><button class="button button-small button-active green-btn" disabled onclick="setwinner('+myArray[i].PTY_ID+')" ><span> winner</span></button></td>';
				}else{
				var currentStatus='<td><button class="button button-small button-deactive"><span>Process challenges</span></button></td>';}

			$('#partyajax tbody').append('<tr>'+ ptyName+classes +currentStatus +'</tr>');
		}
		}	
		 $('.pagination-block').html('');
		},
		error:function(errorStatus){
		alert(errorStatus);	
		}
		});
});


</script>
      