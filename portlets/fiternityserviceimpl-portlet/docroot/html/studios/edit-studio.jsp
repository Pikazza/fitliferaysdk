<%@page import="com.liferay.portlet.expando.service.ExpandoValueLocalServiceUtil"%>
<%@page import="com.liferay.portal.theme.ThemeDisplay"%>
<%@ include file="/html/init.jsp"%> 

<portlet:actionURL var="editStudio" >
<portlet:param name="action" value="editStudio"/>
</portlet:actionURL>
 
 <% User user1 = (User) request.getAttribute(WebKeys.USER);
    String roles= RoleLocalServiceUtil.getUserRoles(user1.getUserId()).toString();
    %>
 <% JSONObject object=new JSONObject(request.getAttribute("return").toString()); %>


 <%	String authCode = PortalUtil.getOriginalServletRequest(request).getParameter("code"); %>
 		
 <%	String disabled=null;
   	String selectdisabled=null;
   	if(roles.contains("Studio Owner")){ 
     	disabled="readonly";
    	selectdisabled="disabled"; 
       }else {  
    	   disabled="false";
           selectdisabled="false";
             } %>
 <%	HttpServletRequest r = PortalUtil.getHttpServletRequest(renderRequest);
    String wellHole =  PortalUtil.getOriginalServletRequest(r).getParameter("formerror");
		%>
		
		
		
<%--<%String stdid=object.get("STD_ID").toString(); %>
		<%=stdid %>
		
		<%= user.getExpandoBridge().getAttribute("stdId") %> --%>

		
      <%String instaurl=themeDisplay.getURLCurrent(); %>
      <%   session=request.getSession();  
      session.setAttribute("MYURL",instaurl);  %>
		
  
<section class="wrapper">
		<c:if test="${fn:length(formerror) gt 0}">
          <div class="serverInfo">
          <div class="container">
             <div class="fL"> ${formerror}</div>
	           <div class="fR"><i class="fa fa-times-circle close-error"></i></div>
          </div>
          </div>
		</c:if> 
 
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
              <li><a href="<%=PortalUtil.getPortalURL(request) +"/group/fiternity/studios" %>">Studios</a></li>
              <li>Edit studio</li>
            </ul>
            <h1>Edit Studio</h1>
          </div>
        </div>
        <div class="content-block">
          <div class="container">
          
          <form name="fm" method="post" enctype="multipart/form-data" >  
            <div class="whiteBg">
              <div class="sub-division">
                <div class="formRow uploadImg nonMandatory">
                  <div class="formInnerField">
                    <label  data-error="Please upload your profile image"><span>Profile Photo</span></label>
                    <div class="right-form">
                      <div class=""><img src="<%=object.get("STD_COMPANY_LOGO") %>"  id="profileImg" alt=""></div>
                      <div class="change-photo">
                        <div class="file-button-block">
                           <button type="Submit"  class="button button-primary">Change photo</button>
                          <input type="file" class="file-button " name="stdicon" id="profile-button"  <% if(roles.contains("Studio Owner")){ %> disabled=<%= selectdisabled%> <%}%> />
                        </div>
                         <div class="hint-text">Image dimension: 300px (W) and 300px (H). <br>Maximum file size of 1mb allowed. Accepted files formats include JPG or PNG.</div>
                      <!--   <a href="#"><strong>Delete profile picture</strong></a> -->
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="sub-division">
                <div class="formRow uploadImg nonMandatory">
                  <div class="formInnerField">
                      <label data-error="Please upload your studio image">
                      <span>Cover Photo</span>
                    </label>
                    <div class="add-photo file-button-block">
                        <img src="<%=object.get("STD_IMAGE_URL") %>" alt="" id="cover-img">
                      <!--   <div class="cover-text">Add cover Photo</div> -->
                      <input type="file" name="stdimage" class="file-button " id="cover-button"  <% if(roles.contains("Studio Owner")){ %> disabled=<%= selectdisabled%> <%}%> />
                    </div>
                   <div class="hint-text">Image dimension: 1400px (W) and 890px (H). <br>Maximum file size of 5mb allowed. Accepted files formats include JPG or PNG.</div>
                  </div>
                </div>
              </div>
              
              <div class="sub-division">
              <input type="hidden" name="Stdid"  value="<%=object.get("STD_ID") %>"/>
              <input type="hidden" name="Stdimgurl"  value="<%=object.get("STD_IMAGE_URL") %>"/>
              <input type="hidden" name="Stdiconurl"  value="<%=object.get("STD_COMPANY_LOGO") %>"/>
              <input type="hidden" name="Stdauthid"  value="<%=object.get("STD_PAM_AUTH_ID") %>"/>
              <input type="hidden" name="Stdauthtoken"  value="<%=object.get("STD_PAM_AUTH_TOKEN") %>"/>
              <input type="hidden" name="code"  value="<%=authCode %>"/>
              <input type="hidden" name="createdOn"  value="<%=object.get("STD_CREATED_ON") %> %>"/>
                <div class="formRow">
                  <div class="formInnerField">
                     <label data-error="Please enter studio name"><span>Studio Name</span></label>
                    <input type="text" name="Stdname" value="<%=object.get("STD_NAME") %>" class="tetxBox" <%= disabled%> placeholder="">
                  </div>
                </div>   
                <div class="formRow">
                  <div class="formInnerField textareaRow">
                    <label data-error="Please enter studio description"><span>Description</span></label>                    
<%--                     <textarea name="Stddesc" maxLength="500"  class="textArea descriptionArea"  <%= disabled%>><%=object.get("STD_DESCRIPTION") %></textarea>
 --%>                    <liferay-ui:input-editor name="Stddesc" height="50" toolbarSet="liferay-article" initMethod="initEditor" width="50" />
 
                    <div class="hint-box">
                      <div class="hint-text clearfix"> 
                        <span class="fL hintPara"></span>
                        <span class="fR totalCount"></span>
                      </div>
                    </div>
                    
                  </div>
                </div>
                <div class="formRow">
                  <div class="formInnerField textareaRow">
                    <label data-error="Please enter studio description"><span>Promotional Description</span></label>                    
                    <textarea name="Stdprodesc" maxLength="500" class="textArea descriptionArea"  <%= disabled%>><%=object.get("STD_STREAM_DESC") %></textarea>
                    <div class="hint-box">
                      <div class="hint-text clearfix"> 
                        <span class="fL hintPara"></span>
                        <span class="fR totalCount"></span>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="formRow">
                  <div class="formInnerField textareaRow">
                    <label data-error="Please enter studio  address"><span>Address</span></label>
                    <textarea name="Stdaddr"  class="textArea" <%= disabled%>><%=object.get("STD_ADDRESS_LINE1") %></textarea>                
                  </div>
                </div>
           
                <div class="formRow">
                  <div class="formInnerField">
                   <label data-error="Please enter studio postcode"><span>Postcode</span></label>
                    <input type="text" name="Stdpost" value="<%=object.get("STD_POST_CODE") %>" class="tetxBox nonMandatory" <%= disabled%> placeholder="">
                  </div>
                </div>
              
                <div class="formRow">
                  <div class="formInnerField">
                   <label data-error="Please enter studio phone number"><span>Phone</span></label>
                    <input type="text" name="Stdphone" value="<%=object.get("STD_PHONENO") %>" class="tetxBox number nonMandatory" <%= disabled%> placeholder="">
                  </div>
                </div>
                
                <div class="formRow">
                  <div class="formInnerField">
                  <label data-error="Please enter studio email id"><span>Email</span></label>
                    <input type="text" name="Stdemail" value="<%=object.get("STD_MAILID") %>" class="tetxBox emailonly nonMandatory" <%= disabled%> placeholder="">
                  </div>
                </div>
                
                <div class="formRow">
                  <div class="formInnerField">
                     <label data-error="Please enter studio latitude"><span>Latitude</span></label>
                    <input type="text" name="Stdlat" value="<%=object.get("STD_LATITUDE") %>" class="tetxBox" <%= disabled%> placeholder="">
                  </div>
                </div>
                <div class="formRow">
                  <div class="formInnerField">
                      <label data-error="Please enter studio longitude"><span>Longitude</span></label>
                    <input type="text" name="Stdlog" value="<%=object.get("STD_LONGITUDE") %>" class="tetxBox" <%= disabled%> placeholder="">
                  </div>
                </div>
                <div class="formRow">
                  <div class="formInnerField">
                   <label  data-error="Please enter Schedule url"><span>Schedule URL</span></label>
                    <input type="text" name="Stdurl" value="<%=object.get("STD_SITE_URL") %>" class="tetxBox nonMandatory" <%= disabled%> placeholder="">
                  </div>
                  </div>
              </div>   
                
              <div class="sub-division">
                <div class="formRow">
                  <div class="formInnerField">
                    <label data-error="Please enter the points per visit"><span>Points per visit</span></label>
                    <input type="text" name="Stdpoints " value="<%=object.get("STD_POINTS") %>" class="tetxBox number"  <%= disabled%> placeholder="">
                  </div>
                </div>
                <div class="formRow">
                  <div class="formInnerField">
                     <label data-error="Please enter the time to spent in the Studio"><span>Time to be spent in the Studio</span></label>
                    <input type="text" name="Stdspenttime" value="<%=object.get("STD_TIME_SPENT") %>" class="tetxBox number" <%= disabled%> placeholder="">
                  </div>
                </div>
                  <div class="formRow">
                  <div class="formInnerField">
                      <label data-error="Please select the type of studio"><span>Type of Studio</span></label>
                      <select name="stdtype"  class="selectMenu nonMandatory" id="selectMenu1" <%= selectdisabled%>>                                         
                        <option>Select Status</option>                        
                        <option <%if(object.get("STD_TYPE").toString().trim().equals("NORMAL")){ %> selected="selected"  <%} %>  >NORMAL</option>
                        <option <%if(object.get("STD_TYPE").toString().trim().equals("PREMIUM")){ %> selected="selected"  <%} %>>PREMIUM</option>                                                                                                                                   
                      </select>
                  </div>
                </div>
                
                <div class="formRow">
                  <div class="formInnerField">
                      <label data-error="Please select the studio status"><span>Studio Status</span></label>
                      <select name="stdspeed" class="selectMenu nonMandatory" id="selectMenu2" <%= selectdisabled%> >
                       <option>Select Status</option>                        
                        <option <%if(object.get("STD_STATUS").toString().trim().equals("ACTIVE")){ %> selected="selected"  <%} %>  >ACTIVE</option>
                        <option <%if(object.get("STD_STATUS").toString().trim().equals("INACTIVE")){ %> selected="selected"  <%} %>>INACTIVE</option>                                                                                                            
                        </select>
                  </div>
                </div>
              </div>  
              
            <div class="button-block">
              <button type="button" class="button button-primary button-medium" id="add-button" >SAVE CHANGES</button>
              <%if(roles.contains("Studio Owner")){ %>
                <button type="button" onclick="window.location.href='https://api.instagram.com/oauth/authorize/?client_id=07090c46105746deaf3104cf561bd211&redirect_uri=https://cms.fiternity.co/c/portal/instagram_redirect&response_type=code'" class="button button-primary button-medium">INSTAGRAM ACCESS</button>
     <!--              <button type="button" onclick="window.location.href='https://api.instagram.com/oauth/authorize/?client_id=07090c46105746deaf3104cf561bd211&redirect_uri=http://localhost:8080/c/portal/instagram_redirect&response_type=code'" class="button button-primary button-medium">INSTAGRAM ACCESS</button>
   -->
 <% }%> 
              </div>
            </div>
            </form>
          </div>          
        </div>
      </section>
      
<script type="text/javascript">

	  function <portlet:namespace />initEditor() { 
		  return "<%= UnicodeFormatter.toString(object.get("STD_DESCRIPTION").toString()) %>"; 
		  }
    
      $(function(){
      $('#add-button').on('click', function(event){
    	  
    	  var errorRow = $(this).parents('.content-block').find('.errorRow').length;
  	    if(errorRow>0){  	    	
  	    	$('.globalError').slideDown();
  	    } else {  	    	
  	    	$('.globalError').slideUp(function(){
  	    		
  	    		var myInput = document.getElementById('selectMenu1');
  	  	    	myInput.disabled = false;
  	  	    	var myInput = document.getElementById('selectMenu2');
  	  	    	myInput.disabled = false;
  	  	    	document.getElementById("profile-button").disabled = false;
  	  	    	document.getElementById("cover-button").disabled = false;
  	    		var url = '<%=editStudio.toString()%>';
  	        	document.forms["fm"].action=url;
  	        	document.forms["fm"].submit();
  	    	});
  	    }
      });   
      });  
      
</script>
      
