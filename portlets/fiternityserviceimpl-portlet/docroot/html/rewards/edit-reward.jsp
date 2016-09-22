<%@ include file="/html/init.jsp"%>

 <portlet:actionURL var="editReward" >
 <portlet:param name="action" value="editReward"/>
 </portlet:actionURL>
 
 <%	User user1 = (User) request.getAttribute(WebKeys.USER);
    String roles= RoleLocalServiceUtil.getUserRoles(user1.getUserId()).toString();
    String disabled="null";
    String selectdisabled="null";
    DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
    %>
  <% JSONObject object=new JSONObject(request.getAttribute("return").toString());
  String date =object.get("RWD_EXPIRY_DATE").toString();
  Date exDate = (Date)formatter.parse(date);
  Calendar cal = Calendar.getInstance();
  cal.setTime(exDate);

  int month = cal.get(Calendar.MONTH);
  int day = cal.get(Calendar.DAY_OF_MONTH);
  int year = cal.get(Calendar.YEAR);%>  
  
  <% 
  if (roles.contains("Rewards Manager") || roles.contains("Administrator") || roles.contains("Site Admin")){
	  disabled="false";
                selectdisabled="false";
                }else{
                    disabled="readonly";
                    selectdisabled="disabled";
  } %>


 
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
              <li><a href="<%=PortalUtil.getPortalURL(request) +"/group/fiternity/rewards" %>">Rewards</a></li>
              <li>Edit reward</li>
            </ul>
            <h1>Edit reward</h1>
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
                      <select name="speed" class="selectMenu nonMandatory">
                        <option><%=object.get("STD_NAME") %></option>
                      </select>
                  </div>
                </div>  
                <div class="formRow">
                  <div class="formInnerField">
                    <label data-error="Please enter your reward name"><span>Reward Title</span></label>
                    <input type="text" name="rwdName" value="<%=object.get("RWD_NAME") %>" class="tetxBox descriptionArea" placeholder="" maxLength="80">
                    <div class="hint-box">
                      <div class="hint-text clearfix"> 
                        <span class="fL hintPara"></span>
                        <span class="fR totalCount"></span>
                      </div>
                    </div>
                  </div>
                </div>
                
                 <input type="hidden" name="rwdId"  value="<%=object.get("RWD_ID") %>"/>
                 <input type="hidden" name="imgUrlOld"  value=" <%=object.get("RWD_IMG_URL") %>"/> 
                  <input type="hidden" name="stdId" id="stdId"  value=" <%=object.get("RWD_STD_ID") %>">  
                 
                <div class="formRow">
                  <div class="formInnerField textareaRow">
                    <label data-error="Please enter your reward details"><span>Reward Description</span></label>
                   <%--  <textarea class="textArea"> <%=object.get("RWD_DESCRIPTION") %></textarea>  --%> 
                   <liferay-ui:input-editor name="rwdDesc" height="50" toolbarSet="liferay-article" initMethod="initEditor" width="50" />
 					<input name="htmlcode" type="hidden" value="<%=object.get("RWD_DESCRIPTION") %>" id="rwdDescHidden"/>              
                  </div>
                </div>
                
         <%--        <aui:field-wrapper label="description">
    			<liferay-ui:input-editor name="descriptionEditor" toolbarSet="liferay-article" initMethod="initEditor" width="200" />
    			<script type="text/javascript">
        		function initEditor() { return "<%= UnicodeFormatter.toString("default content") %>"; }
   				 </script>
				</aui:field-wrapper>
                 --%>
                
             
                <div class="formRow">
                  <div class="formInnerField textareaRow">
                    <label data-error="Please set expiry date"><span>Expiry Date</span></label>
                    <div class="dateBlk">
                      <input  name="exDay" class="numberOnly tetxBox miniBox" id="day" type="text" value="<%= String.format("%02d", day) %>" placeholder="DD" maxlength="2"/>
                      <input  name="exMonth" class="numberOnly tetxBox miniBox" id="month" type="text" value="<%=String.format("%02d", month+1)  %>" placeholder="MM" maxlength="2"/>
                      <input  name="exYear" class="numberOnly tetxBox miniBox" id="year" type="text" value="<%=year %>" placeholder="YYYY" maxlength="4"/>          
                  </div>
                </div>
              </div>
              <div class="sub-division">
                <div class="formRow uploadImg nonMandatory">
                  <div class="formInnerField">
                    <label data-error="Please upload your studio image">
                      <span>Reward Photo</span>
                    </label>
                    <div class="add-photo file-button-block">
                      <img src="<%=object.get("RWD_IMG_URL") %>" alt="" id="cover-img">
                      <input type="file" name="rwdImage" value="${rwdImage}" class="file-button" id="cover-button" />
                    </div>
                    <div class="hint-text">Image dimension: 1230px (W) and 450px (H). <br>Maximum file size of 5mb allowed. Accepted files formats include JPG or PNG.</div>
                  </div>
                </div>
              </div>
              
               <div class="sub-division">  
                <div class="formRow">
                  <div class="formInnerField textareaRow">
                    <label  data-error="Please enter the points"  ><span>Points Required</span></label>
                     <input type="text" name="pointsReq" value="<%=object.get("RWD_POINTS") %>" class="tetxBox nonMandatory" placeholder=""  <%= disabled%>> 
                                   
                  </div>
                </div>
                <div class="formRow">
                  <div class="formInnerField ">
                    <label data-error= "Please enter voucher code" ><span>Voucher Code(s)</span></label>
                     <textarea name="voucherCodes" value="<%=object.get("RWD_POINTS") %>" class="textArea nonMandatory"  <%= disabled%>></textarea> 
                  	 <div class="hint-text">When using multiple voucher codes use comma to separate them.</div>
                  </div>
                </div> 
                <div class="formRow">
                  <div class="formInnerField ">
                    <label data-error= "Please enter voucher code" ><span> Voucher Added</span></label>
                     <textarea  class="textArea nonMandatory"  disabled><%=object.get("ADDED_VOCCODE") %></textarea> 
                  </div>
                </div> 
                <div class="formRow">
                  <div class="formInnerField ">
                    <label data-error= "Please enter voucher code" ><span>Voucher Redeemed</span></label>
                     <textarea name="wwa" class="textArea nonMandatory"  disabled><%=object.get("REEDEMED_VOCCODE") %></textarea>
                  </div>
                </div>  
              </div> 
                
              <div class="sub-division">
            
                <div class="formRow">
                  <div class="formInnerField">
                      <label  data-error="Please select the reward status"   >
                        <span>Status</span>
                      </label>
                      <select name="rwdStatus" class="selectMenu nonMandatory" id="rwdStatus" <%= selectdisabled%>>                      
                        <option>Select Status</option>                        
                        <option <%if(object.get("RWD_STATUS").toString().trim().equals("ACTIVE")){ %> selected="selected"  <%} %>  >ACTIVE</option>
                        <option <%if(object.get("RWD_STATUS").toString().trim().equals("INACTIVE")){ %> selected="selected"  <%} %>>INACTIVE</option>                                                                                      
                      </select>
                  </div>
                </div>
            </div>            
          </div>  
          <div class="button-block">
            <button type="button" class="button button-primary button-medium" id="add-button">SAVE CHANGES</button>
            </div>        
        </div>
        </div>
        </div>
      </section>
      </form>
      
 <script type="text/javascript">

      function <portlet:namespace />initEditor() { return "<%= UnicodeFormatter.toString(object.get("RWD_DESCRIPTION").toString()) %>"; }

      $(function(){
      $('#add-button').on('click', function(event){
    	  var errorRow = $(this).parents('.content-block').find('.errorRow').length;
  	    if(errorRow>0){  	    	
  	    	$('.globalError').slideDown();
  	    } else {  	    	
  	    	$('.globalError').slideUp(function(){
  	    		var myInput = document.getElementById('rwdStatus');
    	    myInput.disabled = false;
  	    		var url = '<%=editReward.toString()%>';
  	        	document.forms["fm"].action=url;
  	        	document.forms["fm"].submit();
  	    	});
  	    }
      });   
      });  
 </script>