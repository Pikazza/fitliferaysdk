
 <%@ include file="/html/init.jsp"%> 
 
 <%	User user1 = (User) request.getAttribute(WebKeys.USER);
    String roles= RoleLocalServiceUtil.getUserRoles(user1.getUserId()).toString();
    String disabled="null";
    String selectdisabled="null";
 %>
<% JSONArray ja=new JSONArray(request.getAttribute("return").toString()); %>

 <portlet:actionURL var="addAdvert" >
 <portlet:param name="action" value="addAdvert"/>
 </portlet:actionURL>

<form   method="post" name="fm" enctype="multipart/form-data" >

      <section class="wrapper">
       <c:if test="${fn:length(formerror) gt 0}">
          <div class="serverInfo">
          <div class="container">
            <div class="fL"> ${formerror}</div>
            <div class="fR"><i class="fa fa-times-circle close-error">&nbsp;</i></div>
          </div>
        </div>
		</c:if>
        <div class="globalError">
          <div class="container">
            <div class="fL">There are few errors in the form. Please enter the correct details in the form below</div>
            <div class="fR"><i class="fa fa-times-circle close-error">&nbsp;</i></div>
          </div>
        </div>
        <div class="title-block">
          <div class="container">          
            <ul class="breadcrumb">
               <li><a href="<%=PortalUtil.getPortalURL(request) +"/group/fiternity/admin-panel" %>">Admin panel</a></li>
                <li><a href="<%=PortalUtil.getPortalURL(request) +"/group/fiternity/adverts" %>">Beacon Content</a></li>
              <li>Add Beacon Content</li>
            </ul>
            <h1>Add Beacon Content</h1>
          </div>
        </div>

        <div class="content-block">
          <div class="container">
            <div class="whiteBg">
              <div class="sub-division">
              
              
                <%if (roles.contains("Adverts Manager") || roles.contains("Administrator") || roles.contains("Site Admin")){ %>
                <div class="formRow">
                  <div class="formInnerField">
                      <label data-error="Please select the studio name">
                        <span>Pick Studio</span>
                      </label>
                      <select name="stdName" class="selectMenu" id="stdName" >
                        <option>Choose Studio</option>
                 <% for(int n = 0; n < ja.length(); n++){
            	    JSONObject stdlist = ja.getJSONObject(n); %>
                    <option value="<%=stdlist.get("STD_ID")%>"> <%=stdlist.get("STD_NAME") %></option> 
                    <%}%>
                      </select>
                  </div>
                </div> 
                
                <%
                disabled="false";
                selectdisabled="false";
                }else{
                    disabled="readonly";
                    selectdisabled="disabled";
                	%> 
                
                <div class="formRow">
                  <div class="formInnerField">
                  <label><span>Pick Studio</span> </label>
                      <select name="stdName" class="selectMenu nonMandatory" id="stdName">
                    <option value='<%=portletSession.getAttribute("stdId", PortletSession.APPLICATION_SCOPE).toString()%>'> <%=user1.getFirstName() %></option> 
                      </select>
                  </div>
                </div>  
                <%}%>
                
                <input type="hidden" name="stdId" id="stdId">
            	<input type="hidden" name="stdNameHidden" id="stdNameHidden"> 
                
                
                <div class="formRow">
                  <div class="formInnerField textareaRow">
                    <label data-error="Please enter offers description">
                      <span>Promo Description</span>
                    </label>
                    <liferay-ui:input-editor name="offDesc"  height="50" toolbarSet="liferay-article" initMethod="initEditor" width="50" />                                                
                  </div>
                </div>
                <div class="formRow uploadImg">
                  <div class="formInnerField">
                    <label data-error="Please upload your event image">
                      <span>Promo Photo</span>
                    </label>
                    <div class="add-photo file-button-block">
                      <img src="${themeDisplay.getPathThemeImages()}/showup-admin-images/cover-img.png" alt="" id="cover-img">
                      <input type="file" name="imageCover" class="file-button" id="cover-button" />
                    </div>
                    <div class="hint-text">Image dimension: 1230px (W) and 450px (H). <br>Maximum file size of 5mb allowed. Accepted files formats include JPG or PNG.</div>
                  </div>
                </div>
                <div class="formRow">
                  <div class="formInnerField">
                    <label data-error="Please enter link">
                      <span>Link</span>
                    </label>
                    <input type="text" name="offLink" value="" class="tetxBox nonMandatory" placeholder="">
                  </div>
                </div>
                <div class="formRow">
                  <div class="formInnerField">
                      <label data-error="Please select notification type">
                        <span>To be shown during</span>
                      </label>
                      <select name="notifyType" class="selectMenu">
                        <option>Choose notification</option>
                        <option>Welcome</option>
                        <option>Exit</option>
                      </select>
                  </div>
                </div> 
              </div>
              <div class="sub-division"> 
                             
           <!--      <div class="formRow">
                  <div class="formInnerField textareaRow">
                    <label data-error="Please set event date"><span>Valid from</span></label>
                    <div class="dateBlk">
                      <input class="numberOnly tetxBox miniBox day" id="day" type="text" placeholder="DD" maxlength="2"/>
                      <input class="numberOnly tetxBox miniBox" id="month" type="text" placeholder="MM" maxlength="2"/>
                      <input class="numberOnly tetxBox miniBox" id="year" type="text" placeholder="YYYY" maxlength="4"/>          
                    </div>
                  </div>
                </div>
                <div class="formRow">
                  <div class="formInnerField textareaRow">
                    <label data-error="Please set event expiry date">
                      <span>Valid to</span>
                    </label>
                    <div class="dateBlkExpiry">
                      <input class="numberOnly tetxBox miniBox day" id="dayExpiry" type="text" placeholder="DD" maxlength="2"/>
                      <input class="numberOnly tetxBox miniBox" id="monthExpiry" type="text" placeholder="MM" maxlength="2"/>
                      <input class="numberOnly tetxBox miniBox" id="yearExpiry" type="text" placeholder="YYYY" maxlength="4"/>          
                    </div>
                  </div>
                </div> -->
                
              <div class="formRow">
                  <div class="formInnerField">
                      <label data-error="Please select the challenge status">
                        <span>Status</span>
                      </label>
                      <select name="offStatus" class="selectMenu <%if (roles.contains("Studio Owner")){%>nonMandatory <%} %>" id="offStatus"  <%= selectdisabled%>>
                        <option>Choose Status</option>
                        <option>Active</option>
                        <option <%if (roles.contains("Studio Owner")){%>selected <%} %>>Inactive</option>
                      </select>
                  </div>
                </div> 
                                        
              </div>
            </div>
           <div class="button-block">
              <button type="button" class="button button-primary button-medium" id="add-button" data-location="events.html">SAVE CHANGES</button>
            </div> 
          </div> 
                     
        </div>
      </section>
</form>

 <script type="text/javascript">
    $(function(){
       $('#add-button').on('click', function(event){
    	  var errorRow = $(this).parents('.content-block').find('.errorRow').length;
    	 /// var	stdid=document.getElementById('stdNameeeee').value;  
    	 // alert(stdid);
  	    if(errorRow>0){  	    	
  	    	$('.globalError').slideDown();
  	    } else {  	    	
  	    	$('.globalError').slideUp(function(){	
  	    		var myInput = document.getElementById('offStatus');
  	    	    myInput.disabled = false;
  	    	  var e = document.getElementById("stdName"); 
        		stdid = e.options[e.selectedIndex].value;
        	    stdname = e.options[e.selectedIndex].text;
        		$('#stdId').val(stdid);
        		$('#stdNameHidden').val(stdname);
  	    		var url = '<%=addAdvert.toString()%>';
  	        	document.forms["fm"].action=url;
  	        	document.forms["fm"].submit();
  	    	});
  	    }
      });  

      });  
</script>

