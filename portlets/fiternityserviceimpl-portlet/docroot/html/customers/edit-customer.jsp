<%@ include file="/html/init.jsp"%>

<portlet:actionURL var="editCustomer" >
<portlet:param name="action" value="editCustomer"/>
</portlet:actionURL>

<%JSONObject object=new JSONObject(request.getAttribute("return").toString()); %>
<form  method="post" name="fm" enctype="multipart/form-data" action=<%=editCustomer.toString() %> >
<section class="wrapper">
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
              <li><a href="<%=PortalUtil.getPortalURL(request) +"/group/fiternity/customers" %>">Customer</a></li>
              <li>Edit customer</li>
            </ul>
            <h1>Edit customer</h1>
          </div>
        </div>

        <div class="content-block">
          <div class="container">
            <div class="whiteBg edit-page">
              <div class="sub-division">
                <div class="formRow">
                  <div class="formInnerField">
                    <label data-error="Please enter your name"><span>Firstname</span></label>
                    <input type="text" value="<%=object.get("PTY_NAME") %>" class="tetxBox nonMandatory" readonly placeholder=""> 
                  </div>
                </div>
                <div class="formRow">
                  <div class="formInnerField">
                    <label data-error="Please enter your name"><span>Lastname</span></label>
                    <input type="text" value="<%=object.get("PTY_LAST_NAME") %>" class="tetxBox nonMandatory" readonly placeholder=""> 
                  </div>
                </div>
                <div class="formRow">
                  <div class="formInnerField">
                    <label data-error="Please email id"><span>Email</span></label> 
                    <input type="text" value="<%=object.get("PTY_EMAIL") %>" class="tetxBox emailonly" readonly placeholder="">
                  </div>
                </div>
                 <input type="hidden" name="ptyId"  value="<%=object.get("PTY_ID") %>"/>
                <div class="formRow">
                  <div class="formInnerField">
                      <label data-error="Please select the customer status">
                        <span>Status</span>
                      </label>
                    	<select name="ptyStatus" class="selectMenu" id="ptyStatus" >
                        <option>Select Status</option>                        
                        <option <%if(object.get("PTY_STATUS").toString().trim().equals("ACTIVE")){ %> selected="selected"  <%} %>  >ACTIVE</option>
                        <option <%if(object.get("PTY_STATUS").toString().trim().equals("INACTIVE")){ %> selected="selected"  <%} %>>INACTIVE</option>                                                                 
                      </select>
                  </div>
                </div> 
              </div>
            </div>
           <div class="button-block">
              <button class="button button-primary button-medium" id="add-button" data-location="customers.html">SAVE CHANGES</button>
            </div> 
          </div> 
                     
        </div>
</section>
</form>
