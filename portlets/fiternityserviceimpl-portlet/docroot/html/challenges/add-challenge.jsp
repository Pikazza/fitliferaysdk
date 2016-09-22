<%@ include file="/html/init.jsp"%> 

 <portlet:actionURL var="addChallenge" >
 <portlet:param name="action" value="addChallenge"/>
 </portlet:actionURL>


<%	User user1 = (User) request.getAttribute(WebKeys.USER);
    String roles= RoleLocalServiceUtil.getUserRoles(user1.getUserId()).toString();
    String disabled="null";
    String selectdisabled="null";
           %>
<% JSONArray ja=new JSONArray(request.getAttribute("return").toString()); %>

<form   method="post" name="fm" enctype="multipart/form-data" >
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
              <li><a href="<%=PortalUtil.getPortalURL(request) +"/group/fiternity/challenges" %>">Challenges</a></li>
              <li>Add Challenge</li>
            </ul>
            <h1>Add Challenge</h1>
          </div>
        </div>

        <div class="content-block">
          <div class="container">
            <div class="whiteBg">
              <div class="sub-division">
              
              
         	<%if (roles.contains("Challenges Manager") || roles.contains("Administrator") || roles.contains("Site Admin") ){ %>
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
                    <label data-error="Please enter challenge title"><span>Challenge Title</span></label>
                    <input type="text" name="cheName" value="${cheName}" class="tetxBox descriptionArea" placeholder="" maxLength="80">
                    <div class="hint-box">
                      <div class="hint-text clearfix"> 
                        <span class="fL hintPara">&nbsp;</span>
                        <span class="fR totalCount">&nbsp;</span>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="formRow">
                  <div class="formInnerField textareaRow">
                    <label data-error="Please enter challenge excerpt"><span>Challenge Excerpt</span></label>
                    <textarea name="cheShort" class="textArea descriptionArea" maxLength="144">${cheShort}</textarea>                
                    <div class="hint-box">
                      <div class="hint-text clearfix"> 
                        <span class="fL hintPara">&nbsp;</span>
                        <span class="fR totalCount">&nbsp;</span>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="formRow">
                  <div class="formInnerField textareaRow">
                    <label data-error="Please enter challenge details"><span>Challenge Description</span></label>
                    <!-- <textarea id="cheDetail" name="cheDetail" class="textArea"></textarea>  -->  
                     <liferay-ui:input-editor name="cheDetail" height="50" toolbarSet="liferay-article" initMethod="initEditor" width="50" />                                
                  </div>
                </div>
                <div class="formRow">
                  <div class="formInnerField textareaRow">
                    <label data-error="Please set event date"><span>Start Date</span></label>
                    <div class="dateBlkSrart">
                      <input name="staDay" value="${staDay}" class="numberOnly tetxBox miniBox day" id="dayStart" type="text" placeholder="DD" maxlength="2"/>
                      <input name="staMonth" value="${staMonth}" class="numberOnly tetxBox miniBox" id="monthStart" type="text" placeholder="MM" maxlength="2"/>
                      <input name="staYear" value="${staYear}" class="numberOnly tetxBox miniBox" id="yearStart" type="text" placeholder="YYYY" maxlength="4"/>          
                    </div>
                  </div>
                </div>
                <div class="formRow">
                  <div class="formInnerField textareaRow">
                    <label data-error="Please set event date"><span>End Date</span></label>
                    <div class="dateBlkExpiry">
                      <input name="endDay" value="${endDay}" class="numberOnly tetxBox miniBox day" id="dayExpiry" type="text" placeholder="DD" maxlength="2"/>
                      <input name="endMonth" value="${endMonth}" class="numberOnly tetxBox miniBox" id="monthExpiry" type="text" placeholder="MM" maxlength="2"/>
                      <input name="endYear" value="${endYear}" class="numberOnly tetxBox miniBox" id="yearExpiry" type="text" placeholder="YYYY" maxlength="4"/>          
                    </div>
                  </div>
                </div>
                <div class="formRow">
                  <div class="formInnerField textareaRow">
                    <label data-error="Please set expiry date"><span>Expiry Date</span></label>
                    <div class="dateBlk">
                      <input name="exDay" value="${exDay}" class="numberOnly tetxBox miniBox" id="day" type="text" placeholder="DD" maxlength="2"/>
                      <input name="exMonth" value="${exMonth}" class="numberOnly tetxBox miniBox" id="month" type="text" placeholder="MM" maxlength="2"/>
                      <input name="exYear" value="${exYear}" class="numberOnly tetxBox miniBox" id="year" type="text" placeholder="YYYY" maxlength="4"/>
                    </div>
                  </div>
                </div>
                   <div class="formRow">
                  <div class="formInnerField">
                    <label data-error="Please enter number of challenge days "><span>No. of Classes</span></label>
                    <input type="text" name="noOfDays" value="${noOfDays}" class="tetxBox number" placeholder="">
                  </div>
                </div>
                
              </div>
              <div class="sub-division">
                <div class="formRow uploadImg">
                  <div class="formInnerField">
                    <label data-error="Please upload your badge ">
                      <span>Upload Badge</span>
                    </label>
                    <div class="right-form">
                      <div class=""><img src="${themeDisplay.getPathThemeImages()}/showup-admin-images/profile-img.jpg" id="profileImg" alt=""></div>
                      <div class="change-photo">
                        <div class="file-button-block">
                          <button class="button button-primary">Add/change Badge</button>
                          <input type="file"  name="iconBadge" class="file-button" id="profile-button" />
                        </div>
                        <div class="hint-text">Image dimension: 300px (W) and 300px (H). <br>Maximum file size of 1mb allowed. Accepted files formats include JPG or PNG.</div>
                        <!-- <a href="#"><strong>Delete Badge</strong></a> -->
                      </div>
                    </div>
                  </div>
                </div>
                <div class="formRow">
                  <div class="formInnerField textareaRow">
                    <label data-error="Please enter badge description"><span>Badge Description</span></label>
                    <textarea name="badgeDesc" class="textArea"> ${badgeDesc} </textarea>                
                  </div>
                </div>
                <div class="formRow uploadImg">
                  <div class="formInnerField">
                    <label data-error="Please upload your Challenge image">
                      <span>Challenge Image</span>
                    </label>
                    <div class="add-photo file-button-block">
                      <img src="${themeDisplay.getPathThemeImages()}/showup-admin-images/cover-img.png" alt="" id="cover-img">
                      <input type="file" name="imageCover" class="file-button" id="cover-button" />
                    </div>
                    <div class="hint-text">Image dimension: 1230px (W) and 450px (H). <br>Maximum file size of 5mb allowed. Accepted files formats include JPG or PNG.</div>
                  </div>
                </div>
              </div>
              <div class="sub-division influencerBlock">
                <div class="influencerRow">
                
                  <div class="formRow">
                    <div class="formInnerField">
                      <label data-error="Please choose influencer image"><span>Influencer Image</span></label>
                      <input type="text" value="${infIcon0}" class="tetxBox nonMandatory" placeholder="">
                      <div class="file-button-block">
                        <button class="button button-primary">Add / Change image</button>
                        <input type="file"  class="file-button influence-profile-button" />
                      </div>
                      <i class="fa fa-times-circle close-influence"></i>
                    </div>
                  </div>
                  <div class="formRow">
                    <div class="formInnerField textareaRow">
                      <label data-error="Please enter influencer description">
                        <span>Influencer Description</span>
                      </label>
                      <textarea  class="textArea nonMandatory"> ${infDesc0}</textarea>   
                      <div class="add-influencer">
                        <a href="javascript:void(0)"><strong>Add Influencer</strong></a>
                      </div>             
                    </div>
                  </div>  
                  
                  
                  
                </div>  
              </div>
              <div class="sub-division">
                <div class="formRow">
                  <div class="formInnerField">
                      <label data-error="Please select the challenge status">
                        <span>Status</span>
                      </label>
                      <select name="cheStatus" class="selectMenu <%if (roles.contains("Studio Owner")){%>nonMandatory <%} %>" id="cheStatus"  <%= selectdisabled%>>
                        <option>Choose Status</option>
                        <option>Active</option>
                        <option <%if (roles.contains("Studio Owner")){%>selected <%} %>>Inactive</option>
                      </select>
                  </div>
                </div>                          
              </div>
            </div>      
            <div class="button-block">
              
                <button type="button" class="button button-primary button-medium"  id="add-button" data-location="challenges.html">SAVE CHANGES</button>
            </div>      
          </div>
        </div>
      </section>
      
      </form>
      
<script type="text/javascript">
   
    $(function(){
    	$('#fileButton1').on('click', function(event){
    		$('#Inficon1').val=document.getElementById('fileButton1').value;
    		alert(document.getElementById('Inficon1').value);
    	});
    	
       $('#add-button').on('click', function(event){
    	  var errorRow = $(this).parents('.content-block').find('.errorRow').length;
    	 /// var	stdid=document.getElementById('stdNameeeee').value;  
    	 // alert(stdid);
  	    if(errorRow>0){  	    	
  	    	$('.globalError').slideDown();
  	    } else {  	    	
  	    	$('.globalError').slideUp(function(){	
  	    		var myInput = document.getElementById('cheStatus');
  	    	    myInput.disabled = false;
  	    	  var e = document.getElementById("stdName"); 
        		stdid = e.options[e.selectedIndex].value;
        	    stdname = e.options[e.selectedIndex].text;
        		$('#stdId').val(stdid);
        		$('#stdNameHidden').val(stdname);
        		
  	    		var url = '<%=addChallenge.toString()%>';
  	        	document.forms["fm"].action=url;
  	        	document.forms["fm"].submit();
  	    	});
  	    }
      });  

      });  
    
</script>