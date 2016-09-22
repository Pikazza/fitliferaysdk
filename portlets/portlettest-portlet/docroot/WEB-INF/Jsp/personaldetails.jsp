<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>



<portlet:resourceURL var="getAddressURL" id="getAddressBlock" />

<portlet:resourceURL var="removeAddressURL" id="removeAddressBlock" />

<portlet:resourceURL var="validateEmailURL" id="validateEmail" />
<portlet:resourceURL var="mobileVarificationURL" id="mobileVarification" />
<portlet:resourceURL var="sendCodeURL" id="sendCode" />
<portlet:resourceURL var="smsURL" id="smsPin" />
<portlet:resourceURL var="addressUrl" id="getAddress" />  

		 <portlet:actionURL var="savetospring" >
		 		<portlet:param name="action" value="savecust"/>
		 </portlet:actionURL>
		<portlet:renderURL var="backUrl">
				<portlet:param name="action" value="getStarted"/>
		</portlet:renderURL>
		<portlet:actionURL var="saveurl" >
        	  <portlet:param name="action" value="savecustomer"/>
          </portlet:actionURL>
          
          
    
          
          
<script>
var openbank = "2";
</script>
<c:if test="${empty error_msg}">
  <div class="global-error">
<div class="container">Please answer the questions highlighted below <a href="#"><i class="fa fa-times-circle"></i></a></div>
</div>

</c:if>

<c:if test="${not empty error_msg}">
<div class="global-error">
<div class="container">${error_msg}<a href="#"><i class="fa fa-times-circle"></i></a></yearRangediv>
</div></div>
<script>

localStorage.setItem('active', 'aboutyou');
$('.global-error').slideDown(function() {
    //  globalErr();
  });
   openbank = "1";

 /*   $('.global-error').show(function() {
                globalErr();
            }); */
   </script>
</c:if>


  	<!-- global error message end -->
  	<!-- main section start-->
    <section class="section">
    	<!-- main container start-->
        <div class="container">
        	<!-- details field steps link section start-->
            <div class="steps-row flexslider text-center" id="step-carousel">
                <ul class="slides clearfix">
                    <li id="icon1" class="completed"> 
                        <a href="javascript:void(0)"><div>Get started</div></a>
                    </li>
                    <li id="icon2" class="flex-active-slide progressing">
                        <a href="javascript:void(0)"><div>About you</div></a>
                    </li>
                    <li id="icon3">
                        <a href="javascript:void(0)"><div>Affordability</div></a>
                    </li>
                    <li id="icon4">
                        <a href="javascript:void(0)"><div>Loan review</div></a>
                    </li>
                    <li id="icon5">
                        <a href="javascript:void(0)"><div>Confirmation</div></a>
                    </li>
                </ul>
            </div>
            <!-- details field steps link section end-->
            <!-- row start-->
             <form:form name="userdetailform" action="<%=saveurl %>" method="POST"  commandName="Customer" id="customerform1" >
             
            
               
            
            <div class="row-blk sticky-main">
            	<!-- column 8 article start-->
				<article class="left-column grid-9 form-warp">
					
					 <liferay-ui:journal-article articleId="<%=aboutyoudeclareid%>" groupId="<%=groupid%>"  ></liferay-ui:journal-article>
						
					</span>
					
					 
					
				<!-- Personal Information start-->
					<div class="form-section aboutyou form-wrap-blk">
						<!-- first step -->
						<div class="form-first">
							<h4>What is your loan for?</h4>
							<div class="purpose-of">
								<div class="form-row purpose-of-row">
								
									<div class="form-inner-field">
									<div class="error-message"><strong>   <liferay-ui:journal-article articleId='<%=PortletProps.get("Loan_purpose_error")%>' groupId="<%=groupid%>"  ></liferay-ui:journal-article> </strong></div>
										<div class="drop-down">
											<form:select data-placeholder="Please select an option" id="purpose-of" class="select-drop-down" path="agreement.loanPurposeID">
												<form:option value="">Please select an option</form:option>
												 <form:options items="${loanPurpose}" /> 
												 
												
											</form:select>
											<div class="help-icon"><i class="fa fa-info"></i></div>
										</div>
										<div class="help-message"><liferay-ui:journal-article articleId='<%=PortletProps.get("Loan_purpose_Help")%>' groupId="<%=groupid%>"  ></liferay-ui:journal-article></div>
									</div>
								</div>
							<!-- What is your loan for select drop down end -->
								<div id="others" class="form-row">
									<div class="form-inner-field">
										<label><span>Please enter what your loan is for</span></label>
										<input type="text" value="" class="text-box alphabetonly commoncheck" id="otherpurpose" maxlength="30"> 
									</div>
									<div class="error-message">
										<strong> <liferay-ui:journal-article articleId='<%=PortletProps.get("Loan_purpose_other_error")%>' groupId="<%=groupid%>"  ></liferay-ui:journal-article></strong>
									</div>
								</div>
							</div>
							
														<%
					SimpleDateFormat marshaldateFormat  = new SimpleDateFormat("dd-MM-yyyy");
					String date=marshaldateFormat.format(new Date());
					%>
							<!-- first step end -->

							<!-- 2nd step end -->
							<div class="second-step form-steps">
								<div class="title-icon">
									<h4>Your details</h4>
								</div>
								<div class="form-first-row">
								<div class="first-form-valid" id="about-form-first">
									<div class="form-row title-gender-row">
									<div class="error-message"><strong> <liferay-ui:journal-article articleId='<%=PortletProps.get("Title_error")%>' groupId="<%=groupid%>"  ></liferay-ui:journal-article>    </strong></div>
										<div class="form-inner-field">
											<label><span>Title</span></label>
											<div class="drop-down">
												<form:select path="titleID"  data-placeholder="Please select an option" id="title-gender" class="select-drop-down">
													<form:option value="">Please select an option</form:option>
													<form:options items="${titles}" />  
												</form:select>
												<div class="help-icon"><i class="fa fa-info"></i></div>
											</div>
											<div class="help-message"><liferay-ui:journal-article articleId='<%=PortletProps.get("Title_Help")%>' groupId="<%=groupid%>"  ></liferay-ui:journal-article></div>
										</div>
										
									</div>

									<div class="form-row">
										<div class="form-inner-field">
											<label><span>First name</span></label>
											<form:input type="text" value="" class="text-box alphabetonly commoncheck" id="firstname"  maxlength="25" path="firstName" />
										</div>
										<div class="error-message"><strong>  <liferay-ui:journal-article articleId='<%=PortletProps.get("First_name_error")%>' groupId="<%=groupid%>"  ></liferay-ui:journal-article> </strong></div>
									</div>
									<div class="form-row">
										<div class="form-inner-field">
											<label><span>Last name</span></label>
											<form:input type="text" value="" class="text-box alphabetonly commoncheck" id="Lname" maxlength="40"  path="lastName" />
											 
										</div>
										<div class="error-message"><strong>  <liferay-ui:journal-article articleId='<%=PortletProps.get("Last_name_error")%>' groupId="<%=groupid%>"  ></liferay-ui:journal-article> </strong></div>
									</div>
									<!-- email-feild -->
									<div class="email-feild">
										<div class="form-row">
										<div class="error-message"><strong><liferay-ui:journal-article articleId='<%=PortletProps.get("Email_address_error")%>' groupId="<%=groupid%>"  ></liferay-ui:journal-article></strong></div>
											<div class="form-inner-field">
												<label><span>Email address</span></label>
												 <c:choose>
												  <c:when test="${not empty Customer.customerID}">
												 <form:input type="text" value="" class="text-box emailonly" id="femail" path="emailAddress" onchange="validateEmailId();" readonly="true"/>
												 </c:when>
												 <c:otherwise>
												 <form:input type="text" value="" class="text-box emailonly" id="femail" path="emailAddress" onchange="validateEmailId();"/>
												 </c:otherwise>
												 </c:choose>
												<div class="help-icon"><i class="fa fa-info"></i></div>
											</div>
											<div class="valid-preloader">
											<img src="${themeDisplay.pathThemeImages}/preloader.gif"/>
												<!-- <img src="/Squaretoday-theme/_diffs/images/preloader.GIF"> -->
											</div>
											  <div class="help-message"><liferay-ui:journal-article articleId='<%=PortletProps.get("Email_address_help")%>' groupId="<%=groupid%>"  ></liferay-ui:journal-article></div>  
											<div id="valid-address">
												<div class="alert-message">
													<!--  <p><strong>Your email address is already linked to an account.</strong> Sign in to retrieve your account details</p> --> 
												   <liferay-ui:journal-article articleId="<%=userknownid%>" groupId="<%=groupid%>"  ></liferay-ui:journal-article>  
												</div>
											</div>
										</div>
									</div>
									</div>
									<!-- email-feild -->
									<!-- 2-1 step -->
									<div class="security-block">
										  <div class="form-row" >
                                      <div class="error-message">
<!-- <strong>Please enter at least 6 characters and include at least one number</strong> --> 
                                      <liferay-ui:journal-article articleId="<%=passwordpolicy%>" groupId="<%=groupid%>"  ></liferay-ui:journal-article>
                                      </div>
                                      <div class="form-inner-field">
                                       <c:choose>
                                        <c:when test="${not empty Customer.customerID}">
                                      <input type ="hidden" value="dhjd@33" class="text-box" id="password" />
                                      </c:when>
                                       <c:otherwise>

                                        <label>Password<span></span></label>
                                         <form:input type="password"  class="text-box" id="password" path="password" />


										</c:otherwise>
                                        </c:choose>

                                        <div class="help-icon"><i class="fa fa-info"></i></div>
                                         </div>
<div class="help-message"><liferay-ui:journal-article articleId='<%=PortletProps.get("password_help")%>' groupId="<%=groupid%>"  ></liferay-ui:journal-article></div>
   </div><div class="form-row squestionrow">
										<div class="error-message"><strong>  <liferay-ui:journal-article articleId='<%=PortletProps.get("Security_question_error")%>' groupId="<%=groupid%>"  ></liferay-ui:journal-article> </strong></div>
											<div class="form-inner-field">
												<label><span>Security question</span></label>
												<div class="drop-down">
												 <form:select path="securityQuestionID" class="select-drop-down"  data-placeholder="Please select an option" id="squestion">
														 <form:option value="">Please select an option</form:option>
														 <form:options items="${securityQuestions}" /> 
													</form:select>
													 <div class="help-icon"><i class="fa fa-info"></i></div>  
												</div>
												  <div class="help-message">Your select this option</div>  
											</div>
											
										</div>
										<div class="form-row">
											<div class="form-inner-field">
												<label><span>Answer</span></label>
												<form:input type="text" value="" class="text-box commoncheck alphabetonly" id="answer-question" maxlength="50" path="securityAnswer"/>
												
												<div class="help-icon"><i class="fa fa-info"></i></div>
											</div>
											<div class="error-message"><strong> <liferay-ui:journal-article articleId='<%=PortletProps.get("Security_question_answer_error")%>' groupId="<%=groupid%>"  ></liferay-ui:journal-article> </strong></div>
											<div class="help-message">Enter your security answer</div>
										</div>
										<div class="form-row marital-status-row">
										<div class="error-message">
										    	<strong> <liferay-ui:journal-article articleId='<%=PortletProps.get("Marital_status_error")%>' groupId="<%=groupid%>"  ></liferay-ui:journal-article> </strong>
										    </div>
											<div class="form-inner-field">
											    <label><span>Marital status</span></label>
											    <div class="drop-down">
											      <form:select  path="maritalStatusID" data-placeholder="Please select an option" id="marital-status" class="select-drop-down">
														<form:option value="" >Please select an option</form:option>
								        			    <form:options items="${maritalStatus}" />  
													</form:select>
													<div class="help-icon"><i class="fa fa-info"></i></div>
											    </div>
											     <div class="help-message">Select a status</div>
											</div>
										    
										</div>
										<div class="form-row">
										<div class="error-message"><strong> <liferay-ui:journal-article articleId='<%=PortletProps.get("Dependents_error")%>' groupId="<%=groupid%>"  ></liferay-ui:journal-article> </strong></div>
											<div class="form-inner-field quantity">
											    <label><span>Number of dependents</span></label>
										    	<form:input type="text" value="" class="text-box number commoncheck" id="nodep" maxlength="2" path="numberOfDependants" />
										    	<div class="help-icon"><i class="fa fa-info"></i></div>
											</div>
											<!-- <div class="error-message"><strong>This is a required field, please enter 0 if not applicable</strong></div> -->
											
											<div class="help-message"> <liferay-ui:journal-article articleId='<%=PortletProps.get("Dependents_help")%>' groupId="<%=groupid%>"  ></liferay-ui:journal-article> </div>
										</div>
										
										<div class="form-row small-form-row add-text-box"> 
										<div class="error-message">
												<strong>   <liferay-ui:journal-article articleId='<%=PortletProps.get("Date_of_birth_error")%>' groupId="<%=groupid%>"  ></liferay-ui:journal-article> </strong>
											</div>
											<div class="form-inner-field date-of-birth">
												<label><span>Date of birth  </span></label>
  												<%-- <fmt:formatDate value="${Customer.dateOfBirth}" var="dateString" pattern="MM/dd/yyyy" /> --%>
  												 
  												<!--  -->
  												
  								            <fmt:parseDate value="${Customer.dateOfBirth}" var="parsedDate"  pattern="yyyy-MM-dd" />
                                            <fmt:formatDate value="${parsedDate}" var="dateString" pattern="dd-MM-YYYY" />  
  								             <form:input  type="text" value="${dateString}" class="text-box number datepicker dob-text-box" path="dateOfBirth" readonly="true" />
  								             
												<i class="fa fa-calendar"></i>
											</div>
											
										</div>
										<div class="form-row">
										<div class="error-text"><strong><liferay-ui:journal-article articleId='<%=PortletProps.get("home_telephone_number_errormsg")%>' groupId="<%=groupid%>"  ></liferay-ui:journal-article></strong></div>
											<div class="form-inner-field">
												<label>
													<span>Home telephone number <br>(Optional)</span>
												</label>
												<form:input  type="text" value="" class="text-box number" id="homenumber" maxlength="11" path="homePhoneNumber" />
											</div>
										</div>
									</div>
									<!-- 2-1 step end -->
								</div>
							</div>
							<!-- 2nd step end -->
						</div>
 
						 <div class="third-step form-steps">
							<!-- 3nd step -->
							<div class="title-icon">
								<h4>Verify mobile</h4>
							</div>
							<div class="form-second-common form-second-row">
								<div class="mobile-frist-step">
									<p> <liferay-ui:journal-article articleId='<%=PortletProps.get("Verification_code_help")%>' groupId="<%=groupid%>"  ></liferay-ui:journal-article>   </p>
									<div class="form-row number-blk">
										<div class="form-inner-field">
											<label><span>Mobile number</span></label>
											<form:input type="text" value="" class="text-box number commoncheck mobilenumber" id="mNumber" placeholder="" maxlength="20" path="mobilePhoneNumber" />
											<button type="button" class="button noverify" onclick="verifyMobileNumber()" >START VERIFICATION</button>
										</div>
										<div class="error-message"> <liferay-ui:journal-article articleId='<%=PortletProps.get("Mobile_phone_error")%>' groupId="<%=groupid%>"  ></liferay-ui:journal-article> </div>
									</div>
								</div>
								<div class="preloader-cube hidden-element mobile-second-step"> 
									<img src="${themeDisplay.pathThemeImages}/preloader.gif"/>
									<span>Thank you for submitting your mobile number. <br /> We are sending you a text message...</span>
								</div> 
								<div class="form-row number-blk hidden-element mobile-third-step">
									<p> <liferay-ui:journal-article articleId='<%=PortletProps.get("Verification_code_sent_help")%>' groupId="<%=groupid%>"  ></liferay-ui:journal-article>   </p>
									<div class="form-inner-field">
										<label><span>Verification number</span></label>
										<input type="text" value="" class="text-box number commoncheck verfiy-no" id="smscode" placeholder="" maxlength="4"  />
										<button type="button" class="button newCode" onclick="validateSmsCode()">SUBMIT</button>
										<button type="button" class="resend-opt" onclick="verifyMobileNumber()">Resend verification code</button>
									     
										 <div class="change-no-verfication ">Change mobile number</div>
									</div>
									
									<div class="resend">
									
										<div class="infoText"> 
											If you didn&#39t receive a code please check your mobile phone number is correct and select resend code
										</div>
									</div>
								</div>
								<div class="preloader-cube hidden-element mobile-fourth-step">
									<img src="${themeDisplay.pathThemeImages}/preloader.gif"/>
									<span>OK, we are now verifying your mobile number...</span>
								</div>
								<div class="form-row number-blk hidden-element mobile-fifth-step">
									<div class="form-inner-field">
										<label><span>Mobile number</span></label>
										<input type="text" value="" class="text-box number commoncheck changeNo" placeholder="" maxlength="14">
									</div>
									<div class="change-no">Change mobile number</div>
								</div>
								<div class="hidden-element mobile-error-no">
									<p>The number you have entered does not seem to be valid. Please recheck your number and try again. You can also call us on 0131 335 0620 to talk to us.</p>
									<div class="form-row number-blk">
										<div class="form-inner-field">
											<label><span>Mobile number</span></label>
							<input type="text" value="" class="text-box number commoncheck mobilenumber" id="mNumber-error" placeholder="" maxlength="14">
							<button type="button" class="noverify sendCode"  onclick="verifyMobileNumberOnError()">START VERIFICATION</button>
										</div>
										<div class="error-message"><strong>Please enter your mobile number to proceed</strong></div>
									</div>
								</div>
							</div>
							<!-- 3nd step end -->
						</div> 


														<div class="fourth-step form-steps">
							<!-- 4nd step -->
							<div class="title-icon">
								<h4>Your address</h4>
							</div>
							<div class="form-third-common form-third-row"  >
								<div class="address-block">
									<div class="address-details">
									<c:choose>
									<c:when test="${fn:length(addresslist) gt 0}" >
									  <c:forEach items="${addresslist}" var="occupan" varStatus="status" >
										<div class="address-wrapper">
											<div class="form-row address-post">
											<div class="error-message"><strong> <liferay-ui:journal-article articleId='<%=PortletProps.get("Postcode_error")%>' groupId="<%=groupid%>"  ></liferay-ui:journal-article> </strong></div>
												<div class="form-inner-field postcode">
												    <label><span>Postcode</span></label>
												    <input type="text"  class="text-box postcodeBox"  maxlength="10" id="postcode${status.index}"	value="${occupan.address.postCode}"/>
 													  <form:input type="hidden" value=""  id="postcodee${status.index}"	path="addressHistory.occupancy[${status.index}].address.postCode"  />
													 <form:input type="hidden" value="" id="propertyNumber${status.index}" path="addressHistory.occupancy[${status.index}].address.propertyNumber"  />
													<form:input type="hidden" value="" id="propertyName${status.index}" path="addressHistory.occupancy[${status.index}].address.propertyName" />
													<form:input type="hidden" value="" id="flat${status.index}" path="addressHistory.occupancy[${status.index}].address.flat" />
													<form:input type="hidden" value="" id="streetName${status.index}" path="addressHistory.occupancy[${status.index}].address.streetName"  />
													<form:input type="hidden" value="" id="postTown${status.index}" path="addressHistory.occupancy[${status.index}].address.postTown"  />
													<form:input type="hidden" value="" id="county${status.index}" path="addressHistory.occupancy[${status.index}].address.county"  />
													<form:input type="hidden" value="" id="district${status.index}" path="addressHistory.occupancy[${status.index}].address.district" />
												
													<%-- <form:input type="hidden" id="movingindate" path="addressHistory.occupancy[${status.index}].movingInDate" value="<%=date %>" /> --%> 
													
													<form:input type="hidden"  id="movingindate${status.index}" path="addressHistory.occupancy[${status.index}].movingInDate"  />
													
													<button class="button button-white addressbutton" id="findAddress${status.index}" disabled="disabled" onclick="getAddress('${status.index}')" type="button" >Find Address</button>
												</div>
												<div class="preloader" id="pre${status.index}"> 
													<div class="preloader-cube">
														 <img src="${themeDisplay.pathThemeImages}/preloader.gif"/>
														<%-- <img src="${themeDisplay.getPathThemeImages}/image.png" /> --%>
													</div>
										    	</div>							
												
											</div>
											<div class="address-list">
												<div class="choose-address" id="chooseAdd0">
													<div class="list-of-address address-list-block">
														<ul class="address-list-inner" id="${status.index}">
														  
														  
														</ul>
													</div>
													<!-- <button class="button button-white confirmbutton">Locate address</button> -->
												</div>
											</div>
											<div class="choosed-address" id='choosed${status.index}'>
												<label>Address</label>
												<div class="confirm-address" id="confirm${status.index}">
												
												 <span >${occupan.address.propertyNumber} </span>
													<span> ${occupan.address.propertyName} </span>
													<span> ${occupan.address.flat} </span>
													<span> ${occupan.address.streetName} </span>
													<span> ${occupan.address.postTown} </span>
													<span> ${occupan.address.county} </span>
													<span> ${occupan.address.district} </span>
										 	
										 			</div>
												

											</div>
											<c:if test="${status.index eq 0}">
											 <div class="form-row occupancy-row">
											<div class="error-message"><strong><i class="fa fa-info-circle"></i>    <liferay-ui:journal-article articleId='<%=PortletProps.get("Type_of_occupation_error")%>' groupId="<%=groupid%>"  ></liferay-ui:journal-article>  </strong></div>
												<div class="form-inner-field">
													<label><span>Type of occupancy</span></label>
													<input type="hidden" value="0" class="hiddenInput">
													<div class="drop-down">
														<form:select  data-placeholder="Type of occupancy" class="select-drop-down occupancy" path="occupancyTypeID" >
												<form:option value="">Please select an option</form:option>
												 <form:options items="${residentialStatus}" /> 
												
											</form:select>
											 <!-- <div class="help-icon"><i class="fa fa-info"></i></div> -->
												    </div>
												   <!--   <div class="help-message">Your select this option</div> -->
												</div>
												
											</div>
											
											</c:if> 
											<div class="form-row small-form-row add-text-box how-long-u ">
												<div class="form-inner-field change-yr-mnth clearfix">
													<label><span> How long you have lived at this address<%-- <liferay-ui:journal-article articleId='<%=PortletProps.get("How_long_have_you_lived_here_error")%>' groupId="<%=groupid%>"  > --%><%-- </liferay-ui:journal-article> --%> </span></label>
													<div class="small-box">
														   <form:input type="text" maxlength="2" class="text-box small-text-box number time-year" value="" path="addressHistory.occupancy[${status.index}].stayYear" id="year${status.index}"/>
													
														<label><span>Years</span></label>
													</div>
													<div class="small-box">
														<form:input type="text" class="text-box number time-month" maxlength="2" id="month${status.index}" value="" path="addressHistory.occupancy[${status.index}].stayMonth"/>
														<label><span>Months</span></label>
													</div>
													
													
														
											<%-- 			<form:hidden  path="Customer.addressHistory.occupancy[0].movingInDate"  value="<%=date%>" /> --%>
												</div>
												<!--<div class="help-message">Please let us know in years & months, for how long you have lived at this address</div>-->
												<div class="error-message"><strong>This field is mandatory</strong></div>
											</div>
											 <div class="poscodeErrorMsg" id='poscodeErrorMsg${status.index}'> </div>
												<div class="repeated-address">
											
												</div>
												
										</div>
										<script type="text/javascript">
										var cindex = '${status.index}';
										$('#choosed'+cindex).slideDown();
										
										</script>
										</c:forEach>
										
										</c:when>
										
										<c:otherwise>
										 			<div class="address-wrapper">
											<div class="form-row address-post">
											<div class="error-message"><strong> <liferay-ui:journal-article articleId='<%=PortletProps.get("Postcode_error")%>' groupId="<%=groupid%>"  ></liferay-ui:journal-article> </strong></div>
												<div class="form-inner-field postcode">
												    <label><span>Postcode</span></label>
												      <input type="text" value="" class="text-box postcodeBox" placeholder="AB15XY" maxlength="10" id="postcode0"	/>
 													  <form:input type="hidden" value=""  id="postcodee0"	path="addressHistory.occupancy[0].address.postCode" />
													 <form:input type="hidden" value="" id="propertyNumber0" path="addressHistory.occupancy[0].address.propertyNumber" />
													<form:input type="hidden" value="" id="propertyName0" path="addressHistory.occupancy[0].address.propertyName" />
													<form:input type="hidden" value="" id="flat0" path="addressHistory.occupancy[0].address.flat" />
													<form:input type="hidden" value="" id="streetName0" path="addressHistory.occupancy[0].address.streetName" />
													<form:input type="hidden" value="" id="postTown0" path="addressHistory.occupancy[0].address.postTown" />
													<form:input type="hidden" value="" id="county0" path="addressHistory.occupancy[0].address.county" />
													<form:input type="hidden" value="" id="district0" path="addressHistory.occupancy[0].address.district" />
													<form:input type="hidden" id="movingindate" path="addressHistory.occupancy[0].movingInDate" value="<%=date %>" /> 
													
													<button class="button button-white addressbutton" id="findAddress0" disabled="disabled" onclick="getAddress('0')" type="button" >Find Address</button>
												</div>
												<div class="preloader" id="pre0"> 
													<div class="preloader-cube">
														 <img src="${themeDisplay.pathThemeImages}/preloader.gif"/>
														<%-- <img src="${themeDisplay.getPathThemeImages}/image.png" /> --%>
													</div>
										    	</div>							
												
											</div>
											<div class="address-list">
												<div class="choose-address" id="chooseAdd0">
													<div class="list-of-address address-list-block">
														<ul class="address-list-inner" id="0">
														  
														  
														</ul>
													</div>
													<!-- <button class="button button-white confirmbutton">Locate address</button> -->
												</div>
											</div>
											<div class="choosed-address" id='choosed0'>
												<label>Address</label>
											 <div class="confirm-address" id="confirm0">
												    <span >${Customer.addressHistory.occupancy[0].address.propertyNumber} </span>
													<span> ${Customer.addressHistory.occupancy[0].address.propertyName} </span>
													<span> ${Customer.addressHistory.occupancy[0].address.flat} </span>
													<span> ${Customer.addressHistory.occupancy[0].address.streetName} </span>
													<span> ${Customer.addressHistory.occupancy[0].address.postTown} </span>
													<span> ${Customer.addressHistory.occupancy[0].address.county} </span>
													<span> ${Customer.addressHistory.occupancy[0].address.district} </span>
										 	</div>

											</div>
											<div class="form-row occupancy-row">
											<div class="error-message"><strong><i class="fa fa-info-circle"></i>    <liferay-ui:journal-article articleId='<%=PortletProps.get("Type_of_occupation_error")%>' groupId="<%=groupid%>"  ></liferay-ui:journal-article>  </strong></div>
												<div class="form-inner-field">
													<label><span>Type of occupancy</span></label>
													<input type="hidden" value="0" class="hiddenInput">
													<div class="drop-down">
														<form:select  data-placeholder="Type of occupancy" class="select-drop-down occupancy" path="occupancyTypeID" >
												<form:option value="">Please select an option</form:option>
												 <form:options items="${residentialStatus}" /> 
												
											</form:select>
											 <!-- <div class="help-icon"><i class="fa fa-info"></i></div> -->
												    </div>
												   <!--   <div class="help-message">Your select this option</div> -->
												</div>
												
											</div>
											<div class="form-row small-form-row add-text-box how-long-u ">
												<div class="form-inner-field change-yr-mnth clearfix">
													<label><span> How long you have lived at this address<%-- <liferay-ui:journal-article articleId='<%=PortletProps.get("How_long_have_you_lived_here_error")%>' groupId="<%=groupid%>"  > --%><%-- </liferay-ui:journal-article> --%> </span></label>
													<div class="small-box">
														   <form:input type="text" maxlength="2" class="text-box small-text-box number time-year" value="" path="addressHistory.occupancy[0].stayYear" id="year0"/>
													
														<label><span>Years</span></label>
													</div>
													<div class="small-box">
														<form:input type="text" class="text-box number time-month" maxlength="2" id="month0" value="" path="addressHistory.occupancy[0].stayMonth"/>
														<label><span>Months</span></label>
													</div>
													
													
														
											<%-- 			<form:hidden  path="Customer.addressHistory.occupancies[0].movingInDate"  value="<%=date%>" /> --%>
												</div>
												<!--<div class="help-message">Please let us know in years & months, for how long you have lived at this address</div>-->
												<div class="error-message"><strong>This field is mandatory</strong></div>
											</div>
											 <div class="poscodeErrorMsg" id='poscodeErrorMsg0'> </div>
												<div class="repeated-address">
											
												</div>
												
										</div>
																 			
										                   
										 
										</c:otherwise>
										</c:choose>
										
										
									</div>
								</div>
							</div>
							
						</div>


						<div class="fifth-step form-steps">
							<!-- 5nd step -->
							<div class="title-icon">
								<h4>Your bank details</h4>
							</div>
							<div class="form-fourth-common form-fourth-row">
								<div class="form-row">
								<div class="error-message"><strong>   <liferay-ui:journal-article articleId='<%=PortletProps.get("Account_name_error")%>' groupId="<%=groupid%>"  ></liferay-ui:journal-article> </strong></div>
									<div class="form-inner-field">
										<label><span>Account name</span></label>
										<form:input type="text" value="" class="text-box alphabetonly" id="bankname" maxlength="100"   path="bankAccount.accountName"  />
										<div class="help-icon"><i class="fa fa-info"></i></div>
									</div>
									<div class="help-message"> <liferay-ui:journal-article articleId='<%=PortletProps.get("Account_name_help")%>' groupId="<%=groupid%>"  ></liferay-ui:journal-article> </div>
									
						        </div>
						        
								<div class="form-row small-form-row add-text-box sort-code">
								<div class="error-message"><strong> <liferay-ui:journal-article articleId='<%=PortletProps.get("Sort_code_error")%>' groupId="<%=groupid%>"  ></liferay-ui:journal-article> </strong></div>
									<div class="form-inner-field clearfix">
										<label><span>Sort Code</span></label>
										<div class="clearfix">
											<div class="small-box">
												<form:input type="text" value="" class="text-box small-text-box number" id="sort1" placeholder="00" maxlength="2" path="bankAccount.sortCode1" />
											</div>
											<div class="small-box">
												<form:input type="text" value="" class="text-box small-text-box number" id="sort2" placeholder="00" maxlength="2" path="bankAccount.sortCode2" />
											</div>
											<div class="small-box">
												<form:input type="text" value="" class="text-box small-text-box number" id="sort3" placeholder="00" maxlength="2" path="bankAccount.sortCode3"  />
												<form:input type="hidden" value=""  path="bankAccount.sortCode" id="sortcode"/>
											</div>
											<input type="hidden" id="checkCode" value="">
										</div>
									</div>
									<!--  <div class="help-message">Enter the 6 digit sort code</div>-->
								</div>
								<div class="form-row small-form-row">
									<div class="error-message"><strong> <liferay-ui:journal-article articleId='<%=PortletProps.get("Account_number_error")%>' groupId="<%=groupid%>"  ></liferay-ui:journal-article> </strong></div>
									<div class="form-inner-field">
										<label><span>Account Number</span></label>
										<form:input type="text" value="" class="text-box number" id="accountnumber" maxlength="8" path="bankAccount.accountNumber"  />
									</div>
								
								</div>
							</div>
							<!-- 5nd step end-->
						</div>

						<div class="six-step form-steps">
							<!-- 6nd step -->
							<div class="title-icon">
								<h4>Marketing preferences</h4>
							</div>
							<div class="form-fifth-common form-fifth-row">
								 <liferay-ui:journal-article articleId="<%=marketingpreferences%>" groupId="<%=groupid%>"  ></liferay-ui:journal-article>
						<div class="form-row">
							<div class="marketing-check-box checkBox">
								<form:checkbox type="checkbox" id="sms" class="formcheck mark-check marketing-check" path="contactBySMS"  />
								<label for="sms"><span>SMS</span></label>

								<form:checkbox type="checkbox" id="email" class="formcheck mark-check marketing-check" path="contactByEmail"  />
								<label for="email"><span>Email</span></label>

								<form:checkbox type="checkbox" id="post" class="formcheck mark-check marketing-check"  path="contactByPost" />
								<label for="post"><span>Post</span></label>

								<input  type="checkbox" id="nomarketing" class="formcheck marketing-check" name="checkbox" />
								<label for="nomarketing"><span>No marketing</span></label>
							</div>
							<div class="error-message margin-left-zero"><strong><liferay-ui:journal-article articleId='<%=PortletProps.get("marketing_preferences_error")%>' groupId="<%=groupid%>"  ></liferay-ui:journal-article></strong></div>
						</div>
							</div>
							<!-- 6nd step end -->
						</div>

						<script>
						var s = '${Customer.bankAccount.sortCode}';
						if(s != '') {
							var resultstr = s.match(new RegExp('.{1,'+2+'}', 'g'));
							$('#sort1').val(resultstr[0]);
							$('#sort2').val(resultstr[1]);
							$('#sort3').val(resultstr[2]);
						}
							/* (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
							  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
							 m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
							  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
							 ga('create', 'UA-75505176-1', 'auto'); */
 						</script>

						<!-- contiune and save button section start -->
						<div class="final-step clearfix">
						
						<button  type="button" class="button button-primary next-pages final-valid fL grey-button" id="continuebtn" value="CONTINUE" >CONTINUE </button>
						<!-- <button type="button" class="button button-primary next-pages final-valid fL grey-button" data-link="affordability.shtml" onclick="ga('send', 'pageview', 'contact?message=' );">CONTINUE <i class="fa fa-chevron-right"></i></button> -->
							<!-- <button type="button" class="button button-secondary button-small fR"><i class="fa fa-download"></i> SAVE</button> -->
						</div>
						<!-- contiune and save button section end -->
						<!-- back and Cancel button section start -->
						<div class="bottom-button-row clearfix">
							<div class="fL"> <a href='javascript:submitForm("BACK");'> <i class="fa fa-chevron-left" onClick="goBack()"></i> Back </a> </div>
							<div class="fR"> <a href='javascript:submitForm("CANCEL");'> <i class="fa fa-times"></i> Cancel </a> </div>
						</div>
						<!-- back and Cancel button section end -->
					</div>
				<!-- Personal Information end-->
				</article>
					<!-- column 9 article end-->
	                <!-- Sidebar -->
					<!--#include file="aside.html"-->
	                <!-- Sidebar end -->
	                <!-- Sticky side bar bottom boundary -->
	                  
				<%@ include file="/html/loanjourney/aside.jsp" %>
                <div id="stick-offset" class="clear"></div>
            </div>
            <!-- row end-->
            
            <form:input type="hidden" path="deviceDetails.blackBox1" id="blackBox1" value="" />
          <form:input type="hidden" path="deviceDetails.blackBox2" id="blackBox2" value="" />
          		 <%
						HttpServletRequest Lrequest = PortalUtil.getHttpServletRequest(renderRequest);
						String clientIp = PortalUtil.getOriginalServletRequest(Lrequest).getRemoteAddr();

				%>
          <form:input type="hidden" path="deviceDetails.ipAddress"  value="<%=clientIp%>"/>
            </form:form>
        </div>
    </section>
    
     <%@ include file="/html/loanjourney/footer.jsp" %>
    <script>
    
 
  if(openbank === "1"){
	  $('.form-fourth-common').slideDown(function() {
	        $('.form-fourth-common').removeClass('form-fourth-row');
	        $(this).parents('.form-steps').addClass('open');
	    }); 
	  
  }/* else{
	  
	  $('.form-third-common').slideDown(1000, function() {
          $('.form-third-common').removeClass('form-third-row');
          $(this).parents('.form-steps').addClass('open');
      });
  } */
    var $titleTexts = $('.third-step .title-icon h4');
    function verifyMobileNumber(){
    	var resorceUrl='<%=mobileVarificationURL.toString()%>';
    	var mobNumber=$('#mNumber').val(); 
    	sendVarificationCode(mobNumber,resorceUrl);
    }
    
    function verifyMobileNumberOnError(){
    	var resorceUrl='<%=mobileVarificationURL.toString()%>';
    	var mobNumber=$('#mNumber-error').val(); 
    	sendVarificationCode(mobNumber,resorceUrl);
    }
    function sendVarificationCode(mobNumber,resorceUrl){ 
    	
    	
    	$('.noverify').parents(".mobile-frist-step").fadeOut(500, function(){
            $('.mobile-second-step').fadeIn(800, function(){
                $(this).fadeOut(1000, function(){
                   //$titleText.text('Verification number sent');
          //          $('.mobile-third-step').fadeIn();
               });
           });
        }); 	
    	
    	$.ajax({
    		url : resorceUrl,
    		type : 'GET',
    		data : {				
    			mobileNumber:mobNumber
    		},
    		async : true,
    		success : function(serverResponse) {
    			
    			 
    			
    			$('.mobile-error-no').hide();
    			//$('#mobilenumber').parents('.form-row').find('.fa-check').remove();
    			/* alert(serverResponse); */
    			
    			
    			if(serverResponse == "Code Sent"){   
    				
    				$titleTexts.text('Verification number sent');
    				$('.mobile-third-step').fadeIn();
    				   $('#smscode').focus();
    			}else if(serverResponse == "New Code"){
    				
    				$('#mobilenumber').parents('.form-row').append('<i class="fa fa-check"></i>');
    			}			
    			else{	
    					$('.mobile-third-step').fadeOut(500, function(){
    						setTimeout(function(){
    							$('.mobile-error-no').fadeIn();
    						}, 1000);
    					 
    				});	 	  
    			}
    			
    		}
    	});	
    }
    
    function validateSmsCode(){    	
    	var Url='<%=smsURL.toString()%>';
    	var smsCode=document.getElementById("smscode").value;
    	verifySms(Url,smsCode);    	
    }
    
    function verifySms(resorceUrl,sms){

    	$.ajax({
    		url : resorceUrl,
    		type : 'GET',
    		data : {				
    			smsCode:sms
    		},
    		async : true,
    		success : function(serverResponse) {		
    			
    			/* alert("pin : "+serverResponse); */
    			if(serverResponse == "pin valid"){
    			
    				 $titleTexts.text('Success! Your mobile number has been verified.');
    				 $('.mobile-fifth-step').fadeIn(1200, function(){
                         $('.form-third-common').slideDown(1000, function() {
                             $('.form-third-common').removeClass('form-third-row');
                             $(this).parents('.form-steps').addClass('open');
                             $('#postcode0').focus();
                         });
                         $('.error-message').hide();
                         
                     });
    							
    			}else if(serverResponse == "pin is not correct"){
    		       /*  $titleTexts.text('Success! Your mobile number has been verified.');
    				 $('.mobile-fifth-step').fadeIn(1200, function(){
                         $('.form-third-common').slideDown(1000, function() {
                             $('.form-third-common').removeClass('form-third-row');
                             $(this).parents('.form-steps').addClass('open');
                             $('#postcode0').focus();
                         });
                         $('.error-message').hide();
                     });  */  
    				
    			       $titleTexts.text('Invalid Pin');
    				$('.mobile-third-step').fadeIn();     
    			}else if(serverResponse == "pin time out"){
    				
    				$titleTexts.text('Pin Time Out');
    				$('.mobile-third-step').fadeIn();
    			}
    			else{
    				
    				$titleTexts.text('Some Thing Wrong Please Try Again');
    				$('.mobile-third-step').fadeIn();
    			}
    		}
    	});
    	}
    
   /*  $('.form-fourth-common').slideDown(function() {
        $('.form-fourth-common').removeClass('form-fourth-row');
        $(this).parents('.form-steps').addClass('open');
    }); */
   /*  var timeoutId;

    
    
    function useBlackboxString(intervalCount) {
        if (typeof ioGetBlackbox !== 'function') {return;}

        var bbData = ioGetBlackbox();
        if (bbData.finished) {
            clearTimeout(timeoutId);
            document.getElementById('blackBox1').value = (bbData.blackbox).replace(/\+/g,'%2B');
            document.getElementById('blackBox2').value = (bbData.blackbox).replace(/\+/g,'%2B');
        }
    }
     timeoutId = setInterval(useBlackboxString, 500); */
     
     function useBlackboxString(intervalCount) {
    	 
    	// alert("useBlackboxString method");
    	 
         if (typeof ioGetBlackbox !== 'function') {return;}
         var bbData1 = fpGetBlackbox();
         var bbData2 = ioGetBlackbox();
         var fie = window.navigator.userAgent;
         var msie = fie.indexOf("Chrome");
         
         
         if(msie =='-1') {
        	 if((bbData1.blackbox).length>=1000 && (bbData2.blackbox).length>=1000) {
        		 clearTimeout(timeoutId);
	             document.getElementById('blackBox1').value =(bbData1.blackbox).replace(/\+/g,'%2B');
	             document.getElementById('blackBox2').value =(bbData2.blackbox).replace(/\+/g,'%2B');	
	             
        	}
         } else {
        	if (bbData2.finished) {
	             clearTimeout(timeoutId);
	              document.getElementById('blackBox1').value =(bbData1.blackbox).replace(/\+/g,'%2B');
	             document.getElementById('blackBox2').value =(bbData2.blackbox).replace(/\+/g,'%2B');
	        }        	
        }
     }
      timeoutId = setInterval(useBlackboxString, 500);    
    
    function validateEmailId(){	
    
    	var Url='<%=validateEmailURL.toString()%>';
    	var emailId=document.getElementById("femail").value;
    	var firstname=document.getElementById("firstname").value;
    	var lastname=document.getElementById("Lname").value;
    	var titleid=document.getElementById("title-gender").value;
    	
    	
    	if(emailId != '' && firstname !='' && lastname !='' && titleid !='' ){
    		if (emailVal(emailId)){
    			$('.valid-preloader').fadeIn();
        		validateEmail(Url,emailId,firstname,lastname,titleid);
	        }
    	}
    }
    function validateEmail(resorceUrl,emailId,firstname,lastname,titleid){	
    	 $('#valid-address .alert-message').hide();
    	/*  $('#valid-address .alert-message').hide(); */
    	
    	$.ajax({
    		url : resorceUrl,
    		type : 'GET',
        	data : {				
    			email:emailId,
    			fname:firstname,
    			lname:lastname,
    			title:titleid
    		},
    		async : true,
    		success : function(serverResponse) {
    			
    			if(serverResponse == "true"){	
    				// user is known therefore show him error msg
    			    $('.valid-preloader').delay(1200).fadeOut();
    			    $('#valid-address .alert-message').show();
    			    $('#valid-address').fadeIn(1200);
    			    $('.security-block').slideUp();
    	
    			    
    			    
    			}else if(serverResponse == "false"){
    				        var vald = $("#femail").val();
    				        if (emailVal(vald)){
    				            $('.valid-preloader').fadeIn(800, function(){
    				                $(this).fadeOut(1000, function(){
    				                    $(this).parents('.form-row').find('.fa-check').fadeIn();
    				                    $('#valid-address').fadeIn();
    				                });
    				            });
    				            $('.security-block').slideDown();
    				            $('#password').focus();
    				        }else{
    				            $('.security-block').slideUp();
    				        }
    				  
    				  $(document).on('change', '#about-form-first', function(){
    				        var tit = $("#title-gender option:selected").text(); 
    				        var a = $('#firstname').val(); 
    				        var b = $('#Lname').val();  
    				        var c = $('#femail').val(); 

    				        if ((tit.length != 0) && (a.length != 0) && (b.length != 0) && ((c.length != 0) && (emailVal(c)))) {            
    				            $('.security-block').slideDown();
    				            $('#password').focus();
    				        }else{
    				             $('.security-block').slideUp();
    				        } 
    				    }); 
    				  
    				  
    				
    				
    				// user is not known therefore allow him to fill details
    				 $('#valid-address .alert-message').hide();
    				  $('.valid-preloader').delay(800).fadeOut();
    				  $('#femail').parents('.form-row').find('.fa-check').fadeIn(1200);
    	    		// $('.security-block').slideDown(); 
    			}
    			
    		}
    	});
    }
   /*  $('#password').focusout(function(){
    	var regularExpression = /${regexp}/;
    	var pwd = $('#password').val();
    	if (!regularExpression.test(pwd)) {
    	   alert("password is not valid");
    		$('#password').parents('.form-row').find('.error-message').show();
            $('#password').parents('.form-inner-field').addClass('addRed');
    	}
    	
    }); */
    $('#password').on('change', function() {
    	/* alert(); */
    	var regularExpression = /${regexp}/;
    	var pwd =$(this).val();
    	
            if (regularExpression.test(pwd)) {
            	/* alert("valid"); */
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
   /*  if ($('#purpose-of option:selected').val() != 0) {
   	 $('#others').slideUp();
        $('.form-first-row').slideDown(function() {
            $('html, body').animate({
                scrollTop: $(this).offset().top - 125
            }, 1500);
        });
   } */

    function submitForm(submitVal){
	    	 var dob=$("#dateOfBirth").val();
	    	   if(dob =="" || dob ==null)
	    	  {
	    		   $("#dateOfBirth").val('13-06-1984');   
	    	  }
	    	 
    	 $('#customerform1').append("<input type='hidden' name='submitValue' value='"+ submitVal+"' />");
         $('#customerform1').submit();
    	return false;
    	
    } 
    
 
    function getAddress(divisionId){
    	  //  $(document).on('click', '.addressbutton', function() {
    	    	//  var index = $(this).parent().index();
    	    	  
    	            /*  $(this).fadeOut(800, function() {
    	                 $(this).parents('.address-wrapper').find('.choose-address').slideDown(800);
    	                 $(this).parents('.address-wrapper').find('.postcodeBox').prop('disabled', true);
    	                 $(this).parents('.address-wrapper').find('.addressbutton').attr('disabled', true);
    	             }); */
    	    	  /*   $('.preloader').fadeIn(500, function() {
    	    	        $(this).fadeOut(500, function() {
    	    	            $('#choose-address').fadeIn(500);
    	    	        });
    	    	    });  */
    	    	    var postcode = $('#postcode'+divisionId).val();
    	    	    var postcodeRegEx = /[A-Z]{1,2}[0-9]{1,2} ?[0-9][A-Z]{2}/i;
    	    	  
    	    	    if(!postcodeRegEx.test(postcode)) {
    	    	    	alert("Post code is invalid - "+postcode );
    	    	     return postcodeRegEx.test(postcode); 
    	    	    } 
    	    	    $('#findAddress'+divisionId).parents('.address-wrapper').find('#pre'+divisionId).fadeIn();  
    	    	    var  requestUrl = '<%=addressUrl.toString()%>';
    	    	  /*   alert("request url "+requestUrl); */
    	    	  
    	    		$.ajax({
    	    			url :requestUrl,
    	    			type : 'GET',
    	    			data : {				
    	    				postcodereq : postcode,
    	    				divId:divisionId
    	    			},
    	    			async : true,
    	    			success : function(serverResponse) {
    	    				/*  $(this).find('.address-list-inner').mCustomScrollbar('destroy'); */
    	                     /* $(this).find('.address-list-inner').empty(); */
    	    			 
    	    				     $("#"+divisionId).mCustomScrollbar('destroy');  
    	    				   $("#"+divisionId).empty();
    	    				var res  = $.parseJSON(serverResponse);
    	    			var divId=	res[0];
    	    				/*  $("#"+divisionId).parent(".list-of-address").append('<li>Select your address...</li>'); */
    	    				 $("#"+divisionId).append('<li id="add'+i+'">Select your address...</li>');
    	    				for( var i = 1; i < res.length; i++) {
    	    				    var addressline = res[i];
    	    				    //console.log(addressline);
    	    				    var newstring = addressline.replace(/,{2,}/g,",");
    	    				   			   
    	    				  $("#"+divisionId).append('<li id="add'+i+'">'+newstring+'</li>');
    	    				
    	    				}
    	    				
    	    				 $('#pre'+divisionId).fadeOut(2000, function() {
    	    					// $('#'+divisionId).slideDown(800);
    	    					 $(this).parents('.address-wrapper').find('#chooseAdd'+divisionId).slideDown(800); 
    	    					 /*  $(this).parents('.address-wrapper').find('.choose-address ').slideDown(800);  */
    	    	                 /* $('#'+divisionId).parent('.address-wrapper').find('.choose-address').slideDown(800);  */
    	    	                 /*$(this).parents('.address-wrapper').find('.postcodeBox').prop('disabled', true);
    	    	                 $(this).parents('.address-wrapper').find('.addressbutton').attr('disabled', true);*/
    	    	             });			  
    	    				/*  $(this).parents('.address-wrapper').find('.choose-address').slideDown(800); */
    	    				    $(document).on('click', '.address-list-inner li', function() {  
    	    					  /*  $( "#"+divisionId+" li" ).on( "click", function( event ) { */  
    	    					 
    	    						$(this).parents('.address-wrapper').find('#choosed'+divisionId).slideUp(function(){
    	    						 
    	    						 $(this).find('.confirm-address').html('');
    	    					    });  
    	    						  
    	    						  
    	    						  
    	    						  $(this).parents('.address-wrapper').find('#confirm'+divisionId).html('');
    	    				        $(this).parents('.address-wrapper').find('#chooseAdd'+divisionId).fadeOut(function() {
    	    				        	   /* var selectedid = $(this).parents('.address-list').find('.address-list-inner .selected').attr('id'); */
    	    				        	     var selectedid = $(this).parents('.address-list').find('#'+divisionId+' .selected').attr('id');  
    	    				        	   
    	    				        	   
    	       				                var selId=selectedid.replace("add","");
    	       				                
    	       				                
    	       				               var data = res[selId]; 
    	    				        	console.log("data selected"+data);
    	    				           /*  var data = $(this).parents('.address-list').find('.address-list-inner .selected').text(); */
    	    				            var arr = data.split(',');
    	    				           $('#propertyNumber'+divisionId).val(arr[0]);
    	    				           $('#propertyName'+divisionId).val(arr[1]);
    	    				           $('#flat'+divisionId).val(arr[2] +""+arr[3]);
    	    				           $('#streetName'+divisionId).val(arr[4]);
    	    				           $('#postTown'+divisionId).val(arr[5]);
    	    				           $('#county'+divisionId).val(arr[6]);
    	    				           /* $('#postcode'+divisionId).val(arr[7]); */
    	    				           $('#postcodee'+divisionId).val(arr[7]);
    	    				           
    	    				        
    	    				            $(this).parents('.address-wrapper').find('#choosed'+divisionId).slideDown(function(){
    	    				            	  var addressblock ='';
    	    	    				            $.each(arr , function(i, val) { 
    	    	    				            	  addressblock += "<span>"+arr[i] + "</span>";
    	    	    				            	});
    	    	    				            
    	    				                $(this).find('.confirm-address').html(addressblock);
    	    				            });
    	    				        });
    	    				    });
    	    			},
    	    			 complete: function () { 
    	    				 /* alert("complete"); */
    	    				 /* $(".address-list-inner").mCustomScrollbar(); */
    	    				 setTimeout( function(){
    	                         $(".address-list-inner").mCustomScrollbar();
    	                     }, 500);
    	    			    }
    	    		}); 
    	}

    
    var addressindex = 0;
    var $content = '<div class="address-note">We need at least one year of address history. Please enter your previous address. </div>';
    
   
 <%--    $(document).on('change', ".time-month", function() {
        var monthValue = 0;
     
        $('input.time-month').each(function() {
            monthValue += parseInt(this.value);
        });
        yearValue = parseInt($(this).parents('.how-long-u').find('.time-year').val());

        // alert(occInput);
        if (monthValue < 12 && yearValue < 1) {
             $('.address-details').append($content);
           /* makeacall(); */
              addressindex++;
           $.get("<%=getAddressURL.toString() %>", { fieldId: addressindex},
       			function(data){
           
        	 
            $(".occupancy").selectmenu({
                change: function(event, ui) {
                     var occ = $(this).parents('.occupancy-row').find('.occupancy option:selected').val();
                     var occInput = $(this).parents('.occupancy-row').find('.hiddenInput').val(occ);
                        $('.address-details').append(data);
                        $(".address-list-inner").mCustomScrollbar("update");   
                        $('.address-note:first').show();
                        $('.radiobutton').buttonset();
                    }
                });
            
            $('.form-fourth-common').slideUp(function() {
                $('.form-fourth-common').addClass('form-fourth-row');
                $(this).parents('.form-steps').removeClass('open');
            });
           });
        } else {
            $('.form-fourth-common').slideDown(function() {
                $('.form-fourth-common').removeClass('form-fourth-row');
                $(this).parents('.form-steps').addClass('open');
            });
            $('.error-message').hide();
        }
    }); --%>
    
    
   
	<%--  function makeacall(){
		 alert("making a call");
		addressindex++;

		$.get("<%=getAddressURL.toString() %>", { fieldId: addressindex},
			function(data){
			$('.address-details').append(data);
			 $('.form-fourth-common').slideUp(function() {
	                $('.form-fourth-common').addClass('form-fourth-row');
	                $(this).parents('.form-steps').removeClass('open');
	            });
		});
	
	 } --%>
	 
	 
	 
	 var addressBoxNumber=0;
	 $(document).on('blur', ".time-month", function() {
		 var monthValue = 0;
		 
		
		 
		 var tit = $(".occupancy option:selected").text();
		 if ($('.occupancy').parent('.drop-down').hasClass('active')) {
	         	$('.occupancy').parents('.form-row').removeClass('redRow');
	             $('.occupancy').parents('.form-inner-field').removeClass('addRed');
	             $('.occupancy').parents('.form-row').find('.error-message').hide();
	             
	         }else{
	             $('.occupancy').parents('.form-row').addClass('redRow');
	             $('.occupancy').parents('.form-inner-field').addClass('addRed');
	             $('.occupancy').parents('.form-row').find('.error-message').show();
	         }
		 var monthTemp=0;
		 var currentValue=this.value;
		 
		       
		 if(monthTemp==0)
    	 {
		 $(".form-inner-field .time-month").each(function() {
			    monthValue=Number(monthValue)+Number($(this).val());
			    
			});
		 monthTemp=1;
    	 }
		 
	        yearValue = parseInt($(this).parents('.how-long-u').find('.time-year').val());
	        $(".occupancy").selectmenu('refresh');
	        // alert(occInput);
	          addressindex++;
	          var tit = $(this).parents('.address-wrapper').find(".occupancy option:selected").text();
	          var postCode = $(this).parents('.address-wrapper').find('.postcodeBox').val()
	          if(postCode.length > 0 && tit.length<23){ 
	        	  
	        	  if (monthValue < 12 && yearValue < 1) {
	        	
	        	
	        	      $.ajax({
	                    url:'<%=getAddressURL.toString() %>',
	                    type: "GET",
	                    data : { fieldId: addressindex },
	                    dataType: "html",
	                    success: function(data){
	                    	
	                    	$(".address-list-inner").mCustomScrollbar('destroy');
	                          /* $($content).appendTo( '.address-details > .address-wrapper' ).show(); */ 
	                       
	                        $('.address-details').append(data);
	                        //find('.repeated-address').append(data);
	                        
	                      //  $('.address-note:first').show();
	                       /*   $($content).appendTo( '.address-details > .address-wrapper' ).show(); 
	                        $('.address-note:gt(0)').remove();  */
	                        
	                        setTimeout( function(){
	                            $(".address-list-inner").mCustomScrollbar();
	                            $.widget('app.selectmenu', $.ui.selectmenu, {
		                            _drawButton: function() {
		                                this._super();
		                                var selected = this.element.find('[selected]').length,
		                                    placeholder = this.options.placeholder;
		                                if (!selected && placeholder) {
		                                    this.buttonText.text(placeholder);
		                                }
		                            }
		                        });
		                        /*jquery ui selectbox placeholder end*/

		                        /*jquery ui selectbox common start*/
		                        $('.select-drop-down').each(function() {
		                            var $placeholder = $(this).data('placeholder');
		                            $(this).selectmenu({
		                                placeholder: $placeholder
		                            });
		                        });
	                        }, 500);
	                        
	                        
	                       
	                        $('.form-fourth-common').slideUp(function() {
	                            $('.form-fourth-common').addClass('form-fourth-row');
	                            $(this).parents('.form-steps').removeClass('open');
	                        });  
	                        
	                        $($content).appendTo('#poscodeErrorMsg'+addressBoxNumber).show();
	                       // $('.address-note:gt(0)').remove();  
	                        addressBoxNumber=addressBoxNumber+1;
	                        
	                        
	                                  
	                       // $this.closest('.newAddressRow').nextAll('.addedMoreAddress').remove();
	                    }
	                });
	        } else {
	        	
	        	//removeAddressIndex(addressindex);
	        	
	        	$(this).closest('.address-wrapper').nextAll('div').remove();
	        	var tit = $(".occupancy option:selected").text();
	 	        if (tit == "" && tit.length<23) {
	 	        	$('.form-fourth-common').slideUp(function() {
		                $('.form-fourth-common').addClass('form-fourth-row');		      
		            });
	 	        } else {
	 	        	$('.form-fourth-common').slideDown(function() {
		                $('.form-fourth-common').removeClass('form-fourth-row');
		                $(this).parents('.form-steps').addClass('open');
		                $('.address-note').remove();
		                $("#bankname").focus();
		            });
	 	        }
	        	
	 	       
	            //$('.error-message').hide();
	        }
	          }
	    });
	 
	 
	 
	  function removeAddressIndex(addressindexs)
	  {
		  $.ajax({
              url:'<%=removeAddressURL.toString() %>',
              type: "GET",
              data : { removeId: addressindexs },
               success: function(data){
                
             },
		  });
	  }   
	 
	 
	  $(document).on('change', ".time-year", function() {
		    
		    var yearId=this.id;
		    var indexId = yearId.substring(4, 5);
		    
		  yearValue = parseInt($(this).parents('.how-long-u').find('.time-year').val());
	        if(yearValue>0)
	        	{
	        	 
	        	removeAddressIndex(indexId);  
	        	
	        	$(this).closest('.address-wrapper').nextAll('div').remove();
	        	var tit = $(".occupancy option:selected").text();
	 	        if (tit == "" && tit.length<23) {
	 	        	$('.form-fourth-common').slideUp(function() {
		                $('.form-fourth-common').addClass('form-fourth-row');		      
		            });
	 	        } else {
	 	        	$('.form-fourth-common').slideDown(function() {
		                $('.form-fourth-common').removeClass('form-fourth-row');
		                $(this).parents('.form-steps').addClass('open');
		                $('.address-note').remove();
		            });
	 	        }
	        	 
	        	}
	        else
	        	{
	        	 $(this).parents('.change-yr-mnth').find('.time-month').val('');
	        	}
	      
     });
	 
	  
	  setTimeout(function(){
          $(document).on('change','#homenumber', function () {
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
	  
	
	  
    </script>
     <c:if test="${not empty Customer.customerID}">
<script>
localStorage.setItem('active', 'aboutyou');


$('.noverify').parents(".mobile-frist-step").fadeOut(500, function(){
    $('.mobile-fifth-step').fadeIn(800, function(){
    	 $titleTexts.text('Success! Your mobile number has been verified.');
  	  var mobNumber = $('#mNumber').val(); 
        $('.changeNo').val(mobNumber);
   });
}); 


$('.next-pages').removeClass('grey-button');

</script>
</c:if>