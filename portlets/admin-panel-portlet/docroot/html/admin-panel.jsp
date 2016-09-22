
<%@page import="javax.portlet.PortletURL"%>
<%@page import="javax.portlet.PortletRequest"%>
<%@page import="com.liferay.portlet.PortletURLFactoryUtil"%>
<%@page import="com.liferay.portal.util.PortalUtil"%>
<%@page import="com.liferay.portal.service.RoleLocalServiceUtil"%>
<%@page import="com.liferay.portal.service.UserServiceUtil"%>
<%@page import="com.liferay.portal.service.RoleServiceUtil"%>
<%@page import="com.liferay.portal.model.Group"%>
<%@page import="java.util.List"%>
<%@page import="com.liferay.portal.model.User"%>
<%@page import="com.liferay.portal.kernel.util.WebKeys"%>
<%
/**
 * Copyright (c) 2000-present Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
%>

<%@ include file="/html/init.jsp"%>
<%@page import="com.liferay.portal.kernel.portlet.LiferayWindowState"%>


             			 <%
              User user1 = (User) request.getAttribute(WebKeys.USER);
          	String roles= RoleLocalServiceUtil.getUserRoles(user1.getUserId()).toString();
           %>

<portlet:actionURL var="showStudios">
<portlet:param name="action" value="showStudios" />
</portlet:actionURL>

<portlet:actionURL var="showModerators">
<portlet:param name="action" value="showModerators" />
</portlet:actionURL>

<portlet:actionURL var="showBeacons">
<portlet:param name="action" value="showBeacons" />
</portlet:actionURL>

<portlet:actionURL var="showNotifications">
<portlet:param name="action" value="showNotifications" />
</portlet:actionURL>

<portlet:actionURL var="showContents">
<portlet:param name="action" value="showContents" />
</portlet:actionURL>

<portlet:actionURL var="showCustomers">
<portlet:param name="action" value="showCustomers" />
</portlet:actionURL>

<portlet:actionURL var="showStudioDetails">
<portlet:param name="action" value="showStudioDetails" />
<portlet:param name="userid" value="<%=String.valueOf(user1.getUserId())%>" />
</portlet:actionURL>     		
						
<portlet:actionURL var="showRewards">
<portlet:param name="action" value="showRewards" />
</portlet:actionURL>
<portlet:actionURL var="showOwnerRewards">
<portlet:param name="action" value="showOwnerRewards" />
<portlet:param name="userid" value="<%=String.valueOf(user1.getUserId())%>" />
</portlet:actionURL>

<portlet:actionURL var="showEvents">
<portlet:param name="action" value="showEvents" />
</portlet:actionURL>
<portlet:actionURL var="showOwnerEvents">
<portlet:param name="action" value="showOwnerEvents" />
<portlet:param name="userid" value="<%=String.valueOf(user1.getUserId())%>" />
</portlet:actionURL>

<portlet:actionURL var="showChallenges">
<portlet:param name="action" value="showChallenges" />
</portlet:actionURL>

<portlet:actionURL var="showOwnerChallenges">
<portlet:param name="action" value="showOwnerChallenges" />
<portlet:param name="userid" value="<%=String.valueOf(user1.getUserId())%>" />
</portlet:actionURL>

<portlet:actionURL var="showAdverts">
<portlet:param name="action" value="showAdverts" />
</portlet:actionURL>

<portlet:actionURL var="showOwnerAdverts">
<portlet:param name="action" value="showOwnerAdverts" />
<portlet:param name="userid" value="<%=String.valueOf(user1.getUserId())%>" />
</portlet:actionURL>

<portlet:actionURL var="showFuels">
<portlet:param name="action" value="showFuels" />
</portlet:actionURL>


<%-- 
  <%plid = PortalUtil.getPlidFromPortletId(scopeGroupId, "studios");

PortletURL myPortletURL = PortletURLFactoryUtil.create(renderRequest, "studios", plid, PortletRequest.RENDER_PHASE); %> 

<%= myPortletURL%> 
 --%>
            
             			
             	
             	




<section class="wrapper">
        <div class="title-block">
          <div class="container"> 
            <h1>Admin panel</h1>
            
           
          </div>
        </div>


        <div class="content-block">
          <div class="container">
            <ul class="dashboard-list">

            
<%--  <%= roles %>  --%>
<%-- <%=themeDisplay.getLayout() %>  --%>
 
			<%
			if (roles.contains("Studios Manager") || roles.contains("Administrator") || roles.contains("Studio Owner") ||  roles.contains("Site Admin"))
			{%>

              <li>	 
                <a <% if( roles.contains("Studio Owner")){%> href="${showStudioDetails}" <%}else { %>href="${showStudios}"<%} %>>
                  <div class="list-img">
                  
                    <img src="${themeDisplay.getPathThemeImages()}/showup-admin-images/studio-icon.png" />
                  </div>
                  <h6>Studios</h6>
                </a>
              </li>
              <% } if(roles.contains("Administrator") || roles.contains("Site Admin"))
          	{ %>
              
              <li>
                <a href="${showModerators}">
                  <div class="list-img">
                     <img src="${themeDisplay.getPathThemeImages()}/showup-admin-images/moderator-icon.png" />
                  </div>
                  <h6>Moderators</h6>
                </a>
              </li>
              
              <% } if(roles.contains("Events Manager") || roles.contains("Administrator")  || roles.contains("Studio Owner")||  roles.contains("Site Admin"))
          	{ %> 
              <li>
                <a <% if( roles.contains("Studio Owner")){%> href="${showOwnerEvents}" <%}else { %>href="${showEvents}"<%} %>">
                  <div class="list-img">
                     <img src="${themeDisplay.getPathThemeImages()}/showup-admin-images/event-icon.png" />
                  </div>
                  <h6>Events</h6>
                </a>
              </li>
              
               <% } if(roles.contains("Rewards Manager") || roles.contains("Administrator")   || roles.contains("Studio Owner")||  roles.contains("Site Admin")) 
          	{ %>
              <li>
                <a <% if( roles.contains("Studio Owner")){%> href="${showOwnerRewards}" <%}else { %>href="${showRewards}"<%} %>">
                  <div class="list-img">
                     <img src="${themeDisplay.getPathThemeImages()}/showup-admin-images/reward-icon.png" />
                  </div>
                  <h6>Rewards</h6>
                </a>
              </li>
              <% } if(roles.contains("Challenges Manager") || roles.contains("Administrator")  || roles.contains("Studio Owner")||  roles.contains("Site Admin"))
          	{ %>
              
              <li>
                <a <% if( roles.contains("Studio Owner")){%> href="${showOwnerChallenges}" <%}else { %>href="${showChallenges}"<%} %>">
                  <div class="list-img">
                     <img src="${themeDisplay.getPathThemeImages()}/showup-admin-images/challenge-icon.png" />
                  </div>
                  <h6>Challenges</h6>
                </a>
              </li>
              
             
              
             
             
              <% } if(roles.contains("Adverts Manager") || roles.contains("Administrator") || roles.contains("Studio Owner")||  roles.contains("Site Admin"))
          	{ %>
              <li>
                <a <% if( roles.contains("Studio Owner")){%> href="${showOwnerAdverts}" <%}else { %>href="${showAdverts}"<%} %>">
                  <div class="list-img">
                     <img src="${themeDisplay.getPathThemeImages()}/showup-admin-images/promos-icon.png" />
                  </div>
                  <h6>Beacon Content</h6>
                </a>
              </li>
              <% } if(roles.contains("Customers Manager") || roles.contains("Administrator")||  roles.contains("Site Admin"))
          	{ %>
              
              <li>
                <a href="${showCustomers}">
                  <div class="list-img">
                     <img src="${themeDisplay.getPathThemeImages()}/showup-admin-images/customer-icon.png"" />
                  </div>
                  <h6>Customers</h6>
                </a>
              </li>
              <%} if( roles.contains("Administrator")||  roles.contains("Site Admin"))
            	{ %>
                
                <li>
                  <a href="${showBeacons}">
                    <div class="list-img">
                       <img src="${themeDisplay.getPathThemeImages()}/showup-admin-images/manage-beacons.png" />
                    </div>
                    <h6>Manage Beacons</h6>    
                  </a>
                </li>
                
                <% }if( roles.contains("Administrator")||  roles.contains("Site Admin"))
            	{ %>
                
                <li>
                  <a href="${showFuels}">
                    <div class="list-img">
                       <img src="${themeDisplay.getPathThemeImages()}/showup-admin-images/fuel-icon.png" />
                    </div>
                    <h6>Fuel</h6>    
                  </a>
                </li>
                
                <% } if( roles.contains("Administrator")||  roles.contains("Site Admin"))
            	{ %>
                
                <li>
                  <a href="${showNotifications}">
                    <div class="list-img">
                       <img src="${themeDisplay.getPathThemeImages()}/showup-admin-images/manage-content.png" />
                    </div>
                    <h6>Manage Content</h6>     
                  </a>
                </li>
                
                <% } if( roles.contains("Administrator")||  roles.contains("Site Admin"))
            	{ %>
                
                <li>
                  <a href="${showContents}">
                    <div class="list-img">
                       <img src="${themeDisplay.getPathThemeImages()}/showup-admin-images/manage-email.png" />
                    </div>
                    <h6>Email Content</h6>    
                  </a>
                </li>                
                <% }%>  
              
            </ul>
          </div>
        </div>
      </section>