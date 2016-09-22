<%@ include file="/html/init.jsp"%>

<portlet:resourceURL var="challengeListingVar" id="challengeListingResource"/>
<portlet:renderURL var="Listing"></portlet:renderURL>
<portlet:renderURL var="addChallenge">
<portlet:param name="render" value="addChallenge" />  
</portlet:renderURL> 
<portlet:renderURL var="showParticipants">
<portlet:param name="render" value="showParticipants" />  
</portlet:renderURL> 
<portlet:renderURL var="editChallengeLink">
<portlet:param name="render" value="showEditChallenge" />  
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
              <li>Challenges</li>
            </ul>
            <div class="search-block">
              <div class="fL"><h1>Challenges</h1></div>
              <div class="fR">
                <span class="search-bar">
                  <input type="text" class="tetxBox" id="searchChallenge" placeholder="Search by challenge name"> <i class="fa fa-search"></i>
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
                          
                <%if (roles.contains("Challenges Manager") || roles.contains("Administrator") || roles.contains("Site Admin")){ %>
                 <select name="studioselection" class="selectMenu challengeList" id="selectStd">
                 <option value="0"> Select Studio</option>
              		 <option value="0" selected="selected"> Select Studio</option>
                <% for(int n = 0; n < jsonstd.length(); n++){
            	    JSONObject stdlist = jsonstd.getJSONObject(n); %>
                    <option value='<%=stdlist.get("STD_ID")%>'> <%=stdlist.get("STD_NAME") %></option>
                    <%} %>
                </select>
              <%  }else
                {
                 String stdId=portletSession.getAttribute("stdId", PortletSession.APPLICATION_SCOPE).toString();
                	%>   
                	  <select name="studioselection" class="selectMenu challengeList hideStd" id="selectStd">
                	 <option value='<%=stdId%>' selected="selected"> <%=user1.getFirstName() %></option>
                	 </select>
                <%} %>
                    
                  <select name="challengesSelection" class="selectMenu challengeList" id="selectCheType">
                  	<option value="S">SELECT EVENTS</option>
                   <option value="ALL" selected="selected">All Challenges</option>
                    <option value="C">Current Challenges</option>
                    <option value="E">Expired Challenges</option>
                    <option value="F">Future Challenges</option>
                  </select>
                  <button onclick="addReward('<%=addChallenge.toString()%>')" class="button button-primary button-mini">
                    <i class="fa fa-plus-circle"></i>&nbsp; Add Challenge
                  </button>
                </div>
              </div>
            </div>
            <table class="list-table" id="challengeajax" width="100%">
              <thead>
                <tr>
                  <th width="30%">Challenge NAME</th>
                  <th width="18%">STUDIO</th>
                  <th width="14%">EXPIRES ON</th>
                  <th width="14%">END DATE</th> 
                  <th width="14%">participants</th>
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
 					actionUrlFromJSP.setParameter("render", "showEditChallenge");
 					actionUrlFromJSP.setParameter("staId",object.get("STA_ID").toString());
 				    

 				    String date=object.get("STA_EXPIRY_DATE").toString();
 				    DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
 				    Date exdate=df.parse(date);
 				    df=new SimpleDateFormat("dd MMM yyyy");
 				    
 				    String date1=object.get("STA_END_DATE").toString();
 				   	DateFormat df1=new SimpleDateFormat("yyyy-MM-dd");
 				  	Date enddate =df1.parse(date1); 
 				 	df1=new SimpleDateFormat("dd MMM yyyy");
					%>
                <tr>
                  <td><a href="<%=actionUrlFromJSP%>"><%=object.get("STA_NAME") %></a></td>
                  <td><%=object.get("STD_NAME") %></td>
                   <td><%=df.format(exdate) %></td>
                   <td><%=df1.format(enddate) %></td>
                   <%if(object.get("VIEW").toString().equals("0")) {%>
                   <td>-</td>
                   <%}else{ %>
                  <td> 
                  <a href="<%=showParticipants.toString()+"&_challenges_WAR_fiternityserviceimplportlet_staId="+object.get("STA_ID").toString() %>">View</a>
                  </td>
                  <%} %>
                    <%  if(object.get("STA_STATUS").equals("ACTIVE")) {%>  
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
                    <span><a href="<%=Listing.toString()+"&_challenges_WAR_fiternityserviceimplportlet_pageNo="+leftIndex %>"><i class="fa fa-chevron-left"></i></a></span>
                  </li>
                  <%for(int i=1;i<=pages;i++){ %>
                  <li <%if(pageNo==i){%>class="active" <%}%>><a href="<%=Listing.toString()+"&_challenges_WAR_fiternityserviceimplportlet_pageNo="+i %>"><%=i %></a></li>
                  <%} %>
                  <li>
                    <span><a href="<%=Listing.toString()+"&_challenges_WAR_fiternityserviceimplportlet_pageNo="+rightIndex %>"><i class="fa fa-chevron-right"></i></a></span>
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
	$( ".challengeList" ).selectmenu({
		  select: function( event, ui ) {	  
			  ajaxcall();             
		  }
		});
	$('#searchChallenge').on('change', function(){
		  ajaxcall();   
	});
	function ajaxcall(){	
	 	var selectStd = document.getElementById("selectStd");
		var studioId = selectStd.options[selectStd.selectedIndex].value;   
		var selectCheType = document.getElementById("selectCheType");
		var challengeId = selectCheType.options[selectCheType.selectedIndex].value;
		var searchquery = document.getElementById("searchChallenge").value;
		var editlink = "${editChallengeLink}";
		var participants="${showParticipants}";
		
		$.ajax({ 
			url : "${challengeListingVar}",
			type : 'GET',
			data : {	
			stdId:studioId,
			challengeId:challengeId,	
			searchString:searchquery	
			},
			async : false,
			success : function(serverResponse) {	
			var myArray=$.parseJSON(serverResponse);
			$('#challengeajax tbody').html('');
			for(i=0; i<myArray.length;i++)
			{
				if(myArray[i].STA_ID>0){
				var editlink1=editlink+"&_challenges_WAR_fiternityserviceimplportlet_staId="+myArray[i].STA_ID;
				var plink=participants+"&_challenges_WAR_fiternityserviceimplportlet_staId="+myArray[i].STA_ID;
				var cheName='<td><a href="'+editlink1+'">'+myArray[i].STA_NAME +'</a></td>';
				if(myArray[i].VIEW=="0"){
				var viewparty='<td>-</td>';
				}
				else{
					var viewparty='<td><a href="'+plink+'">view</a></td>';
				}
				
				var exdate=getFormattedDate(myArray[i].STA_EXPIRY_DATE);
				var enddate=getFormattedDate(myArray[i].STA_END_DATE);
				if(myArray[i].STA_STATUS=="ACTIVE"){ var currentStatus='<td><button class="button button-small button-active"><span>Active</span></button></td>'}
				else{var currentStatus='<td><button class="button button-small button-deactive"><span>Inactive</span></button></td>'}

				$('#challengeajax tbody').append('<tr>'+ cheName +'<td>'+myArray[i].STD_NAME +' </td><td> '+ exdate +'</td><td> '+ enddate +'</td>'+viewparty+currentStatus +'</tr>');
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