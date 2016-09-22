<%@page import="com.liferay.portlet.expando.service.ExpandoValueLocalServiceUtil"%>
<%@page import="com.liferay.portal.theme.ThemeDisplay"%>
<%@ include file="/html/init.jsp"%>

<portlet:actionURL var="editFuel" >
<portlet:param name="action" value="editFuel"/>
</portlet:actionURL>

 <% JSONObject object=new JSONObject(request.getAttribute("return").toString()); %>
 
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
              <li><a href="<%=PortalUtil.getPortalURL(request) +"/group/fiternity/fuel" %>">Fuel</a></li>
              <li>Edit Fuel</li>
            </ul>
            <h1>Edit Fuel</h1>
          </div>
        </div>
        <div class="content-block">
          <div class="container">
          
          <form name="fm" method="post" enctype="multipart/form-data" >  
            <div class="whiteBg">
              <div class="sub-division">
                <div class="formRow uploadImg nonMandatory">
                  <div class="formInnerField">
                    <label  data-error="Please upload your restaurant logo"><span>Profile Photo</span></label>
                    <div class="right-form">
                      <div class=""><img src="<%=object.get("RES_LOGO") %>"  id="profileImg" alt=""></div>
                      <div class="change-photo">
                        <div class="file-button-block">
                           <button type="Submit"  class="button button-primary">Change photo</button>
                          <input type="file" class="file-button " name="resIcon" id="profile-button" />
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
                      <label data-error="Please upload your restaurant cover image">
                      <span>Cover Photo</span>
                    </label>
                    <div class="add-photo file-button-block">
                        <img src="<%=object.get("RES_COVER_IMAGE") %>" alt="" id="cover-img">
                      <!--   <div class="cover-text">Add cover Photo</div> -->
                      <input type="file" name="resImage" class="file-button " id="cover-button"/>
                    </div>
                   <div class="hint-text">Image dimension: 1230px (W) and 450px (H). <br>Maximum file size of 5mb allowed. Accepted files formats include JPG or PNG.</div>
                  </div>
                </div>
              </div>
              
              <div class="sub-division">
              <input type="hidden" name="resId"  value="<%=object.get("RES_ID") %>"/>
              <input type="hidden" name="resIconUrl"  value="<%=object.get("RES_LOGO") %>"/>
              <input type="hidden" name="resImgUrl"  value="<%=object.get("RES_COVER_IMAGE") %>"/>
              <input type="hidden" name="resCreatedOn"  value="<%=object.get("RES_CREATED_DATE") %>"/>
              
                <div class="formRow">
                  <div class="formInnerField">
                     <label data-error="Please enter restaurant name"><span>Restaurant Name</span></label>
                    <input type="text" name="resName" value="<%=object.get("RES_NAME") %>" class="tetxBox" placeholder="">
                  </div>
                </div>   
                 <div class="formRow">
                  <div class="formInnerField">
                     <label data-error="Please enter restaurant type"><span>Restaurant Type</span></label>
                    <input type="text" name="resType" value="<%=object.get("RES_CLASSIFICATION") %>" class="tetxBox" placeholder="">
                  </div>
                </div>



                <div class="formRow">
                  <div class="formInnerField">
                     <label data-error="Please enter studio latitude"><span>Latitude</span></label>
                    <input type="text" name="resLat" value="<%=object.get("RES_LATITUDE") %>" class="tetxBox" placeholder="">
                  </div>
                </div>
                <div class="formRow">
                  <div class="formInnerField">
                      <label data-error="Please enter studio longitude"><span>Longitude</span></label>
                    <input type="text" name="resLong" value="<%=object.get("RES_LONGITUDE") %>" class="tetxBox"  placeholder="">
                  </div>
                </div>   
                </div>
              <div class="sub-division">
                
                <div class="formRow">
                  <div class="formInnerField">
                      <label data-error="Please select the studio status"><span>Studio Status</span></label>
                      <select name="resStatus" class="selectMenu nonMandatory" id="selectMenu2" >
                       <option>Select Status</option>                        
                        <option <%if(object.get("RES_STATUS").toString().trim().equals("ACTIVE")){ %> selected="selected"  <%} %>  >ACTIVE</option>
                        <option <%if(object.get("RES_STATUS").toString().trim().equals("INACTIVE")){ %> selected="selected"  <%} %>>INACTIVE</option>                                                                                                            
                        </select>
                  </div>
                </div>
              </div>  
              
            <div class="button-block">
              <button type="button" class="button button-primary button-medium" id="add-button" >SAVE CHANGES</button>
              </div>
            
            </form>
          </div>          
        </div>
      </section>
      
<script type="text/javascript">


      $(function(){
      $('#add-button').on('click', function(event){
    	  
    	  var errorRow = $(this).parents('.content-block').find('.errorRow').length;
  	    if(errorRow>0){  	    	
  	    	$('.globalError').slideDown();
  	    } else {  	    	
  	    	$('.globalError').slideUp(function(){
  	    		
  	  	    	/* var myInput = document.getElementById('selectMenu2');
  	  	    	myInput.disabled = false; */
  	  	    	document.getElementById("profile-button").disabled = false;
  	  	    	document.getElementById("cover-button").disabled = false;
  	    		var url = '<%=editFuel.toString()%>';
  	        	document.forms["fm"].action=url;
  	        	document.forms["fm"].submit();
  	    	});
  	    }
      });   
      });  
      
</script>
      
 