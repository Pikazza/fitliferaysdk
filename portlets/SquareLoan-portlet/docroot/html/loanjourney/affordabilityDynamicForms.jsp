<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ include file="/html/init.jsp"%>
<div class="partTimeJobBlock"> 
                                    <div class="partTimeJob">  
                                        <div class="job-details">
                                        
                                        <div class="form-row employmenttyperow">
                                        <div class="error-message"><strong>Please select your employment type</strong></div>
                                         <div class="form-inner-field">
                                        <label><span>Employment Type</span></label>
                                        <div class="drop-down">
                                        <form:select path="Customer.employmentList.employment[${indexCounter}].typeID"
                                                    class="select-drop-down employment2" data-placeholder="Please select an option" >
                                                <option value=""></option>
                                                <form:options items="${employmentTypeMap}" />
                                            </form:select>  
                                            <div class="help-icon"><i class="fa fa-info"></i></div>
                                        </div> 
                                         <div class="help-message">Enter your role at work</div>
                                    </div>
                                        </div>
                                        
                                        
                                             <div class="form-row">
                                              <div class="error-message"><strong>Please enter your job title</strong></div>
                                                <div class="form-inner-field">
                                                    <label><span>Job title</span></label>
                                                    <%-- <form:input type="hidden" value="1826" path="Customer.employmentList.employment[${indexCounter}].typeID" /> --%>
                               <form:input path="Customer.employmentList.employment[${indexCounter}].occupation" type="text"
												value=""  
												class="what-role text-box alphabetonly"  />                     
                                                    <div class="help-icon"><i class="fa fa-info"></i></div>
                                                </div>
                                               <div class="help-message">Enter your role at work</div>
                                            </div>
                                            <div class="form-row">
                                             <div class="error-message"><strong>Please enter your employers company name </strong></div>
                                                <div class="form-inner-field">
                                                    <label><span>Company name</span></label>
                                                    <form:input path="Customer.employmentList.employment[${indexCounter}].employerName" type="text"
												value="" class="text-box alphabetonly company whodo" />
                                                     <div class="help-icon"><i class="fa fa-info"></i></div>
                                                </div>
                                                <div class="help-message">Enter the name of the company you work for</div>
                                            </div>
                                            <div class="form-row small-form-row add-text-box date-to-paid"> 
                                                <div class="form-inner-field date-of-birth">
                                                    <label><span>The Date you started this job</span></label>
                                                    <form:input path="Customer.employmentList.employment[${indexCounter}].startDate" type="text" value="" class="text-box number datepicker afford-datepickersecond"/>
                                                    <i class="fa fa-calendar"></i>
                                                </div>
                                               <div class="error-message"><strong>Please enter the years and months you have been in this role</strong></div>
                                            </div>
                                            
                                            <div class="form-row">
                                              <div class="error-text"><strong>Please enter your valid work telephone number</strong></div>
                                                <div class="form-inner-field">
                                                    <label><span>Work telephone number</span></label>
                                                    <div class="number-field">
                            <form:input path="Customer.employmentList.employment[${indexCounter}].workPhoneNumber"
												type="text" value="" 
												class="worktelephone text-box number number-field not-mandar" placeholder="Telephone Number"
												maxlength="11" />                        
  											 <div class="help-icon"><i class="fa fa-info"></i></div>
  											 </div>
                                                </div>
                                              <div class="help-message">You must enter a work contact number - please note we will never contact you at your place of employment during the application process</div></div>
                                            </div>

                                            <div class="form-row how-often-row">
                                             <div class="error-message"><strong>Please select a pay frequency, if your pay is not regular select monthly</strong></div>
                                                <div class="form-inner-field">
                                                    <label><span>How often are you paid?</span></label>
                                                    <div class="drop-down">
                                          <select name="fff"	class="select-drop-down how-often">
												<option value="">Please select an option</option>
												<c:forEach var="entry" items="${frequency}">
                                                <option value="${entry.key}">${entry.value}</option>
                                             </c:forEach>
												
											</select>	
											 <!-- <div class="help-icon"><i class="fa fa-info"></i></div>  -->                                                            
                                          </div>
                                        <!--    <div class="help-message">Your select this option</div> -->
                                                </div>
                                               
                                            </div>

                                            <div class="form-row">
                                            <div class="error-message"><strong>Please enter your monthly income after tax and deductions</strong></div>
                                                <div class="form-inner-field">
                                                    <label><span>Monthly income</span></label>
                                                    <div class="pound-block number-field">
                                                        <span class="pound-symbol">&pound;</span>
                       <%--   <form:input path="Customer.incomeList.incomeItem[${indexCounter}].amount" type="text" value="" class="monthlyincome text-box number"	maxlength="8" />                               
                 --%> 
                            <input type="text" value="" id="monIncome${indexCounter}"  class="monthlyincome text-box number dualZero" maxlength="4">
                         
                                 <%--  <form:input path="Customer.incomeList.incomeItem[${indexCounter}].amount"  value="" id="monIncome${indexCounter}"  class="monthlyincome text-box number dualZero" maxlength="4" /> --%>
                                  <%-- <form:input path="Customer.incomeList.incomeItem[${indexCounter}].typeID" type="hidden" value="101138" />
                                 <form:input path="Customer.incomeList.incomeItem[${indexCounter}].frequencyID" value="295" type="hidden"/> --%>
                 									 <div class="help-icon"><i class="fa fa-info"></i></div>
                                                    </div>
                                                </div>
                                                <div class="help-message">Enter the amount you are paid in a month, after tax and deductions</div>
                                            </div>
                                              <div class="form-row small-form-row add-text-box date-to-paid"> 
                                                <div class="form-inner-field date-of-birth">
                                                    <label><span>Select a repayment date</span></label>
                                                    <form:input path="Customer.employmentList.employment[${indexCounter}].nextPayDate" type="text" value="" class="text-box number datepicker afford-datepicker" readonly="true"/>
                                                    <i class="fa fa-calendar"></i>
                                                </div>
                                                <div class="error-message"><strong>Please enter a valid date</strong></div>
                                            </div>  
                                        </div>
                                           <div class="form-row more-job">
                                            <div class="form-inner-field">
                                                <label>Do you have another job?</label>
                                                <div class="radio radiobutton radioblock">
                                                    <input type="radio" id="rad${indexCounter}" class="other-job partime-job-yes" name="directly${indexCounter}" onclick="createForm()" >
                                                    <label for="rad${indexCounter}"><span>Yes</span></label>
                                                    <input type="radio" id="rada${indexCounter}" class="partime-job-no other-job" name="directly${indexCounter}" onclick="decreaseFormCounter(this)">
                                                    <label for="rada${indexCounter}"><span>No</span></label>
                                                </div>
                                            </div>
                                            <div class="error-message"><strong>This field is mandatory</strong></div>
                                        </div>   
                                    </div>
                                </div>