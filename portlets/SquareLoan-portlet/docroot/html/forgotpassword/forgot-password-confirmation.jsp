<%@page import="com.liferay.portal.kernel.util.Validator"%>
<%@ include file="/html/init.jsp" %>
<portlet:actionURL var="passwordURL">
<portlet:param name="action" value="resetPassword"/>
</portlet:actionURL>
<portlet:renderURL var="cancelforgotpassword"></portlet:renderURL>
<%

String  email=(String)renderRequest.getParameter("mail");
String status=(String)renderRequest.getParameter("status");
%>


   <section class="forget-password-heading">
        <div class="container">
            <div class="row-blk">
                <div class="grid-8 center-block">
                    <h2>Forgot Password</h2>
                    <p>Please follow these three steps</p>
                </div>
            </div>
        </div>
    </section>
     <%
    if(!Validator.isNull(status)){
    	if(status.equalsIgnoreCase("success")){
    %>
    <div class="my-account-errormsg arrow-bottom">
        <div class="container">
            <p><i class="fa fa-exclamation-triangle"></i>Password Successfully Update<span class="my-acoount-close"><i class="fa fa-times-circle-o"></i></span></p>
        </div>
    </div>    
 
    <%
    	}
    else{%>
    <div class="my-account-errormsg arrow-bottom">
        <div class="container">
            <p><i class="fa fa-exclamation-triangle"></i> There are errors in your submitted form<span class="my-acoount-close"><i class="fa fa-times-circle-o"></i></span></p>
        </div>
    </div>
    <%
    }
    } 
    %>
    <!-- error message end -->
    <section class="forget-password-content-wapper">
    <!-- main container start -->
    <div class="container">
        <!-- main row stat -->
        <%
        long groupid = themeDisplay.getLayout().getGroupId();
        String passwordpolicy =  PortletProps.get("password.policy.message");
        %>
        
        <div class="row-blk">
        <div class="grid-8 center-block">
        <form action="${passwordURL}" method="post" name="password" id="password">
            
                <div class="form-block">
                    <div class="password-confirm">
                        <div class="form-row">
                        <div class="error-message">
								<!-- <strong>Please enter at least 6 characters and include at least one number</strong> --> 
			                <liferay-ui:journal-article articleId="<%=passwordpolicy%>" groupId="<%=groupid%>"  ></liferay-ui:journal-article>
						</div>
                            <div class="form-inner-field">
                            	<input type="hidden" value="<%=email%>" name="email"/>
                                <label><span>Create New Password</span></label>
                                <input type="password" value="" class="text-box" id="password-textbox" name="password">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-inner-field">
                                <label><span>Confirm Password</span></label>
                                <input type="password" value="" class="text-box" id="confirm-textbox">
                                <div class="error-password"><strong>Please Confirm your password</strong></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="details-save">
                    <input type="submit" class="button button-primary" id="password-save" value="SAVE">
                  <a href='${cancelforgotpassword}' >  <button type="button" class="button button-secondary" >CANCEL</button></a>
                </div>
            
             </form>
             </div>
        </div>
       
   </div>
   </section>
   <script>
   
   $('#password-textbox').on('change', function() {
   	/* alert(); */
    	var regularExpression = /${regexp}/;
   	var pwdw = $("#password-textbox").val();
   	
           if (regularExpression.test(pwdw)) {
           	/* alert("valid"); */
           		$(this).parents('.form-inner-field').removeClass('addRed');
               $(this).parents('.form-row').removeClass('err-password');
               $(this).parents('.form-row').find('.fa-times').remove();
               $(this).parents('.form-row').find('.help-message').fadeOut(100);

           } else {
           	/* alert(" in valid"); */
           		$(this).parents('.form-inner-field').addClass('addRed');
               $(this).parents('.form-row').append('<i class="fa fa-times"></i>');
               $(this).parents('.form-row').addClass('err-password');
               $(this).parents('.form-row').find('.help-message').fadeIn(800);
           }
      
   });
   
   
   
   
   
   </script>

