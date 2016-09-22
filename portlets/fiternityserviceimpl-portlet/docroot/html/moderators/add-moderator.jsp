<%@page import="com.liferay.portal.kernel.util.UnicodeFormatter"%>
<%@page import="com.liferay.portal.util.PortalUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <%@ include file="/html/init.jsp"%> 

  <portlet:actionURL var="submitModerator" >
 <portlet:param name="action" value="submitModerator"/>
 </portlet:actionURL>


<section class="wrapper">
	<%-- <c:if test="${fn:length(formerror) gt 0}">
		<div class="globalError">
	         <div class="container">
	           <div class="fL"><c:out value="${formerror}"/></div>
	           <div class="fR"><i class="fa fa-times-circle close-error"></i></div>
	         </div>
	       </div>
	</c:if>   --%>    
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
              <li>Add Moderator</li>
            </ul>
            <h1>Add Moderator</h1>
          </div>
        </div>
  </section>
  <form  method="post" name="submitModerator" id="submitModerator">    
  	<section class="wrapper">  
        <div class="content-block">
          <div class="container">
            <div class="whiteBg">
              <div class="sub-division">
                <div class="formRow">
                  <div class="formInnerField">
                    <label data-error="Please enter your name"><span>Name</span></label>
                    <input type="text" value="" name="usrname" id="username" class="tetxBox" placeholder="">
                  </div>
                </div>
                <div class="formRow">
                  <div class="formInnerField">
                    <label data-error="Please enter valid email address"><span>Email</span></label>
                    <input type="text" value="" name="email" id="email" class="tetxBox emailonly" placeholder="">
                  </div>
                </div>
                <div class="formRow">
                  <div class="formInnerField">
                    <label data-error="Please enter your phone number"><span>Phone</span></label>
                    <input type="text" value="" name="pno" id="pno" class="tetxBox number" placeholder="">
                  </div>
                </div>
                <div class="formRow">
                  <div class="formInnerField">
                    <label data-error="Please enter your password"><span>Password</span></label>
                    <input type="password" value="" id="pwd" name="pwd" class="tetxBox" placeholder="">
                  </div>
                </div>
              </div>     
              <div class="sub-division">
                <div class="formRow">
                    <div class="formInnerField">
                      <label data-error="Please select anyone"><span>Can manage or edit</span></label>
                      <div class="checkButton checkBox checkWrap">
                          <input type="checkbox" name="manange" id="check1" value="Rewards"><label for="check1">Rewards</label>
                          <input type="checkbox" name="manange" id="check2" value="Events"><label for="check2">Events</label>
                          <input type="checkbox" name="manange" id="check3" value="Challenges"><label for="check3">Challenges</label>
                          <input type="checkbox" name="manange" id="check4" value="Customers"><label for="check4">Customers</label>
                          <input type="checkbox" name="manange" id="check5" value="Studios"><label for="check5">Studios</label>
                          <input type="checkbox" name="manange" id="check6" value="Adverts"><label for="check6">Adverts</label>
                      </div>
                    </div>
                </div>
                <div class="formRow">
                  <div class="formInnerField">
                      <label data-error="Please select the studio status">
                        <span>Status</span>
                      </label>
                      <select name="status" id="status" class="selectMenu">
                        <option value="">Choose User status</option>
                        <option value="Active">Active</option>
                        <option value="InActive">Inactive</option>
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
      $(function(){
      $('#add-button').on('click', function(event){
    	  var errorRow = $(this).parents('.content-block').find('.errorRow').length;
  	    if(errorRow>0){  	    	
  	    	$('.globalError').slideDown();
  	    } else {  	    	
  	    	$('.globalError').slideUp(function(){	    		
  	    		var url = '<%=submitModerator.toString()%>';
  	        	document.forms["submitModerator"].action=url;
  	        	document.forms["submitModerator"].submit();
  	    	});
  	    }
      });   
      });  
      </script>
     