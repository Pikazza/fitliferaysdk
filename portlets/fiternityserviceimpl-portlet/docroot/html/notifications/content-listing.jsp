<%@ include file="/html/init.jsp"%>

<portlet:renderURL var="showContentedit">
<portlet:param name="render" value="showContentedit" />  
</portlet:renderURL>
<portlet:renderURL var="Listing"></portlet:renderURL>
<section class="wrapper">
        <div class="title-block">
          <div class="container"> 
            <ul class="breadcrumb">
              <li><a href="<%=PortalUtil.getPortalURL(request) +"/group/fiternity/admin-panel" %>">Admin panel</a></li>
              <li>Email Content</li>
            </ul>
            <div class="search-block">
              <div class="fL"><h1>Email Content</h1></div>
              <div class="fR">

              </div>
            </div>
          </div>
        </div>

        <div class="table-block">
          <div class="container">
            <table class="list-table" width="100%" id="beaconajax">
              <thead>
                <tr>
                  <th width="30%"> TITLE</th>
                  <th width="30%">&nbsp;</th>
                  <th width="20%">&nbsp;</th>
                  <th width="20%">&nbsp;</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>Reward Mail Content</td> 
                   <td><a href="<%=showContentedit.toString()+"&_notifications_WAR_fiternityserviceimplportlet_type="+request.getAttribute("rewardId").toString() %>">Edit</a></td>
                   <td><a> </a></td>
                   <td><a> </a></td>
                   </tr>
                   
                   <tr>
                  	<td>Event Mail Content</td> 
                   <td><a href="<%=showContentedit.toString()+"&_notifications_WAR_fiternityserviceimplportlet_type="+request.getAttribute("eventId").toString() %>">Edit</a></td>
                   <td><a> </a></td>
                   <td><a> </a></td>
                   </tr>
                   
                   <tr>
                  	<td>Challenge Mail Content</td> 
                   <td><a href="<%=showContentedit.toString()+"&_notifications_WAR_fiternityserviceimplportlet_type="+request.getAttribute("challengeId").toString() %>">Edit</a></td>
                   <td><a> </a></td>
                   <td><a> </a></td>
                   </tr>
                   
                    <tr>
                  <td>Adverts Mail Content</td> 
                   <td><a href="<%=showContentedit.toString()+"&_notifications_WAR_fiternityserviceimplportlet_type="+request.getAttribute("advertsId").toString() %>">Edit</a></td>
                   <td><a> </a></td>
                   <td><a> </a></td>
                   </tr>
                   
                    <tr>
                  <td>Moderator Mail Content</td> 
                   <td><a href="<%=showContentedit.toString()+"&_notifications_WAR_fiternityserviceimplportlet_type="+request.getAttribute("moderatorId").toString() %>">Edit</a></td>
                   <td><a> </a></td>
                   <td><a> </a></td>
                   </tr>
              </tbody>
            </table>
          </div>
        </div>
      </section>
