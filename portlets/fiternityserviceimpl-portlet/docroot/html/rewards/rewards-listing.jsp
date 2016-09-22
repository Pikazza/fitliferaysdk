<%@ include file="/html/init.jsp"%>
 
<portlet:resourceURL var="rewardListingVar" id="rewardListingResource"/>  
<portlet:renderURL var="Listing"></portlet:renderURL>
<portlet:renderURL var="addReward">
<portlet:param name="render" value="addReward" />  
</portlet:renderURL> 
<portlet:renderURL var="editlink">
<portlet:param name="render" value="showeditReward" />  
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
    
 
 <input type='hidden' id='rewardListingURL' value='${rewardListingVar}'/>
 <input type='hidden' id='editlink' value='${editlink}'/>
<section class="wrapper">
        <div class="title-block">
          <div class="container">
            <ul class="breadcrumb">
              <li><a href="<%=PortalUtil.getPortalURL(request) +"/group/fiternity/admin-panel" %>">Admin panel</a></li>
              <li>Rewards</li>
            </ul>
            <div class="search-block">
              <div class="fL"><h1>Rewards</h1></div>
              <div class="fR">
                <span class="search-bar">
                  <input type="text" class="tetxBox" id="searchquery" placeholder="Search by reward name"> 
                  <i class="fa fa-search">&nbsp;</i>
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
                <%if (roles.contains("Rewards Manager") || roles.contains("Administrator") || roles.contains("Site Admin")){ %>
                 <select name="studioselection" class="selectMenu rewardList" id="selectStd">
              		 <option value="0"> SELECT STUDIO</option>
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
                	<select name="studioselection" class="selectMenu rewardList hideStd" id="selectStd">
                	 <option value='<%=stdId%>'> <%=user1.getFirstName() %></option> 
                	  </select> 
                <%} %>
                  <select name="rewardselection" class="selectMenu rewardList" id="selectRwdType">
                  <option value="A">Select Rewards</option>
                  <option value="A">ALL REWARDS</option>
                  <option value="C">CURRENT REWARDS</option>
                  <option value="E">EXPIRED REWARDS</option>
                  </select>
                
                  <button onclick="addReward('<%=addReward.toString()%>')" class="button button-primary button-mini">
                    <i class="fa fa-plus-circle"></i>&nbsp; Add reward
                  </button>
                <!--   </form> -->
                </div>


              </div>
            </div>
           
            <table class="list-table" width="100%" id="tblajax">
              <thead>
                <tr>
                  <th width="30%">REWARD NAME</th>
                  <th width="30%">STUDIO</th>
                  <th width="15%">VALID UNTIL</th>
                  <th width="15%">POINTS</th>
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
 				actionUrlFromJSP.setParameter("render", "showeditReward");
 				actionUrlFromJSP.setParameter("rwdId",object.get("RWD_ID").toString() );
 				
 				String date=object.get("RWD_EXPIRY_DATE").toString();
  				DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
  				Date d=df.parse(date);
  				df=new SimpleDateFormat("dd MMM yyyy");
%>
                <tr>
                  <td><a href="<%=actionUrlFromJSP%>"><%=object.get("RWD_NAME") %></a></td>
                  <td><%=object.get("STD_NAME") %></td>
                  <td><%=df.format(d) %></td>
                  <td><%=object.get("RWD_POINTS") %></td>
                    <%  if(object.get("RWD_STATUS").equals("ACTIVE")) {%>  
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
                    <span><a href="<%=Listing.toString()+"&_rewards_WAR_fiternityserviceimplportlet_pageNo="+leftIndex %>"><i class="fa fa-chevron-left"></i></a></span>
                  </li>
                  <%for(int i=1;i<=pages;i++){ %>
                  <li <%if(pageNo==i){%>class="active" <%}%>><a href="<%=Listing.toString()+"&_rewards_WAR_fiternityserviceimplportlet_pageNo="+i %>"><%=i %></a></li>
                  <%} %>
                  <li>
                    <span><a href="<%=Listing.toString()+"&_rewards_WAR_fiternityserviceimplportlet_pageNo="+rightIndex %>"><i class="fa fa-chevron-right"></i></a></span>
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
</script>
