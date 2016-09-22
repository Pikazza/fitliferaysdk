<%@ include file="/html/init.jsp"%>

<%	User user1 = (User) request.getAttribute(WebKeys.USER);
    String roles= RoleLocalServiceUtil.getUserRoles(user1.getUserId()).toString();
    String disabled="null",selectdisabled="null";
    DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
    DateFormat timeform = new SimpleDateFormat("HH:mm");
    %>
<% JSONObject object=new JSONObject(request.getAttribute("return").toString());

  Date staDate = (Date)formatter.parse(object.get("START_DATE").toString());
  Calendar staCal = Calendar.getInstance();
  staCal.setTime(staDate);
  
  Date endDate = (Date)formatter.parse(object.get("END_DATE").toString());
  Calendar endCal = Calendar.getInstance();
  endCal.setTime(endDate);
  
  Date exDate = (Date)formatter.parse(object.get("STA_EXPIRY_DATE").toString());
  Calendar exCal = Calendar.getInstance();
  exCal.setTime(exDate);

  Date staTime = (Date)timeform.parse(object.get("START_TIME").toString());
  Calendar staTimeCal = Calendar.getInstance();
  staTimeCal.setTime(staTime);
  int stahour = staTimeCal.get(Calendar.HOUR_OF_DAY);
  int stamin = staTimeCal.get(Calendar.MINUTE); 
  
  Date endTime = (Date)timeform.parse(object.get("END_TIME").toString());
  Calendar endTimeCal = Calendar.getInstance();
  endTimeCal.setTime(endTime);
  int endhour = endTimeCal.get(Calendar.HOUR_OF_DAY);
  int endmin = endTimeCal.get(Calendar.MINUTE);
 
  %>
    <% 
  if (roles.contains("Events Manager") || roles.contains("Administrator") || roles.contains("Site Admin")){
	  disabled="false";
      selectdisabled="false";
  }else{
         disabled="readonly";
         selectdisabled="disabled";
 		} %>
  

<portlet:actionURL var="editEvent" >
<portlet:param name="action" value="editEvent"/>
</portlet:actionURL>


<form <%--  action="<%=editEvent.toString()%>"  --%> method="post" name="fm" enctype="multipart/form-data" >
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
            <div class="fR"><i class="fa fa-times-circle close-error">&nbsp;</i></div>
          </div>
        </div>
        <div class="title-block">
          <div class="container">          
            <ul class="breadcrumb">
              <li><a href="<%=PortalUtil.getPortalURL(request) +"/group/fiternity/admin-panel" %>">Admin panel</a></li>
				<li><a href="<%=PortalUtil.getPortalURL(request) +"/group/fiternity/events" %>">Events</a></li>              
				<li>Edit event</li>
            </ul>
            <h1>Edit event</h1>
          </div>
        </div>

        <div class="content-block">
          <div class="container">
            <div class="whiteBg">
              <div class="sub-division">
              
             <div class="formRow">
                  <div class="formInnerField">
                      <label data-error="Please select the studio status">
                        <span>Pick Studio</span>
                      </label>
                      <select name="stdName" class="selectMenu nonMandatory">
                        <option><%=object.get("STD_NAME") %></option>
                      </select>
                  </div>
                </div>
                
            	 <input type="hidden" name="staId"  value="<%=object.get("STA_ID") %>"/>
                  <input type="hidden" name="stdId" id="stdId"  value=" <%=object.get("STD_ID") %>"> 
                   <input type="hidden" name="imageCoverOld"  value="<%=object.get("STA_IMAGE_URL") %>"/> 
                   <input type="hidden" name="eventType"  value="<%=object.get("EVENT_TYPE") %>"/>
                
                <div class="formRow">
                  <div class="formInnerField">
                    <label data-error="Please enter your event title"><span>Event Title</span></label>
                    <input type="text" name="eveName" value="<%=object.get("STA_NAME") %>" class="tetxBox descriptionArea" placeholder="" maxLength="80">
                    <div class="hint-box">
                      <div class="hint-text clearfix"> 
                        <span class="fL hintPara"></span>
                        <span class="fR totalCount"></span>
                      </div>
                    </div>
                  </div>
                </div>
                
              <% if(object.get("EVENT_TYPE").toString().equalsIgnoreCase("FITERNITY") ) { %> 
              <input type="hidden" name="orgIconHidden"  value="<%=object.get("STD_COMPANY_LOGO") %>"/>
                
                 <div class="formRow uploadImg nonMandatory organizer" >
                  <div class="formInnerField">
                    <label  data-error="Please upload your profile image"><span>Organizer's Profile Photo</span></label>
                    <div class="right-form">
                      <div class=""><img src="<%=object.get("STD_COMPANY_LOGO") %>" id="profileImg" alt=" "></div>
                      <div class="change-photo">
                        <div class="file-button-block">
                          <button type="Submit"  class="button button-primary">Change Photo</button>
                          <input type="file" name="orgIcon" value="<c:out value=""/>" class="file-button" id="profile-button"/>
                        </div>
                         <div class="hint-text">Image dimension: 300px (W) and 300px (H). <br>Maximum file size of 1mb allowed. Accepted files formats include JPG or PNG.</div>
                      <!--   <a href="#"><strong>Delete profile picture</strong></a> -->
                      </div>
                    </div>
                  </div>
                  </div>
                  
                  <%} %>
               
                <div class="formRow">
                  <div class="formInnerField textareaRow">
                    <label data-error="Please enter event description">
                      <span>Event Description</span>
                    </label>
                    <liferay-ui:input-editor name="eveDesc" height="50" toolbarSet="liferay-article" initMethod="initEditor" width="50" />                   
                   <%--  <textarea name="eveDesc" class="textArea"><%=object.get("STA_DESCRIPTION") %></textarea>  --%>               
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
                      <input name="staDay" value="<%= String.format("%02d", staCal.get(Calendar.DAY_OF_MONTH)) %>" class="numberOnly tetxBox miniBox day" id="dayStart" type="text" placeholder="DD" maxlength="2"/>
                      <input name="staMonth" value="<%= String.format("%02d", staCal.get(Calendar.MONTH)+1) %>" class="numberOnly tetxBox miniBox" id="monthStart" type="text" placeholder="MM" maxlength="2"/>
                      <input name="staYear" value="<%=staCal.get(Calendar.YEAR) %>" class="numberOnly tetxBox miniBox" id="yearStart" type="text" placeholder="YYYY" maxlength="4"/>          
                    </div>
                  </div>
                </div>
                <div class="formRow">
                  <div class="formInnerField textareaRow">
                    <label data-error="Please set end date"><span>End Date</span></label>
                    <div class="dateBlkExpiry">
                      <input name="endDay" value="<%=String.format("%02d", endCal.get(Calendar.DAY_OF_MONTH))  %>" class="numberOnly tetxBox miniBox day" id="dayExpiry" type="text" placeholder="DD" maxlength="2"/>
                      <input name="endMonth" value="<%= String.format("%02d", endCal.get(Calendar.MONTH)+1)  %>" class="numberOnly tetxBox miniBox" id="monthExpiry" type="text" placeholder="MM" maxlength="2"/>
                      <input name="endYear" value="<%=endCal.get(Calendar.YEAR) %>" class="numberOnly tetxBox miniBox" id="yearExpiry" type="text" placeholder="YYYY" maxlength="4"/>          
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
                      <option <% if(i==stahour){  %>selected <%} %>> <%=String.format("%02d", i)%></option  >
                      <%} %>
                      
                    </select>
                    <select name="staMin" class="selectMenu">
                      <option>MM</option>
                       <%for(int i=0;i<=59;i++){ 
                  	%>  
                      <option <% if(i==stamin){  %>selected <%} %>> <%=String.format("%02d", i)%></option  >
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
                      <option <% if(i==endhour){  %>selected <%} %>><%=String.format("%02d", i)%></option >
                      <%} %>
                    </select>
                    <select name="endMin" class="selectMenu">
                      <option>MM</option>
                       <%for(int i=0;i<=59;i++){ 
                  	%>  
                      <option <% if(i==endmin){  %>selected <%} %>> <%=String.format("%02d", i)%></option  >
                      <%} %>
                    </select>
                  </div>
                </div>
                
                <div class="formRow">
                  <div class="formInnerField">
                    <label data-error="Please enter event fee"><span>Event Fee</span></label>
                    <div class="freeBox">
                    
                      <input type="text" name="eveFee" value="<%=object.get("STA_PRICE").toString().equals("0")?"":object.get("STA_PRICE") %>" class="tetxBox miniBox number" placeholder="" <%if(object.get("STA_PRICE").toString().equals("0")) {%>disabled="disabled" <%} %>>

                      <div class="checkButton checkBox">
                          <input type="checkbox" name="eveFree" id="freeBox" <%if(object.get("STA_PRICE").toString().equals("0")) {%> checked="checked" <%} %>><label for="freeBox">Free</label>
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
                      <input name="exDay" value="<%= String.format("%02d", exCal.get(Calendar.DAY_OF_MONTH))  %>" class="numberOnly tetxBox miniBox day" id="day" type="text" placeholder="DD" maxlength="2"/>
                      <input name="exMonth" value="<%=String.format("%02d", exCal.get(Calendar.MONTH)+1)  %>" class="numberOnly tetxBox miniBox" id="month" type="text" placeholder="MM" maxlength="2"/>
                      <input name="exYear" value="<%=exCal.get(Calendar.YEAR) %>" class="numberOnly tetxBox miniBox" id="year" type="text" placeholder="YYYY" maxlength="4"/>          
                    </div>
                  </div>
                </div>
                <div class="formRow uploadImg nonMandatory">
                  <div class="formInnerField">
                    <label data-error="Please upload your event image">
                      <span>Event Photo</span>
                    </label>
                    <div class="add-photo file-button-block">
                      <img src="<%=object.get("STA_IMAGE_URL") %>" alt="" id="cover-img">
                      <input type="file" name="eveCover" class="file-button" id="cover-button" />
                    </div>
                    <div class="hint-text">Image dimension: 1230px (W) and 450px (H). <br>Maximum file size of 5mb allowed. Accepted files formats include JPG or PNG.</div>
                  </div>
                </div>
                
         
                
                   <div class="formRow">
                  <div class="formInnerField">
                    <label data-error="Please enter location"><span>Location</span></label>
                    <input type="text" name="eveLoc" value="<%=object.get("STA_LOCATION") %>" class="tetxBox" placeholder="">
                  </div>
                </div>
                
                 <div class="formRow">
                  <div class="formInnerField textareaRow">
                    <label data-error="Please enter event address">
                      <span>Event Address</span>
                    </label>
                    <textarea name="eveAddr" class="textArea"><%=object.get("STA_ADDRESS_LINE1") %></textarea>                
                  </div>
                </div>
                
                  <div class="formRow">
                  <div class="formInnerField">
                    <label data-error="Please enter studio postcode"><span>Postcode</span></label>
                    <input type="text" name="evePost" value="<%=object.get("STA_POST_CODE") %>" class="tetxBox nonMandatory" placeholder="">
                  </div>
                </div>
                        <div class="formRow">
                  <div class="formInnerField">
                    <label data-error="Please enter studio latitude"><span>Latitude</span></label>
                    <input type="text" name="eveLat" value="<%=object.get("STA_LATITUDE") %>" class="tetxBox" placeholder="">
                  </div>
                </div>
                
                
                
                <div class="formRow">
                  <div class="formInnerField">
                    <label data-error="Please enter studio longitude"><span>Longitude</span></label>
                    <input type="text" name="eveLog" value="<%=object.get("STA_LONGITUDE") %>" class="tetxBox" placeholder="">
                  </div>
                </div>
                
                
                <div class="formRow">
                  <div class="formInnerField">
                    <label data-error="Please enter external link"><span>Purchase Tickets</span></label>
                    <input type="text" name="eveLink" value="<%=object.get("STA_EXTERNAL_LINK") %>" class="tetxBox nonMandatory" placeholder="">
                  </div>
                </div>
                
              </div> 
              
                
                
              <div class="sub-division influencerBlock">
               <%JSONArray infarray =object.getJSONArray("STA_INFLUENCER"); %>
              
              <%if(infarray.length()==0){ %>
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
              <%} %>
              
              <% for(int i=0;infarray.length()>i;i++) {  JSONObject infobject=infarray.getJSONObject(i);%>
              <input type="hidden" name="infImg<%=i%>"  value="<%=infobject.get("IMG") %>"/>
               <input type="hidden" name="infDec<%=i%>"  value="<%=infobject.get("DESC") %>"/>
              
                <div class="influencerRow">
                  <div class="formRow">
                    <div class="formInnerField">
                      <label data-error="Please enter influencer image"><span>Influencer Image</span></label>
                      <input type="text" value="<%=infobject.get("IMG") %>" class="tetxBox nonMandatory" placeholder="">
                      <div class="file-button-block">
                        <button class="button button-primary">Add / Change image</button>
                        <input type="file" class="file-button influence-profile-button" />
                      </div>
                      <i class="fa fa-times-circle close-influence"></i>                   
                      <a href="<%=infobject.get("IMG") %>" target="_blank"><strong>View Image</strong> </a>
                    </div>
                  </div>
                  <div class="formRow">
                    <div class="formInnerField textareaRow">
                      <label data-error="Please enter influencer description">
                        <span>Influencer Description</span>
                      </label>
                      <textarea class="textArea nonMandatory"> <%=infobject.get("DESC") %></textarea>   
                      <div class="add-influencer">
                        <a href="javascript:void(0)"><strong>Add Influencer</strong></a>
                      </div>             
                    </div>
                  </div>  
                </div>  
                <%} %>
              </div>
              
              
              
              
              <div class="sub-division">
                <div class="formRow">
                  <div class="formInnerField">
                    <label data-error="Please enter points for attending event">
                      <span>Points for Attending Event</span>
                    </label>
                    <input name="evePoints" type="text"  <%= disabled%>  value="<%=object.get("STA_GOAL_POINTS") %>" class="tetxBox number" placeholder="">
                  </div>
                </div>
                <div class="formRow">
                  <div class="formInnerField">
                      <label data-error="Please select event status">
                        <span>Status</span>
                      </label>
                      <select name="eveStatus" class="selectMenu <%if (roles.contains("Studio Owner")){%>nonMandatory <%} %>" id="eveStatus" <%= selectdisabled%>>
                      <option>Select Status</option>                        
                        <option <%if(object.get("STA_STATUS").toString().trim().equals("ACTIVE")){ %> selected="selected"  <%} %>  >ACTIVE</option>
                        <option <%if(object.get("STA_STATUS").toString().trim().equals("INACTIVE")){ %> selected="selected"  <%} %>>INACTIVE</option>                                                                
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
      
	function <portlet:namespace />initEditor() { return "<%= UnicodeFormatter.toString(object.get("STA_DESCRIPTION").toString()) %>"; } 
      
	$(function(){
      $('#add-button').on('click', function(event){
    	  var errorRow = $(this).parents('.content-block').find('.errorRow').length;
  	    if(errorRow>0){  	    	
  	    	$('.globalError').slideDown();
  	    } else {  	    	
  	    	$('.globalError').slideUp(function(){
  	    		var myInput = document.getElementById('eveStatus');
    	    myInput.disabled = false;
  	    		var url = '<%= editEvent.toString()%>';
  	        	document.forms["fm"].action=url;
  	        	document.forms["fm"].submit();
  	    	});
  	    }
      });   
      });  
      </script>
      