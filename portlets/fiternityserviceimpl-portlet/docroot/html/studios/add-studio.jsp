<%@page import="com.liferay.portal.theme.ThemeDisplay"%>
<%@ include file="/html/init.jsp"%> 
 
<portlet:actionURL var="addStudio" >
<portlet:param name="action" value="addStudio"/>
</portlet:actionURL>

   
<form  method="post" name="fm" id="addStudio" enctype="multipart/form-data" > 
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
              <li>Add studio</li>
            </ul>
            <h1>Add Studio</h1>
          </div>
        </div>
        <div class="content-block">
          <div class="container">
            <div class="whiteBg">
              <div class="sub-division">
                <div class="formRow uploadImg">
                  <div class="formInnerField">
                    <label  data-error="Please upload your profile image"><span>Profile Photo</span></label>
                    <div class="right-form">
                      <div class=""><img src="${themeDisplay.getPathThemeImages()}/showup-admin-images/profile-img.jpg" id="profileImg" alt=" "></div>
                      <div class="change-photo">
                        <div class="file-button-block">
                          <button type="Submit"  class="button button-primary">Change Photo</button>
                          <input type="file" name="stdicon" value="<c:out value="${Stdicon}"/>" class="file-button" id="profile-button"/>
                        </div>
                         <div class="hint-text">Image dimension: 300px (W) and 300px (H). <br>Maximum file size of 1mb allowed. Accepted files formats include JPG or PNG.</div>
                      <!--   <a href="#"><strong>Delete profile picture</strong></a> -->
                      </div>
                    </div>
                  </div>
                </div>
              </div> 
              <div class="sub-division">
                <div class="formRow uploadImg">
                  <div class="formInnerField ">
                  <label data-error="Please upload your studio image">
                      <span>Cover Photo</span>
                    </label>
                    <div class="add-photo file-button-block">
                      <img src="${themeDisplay.getPathThemeImages()}/showup-admin-images/cover-img.png" alt=" " id="cover-img">
                      <input type="file" name="stdimage" value="<c:out value="${Stdimage}"/>" class="file-button" id="cover-button"/>
                    </div>
                   <div class="hint-text">Image dimension: 1400px (W) and 890px (H). <br>Maximum file size of 5mb allowed. Accepted files formats include JPG or PNG.</div>
                  </div>
                </div>
              </div>  
               
              <div class="sub-division">
                <div class="formRow">
                  <div class="formInnerField">
                 <label data-error="Please enter studio name"><span>Studio Name</span></label>
                    <input type="text" name="Stdname"  	class="tetxBox" value="<c:out value="${Stdname}"/>" placeholder="">
                  </div>
                </div>
                <%-- <div class="formRow">
                  <div class="formInnerField textareaRow">
                   <label data-error="Please enter studio description"><span>Description</span></label>
                    <textarea name="Stddesc"  class="textArea descriptionArea" maxLength="500"><c:out value="${Stddesc}"/></textarea>
                    <div class="hint-box">
                      <div class="hint-text clearfix"> 
                      <span class="fL hintPara"></span>
                        <span class="fR totalCount"></span>
                    </div>
                  </div>
                </div>
                </div> --%>
              <div class="formRow">
                  <div class="formInnerField textareaRow">
                    <label data-error="Please enter your reward Details"><span>Description</span></label>
                    <liferay-ui:input-editor name="Stddesc" height="50" toolbarSet="liferay-article" initMethod="initEditor" width="50" />
 					<input name="htmlcode" type="hidden" value="" />
                  </div>
                </div>
                
                 <div class="formRow">
                  <div class="formInnerField textareaRow">
                   <label data-error="Please enter studio description"><span> Promotional Description</span></label>
                    <textarea name="Stdprodesc"  class="textArea descriptionArea" maxLength="500"><c:out value="${Stddesc}"/></textarea>
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
                    <textarea name="Stdaddr"  class="textArea"><c:out value="${Stdaddr}"/></textarea>                
                  </div>
                </div>
                <div class="formRow">
                  <div class="formInnerField">
                    <label data-error="Please enter studio postcode"><span>Postcode</span></label>
                    <input type="text" name="Stdpost" value="${Stdpost}" class="tetxBox nonMandatory" placeholder="">
                  </div>
                </div>
                
                <div class="formRow">
                  <div class="formInnerField">
                    <label data-error="Please enter studio phone number"><span>Phone</span></label>
                    <input type="text" name="Stdphone" value="<c:out value="${Stdphone}"/>" class="tetxBox number nonMandatory" placeholder="">
                  </div>
                </div>
                
                <div class="formRow">
                  <div class="formInnerField">
                    <label data-error=""><span>Email</span></label>
                    <input type="text" name="Stdemail" value="<c:out value="${Stdemail}"/>" class="tetxBox nonMandatory" placeholder="">
                  </div>
                </div>
                
                <div class="formRow">
                  <div class="formInnerField">
                    <label data-error="Please enter studio latitude"><span>Latitude</span></label>
                    <input type="text" name="Stdlat" value="<c:out value="${Stdlat}"/>" class="tetxBox" placeholder="">
                  </div>
                </div>
                
                <div class="formRow">
                  <div class="formInnerField">
                    <label data-error="Please enter studio longitude"><span>Longitude</span></label>
                    <input type="text" name="Stdlog" value="<c:out value="${Stdlog}"/>" class="tetxBox" placeholder="">
                  </div>
                </div>
                
                <div class="formRow">
                  <div class="formInnerField">
                    <label  data-error="Please enter Schedule url"><span>Schedule URL</span></label>
                    <input type="text" name="Stdurl" value="<c:out value="${Stdurl}"/>" class="tetxBox nonMandatory" placeholder="">
                  </div>
                </div>
                </div> 
              <div class="sub-division">
                <div class="formRow">
                  <div class="formInnerField">
                    <label data-error="Please enter the points per visit"><span>Points per visit</span></label>
                    <input type="text" name="Stdpoints" value="<c:out value="${Stdpoints}"/>" class="tetxBox number"  placeholder="">
                  </div>
                </div>
                
                <div class="formRow">
                  <div class="formInnerField">
                    <label data-error="Please enter the time to spent in the Studio"><span>Time to be spent in the Studio</span></label>
                    <input type="text" name="Stdspenttime" value="<c:out value="${Stdspenttime}"/>" class="tetxBox number" placeholder="">
                  </div>
                </div>
                
                <div class="formRow">
                  <div class="formInnerField">
                      <label data-error="Please select the type of studio"><span>Type of Studio</span></label>
                      <select name="stdtype"  name="Stdtype" class="selectMenu">
                      <option>Choose type of Studio</option>
                        <option>NORMAL</option>
                        <option>PREMIUM</option>
                      </select>
                  </div>
                </div>
                
                <div class="formRow">
                  <div class="formInnerField">
                      <label data-error="Please select the studio status"><span>Studio Status</span></label>
                      <select name="stdspeed" class="selectMenu">
                      <option>Choose Studio Status</option>
                        <option>ACTIVE</option>
                        <option>INACTIVE</option>
                        </select>
                  </div>
                </div>
              </div>  
              
              <div class="sub-division">
                <div class="formRow">
                  <div class="formInnerField">
                    <label data-error="Please enter user name"><span>Username</span></label>
                    <input type="text" name="username" value="${username}" class="tetxBox emailonly" placeholder="">
                    <div class="hint-text">Username should be valid email address.</div> 
                  </div>
                </div>
                <div class="formRow">
                  <div class="formInnerField">
                    <label data-error="Please enter your password"><span>Password</span></label>
                    <input type="password" name="password" value="" class="tetxBox" placeholder="">
                  </div>
                </div>
              </div>
            </div>
            
            
            <div class="button-block">
              <button type="button"  id="add-button" class="button button-primary button-medium" onclick="load()" >SAVE CHANGES</button>
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
  	    		var url = '<%=addStudio.toString()%>';
  	        	document.forms["fm"].action=url;
  	        	document.forms["fm"].submit();
  	    	});
  	    }
      });   
      });  
      </script>