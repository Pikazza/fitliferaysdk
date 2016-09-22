<%@page import="java.util.ArrayList"%>
<%@page import="com.liferay.portal.model.Role"%>
<%@page import="com.liferay.portal.service.RoleLocalServiceUtil"%>
<%@page import="com.liferay.portal.model.Phone"%>
<%@page import="java.util.List"%>
<%@page import="com.liferay.portal.service.UserLocalServiceUtil"%>
<%@page import="com.liferay.portal.model.User"%>
<%@page import="com.liferay.portal.kernel.util.UnicodeFormatter"%>
<%@page import="com.liferay.portal.util.PortalUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <%@ include file="/html/init.jsp"%> 

  <portlet:actionURL var="updateModerator" >
 <portlet:param name="action" value="updateModerator"/>
 </portlet:actionURL>
 
 <% long euserid = Long.parseLong(request.getAttribute("result").toString());
     User usr = UserLocalServiceUtil.getUser(euserid);
     List<Phone>  plist = usr.getPhones();
  	String phonenos = null;
  	if(plist != null)
  	{
  		for(Phone p : plist )
  		{
  			phonenos = p.getNumber();
  		}
  	}
  	List<Role> rl = RoleLocalServiceUtil.getUserRoles(euserid);
  	List<String> rlval = new ArrayList<String>();
  	boolean chkrwd = false , chkevnt = false,chkclng =false,chkcust = false,chkstd = false,chkadv = false;
  	for(Role r : rl)
  	{
  	
  		if(r.getName().indexOf("Manager") > 0)
  		{ 		
  		String rolename = r.getName().substring(0, r.getName().indexOf(" "));
  		System.out.println("rolename :::::::::::::"+rolename);
  		if(rolename.equals("Rewards"))
  		{
  			chkrwd = true;
  		}
  		else if(rolename.equals("Events"))
  		{
  			chkevnt = true;
  		}
  		else if(rolename.equals("Challenges"))
  		{
  			chkclng = true;
  		}
  		else if(rolename.equals("Customers"))
  		{
  			chkcust = true;
  		}
  		else if(rolename.equals("Studios"))
  		{
  			chkstd = true;
  		}
  		else if(rolename.equals("Adverts"))
  		{
  			chkadv = true;
  		}
  		
  		}
  	}
 %>
<section class="wrapper">
	<%-- <c:if test="${fn:length(formerror) gt 0}">
		<div class="globalError">
	         <div class="container">
	           <div class="fL"><c:out value="${formerror}"/></div>
	           <div class="fR"><i class="fa fa-times-circle close-error"></i></div>
	         </div>
	       </div>
	</c:if> --%>     
	 <div class="globalError">
	         <div class="container">
	           <div class="fL">There are few errors in the form. Please enter the correct details in the form below</div>
	           <div class="fR"><i class="fa fa-times-circle close-error"></i></div>
	         </div>
	       </div>  
        <div class="title-block">
          <div class="container">          
            <ul class="breadcrumb">
              <li><a href="<%=PortalUtil.getPortalURL(request) +"/group/fiternity/admin-panel" %>">Admin panel</a></li>
              <li><a href="<%=PortalUtil.getPortalURL(request) +"/group/fiternity/moderators" %>">Moderators</a></li>  
              <li>Edit Moderator</li>
            </ul>
            <h1>Edit Moderator</h1>
          </div>
        </div>
   </section>
        <form  method="post" name="updateModerator" id="updateModerator">
        <section class="wrapper">        
        <div class="content-block">
          <div class="container">
            <div class="whiteBg">
              <div class="sub-division">
                <div class="formRow">
                  <div class="formInnerField">
                    <label data-error="Please enter your name"><span>Name</span></label>
                    <input type="text" value= "<%=usr.getFirstName().toString() %>" name="usrname" id="username" class="tetxBox" placeholder="">
                    <input type="hidden" name="usrId" id="usrId" value="<%=euserid %>"> 
                  </div>
                </div>
                <div class="formRow">
                  <div class="formInnerField">
                    <label data-error="Please enter valid email address"><span>Email</span></label>
                    <input type="text" value="<%=usr.getEmailAddress().toString() %>" name="email" id="email" class="tetxBox emailonly" readonly="readonly" placeholder="">
                  </div>
                </div>
                <div class="formRow">
                  <div class="formInnerField">
                    <label data-error="Please enter your phone number"><span>Phone</span></label>
                    <input type="text" value="<%=phonenos %>" name="pno" id="pno" class="tetxBox number" placeholder="">
                  </div>
                </div>
                <div class="formRow">
                  <div class="formInnerField">
                    <label data-error="Please enter your password"><span>Password</span></label>
                    <input type="password" value="" id="pwd" name="pwd" class="tetxBox nonMandatory" placeholder="">
                  </div>
                </div>
              </div>     
              <div class="sub-division">
                <div class="formRow">
                    <div class="formInnerField">
                      <label data-error="Please select anyone"><span>Can manage or edit</span></label>
                      <div class="checkButton checkBox checkWrap">
                          <input type="checkbox" name="manange" id="check1" value="Rewards" <% if(chkrwd == true) {%> checked="checked" <% }%> ><label for="check1">Rewards</label>
                          <input type="checkbox" name="manange" id="check2" value="Events" <% if(chkevnt == true) {%> checked="checked" <% }%> ><label for="check2">Events</label>
                          <input type="checkbox" name="manange" id="check3" value="Challenges" <% if(chkclng == true) {%> checked="checked" <% }%> ><label for="check3">Challenges</label>
                          <input type="checkbox" name="manange" id="check4" value="Customers" <% if(chkcust == true) {%> checked="checked" <% }%> ><label for="check4">Customers</label>
                          <input type="checkbox" name="manange" id="check5" value="Studios" <% if(chkstd == true) {%> checked="checked" <% }%> ><label for="check5">Studios</label>
                          <input type="checkbox" name="manange" id="check6" value="Adverts" <% if(chkadv == true) {%> checked="checked" <% }%> ><label for="check6">Adverts</label>
                      </div>
                    </div>
                </div>
                <div class="formRow">
                  <div class="formInnerField">
                      <label data-error="Please select the studio status">
                        <span>Status</span>
                      </label>
                      <input type="hidden" id="statusval" name="statusval" value="<%=usr.getStatus()%>">
                      <select name="status" id="status" class="selectMenu">
                        <option value="">Choose User status</option>
                        <option value="Active" <%if(usr.getStatus()==0){ %> selected  <%}%>>Active</option>
                        <option value="Inactive" <%if(usr.getStatus()==5){ %> selected  <%}%>>Inactive</option>
                      </select>
                  </div>
                </div>                
              </div>
            </div>
            <div class="button-block">
              <button type="button" class="button button-primary button-medium" id="add-button" >SAVE CHANGES</button>
            </div>
            
          </div>          
        </div>
      </section>      
      </form>
      
      
 	 <script type="text/javascript">						
/*   		$(document).ready(function(){
  			var status = $("#statusval").val();
			  $( "#status" ).val(status);
			  $('#status').selectmenu("refresh");
		   
		  }); */
		
  		
  	      $(function(){
  	      $('#add-button').on('click', function(event){
  	    	  var errorRow = $(this).parents('.content-block').find('.errorRow').length;
  	  	    if(errorRow>0){  	    	
  	  	    	$('.globalError').slideDown();
  	  	    } else {  	    	
  	  	    	$('.globalError').slideUp(function(){	    		
  	  	    		var url = '<%=updateModerator.toString()%>';
  	  	        	document.forms["updateModerator"].action=url;
  	  	        	document.forms["updateModerator"].submit();
  	  	    	});
  	  	    }
  	      });   
  	      });  
  	     
		  </script>      
     