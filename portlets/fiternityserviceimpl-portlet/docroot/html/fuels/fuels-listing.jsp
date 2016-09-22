<%@ include file="/html/init.jsp"%>

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
<portlet:renderURL var="showEdit">
<portlet:param name="render" value="showEdit" />  
</portlet:renderURL>
<portlet:renderURL var="addFuel">
<portlet:param name="render" value="addFuel" />  
</portlet:renderURL>
<portlet:renderURL var="Listing"></portlet:renderURL>
<section class="wrapper">
        <div class="title-block">
          <div class="container"> 
            <ul class="breadcrumb">
              <li><a href="<%=PortalUtil.getPortalURL(request) +"/group/fiternity/admin-panel" %>">Admin panel</a></li>
              <li>Fuel</li>
            </ul>
            <div class="search-block">
              <div class="fL"><h1>Fuel</h1></div>
              <div class="fR">
              <button onclick="addFuel('<%=addFuel.toString()%>')" class="button button-primary button-mini">
                    <i class="fa fa-plus-circle">&nbsp;</i>&nbsp; Add Fuel
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
                  <th width="40%">NAME</th>
                  <th width="40%">Classification</th>
                  <th width="20%">&nbsp;</th>
                </tr>
              </thead>
              <tbody>
                  <%for(int n = 0; n < ja.length(); n++)
             		{ 
              		JSONObject object = ja.getJSONObject(n);
              		PortletURL actionUrlFromJSP = renderResponse.createRenderURL();
 					actionUrlFromJSP.setWindowState(LiferayWindowState.NORMAL);
 					actionUrlFromJSP.setPortletMode(LiferayPortletMode.VIEW);
 					actionUrlFromJSP.setParameter("render", "showEdit");
 					actionUrlFromJSP.setParameter("resId",object.get("RES_ID").toString());
 					%>
                <tr>
                   <td><a href="<%=actionUrlFromJSP.toString() %>" > <%=object.get("RES_NAME") %></a></td> 
                   <td><%=object.get("RES_CLASSIFICATION") %></td>
                   <%  if(object.get("RES_STATUS").equals("ACTIVE")) {%>  
                  <td><button class="button button-small button-active"><span>Active</span></button></td>
                 	<%}else{ %>
                  <td><button class="button button-small button-deactive"><span>Inactive</span></button></td>
                   <%} %>
                   </tr>
                   <%} %>

              </tbody>
            </table>
            			<% if(pages>1){ %>
            <div class="pagination-block">
              <div class="pagination">
                <ul>
                <li class="active">
                    <span><a href="<%=Listing.toString()+"&_fuels_WAR_fiternityserviceimplportlet_pageNo="+leftIndex %>"><i class="fa fa-chevron-left"></i></a></span>
                  </li>
                  <%for(int i=1;i<=pages;i++){ %>
                  <li <%if(pageNo==i){%>class="active" <%}%>><a href="<%=Listing.toString()+"&_fuels_WAR_fiternityserviceimplportlet_pageNo="+i %>"><%=i %></a></li>
                  <%} %>
                  <li>
                    <span><a href="<%=Listing.toString()+"&_fuels_WAR_fiternityserviceimplportlet_pageNo="+rightIndex %>"><i class="fa fa-chevron-right"></i></a></span>
                  </li>
                </ul>
              </div>
            </div>
 			<%} %>
          </div>
        </div>
      </section>

            
<script type="text/javascript">

function addFuel(url) {
    window.location.href = url;
}
</script>