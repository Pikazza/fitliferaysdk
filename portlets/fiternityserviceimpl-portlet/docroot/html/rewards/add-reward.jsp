<%@ include file="/html/init.jsp"%> 
 
<portlet:actionURL var="addReward" >
<portlet:param name="action" value="addReward"/>
</portlet:actionURL>
<%	User user1 = (User) request.getAttribute(WebKeys.USER);
    String roles= RoleLocalServiceUtil.getUserRoles(user1.getUserId()).toString();
    String disabled="null";
    String selectdisabled="null";
  %>
<% JSONArray ja=new JSONArray(request.getAttribute("return").toString()); %> 

<form  method="post" name="fm" enctype="multipart/form-data" >
<section class="wrapper">

 		<c:if test="${fn:length(formerror) gt 0}">
          <div class="serverInfo">
          <div class="container">
            <div class="fL">${formerror}</div>
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
              <li><a href="<%=PortalUtil.getPortalURL(request) +"/group/fiternity/rewards" %>">Rewards</a></li>
              <li>Add reward</li>
            </ul>
            <h1>Add reward</h1>
          </div>
        </div>

        <div class="content-block">
          <div class="container">
            <div class="whiteBg">
              <div class="sub-division">
              
         		<%if (roles.contains("Rewards Manager") || roles.contains("Administrator") || roles.contains("Site Admin")){ %>
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
                  <div class="formInnerField">
                    <label data-error="Please enter your reward name"><span>Reward Title</span></label>
                    <input type="text" name="rwdName" id="rwdName" value="${rwdName} " class="tetxBox descriptionArea" placeholder="" maxLength="80">
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
                    <label data-error="Please enter your reward Details"><span>Reward Description</span></label>
                    <liferay-ui:input-editor name="rwdDesc" height="50" toolbarSet="liferay-article" initMethod="initEditor" width="50" />
 					<input name="htmlcode" type="hidden" value="" />
                  </div>
                </div>
      
                <div class="formRow">
                  <div class="formInnerField textareaRow">
                    <label data-error="Please set expiry date"><span>Expiry Date</span></label>
                    <div class="dateBlk">
                      <input  name="exDay" class="numberOnly tetxBox miniBox" id="day" type="text" value="${exDay}" placeholder="DD" maxlength="2"/>
                      <input  name="exMonth" class="numberOnly tetxBox miniBox" id="month" type="text" value="${exMonth}" placeholder="MM" maxlength="2"/>
                      <input  name="exYear" class="numberOnly tetxBox miniBox" id="year" type="text" value="${exYear}" placeholder="YYYY" maxlength="4"/>          
                  </div>
                </div>
              </div>
              <div class="sub-division">
                <div class="formRow uploadImg">
                  <div class="formInnerField">
                    <label data-error="Please upload your studio image">
                      <span>Reward Photo</span>
                    </label>
                    <div class="add-photo file-button-block">
                      <img src="${themeDisplay.getPathThemeImages()}/showup-admin-images/cover-img.png" alt="" id="cover-img">
                      <input type="file" name="rwdImage" value="${rwdImage}" class="file-button" id="cover-button" />
                    </div>
                    <div class="hint-text">Image dimension: 1230px (W) and 450px (H). <br>Maximum file size of 5mb allowed. Accepted files formats include JPG or PNG.</div>
                  </div>
                </div>
              </div>
               <div class="sub-division">  
                <div class="formRow">
                  <div class="formInnerField textareaRow">
                    <label  data-error="Please enter the points" ><span>Points Required</span></label>
                     <input type="text" name="pointsReq" value="${pointsReq}" class="tetxBox nonMandatory number" placeholder=""  <%= disabled%>> 
                                   
                  </div>
                </div>
                
                <div class="formRow">
                  <div class="formInnerField ">
                    <label data-error="Please enter voucher code"><span>Voucher Code(s)</span></label>
                     <textarea name="voucherCodes" class="textArea <%if (roles.contains("Studio Owner")){%>nonMandatory <%} %>"  <%= disabled%>>${voucherCodes}</textarea> 
                   <div class="hint-text">When using multiple voucher codes use comma to separate them.</div>
                  </div>
                </div>
                
              </div>     
              <div class="sub-division">
            
                <div class="formRow">
                  <div class="formInnerField">
                      <label  data-error="Please select the reward status"  >
                        <span>Status</span>
                      </label>
                      <select name="rwdStatus" class="selectMenu <%if (roles.contains("Studio Owner")){%>nonMandatory <%} %>" id="rwdStatus" <%= selectdisabled%>>
                        <option>Choose Status</option>
                        <option>Active</option>
                        <option <%if (roles.contains("Studio Owner")){%>selected <%} %>>Inactive</option>
                      </select>
                  </div>
                </div>
            </div>            
          </div>  
          <div class="button-block">
            <button type="button" class="button button-primary button-medium" id="add-button" onclick="load()">SAVE CHANGES</button>
            </div>        
        </div>
         </div>
          </div>
      </section>
      </form>
      
      <script type="text/javascript">
      
/*     
            function initEditor() {
                        return '<font style="font-weight: bold">scott was here</font>';
            }
 */
 
      $(function(){
      $('#add-button').on('click', function(event){
    	  var errorRow = $(this).parents('.content-block').find('.errorRow').length;
    	  var	stdid=document.getElementById('stdName').value;  
  	    if(errorRow>0){  	    	
  	    	$('.globalError').slideDown();
  	    } else {  	    	
  	    	$('.globalError').slideUp(function(){	
  	    		
  	    		 var	stdid=document.getElementById('stdId').value;     	    
             	var myInput = document.getElementById('rwdStatus');
          	    myInput.disabled = false;
          	  var e = document.getElementById("stdName"); 
        		stdid = e.options[e.selectedIndex].value;
        	    stdname = e.options[e.selectedIndex].text;
        		$('#stdId').val(stdid);
        		$('#stdNameHidden').val(stdname);
        		
  	    		var url = '<%=addReward.toString()%>';
  	        	document.forms["fm"].action=url;
  	        	document.forms["fm"].submit();
  	    	});
  	    }
      });   
      });  
      </script>