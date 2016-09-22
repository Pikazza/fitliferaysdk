<%@page import="javax.portlet.PortletRequest"%>
<%@page import="com.liferay.portlet.PortletURLFactoryUtil"%>
<%@page import="com.liferay.portal.kernel.portlet.LiferayPortletURL"%>
<%@ include file="/html/init.jsp"%>

<portlet:renderURL var="addStudio">
<portlet:param name="render" value="addStudio" />  
</portlet:renderURL>     
<portlet:resourceURL var="studioListingVar" id="studioListingResource"/>  
<portlet:renderURL var="Listing"></portlet:renderURL>
<portlet:renderURL var="studioEditLink">
<portlet:param name="render" value="showeditStudio" />  
</portlet:renderURL>

 <input type='hidden' id='studioListingURL' value='${studioListingVar}'/>
 <input type='hidden' id='studioEditLink' value='${studioEditLink}'/>
       
       <% JSONArray ja=new JSONArray(request.getAttribute("return").toString()); %> 
      
<%long groupId = themeDisplay.getScopeGroupId();
String portletId = "studios_WAR_studiosportlet";
long plid1 = PortalUtil.getPlidFromPortletId(groupId, portletId);

LiferayPortletURL renderURL = PortletURLFactoryUtil.create(request,
    portletId, plid, PortletRequest.RENDER_PHASE);  %>
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
              <li>Studios</li>
            </ul>
            <div class="search-block">
              <div class="fL"><h1>Studios</h1></div>
              <div class="fR">
              <span class="search-bar"><input type="text" class="tetxBox" placeholder="Search by studio, email or phone no." id="studioSearch"> <i class="fa fa-search"></i></span>             
                 <button  onclick="addStudio('<%=addStudio.toString()%>')"  class="button button-primary button-mini" >
                  <i class="fa fa-plus-circle"></i>&nbsp; Add studio
                </button>
              </div>
            </div>
          </div>
        </div>
        <div class="table-block">
          <div class="container">
            <table class="list-table" width="100%" id="studioajax">
              <thead>
                <tr>
                  <th width="32%">STUDIO NAME</th>
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
 				actionUrlFromJSP.setParameter("render", "showeditStudio");
 				actionUrlFromJSP.setParameter("stdid",object.get("STD_ID").toString() );
					%>
                
           <%if(!object.get("STD_NAME").toString().equalsIgnoreCase("fiternity")){ %>     
                <tr>
                  <td><a href="<%=actionUrlFromJSP%>"><%=object.get("STD_NAME") %></a></td>
                  <td><%=object.get("STD_MAILID") %></td>
                  <td><%=object.get("STD_PHONENO") %></td>
                 <%  if(object.get("STD_STATUS").equals("ACTIVE")) {%>
                  <td><button  class="button button-small button-active" >Active</button></td>
                  <%}else{ %>
                  <td><button  class="button button-small button-deactive">Inactive</button></td>
                  <%} %>	
                </tr>
                
                <%} %>
                
                <% }%>
              </tbody>
            </table>
            <% if(pages>1){ %>
       <div class="pagination-block">
              <div class="pagination">
                <ul>
                <li class="active">
                    <span><a href="<%=Listing.toString()+"&_studios_WAR_fiternityserviceimplportlet_pageNo="+leftIndex %>"><i class="fa fa-chevron-left"></i></a></span>
                  </li>
                  <%for(int i=1;i<=pages;i++){ %>
                  <li <%if(pageNo==i){%>class="active" <%}%>><a href="<%=Listing.toString()+"&_studios_WAR_fiternityserviceimplportlet_pageNo="+i %>"><%=i %></a></li>
                  <%} %>
                  <li>
                    <span><a href="<%=Listing.toString()+"&_studios_WAR_fiternityserviceimplportlet_pageNo="+rightIndex %>"><i class="fa fa-chevron-right"></i></a></span>
                  </li>
                </ul>
              </div>
            </div>
             <%} %>
          </div>
        </div>
      </section>
 
<script type="text/javascript">
function addStudio(url) {
    window.location.href = url;
}
</script>



