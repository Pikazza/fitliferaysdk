<%@ include file="/html/init.jsp"%>
<% JSONObject object=new JSONObject(request.getAttribute("return").toString());%>
<portlet:actionURL var="doEdit">
<portlet:param name="action" value="doEdit" />  
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
              <li><a href="<%=PortalUtil.getPortalURL(request) +"/group/fiternity//manage-content" %>">Manage Content</a></li>
              <li>Edit Content</li>
            </ul>
            <h1>Edit Content</h1>
          </div>
        </div>

        <div class="content-block">
          <div class="container">
            <div class="whiteBg">
              <div class="sub-division">
              		
              	    <input type="hidden" name="noteId"  value="<%=object.get("ID") %>"/>
                   	<input type="hidden" name="noteType"  value="<%=object.get("TYPE") %>"/>
                   	
                   	
                <div class="formRow">
                  <div class="formInnerField">
                    <label data-error="Please enter location"><span>Title</span></label>
                    <input type="text" name="noteTitle" value="<%=object.get("TITLE") %>" class="tetxBox" placeholder="">
                  </div>
                </div>   
                 
                <%if(object.get("TYPE").toString().equals("term-of-use")){ %>  
                <div class="formRow">
                  <div class="formInnerField">
                    <label data-error="Please enter your content"><span>Content</span></label>                  
                      <liferay-ui:input-editor name="noteDesc" height="50" toolbarSet="liferay-article" initMethod="initEditor" width="50" />                    
                 </div>
                </div>
                
                <%}else{ %>
                 <div class="formRow">
                  <div class="formInnerField">
                    <label data-error="Please enter your content"><span>Content</span></label>   
                    <textarea name="noteDesc"  class="textArea descriptionArea" maxLength="500"><%=object.get("DESCRIPTION") %></textarea>                            
                 </div>
                </div>
                <%} %>
                


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

      function <portlet:namespace />initEditor() { return "<%= UnicodeFormatter.toString(object.get("DESCRIPTION").toString()) %>"; }
      
      $(function(){
          $('#add-button').on('click', function(event){
        	  var errorRow = $(this).parents('.content-block').find('.errorRow').length;
      	    if(errorRow>0){
      	    	$('.globalError').slideDown();
      	    } else { 
      	    	$('.globalError').slideUp(function(){
      	    		var url = '<%= doEdit.toString()%>';
      	        	document.forms["fm"].action=url;
      	        	document.forms["fm"].submit();
      	    	});
      	    }
          });   
          }); 
 </script>