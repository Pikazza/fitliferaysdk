      <%@page import="com.liferay.portal.kernel.util.Validator"%>
<%@ include file="/html/init.jsp" %>
      <portlet:actionURL var="contactusURL" windowState="<%=WindowState.MAXIMIZED.toString()%>">
      <portlet:param name="action" value="contactusAction"/>      
      </portlet:actionURL>
      <portlet:resourceURL var="getAddressURL" id="getAddress"/>
        <!-- error message start -->
        <%
        String status=(String)renderRequest.getParameter("status");
        %>
    <%
    if(!Validator.isNull(status)){
    	
    %>
    <script>
    $('#con_error').html("Sorry some error occurred ,Please try again");
    $('.global-error').show();
    </script>
     <!-- <div class="my-account-errormsg arrow-bottom" >
        <div class="container">
            <p><i class="fa fa-exclamation-triangle"></i>Sorry some error occurred ,Please try again <span class="my-acoount-close"><i class="fa fa-times-circle-o"></i></span></p>
        </div>
    </div> -->    
    <%   
    } 
    %>
    <!-- error message end -->
      <div class="form-block form-wrap-blk contact-form-blk">    
      <form action="${contactusURL}" id="contactus" name="contactus" method="post" onsubmit="return checkEmptyField();">
                        
                          <div class="form-row">
                            <div class="error-message"><strong>Please enter your first name</strong></div>
                            <div class="form-inner-field">
                                <label><span>First name</span></label>
                                <input type="text" value="" class="text-box alphabetOnly commonCheck" id="person-name" name="firstName">
                            </div>
                           </div>
                        
                        <div class="form-row">
                         <div class="error-message"><strong>Please enter your last name</strong></div>
                            <div class="form-inner-field">
                                <label><span>Last name</span></label>
                                <input type="text" value="" class="text-box alphabetOnly commonCheck" id="person-last-name" name="lastName">
                            </div>
                        </div>
                        
                        
                        <div class="form-row">
                            <div class="error-text"><strong>Please enter mobile number</strong></div>
                            <div class="form-inner-field">
                                <label><span>Mobile number</span></label>
                                <input type="text" name="mobileNumber" value="" class="text-box number commonCheck not-mandar" id="person-number" maxlength="11">
                            </div>
                        </div>
                        
                        <div class="form-row">
                         <div class="error-message"><strong>Please enter a valid email address</strong></div>
                            <div class="form-inner-field">
                                <label><span>Email address</span></label>
                                <input type="text" value="" class="text-box emailonly" id="person-email" name="emailAddress">
                                <div class="help-icon"><i class="fa fa-info"></i></div>
                            </div>
                            <div class="help-message">Your email address is required so we can contact you about your account and so you can login later.</div>
                        </div>
                        
                        
                        
                        
                        
                    	<input type="hidden" id="webAddress" value="" name="webAddress"/>
                    	
                    	<div class="find-address-blk">
                        <div class="form-row address-post">
                            <div class="error-message"><strong>Please enter your post code</strong></div>
                                <div class="form-inner-field postcode">
                                <label><span>Your postcode</span></label>
                                <input type="text" value="" class="text-box your-postcode" id="postcode" placeholder="AB15XY" maxlength="8" name="address">
                                <button type="button" id="addressbutton" class="button button-white button-address" disabled="disabled" onclick="getAddress()">Find address</button>
                               </div>
                               <div class="preloader">
                                    <div class="preloader-cube">
                                         <img src="${themeDisplay.pathThemeImages}/preloader.GIF"/>
                                    </div>
                                </div> 
                            <!-- <div class="help-message">Please enter your post code</div> -->
                            <!-- <div class="error-message"><strong>This field is mandatory</strong></div> -->
                        </div>
                        
                        <div class="address-list">
                            <div class="choose-address" id="choose-address" >
                                <div class="list-of-address address-list-block">
                                        <ul id="address-list-inner" class="address-list-inner">
                                        
								        </ul>
                                </div>
                                <!-- <button id="confirmbutton" type="button" class="button button-white" >Choose address</button> -->
                            </div>
                        </div>
                        <div class="choosed-address ">
                                <label>Address</label>
                                <div class="confirm-address"></div>
                         </div>
                        
                        </div>
                        
                        
                        <!-- <div class="form-row">
                            <div class="form-inner-field">
                                <label><span>House Number</span></label>
                                <input type="text" value="" class="text-box alphabetOnly commonCheck" id="housenumber" name="houseNumber">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-inner-field">
                                <label><span>Street Address</span></label>
                                <input type="text" value="" class="text-box alphabetOnly commonCheck" id="street" name="streetAddress" >
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-inner-field">
                                <label><span>Town/City</span></label>
                                <input type="text" value="" class="text-box alphabetOnly commonCheck" id="county" name="city">
                            </div>
                        </div> -->
                        <div class="form-row">
                        <div class="error-message"><strong>Please enter Your message</strong></div>
                            <div class="form-inner-field txtMsg">
                                <label><span>Your query</span></label>
                                <textarea rows="5" class="textArea commonCheck" id="person-textbox" name="query"></textarea>
                            </div>
                        </div>
                     
                          <input type="submit"  class="button button-primary contact-vaild grey-button next-pages" value="submit">
                        </form>
                     </div>
                    
                    <script type="text/javascript">
                    
                    
                    
                    function checkEmptyField()
                    {
                    	 var tname = $('#person-textbox').val();
                    	 var fname = $('#person-name').val();
                    	 var lname = $('#person-last-name').val();
                    	 var femail = $('#person-email').val();
                    	 var postcode = $('.your-postcode').val();
                    	 
                    	 if(tname.length>0 && fname.length>0 && lname.length>0 && femail.length>0 && postcode.length>0 )
                    		 {
                    		 return true;
                    		 }
                    	 else
                    		 {
                    		 return false;
                    		 }
                    	 
                    }
                    
                    function getAddress(){          	
                    		var resorceUrl='<%=getAddressURL.toString()%>';
                    		var post_code=document.getElementById("postcode").value;
                    		$(".address-list-inner").mCustomScrollbar();
                    		
                    		
                    		//$('#findAddress'+divisionId).parents('.address-wrapper').find('#pre'+divisionId).fadeIn(); 
                    		
                    		
                    		 $('#addressbutton').parents('.find-address-blk').find('.preloader').fadeIn(),
                    		
                    		
                    		$.ajax({
                    			url : resorceUrl,
                    			type : 'GET',
                    	    	data : {				
                    	    		postcode:post_code
                    			},
                    			async : true,
                    			success : function(serverResponse) {	
                    				/* alert(serverResponse);  
                    				$('#address-list').show();
                    				$('#choose-address').show(); */      	
                    				  $(".address-list-inner").mCustomScrollbar('destroy'); 
                    							
                    				$('#addressbutton').parents('.find-address-blk').find('.choose-address').slideDown();
                    				
                    				 $("#address-list-inner").empty();
                    				$("#address-list-inner").append('<li>Select your address...</li>');	
                    				
                    				var res  = $.parseJSON(serverResponse);
                    					for( var i = 0; i < res.length; i++) {
                    					    var addressline = res[i];
                    					  /*  alert(sponsor); */
                    					   
                    					  //alert(addressline);
                    					  
                    					   $("#address-list-inner").append('<li>'+addressline+'</li>');
                    					   
                    					
                    					}
                    					
                    					
                    					  $(".address-list-inner").mCustomScrollbar();
                    					 /*  $('#addressbutton').on('click', function() {
                    					        $('.preloader').fadeIn(500, function() {
                    					            $(this).fadeOut(500, function() {
                    					                $('#choose-address').fadeIn(500);
                    					            });
                    					        });
                    					    }); */
                    					    $('.preloader').fadeIn(500, function() {
                    				            $(this).fadeOut(500, function() {
                    				                $('#choose-address').fadeIn(500);
                    				            });
                    				        });
                    					   /* $('.address-list-inner li').bind('click', function(e) {
                    					        $('#address-list-inner li').removeClass('selected');
                    					        $(this).addClass('selected');
                    					       // $('#confirmbutton').removeAttr('disabled');
                    					    }); */
                    					   
                    					   
                    					   
                    					   $(document).on('click', '.address-list-inner li', function() {
                    					        
                    						    $(this).parent('.address-list-inner').find('li').removeClass('selected');
                    					        $(this).addClass('selected');
                    					    });

                    					    $(document).on('click', '.address-list-inner li', function() {
                    					    	
                    					    	
                    					        $(this).parents('.contact-form-blk').find('.confirm-address').html('');
                    					        $(this).parents('.contact-form-blk').find('.choose-address').fadeOut(function() {
                    					        	
                    					        	
                    					            var data = $(this).parents('.address-list').find('.address-list-inner .selected').text();
                    					            
                    					            
                    					            var arr = data.split(',');
                    					            
                    					            
                    					            $(this).parents('.contact-form-blk').find('.choosed-address').slideDown(function(){
                    					            	
                    					            	
                    					            	 var addressblock ='';
                    					            	 var emailaddressblock='';
                    					            	
                    					            	$.each(arr , function(i, val) { 
                    					            		 emailaddressblock+=arr[i]+" ";
          	    	    				            	  addressblock += "<span>"+arr[i] + "</span>";
          	    	    				            	});
                    					            	
                    					            	
                    					                $(this).find('.confirm-address').html(addressblock);
                    					                $('#webAddress').val(emailaddressblock);
                    					            });
                    					        });
                    					        
                    					    });
                                                      
                    					    
                    					     
                    					   /*  $('#confirmbutton').on('click', function() {
                    						  
                    					        $('.choosed-address').html('');
                    					        $('#choose-address').fadeOut(function() {
                    					            var data =$('#address-list-inner .selected').text();
                    					            
                    					            var arr = data.split(',');
                    					            var addressblock ='';
                    					            var fullAddress='';
                    					            $.each(arr , function(i, val) { 
                    					            	fullAddress +=arr[i] +" ";
                    					            	  addressblock += "<span>"+arr[i] + "</span>";
                    					            	});
                    					            
                    					            $('.choosed-address').html(addressblock);
                    					            
                    					            $('#webAddress').val("");                	    
                    		                	    console.log(fullAddress); 
                    		                	    $('#webAddress').val(fullAddress);

                    					        });
                    					    });  */
                    				}
                    		});
                    	
                    }
              setTimeout(function(){
                    $(document).on('change','#person-number', function () {
                        if($(this).attr('maxlength') > $(this).val().length){
                            $(this).parents('.form-row').addClass('nonActive');
                            $(this).parents('.form-row').find('.error-text').show();
                            $(this).parents('.form-inner-field').addClass('addRederror');                              
                        } else {
                            $(this).parents('.form-row').removeClass('nonActive');
                            $(this).parents('.form-row').find('.error-text').hide();
                            $(this).parents('.form-inner-field').removeClass('addRederror');  
                        }
                        if($(this).val().length==0){
                            $(this).parents('.form-row').removeClass('nonActive');
                            $(this).parents('.form-row').find('.error-text').hide();
                            $(this).parents('.form-inner-field').removeClass('addRed'); 
                        }
                });
              },500);
                  /*  $('#address-list-inner li').click(function() {
                	   alert("called");
                	   $('#webAddress').val("");                	    
                	    console.log($(this).text()); 
                	    $('#webAddress').val($(this).text());
                	    
                	});  */
                    
                    </script>