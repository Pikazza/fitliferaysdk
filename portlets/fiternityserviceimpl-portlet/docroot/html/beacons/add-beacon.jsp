<%@ include file="/html/init.jsp"%>

<portlet:actionURL var="addBeacon" >
  <portlet:param name="action" value="addBeacon"/>  
</portlet:actionURL>

<%JSONArray ja=new JSONArray(request.getAttribute("return").toString()); %>

<form  method="post" name="fm" >

<section class="wrapper">
		<c:if test="${fn:length(formerror) gt 0}">
          <div class="serverInfo">
          <div class="container">
            <div class="fL">${formerror}</div>
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
              <li><a href="<%=PortalUtil.getPortalURL(request) +"/group/fiternity/beacons" %>">Manage Beacons</a></li>
              <li>Add Beacon</li>
            </ul>
            <h1>Add Beacon</h1>
          </div>
        </div>

        <div class="content-block">
          <div class="container">
            <div class="whiteBg">
              <div class="sub-division">
              
                <div class="formRow">
                  <div class="formInnerField">
                    <label data-error="Please enter your Beacon ID"><span>Beacon ID</span></label>
                    <input type="text" name="beaId" value="" class="tetxBox"  placeholder="">
                  </div>
                </div>
                <div class="formRow">
                  <div class="formInnerField">
                    <label data-error="Please enter your Beacon Site"><span>Beacon Site Name</span></label>
                    <input type="text" name="beaSite" value="" class="tetxBox"  placeholder="">
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
                    <option value="<%=stdlist.get("STD_ID")%>"> <%=stdlist.get("STD_NAME") %></option> 
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
                      	<option>Select Activity</option>
                        <option>EVENT</option>
                        <option>CLASS</option>
                      </select>
                  </div>
                </div>
             
                
                <div class="formRow">
                  <div class="formInnerField">
                      <label data-error="Please choose the detect type">
                        <span>Beacon Use</span>
                      </label>
                    	<select name="detype" class="selectMenu" id="detype" >
                      	<option>Select Beacon Usage</option>
                        <option>OWN</option>
                        <option>FITERNITY</option>
                      </select>
                  </div>
                </div>
                

                <div class="formRow">
                  <div class="formInnerField">
                      <label data-error="Please select the beacon status">
                        <span>Status</span>
                      </label>
                    	<select name="beaStatus" class="selectMenu" id="ptyStatus" >
                      	<option>Select Status</option>
                        <option>ACTIVE</option>
                        <option>INACTIVE</option>
                      </select>
                  </div>
                </div>  -
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
      $(function(){
      $('#add-button').on('click', function(event){
    	 var errorRow = $(this).parents('.content-block').find('.errorRow').length;  
  	    if(errorRow>0){ 
  	    	$('.globalError').slideDown();
  	    }
  	    else {  	  
  	    	$('.globalError').slideUp(function(){
  	    		$( "#detype" ).selectmenu( "option", "disabled", false );
  	    		var url = '<%=addBeacon.toString()%>';
  	        	document.forms["fm"].action=url;
  	        	document.forms["fm"].submit();
  	    	});
  	    }
      });  
      
      
      $( "#actype" ).selectmenu({
		  select: function( event, ui ) {
			  var searchquery = document.getElementById("actype").value;
			  if(searchquery=="EVENT"){
				 $('#detype').val('OWN').selectmenu('refresh');
				  $( "#detype" ).selectmenu( "option", "disabled", true );
				  }
			  else{
				  $( "#detype" ).selectmenu( "option", "disabled", false );
			  }				  	  		        
		  }
		});
      });  
      </script>
