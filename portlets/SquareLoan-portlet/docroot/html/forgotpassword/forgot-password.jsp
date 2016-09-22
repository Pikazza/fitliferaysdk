<%@page import="com.liferay.portal.kernel.util.Validator"%>
<%@ include file="/html/init.jsp" %>
<portlet:resourceURL var="validateEmailURL" id="validateEmail" />
<portlet:resourceURL var="sendCodeURL" id="sendCode" />


<portlet:actionURL var="validateSMSURL">
<portlet:param name="action" value="validateSMS"/>
</portlet:actionURL>
<%
String status=(String)renderRequest.getParameter("status");
String  phone=(String)renderRequest.getParameter("phone");
String  mail=(String)renderRequest.getParameter("mail");
System.out.println("param jsp : "+status+"  "+mail+"   "+phone);
if(mail==null){
	mail="";
	phone="";
}
%>


    <%@page import="com.liferay.portal.kernel.util.Validator"%>
<!--#include file="header.html"-->
      <section class="forget-password-heading">
        <div class="container">
            <div class="row-blk">
                <div class="grid-8 center-block">
                    <h2>Forgot Password</h2>
                    <p>Please follow these simple steps</br>to reset your password</p>
                </div>
            </div>
        </div>
    </section>
    <!-- error message start -->
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
            <p><i class="fa fa-exclamation-triangle"></i> Pin entered is invalid Please try again, <span class="my-acoount-close"><i class="fa fa-times-circle-o"></i></span></p>
        </div>
    </div>
     <script type="text/javascript">
$('.my-account-errormsg').show();
</script> 
    <%
    }
    } 
    %>
    <!-- error message end -->
    <section class="forget-password-content-wapper">
    <!-- main container start -->
    <div class="container">
        <!-- main row stat -->
        <div class="row-blk">
            <div class="grid-8 center-block">
             <form action="${validateSMSURL}" name="forgot" id="forgot" method="post">
                <div class="form-block">
                
                
                
                    <div class="form-row">
                       <div class="error-message"><strong>Please enter a valid email address</strong></div>
                        <div class="form-inner-field forget-email-vaild">
                            <label><span>Email address</span></label>
                            <input type="text" value="<%=mail%>" class="text-box emailonly" id="verify-email" name="email" >
                                  <button type="button" class="reset-password small-button">Proceed</button>
                                  
                                  <div class="valid-preloader">
                                    <img src="${themeDisplay.pathThemeImages}/preloader.gif" alt="">
                                 </div>
                                  
                            <div class="message-alert">
                                
                                <div class="alert-message">
                                   there is no account for given email id
                                </div>
                              </div>   
                                <div class="reset-session">
                                    <p>To verify your account we need to send a code to your registered mobile ending <span>XXXXXXXX74</span></p>
                                    <button type="button" class="small-button sms-valid-no" onclick="sendVerifyNumber('send')">Send code</button>
                                </div>
                                <div class="smsalert">
                                    <p>You will shortly receive a text message to the number you provided. Please enter the code you received here</p>
                                </div>
                                <div class="form-row" id="smsverfiy" >
                                        <div class="sms-success">		
                                           <p>We&#39ve sent you a text message with a verification number. Please enter this number in the field below</p>		
                                        </div>
                                    <div class="form-inner-field">
                                        <label><span>SMS verification code</span></label>
                                        <input type="text" name="pin" value="" class="text-box number" id="verfiy-sms" placeholder="" maxlength="4">
                                        <button type="button" class="button newCode" onclick="sendVerifyNumber('resend')">resend code</button>
                                    </div>
                                    <div class="resend">
                                        <div class="infoText"> if you didn't receive your code check your mobile number is correct and send a new code</div>
                                    </div>
                                    
                                    <button type="submit" class="reset-submit small-button">PROCEED</button>
                                </div>
                           
                            
                        </div>
                    </div>
                   
                </div>
                </form>
            </div>
        </div>
    </div>
    
  
<script type="text/javascript">
$('.reset-password').click(function(){
	$('.valid-preloader').fadeIn(800);
	validateEmail();
});
function validateEmail(){	
	
	var resorceUrl='<%=validateEmailURL.toString()%>';
	var emailId=document.getElementById("verify-email").value;	
	
	
	$.ajax({
		url : resorceUrl,
		type : 'GET',
    	data : {				
			email:emailId
		},
		async : true,
		success : function(serverResponse) {	
			/* alert(serverResponse); */
			var jresponse=$.parseJSON(serverResponse);
			var resultRespone=jresponse.jsonResponse;
			
			
			 if(resultRespone.status == "valid"){	
				 /* alert(""+resultRespone.pnoneNumber); */
				$('.valid-preloader').fadeOut();
				$('.alert-message').fadeOut(2000);
				 $("#verify-email").attr('readonly','readonly');
				$('.reset-session p span').html('');
				$('.reset-session p span').html(resultRespone.pnoneNumber);
				  $('.reset-password').fadeOut(); 
				  $('.reset-session').slideDown(500, function(){}); 
				
			 }else{			
				 $('.valid-preloader').fadeOut(function(){
						$('.alert-message').fadeIn(2000);
					});
				  $('.reset-password').fadeOut(); 
				/* $('#smsverfiy').fadeOut();  */ 
				 $('.message-alert').slideDown(500, function(){
				 
				 }); 
				 		 
			 }			
		}
	});
}


 

function sendVerifyNumber(value){
	 $('.smsalert').fadeIn(500);
	var resorceUrl='<%=sendCodeURL.toString()%>';
	var emailId=document.getElementById("verify-email").value;
$.ajax({
	url : resorceUrl,
	type : 'GET',
	data : {				
	buttonVal:value,
	email:emailId
	},
	async : true,
	success : function(serverResponse) {	
		if(serverResponse == "Code Sent"){	
			 $('.smsalert').fadeOut(500);
			       $('.sms-valid-no').fadeOut(800, function(){
			            $('#smsverfiy').fadeIn(); 
			       });
			 			 			
		   }else if(serverResponse == "New Code"){
			   
			  
			   }		  
		  else{
			 
			} 
		} 
});	
}


 $('.reset-password').attr('disabled', true);
$('#verify-email').change(function() {
	$('.reset-password').fadeIn(); 
	 $('.message-alert').slideUp(500); 
    var formVal = 0;
    var vemail = $('#verify-email').val();
    if (!emailVal(vemail)) {
        $('.reset-password').attr('disabled', true);
        $('#verify-email').parents('.form-row').find('.error-message').show();
        $('#verify-email').parents('.form-inner-field').addClass('addRed');
        $('.message-alert, #smsverfiy').slideUp(500);
        formVal += 1;
    } else {
    	  $('.reset-password').attr('disabled', false);  
    	
    	  $('#verify-email').parents('.form-row').find('.error-message').hide();
          $('#verify-email').parents('.form-inner-field').removeClass('addRed');
    }
});

  $('#verfiy-sms').on('keyup', function() {
    if ($(this).val() != 0) {
       $('.newCode').attr('disabled', false);
        $('.reset-submit').attr('disabled', false);
    } else {
     $('.newCode').attr('disabled', true);
        $('.reset-submit').attr('disabled', false);
    }
});  
 


</script>

