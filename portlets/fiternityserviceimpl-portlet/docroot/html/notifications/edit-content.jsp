<%@ include file="/html/init.jsp"%>
<%-- <% JSONObject object=new JSONObject(request.getAttribute("return").toString());%> --%>
<portlet:actionURL var="doContentEdit">
<portlet:param name="action" value="doContentEdit" />  
</portlet:actionURL>

<form  method="post" name="fm"   >
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
              <li><a href="<%=PortalUtil.getPortalURL(request) +"/group/fiternity/email-content?p_p_id=notifications_WAR_fiternityserviceimplportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-1&p_p_col_count=1&_notifications_WAR_fiternityserviceimplportlet_render=showContentListing" %>">Email Content</a></li>
              <li>Edit Email Content</li>
            </ul>
            <h1>Edit Email Content</h1>
          </div>
        </div>

        <div class="content-block">
          <div class="container">
            <div class="whiteBg">
              <div class="sub-division">
              		
              	    <input type="hidden" name="groupId"  value="<%=request.getAttribute("groupId").toString()%>"/> 
              	    <input type="hidden" name="version"   value="<%=request.getAttribute("version").toString()%>"/>
                   	<input type="hidden" name="contType"   value="<%=request.getAttribute("type").toString()%>"/>
               
  <%--           	
                <div class="formRow">
                  <div class="formInnerField">
                    <label data-error="Please enter location"><span>Notification Title</span></label>
                    <input type="text" name="noteTitle" value="<%=object.get("TITLE") %>" class="tetxBox" placeholder="">
                  </div>
                </div>    
                    --%>
                <div class="formRow">
                  <div class="formInnerField">
                    <label data-error="Please enter your content"><span>Mail Content</span></label>                  
                      <liferay-ui:input-editor name="contDesc" height="50" toolbarSet="liferay-article" initMethod="initEditor" width="50" />                    
                 </div>
                </div>
                

              </div>
            </div>
           <div class="button-block">
              <button type="button" class="button button-primary button-medium" id="add-button">SAVE CHANGES</button>
            </div> 
          </div> 
                     
        </div>
</section>
</form>

<script type="text/javascript">

      function <portlet:namespace />initEditor() { return "<%= UnicodeFormatter.toString(request.getAttribute("return").toString()) %>"; }
      
      $(function(){
          $('#add-button').on('click', function(event){
        	  var errorRow = $(this).parents('.content-block').find('.errorRow').length;
      	    if(errorRow>0){
      	    	$('.globalError').slideDown();
      	    } else { 
      	    	$('.globalError').slideUp(function(){
      	    		var url = '<%= doContentEdit.toString()%>';
      	        	document.forms["fm"].action=url;
      	        	document.forms["fm"].submit();
      	    	});
      	    }
          });   
          }); 
 </script>