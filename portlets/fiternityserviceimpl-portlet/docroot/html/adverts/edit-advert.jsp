<%@ include file="/html/init.jsp"%> 
<%! public static final String EDITOR_WYSIWYG_IMPL_KEY = "editor.wysiwyg.portal-web.docroot.html.view.jsp";%>

  <%User user1 = (User) request.getAttribute(WebKeys.USER);
    String roles= RoleLocalServiceUtil.getUserRoles(user1.getUserId()).toString();
    String disabled="null";
    String selectdisabled="null";
    DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
    JSONObject object=new JSONObject(request.getAttribute("return").toString());
    %>
  <%if (roles.contains("Adverts Manager") || roles.contains("Administrator") || roles.contains("Site Admin")){
	  disabled="false";
                selectdisabled="false";
                }else{
                    disabled="readonly";
                    selectdisabled="disabled";
  }%>
 <portlet:actionURL var="editAdvert" >
 <portlet:param name="action" value="editAdvert"/>
 </portlet:actionURL>
 
 <form  method="post" name="fm" enctype="multipart/form-data" >
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
                <li><a href="<%=PortalUtil.getPortalURL(request) +"/group/fiternity/adverts" %>">Beacon Content</a></li>
              <li>Edit Beacon Content</li>
            </ul>
            <h1>Edit Beacon Content</h1>
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
                
                 <input type="hidden" name="offId"  value="<%=object.get("OFR_ID") %>"/>
                 <input type="hidden" name="stdId" id="stdId"  value=" <%=object.get("OFR_STD_ID") %>"> 
                 <input type="hidden" name="imageCoverOld"  value="<%=object.get("OFR_IMG") %>"/>  
                 <input type="hidden" name="offCreDate"  value="<%=object.get("OFR_CREATED_DATE") %>"/>
                
                <div class="formRow">
                  <div class="formInnerField textareaRow liferayediter">
                    <label data-error="Please enter offers description">
                      <span>Promo Description</span>
                    </label>
                    <liferay-ui:input-editor  editorImpl="<%=EDITOR_WYSIWYG_IMPL_KEY%>"  name="offDesc"  height="50" toolbarSet="liferay-article" initMethod="initEditor" width="50" onBlurMethod="bm" />                                                
                  <input  name="htmlCodeFromEditorPlacedHere" type="hidden" value=""  />
                  </div>
                </div>
                
                
                <div class="formRow uploadImg nonMandatory">
                  <div class="formInnerField">
                    <label data-error="Please upload your event image">
                      <span>Promo Photo</span>
                    </label>
                    <div class="add-photo file-button-block">
                      <img src="<%=object.get("OFR_IMG") %>" alt="" id="cover-img">
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
                    <input type="text" name="offLink" value="<%=object.get("OFR_EXTERNAL_LINK") %>" class="tetxBox nonMandatory" placeholder="">
                  </div>
                </div>
                <div class="formRow">
                  <div class="formInnerField">
                      <label data-error="Please select notification type">
                        <span>To be shown during</span>
                      </label>
                      <select name="notifyType" class="selectMenu">
                      <option>Choose Notification</option>                       
                        <option <%if(object.get("OFR_TYPE").toString().trim().equals("W")){ %> selected="selected"  <%} %>  >Welcome</option>
                        <option <%if(object.get("OFR_TYPE").toString().trim().equals("E")){ %> selected="selected"  <%} %>>Exit</option>                                            
                      </select>
                  </div>
                </div> 
              </div>
              <div class="sub-division">                                           
              <div class="formRow">
                  <div class="formInnerField">
                      <label data-error="Please select the challenge status">  
                        <span>Status</span>
                      </label>
                      <select name="offStatus" class="selectMenu <%if (roles.contains("Studio Owner")){%>nonMandatory <%} %>" id="offStatus" <%= selectdisabled%>>
                      	<option>Select Status</option>                        
                        <option <%if(object.get("OFR_STATUS").toString().trim().equals("ACTIVE")){ %> selected="selected"  <%} %>  >ACTIVE</option>
                        <option <%if(object.get("OFR_STATUS").toString().trim().equals("INACTIVE")){ %> selected="selected"  <%} %>>INACTIVE</option>                       
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
     function <portlet:namespace />initEditor() { 
    	 
    	 return "<%= UnicodeFormatter.toString(object.get("OFR_DESCRIPTION").toString()) %>"; 
    	 }
     function <portlet:namespace />extractCodeFromEditor() {
         var x = window.<portlet:namespace />editor.getHTML();
}
     function <portlet:namespace />bm() {
    	 //alert("pikazza wewe");
    	// var x =document.getElementById("cke__adverts_WAR_fiternityserviceimplportlet_offDesc").value;
    		var x=document.getElementById('cke__adverts_WAR_fiternityserviceimplportlet_offDesc').value;
	         
 }
     
     
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
  	    		var myInput = document.getElementById('offStatus');
  	    	    myInput.disabled = false;
  	    		var url = '<%=editAdvert.toString()%>';
  	        	document.forms["fm"].action=url;
  	        	document.forms["fm"].submit();
  	    	});
  	    }
      });  

/*        $(document).on('blur', '.liferayediter textarea', function() {
   		alert('sdfd');
   			alert($(this).val());
   		
   	}); */
   	
   	
      });     
</script>
 