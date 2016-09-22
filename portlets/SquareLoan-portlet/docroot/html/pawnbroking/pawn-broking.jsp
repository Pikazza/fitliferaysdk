<%@ include file="/html/init.jsp" %>
<portlet:actionURL var="pawnbrokURL" windowState="<%=WindowState.MAXIMIZED.toString()%>">
<portlet:param name="action" value="pawnbroke"/>
</portlet:actionURL>
   <portlet:resourceURL var="getAddressURL" id="getAddress"/>
   <style>
<!--

-->
.loader-wrapper{ display:none; }
.preloader-cube{ margin-bottom: 38px; }
.sk-folding-cube {
 margin: 20px auto;
 width: 40px;
 height: 40px;
 position: relative;
 -webkit-transform: rotateZ(45deg);
         transform: rotateZ(45deg);
}

.sk-folding-cube .sk-cube {
 float: left;
 width: 50%;
 height: 50%;
 position: relative;
 -webkit-transform: scale(1.1);
     -ms-transform: scale(1.1);
         transform: scale(1.1);
}
.sk-folding-cube .sk-cube:before {
 content: '';
 position: absolute;
 top: 0;
 left: 0;
 width: 100%;
 height: 100%;
 background-color: #e50647;
 -webkit-animation: sk-foldCubeAngle 2.4s infinite linear both;
         animation: sk-foldCubeAngle 2.4s infinite linear both;
 -webkit-transform-origin: 100% 100%;
     -ms-transform-origin: 100% 100%;
         transform-origin: 100% 100%;
}
.sk-folding-cube .sk-cube2 {
 -webkit-transform: scale(1.1) rotateZ(90deg);
         transform: scale(1.1) rotateZ(90deg);
}
.sk-folding-cube .sk-cube3 {
 -webkit-transform: scale(1.1) rotateZ(180deg);
         transform: scale(1.1) rotateZ(180deg);
}
.sk-folding-cube .sk-cube4 {
 -webkit-transform: scale(1.1) rotateZ(270deg);
         transform: scale(1.1) rotateZ(270deg);
}
.sk-folding-cube .sk-cube2:before {
 -webkit-animation-delay: 0.3s;
         animation-delay: 0.3s;
}
.sk-folding-cube .sk-cube3:before {
 -webkit-animation-delay: 0.6s;
         animation-delay: 0.6s;
}
.sk-folding-cube .sk-cube4:before {
 -webkit-animation-delay: 0.9s;
         animation-delay: 0.9s; 
}
@-webkit-keyframes sk-foldCubeAngle {
 0%, 10% {
   -webkit-transform: perspective(140px) rotateX(-180deg);
           transform: perspective(140px) rotateX(-180deg);
   opacity: 0;
 } 25%, 75% {
   -webkit-transform: perspective(140px) rotateX(0deg);
           transform: perspective(140px) rotateX(0deg);
   opacity: 1;
 } 90%, 100% {
 	-webkit-transform:perspective(140px) rotateY(180deg);transform:perspective(140px) rotateY(180deg);opacity:0 } 
}
</style>
     <!-- ---------pre loader------- -->
    <div class="loader-wrapper">
        <div class="loder-content text-center">
            <div>
                <div class="preloader-cube">
                    <div class="sk-folding-cube">
                     <div class="sk-cube1 sk-cube"></div>
                     <div class="sk-cube2 sk-cube"></div>
                     <div class="sk-cube4 sk-cube"></div>
                     <div class="sk-cube3 sk-cube"></div>
                    </div>
                </div>
                <div class="first-loader application-loader">
                    <div>
                        <p>We are reviewing your application, we won’t be long! Please don’t refresh or hit the back button.</p>
                    </div>
                </div>
                <div class="second-loader application-loader">
                    <div>
                        <p>It’s taking a little bit longer to upload images than hoped. Don’t worry, it’s not you, it’s us! We’ll have an answer shortly. Please don’t refresh or hit the back button.</p>
                    </div>                    
                </div>
                <div class="third-loader application-loader">
                    <div>
                        <p>...........Loading...............</p>
                    </div>                    
                </div>
            </div>
        </div>
    </div>
     <!-- ---------pre loader end------- -->
 <section id="personal-info">
        <div class="section cashBack">
            <div class="container"><h3><strong>Value your item</strong> for cash back <i class="fa fa-angle-up"></i></h3> </div>
        </div>
         <form action="${pawnbrokURL}" enctype="multipart/form-data"  name="pawnbooking" id="pawnbooking" method="post" onsubmit="preLoader()">
          <!-- tahir    <div class="form-inner-field uploadFile">
                                <label><span>Upload a photo</span></label>
                                <input class="text-box" type="file" id="fileupload" name="myfiles" multiple="multiple"/>
                            </div>
         <input type="submit"  value="Value Your item now"> --> 
       
                       
        <div class="section">
            <div class="container personal-info">
           <!--  <form action="${pawnbrokURL}" method="post" name="pawnbooking" id="pawnbooking" enctype="multipart/form-data"> -->
                <div class="row-blk ">
                    <div class="grid-8 center-block personal-form-row">
                    <h6>Personal Information</h6>
                    <div class="form-block">
                        <div class="form-row personal-gender">
                            <div class="form-inner-field">
                                <label><span>Title</span></label>
                                <div class="drop-down">
                                    <select name="personal-type1" data-placeholder="Please select a title" id="personal-gender" class="select-drop-down" >
                                        <option value="Miss">Miss</option>
                                        <option value="Ms">Ms</option>
                                        <option value="Mr">Mr</option>
                                        <option value="Mrs">Mrs</option>
                                        <option value="Dr">Dr</option>
                                    </select>
                                </div>
                            </div>
                            <div class="error-message"><strong><i class="fa fa-info-circle"></i>This field is mandatory</strong></div>
                        </div>
                        <div class="form-row">
                            <div class="form-inner-field">
                                <label><span>Name</span></label>
                                <input type="text" value="" class="text-box alphabetonly commoncheck" id="personal-name" name="personal-name">
                                <div class="help-icon"><i class="fa fa-info-circle"></i></div>
                            </div>
                            <div class="error-message"><strong><i class="fa fa-info-circle"></i> Please enter your first name</strong></div>
                            <div class="help-message">This is the name by which most people call you</div>
                        </div>
                        <div class="form-row">
                            <div class="form-inner-field">
                                <label><span>Email</span></label>
                                <input type="text" value="" class="text-box emailonly" id="personal-email" name="personal-email">
                                <div class="help-icon"><i class="fa fa-info-circle"></i></div>
                            </div>
                            <div class="error-message"><strong><i class="fa fa-info-circle"></i> Please enter a valid email address</strong></div>
                            <div class="help-message">Your email address is required so we can contact you about your account and so you can login later.</div>
                        </div>
                        <div class="form-row">
                            <div class="form-inner-field">
                                <label><span>Mobile number</span></label>
                                <input type="text" value="" class="text-box number commoncheck" id="personal-mobile" name="personal-mobile">
                                <div class="help-icon"><i class="fa fa-info-circle"></i></div>
                            </div>
                            <div class="error-message"><strong><i class="fa fa-info-circle"></i> Enter Your mobile number</strong></div>
                            <div class="help-message">Your personal mobile number</div>
                        </div>
                        <div class="form-row">
                            <div class="form-inner-field">
                                <label><span>Are you over 18?</span></label>
                                <div class="radio radiobutton clearfix">
                                    <input type="radio" id="radio1" class="are-you" value="Yes" name="age">
                                    <label for="radio1"><span>Yes</span></label>

                                    <input type="radio" id="radio2" class="are-you" value="No" name="age">
                                    <label for="radio2"><span>No</span></label>
                                </div>
                            </div>
                            <div class="error-message"><strong><i class="fa fa-info-circle"></i>This field is mandatory</strong></div>
                        </div>
                        <input type="hidden" id="webAddress" value="" name="webAddress"/>
                        <div class="form-row">
                            <div class="form-inner-field postcode">
                                <label><span>Postcode</span></label>
                                <input type="text" value="" class="text-box" id="postcode" placeholder="AB15XY" maxlength="8">
                                <button type="button" id="addressbutton" class="button button-white" disabled="disabled" onclick=" getAddress()">Find Address</button>
                            </div>
                            <!-- <div class="help-message">Please enter your post code</div> -->
                            <div class="error-message"><strong>This field is mandatory</strong></div>
                        </div>
                        <div class="address-list">
                            <div class="preloader"></div>
                            <div id="choose-address">
                                <h6>Please select your address from the options given below.</h6>
                                <div class="list-of-address" id="address-list">
                                    <ul id="address-list-inner">
                                       
                                         </ul>
                                </div>
                                <button type="button" id="confirmbutton" class="button button-white">Locate address</button>
                                 <input type="hidden" id="webAddress" value="" name="webAddress"/>
                            </div>
                        </div>
                          <div class="choosed-address" class="form-row"></div>
                       </div>
                    <div class="form-block">
                        <h6>information about the item</h6>
                        <div class="form-row">
                            <div class="form-inner-field uploadFile">
                                <label><span>Upload a photo</span></label>
                                <input class="text-box" type="file" id="fileupload" name="myfiles"/>
                            </div>
                            <div class="error-message"><strong><i class="fa fa-info-circle"></i> This field is mandatory</strong></div>
                        </div>
                        <div class="form-row">
                            <div class="form-inner-field">
                                <label><span>Item condition</span></label>
                                <div class="radio radiobutton clearfix">
                                    <input type="radio" id="radio3" class="item-condition" name="condition" value="New">
                                    <label for="radio3"><span>New</span></label>

                                    <input type="radio" id="radio4" class="item-condition" name="condition" value="Used">
                                    <label for="radio4"><span>Used</span></label>
                                </div>
                            </div>
                            <div class="error-message"><strong><i class="fa fa-info-circle"></i> This field is mandatory</strong></div>
                        </div>
                        <div class="form-row">
                            <div class="form-inner-field txtMsg">
                                <label><span>Item description</span></label>
                                <textarea rows="5" class="textArea" name="description" id="description"></textarea>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-inner-field">
                                <label><span>Age of item</span></label>
                                <input type="text" value="" class="text-box number commoncheck" id="age-of-item" placeholder="Years" name="age-of-item">
                                <div class="help-icon"><i class="fa fa-info-circle"></i></div>
                            </div>
                            <div class="error-message"><strong><i class="fa fa-info-circle"></i> This field is mandatory.</strong></div>
                            <div class="help-message">Please enter the Age of item</div>
                        </div>
                        <div class="form-row personal-type">
                            <div class="form-inner-field">
                                <label><span>Type</span></label>
                                <div class="drop-down">
                                    <select data-placeholder="Please select a Type" id="personal-type" class="select-drop-down" name="personal-type2">
                                        <option value="Miss">Miss</option>
                                        <option value="Ms">Ms</option>
                                        <option value="Mr">Mr</option>
                                        <option value="Mrs">Mrs</option>
                                        <option value="Dr">Dr</option>
                                    </select>
                                </div>
                            </div>
                            <div class="error-message"><strong><i class="fa fa-info-circle"></i> This field is mandatory.</strong></div>
                        </div>
                        <div class="form-row">
                            <div class="form-inner-field clearfix">
                                <label><span>Carat</span></label>
                                <div class="halfwidth fL">
                                    <input type="text" value="" class="text-box number commoncheck" id="carat" placeholder="Carat" name="carat_q" value="">
                                </div>
                                <div class="radio radiobutton marLeft20 fL">
                                    <input type="radio" id="radio5" class="carat-button" name="carat" value="Not sure">
                                    <label for="radio5"><span>Not sure</span></label>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-inner-field clearfix">
                                <label><span>Weight (in grams)</span></label>
                                <div class="halfwidth fL">
                                    <input type="text" value="" class="text-box number commoncheck" placeholder="Weight (in grams)" name="wight">
                                </div>
                                <div class="radio radiobutton marLeft20 fL">
                                    <input type="radio" id="radio6" class="carat-button" name="grams" value="Not sure">
                                    <label for="radio6"><span>Not sure</span></label>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-inner-field clearfix">
                                <label><span>Are you the rightful owner?</span></label>
                                <div class="radio radiobutton clearfix">
                                    <input type="radio" id="radio7" class="owner" name="owner" value="Yes">
                                    <label for="radio7"><span>Yes</span></label>

                                    <input type="radio" id="radio8" class="owner" name="owner" value="No">
                                    <label for="radio8"><span>No</span></label>
                                </div>
                            </div>
                            <div class="error-message"><strong><i class="fa fa-info-circle"></i> This field is mandatory</strong></div>
                        </div>
                        <div class="form-row">
                            <div class="form-inner-field clearfix">
                                <label><span>Is the item boxed?</span></label>
                                <div class="radio radiobutton clearfix">
                                    <input type="radio" id="radio9" class="item-boxed" name="item" value="Yes">
                                    <label for="radio9"><span>Yes</span></label>

                                    <input type="radio" id="radio10" class="item-boxed" name="item" value="No">
                                    <label for="radio10"><span>No</span></label>
                                </div>
                            </div>
                            <div class="error-message"><strong><i class="fa fa-info-circle"></i> This field is mandatory.</strong></div>
                        </div>
                        <div class="form-row">
                            <div class="form-inner-field clearfix">
                                <label><span>Does it have instructions?</span></label>
                                <div class="radio radiobutton clearfix">
                                    <input type="radio" id="radio11" class="instructions" name="instructions" value="Yes">
                                    <label for="radio11"><span>Yes</span></label>

                                    <input type="radio" id="radio12" class="instructions" name="instructions" value="No">
                                    <label for="radio12"><span>No</span></label>
                                </div>
                            </div>
                            <div class="error-message"><strong><i class="fa fa-info-circle"></i> This field is mandatory.</strong></div>
                        </div>                       
                       
                          
                                <input type="submit" class="button button-primary personal-vaild grey-button next-pages" value="Value Your item now">
                            
                       
                    </div>
                </div>
                </div>
            
                </div>
                </div>
                  </form>   
            
                </section>
                    <script type="text/javascript">
                    
                    function preLoader(){
                    	   $('.loader-wrapper').fadeIn();  
                         
                     
                     
                      /*  $('.first-loader').fadeIn(300, function(){
                           $(this).delay(29000).fadeOut(1000, function(){
                               $('.second-loader').fadeIn(1000, function(){
                                   $('.second-loader').delay(59000).fadeOut(1000, function(){
                                       $('.third-loader').fadeIn(1000); 
                                   });
                               });
                           });
                       });  */
                 
                    	
                    }
                    
                    
                    function getAddress(){
                    	
                    		
                    		var resorceUrl='<%=getAddressURL.toString()%>';
                    		var post_code=document.getElementById("postcode").value;
                    		
                    		$.ajax({
                    			url : resorceUrl,
                    			type : 'GET',
                    	    	data : {				
                    	    		postcode:post_code
                    			},
                    			async : true,
                    			success : function(serverResponse) {	
                    				
                					
                    				var res  = $.parseJSON(serverResponse);
                    					for( var i = 0; i < res.length; i++) {
                    					    var addressline = res[i];
                    					  /*  alert(sponsor); */
                    					   
                    					   $("#address-list-inner").append('<li>'+addressline+'</li>');
                    					
                    					}
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
                    					   $('#address-list-inner li').bind('click', function(e) {
                    					        $('#address-list-inner li').removeClass('selected');
                    					        $(this).addClass('selected');
                    					        $('#confirmbutton').removeAttr('disabled');
                    					    });
                    				   
                    					   $('#confirmbutton').on('click', function() {
                    						  
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
                    					            /*  $('.choosed-address').html("<span>"+arr[0] + ",</span>" + arr[1]+",<span>"+arr[2]); */
                    					            $('.choosed-address').html(addressblock);
                    					            
                    					            $('#webAddress').val("");                	    
                    		                	    console.log(fullAddress); 
                    		                	    $('#webAddress').val(fullAddress);

                    					        });
                    					    });
                    				}
                    		});
                    	
                    }
                 
                    
                    </script>