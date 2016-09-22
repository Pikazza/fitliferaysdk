<%@ include file="/html/init.jsp"%>

<portlet:actionURL var="editBeacon" >
<portlet:param name="action" value="editBeacon"/>  
</portlet:actionURL>

<portlet:actionURL var="addBeacon" >
<portlet:param name="action" value="addBeacon"/>  
</portlet:actionURL>

<%JSONObject object=new JSONObject(request.getAttribute("return").toString()); %>
<%JSONArray ja=new JSONArray(request.getAttribute("stdlist").toString()); %>
<form  method="post" name="fm" enctype="multipart/form-data"  >
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
              <li><a href="<%=PortalUtil.getPortalURL(request) +"/group/fiternity/beacons" %>">Manage Beacons</a></li>
              <li>Edit Beacon</li>
            </ul>
            <h1>Edit Beacon</h1>
          </div>
        </div>

        <div class="content-block">
          <div class="container">
            <div class="whiteBg ">
              <div class="sub-division">
                <div class="formRow edit-page">
                  <div class="formInnerField">
                    <label data-error="Please enter your Beacon ID"><span>Beacon ID</span></label>
                    <input type="text" name="beaId" value="<%=object.get("BCON_ID") %>" class="tetxBox" readonly placeholder="">
                  </div>
                </div>
               <div class="formRow">
                  <div class="formInnerField">
                    <label data-error="Please enter your Beacon Site"><span>Beacon Site Name</span></label>
                    <input type="text" name="beaSite" value="<%=object.get("BCON_SITE") %>" class="tetxBox"  placeholder="">
                  </div>
                </div>
                
                 <div class="formRow">
                  <div class="formInnerField">
                      <label data-error="Please select the studio name">
                        <span>Studio</span>
                      </label>
                      <select name="stdName" class="selectMenu" id="stdName" >
                        <option>Choose Studio</option>
                 <% for(int n = 0; n < ja.length(); n++){
            	    JSONObject stdlist = ja.getJSONObject(n); %>
                    <option value="<%=stdlist.get("STD_ID")%>" <%if(object.get("BCON_STD_ID").toString().equals(stdlist.get("STD_ID").toString())){ %> selected="selected" <%} %> > <%=stdlist.get("STD_NAME") %></option> 
                    <%}%>
                      </select>
                  </div>
                </div> 

                

                
   			<div class="formRow">
                  <div class="formInnerField">
                      <label data-error="Please choose activity type">
                        <span>Activity</span>
                      </label>
                    	<select name="actype" class="selectMenu" id="actype" >
                      	<option>select status</option>
                        <option <%if(object.get("BCON_STA_TYPE_ID").toString().trim().equals("1")){ %>selected="selected" <%}%> >EVENT</option>
                        <option <%if(object.get("BCON_STA_TYPE_ID").toString().trim().equals("2")){ %>selected="selected" <%}%> >CLASS</option>
                      </select>
                  </div>
                </div>
             
                
                <div class="formRow">
                  <div class="formInnerField">
                      <label data-error="Please choose the detect type">
                        <span>Beacon Use</span>
                      </label>
                    	<select name="detype" class="selectMenu" id="detype" >
                        <option>Select Status</option>                        
                        <option <%if(object.get("BCON_DETECT_TYPE").toString().trim().equals("OWN")){ %> selected="selected"  <%} %>  >OWN</option>
                        <option <%if(object.get("BCON_DETECT_TYPE").toString().trim().equals("FITERNITY")){ %> selected="selected"  <%} %>>FITERNITY</option>                                            
                      </select>
                  </div>
                </div>
             
                <div class="formRow">
                  <div class="formInnerField">
                      <label data-error="Please select the customer status">
                        <span>Status</span>
                      </label>
                    	<select name="beaStatus" class="selectMenu" id="ptyStatus" >
                      	<option>Select Status</option>                        
                        <option <%if(object.get("BCON_STATUS").toString().trim().equals("ACTIVE")){ %> selected="selected"  <%} %>  >ACTIVE</option>
                        <option <%if(object.get("BCON_STATUS").toString().trim().equals("INACTIVE")){ %> selected="selected"  <%} %>>INACTIVE</option>                       
                      </select>
                  </div>
                </div>  
              </div>
            </div>
           <div class="button-block">
              <button class="button button-primary button-medium" id="add-button">SAVE CHANGES</button>
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
  	    		var url = '<%=editBeacon.toString()%>';
  	        	document.forms["fm"].action=url;
  	        	document.forms["fm"].submit();
  	    	});
  	    }
      });   
      });  
      </script>