<%@ include file="/html/init.jsp"%> 

 <% User user1 = (User) request.getAttribute(WebKeys.USER);
    String roles= RoleLocalServiceUtil.getUserRoles(user1.getUserId()).toString();
    String disabled="null", selectdisabled="null";
    DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
%>
<% JSONObject object=new JSONObject(request.getAttribute("return").toString());
   JSONArray badgearray =object.getJSONArray("STA_BADGE"); 
   JSONObject badgeobject=badgearray.getJSONObject(0);

  Date staDate = (Date)formatter.parse(object.get("START_DATE").toString());
  Calendar staCal = Calendar.getInstance();
  staCal.setTime(staDate);
  
  Date endDate = (Date)formatter.parse(object.get("END_DATE").toString());
  Calendar endCal = Calendar.getInstance();
  endCal.setTime(endDate);
  
  Date exDate = (Date)formatter.parse(object.get("STA_EXPIRY_DATE").toString());
  Calendar exCal = Calendar.getInstance();
  exCal.setTime(exDate);
  %>  
  
  <% 
  if (roles.contains("Challenge Manager") || roles.contains("Administrator") || roles.contains("Site Admin")){
	  disabled="false";
      selectdisabled="false";
   }else{
      disabled="readonly";
      selectdisabled="disabled";
  		} %>
  
<portlet:actionURL var="editChallenge" >
<portlet:param name="action" value="editChallenge"/>
</portlet:actionURL>
 
<form  method="post" name="fm" enctype="multipart/form-data" >

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
              <li>Edit Challenge</li>
            </ul>
            <h1>Edit Challenge</h1>
          </div>
        </div>

        <div class="content-block">
          <div class="container">
            <div class="whiteBg">
              <div class="sub-division">
                <div class="formRow">
                  <div class="formInnerField">
                      <label data-error="Please select the stdio name">
                        <span>Pick Studio</span>
                      </label>
                      <select name="speed" class="selectMenu nonMandatory">
                        <option><%=object.get("STD_NAME") %></option>
                      </select>
                  </div>
                </div>
                
                <input type="hidden" name="staId"  value="<%=object.get("STA_ID") %>"/>
                  <input type="hidden" name="stdId" id="stdId"  value=" <%=object.get("STD_ID") %>"> 
                   <input type="hidden" name="imageCoverOld"  value="<%=object.get("STA_IMAGE_URL") %>"/>
                   <input type="hidden" name="iconBadgeOld"  value="<%=badgeobject.get("IMG") %>"/>
                
                <div class="formRow">
                  <div class="formInnerField">
                    <label data-error="Please enter your name"><span>Challenge Title</span></label>
                    <input type="text" name="cheName" value="<%=object.get("STA_NAME") %>" class="tetxBox descriptionArea" placeholder="" maxLength="80">
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
                    <textarea name="cheShort" class="textArea descriptionArea" maxLength="144"> <%=object.get("STA_SHORT_DESCRIPTION") %></textarea>                
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
                   <%--  <textarea name="cheDetail" class="textArea"> <%=object.get("STA_DESCRIPTION") %></textarea> --%> 
                     <liferay-ui:input-editor name="cheDetail" height="50" toolbarSet="liferay-article" initMethod="initEditor" width="50" />                                               
                  </div>
                </div>
                <div class="formRow">
                  <div class="formInnerField textareaRow">
                    <label data-error="Please set event date"><span>Start Date</span></label>
                    <div class="dateBlkSrart">
                     <input name="staDay" value="<%= String.format("%02d", staCal.get(Calendar.DAY_OF_MONTH)) %>" class="numberOnly tetxBox miniBox day" id="dayStart" type="text" placeholder="DD" maxlength="2"/>
                      <input name="staMonth" value="<%= String.format("%02d", staCal.get(Calendar.MONTH)+1) %>" class="numberOnly tetxBox miniBox" id="monthStart" type="text" placeholder="MM" maxlength="2"/>
                      <input name="staYear" value="<%=staCal.get(Calendar.YEAR) %>" class="numberOnly tetxBox miniBox" id="yearStart" type="text" placeholder="YYYY" maxlength="4"/>          
                    </div>
                  </div>
                </div>
                <div class="formRow">
                  <div class="formInnerField textareaRow">
                    <label data-error="Please set event date"><span>End Date</span></label>
                    <div class="dateBlkExpiry">
                      <input name="endDay" value="<%=String.format("%02d", endCal.get(Calendar.DAY_OF_MONTH))  %>" class="numberOnly tetxBox miniBox day" id="dayExpiry" type="text" placeholder="DD" maxlength="2"/>
                      <input name="endMonth" value="<%= String.format("%02d", endCal.get(Calendar.MONTH)+1)  %>" class="numberOnly tetxBox miniBox" id="monthExpiry" type="text" placeholder="MM" maxlength="2"/>
                      <input name="endYear" value="<%=endCal.get(Calendar.YEAR) %>" class="numberOnly tetxBox miniBox" id="yearExpiry" type="text" placeholder="YYYY" maxlength="4"/>          
                    </div>
                  </div>
                </div>
                <div class="formRow">
                  <div class="formInnerField textareaRow">
                    <label data-error="Please set expiry date"><span>Expiry Date</span></label>
                    <div class="dateBlk">
                      <input name="exDay" value="<%= String.format("%02d", exCal.get(Calendar.DAY_OF_MONTH))  %>" class="numberOnly tetxBox miniBox day" id="day" type="text" placeholder="DD" maxlength="2"/>
                      <input name="exMonth" value="<%=String.format("%02d", exCal.get(Calendar.MONTH)+1)  %>" class="numberOnly tetxBox miniBox" id="month" type="text" placeholder="MM" maxlength="2"/>
                      <input name="exYear" value="<%=exCal.get(Calendar.YEAR) %>" class="numberOnly tetxBox miniBox" id="year" type="text" placeholder="YYYY" maxlength="4"/>          
                    </div>
                  </div>
                </div>
                
               	<div class="formRow">
                  <div class="formInnerField">
                    <label data-error="Please enter number of challenge days "><span>No. of Classes</span></label>
                    <input type="text" name="noOfDays" value="<%=object.get("STA_NoOfClasses") %>" class="tetxBox number" placeholder="">
                  </div>
                </div>
              </div>
              
              <div class="sub-division">
                <div class="formRow uploadImg nonMandatory">
                  <div class="formInnerField">
                    <label data-error="Please upload badge image">
                      <span>Upload Badge</span>
                    </label>
                    <div class="right-form">
                      <div class=""><img src="<%=badgeobject.get("IMG") %>" id="profileImg" alt=""></div>
                      <div class="change-photo">
                        <div class="file-button-block">
                          <button class="button button-primary">Add/Change Badge</button>
                          <input name="iconBadge" type="file" class="file-button" id="profile-button" />
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
                    <textarea name="badgeDesc"  class="textArea"><%=badgeobject.get("DESC") %></textarea>                
                  </div>
                </div> 
                <div class="formRow uploadImg nonMandatory">
                  <div class="formInnerField">
                    <label data-error="Please upload your challenge image">
                      <span>Challenge Image</span>
                    </label>
                    <div class="add-photo file-button-block">
                      <img src="<%=object.get("STA_IMAGE_URL") %>" alt="" id="cover-img">
                      <input name="imageCover" type="file" class="file-button" id="cover-button" />
                    </div>
                    <div class="hint-text">Image dimension: 1230px (W) and 450px (H). <br>Maximum file size of 5mb allowed. Accepted files formats include JPG or PNG.</div>
                  </div>
                </div>
              </div>
              
              <div class="sub-division influencerBlock">
              <%JSONArray infarray =object.getJSONArray("STA_INFLUENCER");  		
              %>
              
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
                      <label data-error="Please influencer image"><span>Influencer Image</span></label>
                      <input type="text" value=" <%=infobject.get("IMG") %>" class="tetxBox nonMandatory" placeholder="">
                      <div class="file-button-block">
                        <button class="button button-primary">Add / Change image</button>
                        <input type="file" value=" <%=infobject.get("IMG") %>" class="file-button influence-profile-button" />
                      </div>
                      <i class="fa fa-times-circle close-influence"></i>
                       <a href="<%=infobject.get("IMG") %>" target="_blank"><strong>View Image</strong> </a>
                    </div>
                  </div>
                  <div class="formRow">
                    <div class="formInnerField textareaRow">
                      <label data-error="Please enter event description">
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
                      <label data-error="Please select the status">  
                        <span>Status</span>
                      </label>
                      <select name="cheStatus" class="selectMenu <%if (roles.contains("Studio Owner")){%>nonMandatory <%} %>" id="cheStatus" <%= selectdisabled%>>
                     	<option>Select Status</option>                        
                        <option <%if(object.get("STA_STATUS").toString().trim().equals("ACTIVE")){ %> selected="selected"  <%} %>  >ACTIVE</option>
                        <option <%if(object.get("STA_STATUS").toString().trim().equals("INACTIVE")){ %> selected="selected"  <%} %>>INACTIVE</option>                                           
                      </select>
                  </div>
                </div>                          
              </div>
            </div>      
            <div class="button-block">
              <button type="button" class="button button-primary button-medium" id="add-button" data-location="challenges.html">SAVE CHANGES</button>
            </div>      
          </div>
        </div>
      </section>
      
      </form>

<script type="text/javascript">  
      
   function <portlet:namespace />initEditor() { return "<%= UnicodeFormatter.toString(object.get("STA_DESCRIPTION").toString()) %>"; }
   
   $(function(){
    	$('#fileButton1').on('click', function(event){
    		$('#Inficon1').val=document.getElementById('fileButton1').value;
    		alert(document.getElementById('Inficon1').value);
    	});
    	
       $('#add-button').on('click', function(event){
    	  var errorRow = $(this).parents('.content-block').find('.errorRow').length;
  	    if(errorRow>0){  	    	
  	    	$('.globalError').slideDown();
  	    } else {  	    	
  	    	$('.globalError').slideUp(function(){	
  	    		var myInput = document.getElementById('cheStatus');
  	    	    myInput.disabled = false;
  	    		var url = '<%=editChallenge.toString()%>';
  	        	document.forms["fm"].action=url;
  	        	document.forms["fm"].submit();
  	    	});
  	    }
      });  

      });  
    
</script>