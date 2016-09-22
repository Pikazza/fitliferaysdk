
<%@ include file="/html/init.jsp"%>
 
<portlet:actionURL var="addEvent" >
<portlet:param name="action" value="addEvent"/>
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
            <div class="fL">${formerror}</div>
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
              <li><a href="<%=PortalUtil.getPortalURL(request) +"/group/fiternity/events" %>">Events</a></li>
              <li>Add event</li>
            </ul>
            <h1>Add event</h1>
          </div>
        </div>

        <div class="content-block">
          <div class="container">
            <div class="whiteBg">
              <div class="sub-division">
              
               <%if (roles.contains("Events Manager") || roles.contains("Administrator") || roles.contains("Site Admin")){ %>
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
                  <label data-error="Please select the studio name"><span>Pick Studio</span> </label>
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
                    <label data-error="Please enter your event title"><span>Event Title</span></label>
                    <input type="text" name="eveName" value="${eveName}" class="tetxBox descriptionArea" placeholder="" maxLength="80">
                    <div class="hint-box">
                      <div class="hint-text clearfix"> 
                        <span class="fL hintPara"></span>
                        <span class="fR totalCount"></span>
                      </div>
                    </div>
                  </div>
                </div>

  
                 <div class="formRow organizer" style="display:none">
                  <div class="formInnerField">
                    <label data-error="Please enter organizer name"><span>Organizer Name</span></label>
                    <input type="text" name="orgName" value="${orgName}" class="tetxBox nonMandatory" placeholder="">
                  </div>
                </div>
                
                
                 <div class="formRow uploadImg nonMandatory organizer" style="display:none">
                  <div class="formInnerField">
                    <label  data-error="Please upload organizer's profile image"><span>Organizer's Profile Photo</span></label>
                    <div class="right-form">
                      <div class=""><img src="${themeDisplay.getPathThemeImages()}/showup-admin-images/profile-img.jpg" id="profileImg" alt=" "></div>
                      <div class="change-photo">
                        <div class="file-button-block">
                          <button type="Submit"  class="button button-primary">Change Photo</button>
                          <input type="file" name="orgIcon" value="<c:out value="${Stdicon}"/>" class="file-button" id="profile-button"/>
                        </div>
                         <div class="hint-text">Image dimension: 300px (W) and 300px (H). <br>Maximum file size of 1mb allowed. Accepted files formats include JPG or PNG.</div>
                      <!--   <a href="#"><strong>Delete profile picture</strong></a> -->
                      </div>
                    </div>
                  </div>
                  </div>

          
               
                <div class="formRow">
                  <div class="formInnerField textareaRow">
                    <label data-error="Please enter event description">
                      <span>Event Description</span>
                    </label>
                  <!--   <textarea name="eveDesc" class="textArea"></textarea>  -->
                    <liferay-ui:input-editor name="eveDesc" height="50" toolbarSet="liferay-article" initMethod="initEditor" width="50" />                                   
                 </div>
                </div>
                
                 
                <!-- <div class="formRow">
                  <div class="formInnerField textareaRow">
                    <label data-error="Please set event date"><span>Event date</span></label>
                    <div class="dateBlk">
                      <input class="numberOnly tetxBox miniBox day" id="day" type="text" placeholder="DD" maxlength="2"/>
                      <input class="numberOnly tetxBox miniBox" id="month" type="text" placeholder="MM" maxlength="2"/>
                      <input class="numberOnly tetxBox miniBox" id="year" type="text" placeholder="YYYY" maxlength="4"/>          
                    </div>
                  </div>
                </div> -->

                <div class="formRow">
                  <div class="formInnerField textareaRow">
                    <label data-error="Please set start date"><span>Start Date</span></label>
                    <div class="dateBlkSrart">
                      <input name="staDay" value="${staDay}" class="numberOnly tetxBox miniBox day" id="dayStart" type="text" placeholder="DD" maxlength="2"/>
                      <input name="staMonth" value="${staMonth}" class="numberOnly tetxBox miniBox" id="monthStart" type="text" placeholder="MM" maxlength="2"/>
                      <input name="staYear" value="${staYear}" class="numberOnly tetxBox miniBox" id="yearStart" type="text" placeholder="YYYY" maxlength="4"/>          
                    </div>
                  </div>
                </div>
                <div class="formRow">
                  <div class="formInnerField textareaRow">
                    <label data-error="Please set end date"><span>End Date</span></label>
                    <div class="dateBlkExpiry">
                      <input name="endDay" value="${endDay}" class="numberOnly tetxBox miniBox day" id="dayExpiry" type="text" placeholder="DD" maxlength="2"/>
                      <input name="endMonth" value="${endMonth}" class="numberOnly tetxBox miniBox" id="monthExpiry" type="text" placeholder="MM" maxlength="2"/>
                      <input name="endYear" value="${endYear}" class="numberOnly tetxBox miniBox" id="yearExpiry" type="text" placeholder="YYYY" maxlength="4"/>          
                    </div>
                  </div>
                </div>
                <div class="formRow">
                  <div class="formInnerField small-select">
                    <label data-error="Please set start time">
                      <span>Start Time</span>
                    </label>
                        <select  name="staHour" class="selectMenu">
                      <option>HH</option>
                  <%for(int i=0;i<=23;i++){ 
                  	%>  
                      <option> <%=String.format("%02d", i)%></option  >
                      <%} %>
                      
                    </select>
                    <select name="staMin" class="selectMenu">
                      <option>MM</option>
                       <%for(int i=0;i<=59;i++){ 
                  	%>  
                      <option > <%=String.format("%02d", i)%></option  >
                      <%} %>
                      
                    </select>
                  </div>
                </div>
                <div class="formRow">
                  <div class="formInnerField small-select">
                    <label data-error="Please set end time">
                      <span>End Time</span>
                    </label>
                    <select  name="endHour" class="selectMenu">
                      <option>HH</option>
                       <%for(int i=0;i<=23;i++){ 
                  	%>  
                      <option><%=String.format("%02d", i)%></option >
                      <%} %>
                    </select>
                    <select name="endMin" class="selectMenu">
                      <option>MM</option>
                       <%for(int i=0;i<=59;i++){ 
                  	%>  
                      <option> <%=String.format("%02d", i)%></option  >
                      <%} %>
                    </select>
                  </div>
                </div>
                <div class="formRow">
                  <div class="formInnerField">
                    <label data-error="Please enter event fee"><span>Event Fee</span></label>
                    <div class="freeBox">
                      <input type="text" name="eveFee" value="${eveFee}" class="tetxBox miniBox number" placeholder=""> 

                      <div class="checkButton checkBox">
                          <input type="checkbox" name="eveFree" id="freeBox"><label for="freeBox">Free</label>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="formRow">
                  <div class="formInnerField textareaRow">
                    <label data-error="Please set event expiry date">
                      <span>Event Expiry Date</span>
                    </label>
                    <div class="dateBlk">
                      <input name="exDay" value="${exDay}"  class="numberOnly tetxBox miniBox day" id="day" type="text" placeholder="DD" maxlength="2"/>
                      <input name="exMonth" value="${exMonth}" class="numberOnly tetxBox miniBox" id="month" type="text" placeholder="MM" maxlength="2"/>
                      <input name="exYear" value="${exYear}" class="numberOnly tetxBox miniBox" id="year" type="text" placeholder="YYYY" maxlength="4"/>          
                    </div>
                  </div>
                </div>
                <div class="formRow uploadImg">
                  <div class="formInnerField">
                    <label data-error="Please upload your event image">
                      <span>Event Photo</span>
                    </label>
                    <div class="add-photo file-button-block">
                      <img src="${themeDisplay.getPathThemeImages()}/showup-admin-images/cover-img.png" alt="" id="cover-img">
                      <input type="file" name="eveCover" class="file-button" id="cover-button" />
                    </div>
                    <div class="hint-text">Image dimension: 1230px (W) and 450px (H). <br>Maximum file size of 5mb allowed. Accepted files formats include JPG or PNG.</div>
                  </div>
                </div>
                
                
                
                   <div class="formRow">
                  <div class="formInnerField">
                    <label data-error="Please enter location"><span>Location</span></label>
                    <input type="text" name="eveLoc" value="${eveLoc}" class="tetxBox" placeholder="">
                  </div>
                </div>
                 
                <div class="formRow">
                  <div class="formInnerField textareaRow">
                    <label data-error="Please enter event address">
                      <span>Event Address</span>
                    </label>
                    <textarea name="eveAddr" class="textArea">${eveAddr}</textarea>                
                  </div>
                </div>
                
                       
                  <div class="formRow">
                  <div class="formInnerField">
                    <label data-error="Please enter studio postcode"><span>Postcode</span></label>
                    <input type="text" name="evePost" value="${evePost}" class="tetxBox nonMandatory" placeholder="">
                  </div>
                </div>
                
                 <div class="formRow">
                  <div class="formInnerField">
                    <label data-error="Please enter studio latitude"><span>Latitude</span></label>
                    <input type="text" name="eveLat" value="${eveLat}" class="tetxBox" placeholder="">
                  </div>
                </div>
                
                
                
                <div class="formRow">
                  <div class="formInnerField">
                    <label data-error="Please enter studio longitude"><span>Longitude</span></label>
                    <input type="text" name="eveLog" value="${eveLog}" class="tetxBox" placeholder="">
                  </div>
                </div>
                
                <div class="formRow">
                  <div class="formInnerField">
                    <label data-error="Please enter external link"><span>Purchase Tickets</span></label>
                    <input type="text" name="eveLink" value="${eveLink}" class="tetxBox nonMandatory " placeholder="">
                  </div>
                </div>
                
              </div>   
              <div class="sub-division influencerBlock">
                <div class="influencerRow">
                  <div class="formRow">
                    <div class="formInnerField">
                      <label data-error="Please enter influencer image"><span>Influencer Image</span></label>
                      <input type="text" value="${infIcon0}" class="tetxBox nonMandatory" placeholder="">
                      <div class="file-button-block">
                        <button class="button button-primary">Add / Change image</button>
                        <input type="file" class="file-button influence-profile-button" />
                      </div>
                      <i class="fa fa-times-circle close-influence"></i>
                    </div>
                  </div>
                  <div class="formRow">
                    <div class="formInnerField textareaRow">
                      <label data-error="Please enter influencer description">
                        <span>Influencer Description</span>
                      </label>
                      <textarea class="textArea nonMandatory"> ${infDesc0}</textarea>   
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
                    <label data-error="Please enter points for attending event" >
                      <span>Points for Attending Event</span>
                    </label>
                    <input name="evePoints" type="text" value="${evePoints}"  class="tetxBox number <%if (roles.contains("Studio Owner")){%> nonMandatory<%} %>" <%= disabled%> placeholder="">
                  </div>
                </div>
                <div class="formRow">
                  <div class="formInnerField">
                      <label  data-error=<%if (!roles.contains("Studio Owner")){ %>"Please select the reward status" <%}%>  >
                        <span>Status</span>
                      </label>
                      <select name="eveStatus" class="selectMenu <%if (roles.contains("Studio Owner")){%>nonMandatory <%} %>" id="eveStatus" <%= selectdisabled%>>
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
  	    		
  	    		    	    
            var myInput = document.getElementById('eveStatus');
          	myInput.disabled = false;
          	var e = document.getElementById("stdName"); 
      		stdid = e.options[e.selectedIndex].value;
      	    stdname = e.options[e.selectedIndex].text;
      		$('#stdId').val(stdid);
      		$('#stdNameHidden').val(stdname);
      		/* var	stdid=document.getElementById('stdId').value; 
      		alert(stdid); */
          	    
  	    		var url = '<%=addEvent.toString()%>';
  	        	document.forms["fm"].action=url;
  	        	document.forms["fm"].submit();
  	    	});
  	    }
      });
      
      $('.selectMenu').on('change',function(event){
    	  alert("am here");
    	  
      });
      
      $( "#stdName" ).selectmenu({ 		
  		change: function( event, ui ) {
  		var e = document.getElementById("stdName"); 
  		stdid = e.options[e.selectedIndex].value;
  	    stdname = e.options[e.selectedIndex].text;
  	    if(stdname == "FITERNITY") { 
  	    	$(".organizer").show().find('input[type="text"]').removeClass('nonMandatory');
  	  		$(".organizer.uploadImg").removeClass('nonMandatory')
  	    } else {
  	    	$(".organizer.uploadImg").addClass('nonMandatory')
  	    		$(".organizer").hide().find('input[type="text"]').addClass('nonMandatory');
  	    	}
  					
		  }
		});
      
      });  
 
      </script>