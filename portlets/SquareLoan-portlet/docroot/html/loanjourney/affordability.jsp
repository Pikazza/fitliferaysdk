<%@ include file="/html/init.jsp"%>
<portlet:actionURL var="saveAffordabilityUrl" >
    <portlet:param name="action" value="affordabilityAction" />
</portlet:actionURL>
<portlet:resourceURL var="getDynamicFormURL" id ="getForm"></portlet:resourceURL>
<%
String SizeVal=(String)request.getAttribute("listSize");
System.out.println("sizeeeeeeeee is " + SizeVal);
int iVal=0;
long groupid = themeDisplay.getLayout().getGroupId();
String joblessmsg =PortletProps.get("jobless-message");
%>

<!--#include file="header-subheader.html"-->
    <!-- global error message start -->
    <div class="global-error">
        <div class="container">Please answer the questions highlighted below<a href="#"><i class="fa fa-info"></i></a></div>
    </div>
    <!-- global error message end -->
    <!-- main section start-->
    <section class="section">
        <!-- main container start-->
        <div class="container">
            <!-- details field steps link section start-->
            <div class="steps-row flexslider text-center" id="step-carousel">
                <ul class="slides clearfix">
                    <li id="icon1" class="completed"> 
                        <a href=""><div>Get Started</div></a>
                    </li>
                    <li id="icon2" class="completed">
                        <a href=""><div>About you</div></a>
                    </li>
                    <li id="icon3" class="flex-active-slide progressing">
                        <a href=""><div>Affordability</div></a>
                    </li>
                    <li id="icon4">
                        <a href=""><div>Loan review</div></a>
                    </li>
                    <li id="icon5">
                        <a href=""><div>Confirmation</div></a>
                    </li>
                </ul>
            </div>
            <!-- details field steps link section end-->
            <!-- row start-->
            <div class="row-blk sticky-main">
                <!-- column 8 article start-->
                <form:form id="affordibility" action="<%=saveAffordabilityUrl%>" method="post"  commandName="Customer"  >
                            
                
                <article class="left-column grid-8 form-warp">
                    <h1>Affordability</h1>
                    <!-- <button type="button" class="button button-secondary button-small save-button"><i class="fa fa-download"></i> SAVE</button> -->
                    <div class="desc-content">
                      <p>Please enter the information below as accurately as you can, this information will be checked when you submit the application and will determine how much we can lend to you. We will not contact your employer to make this assessment.</p>
                    </div>
                    <!-- form section start -->
                        <div id="affordibility" class="form-section form-wrap-blk">
                            <div class="sub-division-row">
                                <div class="title-icon">
                                    <h4>Where do you work?</h4>
                                </div>
                                <div class="form-row employmenttyperow">
                                <div class="error-message"><strong><liferay-ui:journal-article articleId='<%=PortletProps.get("Where_do_you_work_error")%>' groupId="<%=groupid%>">
                                        </liferay-ui:journal-article></strong></div>
                                    <div class="form-inner-field">
                                        <label><span>Employment Type</span></label>
                                        <div class="drop-down">
                                        <input type="hidden" value="<%=SizeVal%>" id="indexVariable">
                                        <div class="help-icon"><i class="fa fa-info"></i></div>
                                        <form:select path="employmentList.employment[0].typeID"
                                                id="employmenttype" class="select-drop-down" data-placeholder="Please select an option" >
                                                <option value=""></option>
                                                <form:options items="${employmentTypeMap}" />
                                            </form:select> 
                                            
                                        </div> 
            <div class="help-message"><liferay-ui:journal-article articleId='<%=PortletProps.get("where_do_you_work_help")%>' groupId="<%=groupid%>">
                                        </liferay-ui:journal-article></div>
                                    </div>
                                    
                                    <div id="jobless-message">
                                        <liferay-ui:journal-article articleId='<%=PortletProps.get("jobless-message")%>' groupId="<%=groupid%>">
                                        </liferay-ui:journal-article>
                                    </div>
                                </div>
                            <c:choose>
                                <c:when test='<%=SizeVal.equalsIgnoreCase("0")%>'>
 
                            <div class="partTimeJobBlock"> 
                                    <div class="partTimeJob">  
                                        <div class="job-details">
                                             <div class="form-row">
                                              <div class="error-message"><strong><liferay-ui:journal-article articleId='<%=PortletProps.get("jobtitle_error")%>' groupId="<%=groupid%>">
                                        </liferay-ui:journal-article></strong></div>
                                                <div class="form-inner-field">
                                                    <label><span>Job title</span></label>
                                               <form:input path="employmentList.employment[0].occupation" type="text" value=""    class="what-role text-box alphabetonly" maxlength="30"  />      
                                                 <div class="help-icon"><i class="fa fa-info"></i></div>
                                                </div>
                                                  <div class="help-message"><liferay-ui:journal-article articleId='<%=PortletProps.get("jobtitle_help")%>' groupId="<%=groupid%>">
                                        </liferay-ui:journal-article></div>
                                            </div>
                                            <div class="form-row">
                                             <div class="error-message"><strong><liferay-ui:journal-article articleId='<%=PortletProps.get("company_name_error")%>' groupId="<%=groupid%>">
                                        </liferay-ui:journal-article> </strong></div>
                                                <div class="form-inner-field">
                                                    <label><span>Company name</span></label>
                                                    <form:input path="employmentList.employment[0].employerName" type="text"
                                                value="" class="text-box  company whodo" maxlength="40"/>
                                                     <div class="help-icon"><i class="fa fa-info"></i></div>
                                                </div>
                                               <div class="help-message"><liferay-ui:journal-article articleId='<%=PortletProps.get("company_name_help")%>' groupId="<%=groupid%>">
                                        </liferay-ui:journal-article></div>
                                            </div>
                                            <div class="form-row small-form-row add-text-box date-to-paid"> 
                                                <div class="form-inner-field date-of-birth">
                                                    <!-- <label><span>Time in role</span></label> -->
                                                             <label><span>The Date you started this job</span></label>
                                                    <form:input path="employmentList.employment[0].startDate" type="text" value="" class="text-box number datepicker afford-datepickersecond" readonly="true"/>
                                                    <i class="fa fa-calendar"></i>
                                                </div>
                                               <div class="error-message"><strong><liferay-ui:journal-article articleId='<%=PortletProps.get("job_started_date_error")%>' groupId="<%=groupid%>">
                                        </liferay-ui:journal-article></strong></div>
                                            </div>
                                            <div class="form-row">
                                              <div class="error-text"><strong><liferay-ui:journal-article articleId='<%=PortletProps.get("work_telephone_number_error")%>' groupId="<%=groupid%>">
                                        </liferay-ui:journal-article></strong></div>
                                                <div class="form-inner-field">
                                                    <label><span>Work telephone number</span></label>
                                                    <div class="number-field">
                                              <form:input path="employmentList.employment[0].workPhoneNumber"
                                                type="text" value="" 
                                                class="worktelephone text-box number number-field not-mandar" placeholder="Telephone Number"
                                                maxlength="11" />                        
                                               <div class="help-icon"><i class="fa fa-info"></i></div>
                                               </div>
                                                </div>
                                                  <div class="help-message"><liferay-ui:journal-article articleId='<%=PortletProps.get("work_telephone_number_help")%>' groupId="<%=groupid%>">
                                        </liferay-ui:journal-article></div></div>

                                            <div class="form-row how-often-row">
                                            <div class="error-message"><strong><liferay-ui:journal-article articleId='<%=PortletProps.get("how_often_are_you_paid_error")%>' groupId="<%=groupid%>">
                                        </liferay-ui:journal-article></strong></div>
                                                <div class="form-inner-field">
                                                    <label><span>How often are you paid?</span></label>
                                                    <div class="drop-down">
                                      <form:select path="agreement.paymentFrequencyID" id="how-often-paid" class="how-often" data-placeholder="Please select an option">
                                                <option value="${Customer.agreement.paymentFrequencyID}">Please select an option</option>
                                                <form:options items="${frequency}" />
                                         </form:select>                                                               
                                                      <!-- <div class="help-icon"><i class="fa fa-info"></i></div> -->
                                                    </div>
                                                    <!-- <div class="help-message">Select employment type</div> -->
                                                </div>
                                                
                                            </div>

                                            <div class="form-row">
                                             <div class="error-message"><strong><liferay-ui:journal-article articleId='<%=PortletProps.get("monthly_income_error")%>' groupId="<%=groupid%>">
                                        </liferay-ui:journal-article></strong></div>
                                                <div class="form-inner-field">
                                                    <label><span>Monthly income</span></label>
                                                    <div class="pound-block number-field">
                                                        <span class="pound-symbol">&pound;</span>
                                                 <input type="text" value="" id="monIncome0" class="monthlyincome text-box number dualZero" maxlength="4">                                  
                      <%--    <form:input path="incomeList.incomeItem[0].amount" type="text" value="" class="monthlyincome text-box number" maxlength="8" />                               
                   --%>
                                 <div class="help-icon"><i class="fa fa-info"></i></div>
                                                    </div>
                                                </div>
                                                <div class="help-message"><liferay-ui:journal-article articleId='<%=PortletProps.get("monthly_income_help")%>' groupId="<%=groupid%>">
                                        </liferay-ui:journal-article></div>
                                            </div>
                                             <div class="form-row small-form-row add-text-box date-to-paid"> 
                                                <div class="form-inner-field date-of-birth">
                                                    <label><span>Select a repayment date</span></label>
                                                    <form:input path="employmentList.employment[0].nextPayDate" type="text" value="" class="text-box number datepicker afford-datepicker" readonly="true"/>
                                                    <i class="fa fa-calendar"></i>
                                                </div>
                                                <div class="error-message"><strong><liferay-ui:journal-article articleId='<%=PortletProps.get("repayment_date_error")%>' groupId="<%=groupid%>">
                                        </liferay-ui:journal-article></strong></div>
                                            </div>  
                                        </div>
                                        <div class="form-row more-job" id="radioDiv">
                                            <div class="form-inner-field">
                                                <label>Do you have another job?</label>
                                                <div class="radio radiobutton radioblock">
                                                    <input type="radio" id="rad0" class="other-job partime-job-yes" name="directly0"  onchange="createForm()">
                                                    <label for="rad0"><span>Yes</span></label>
                                                    <input type="radio" id="rada0" class="partime-job-no other-job" name="directly0" onchange="decreaseFormCounter(this)"  >
                                                    <label for="rada0"><span>No</span></label>
                                                </div>
                                            </div>
                                            <div class="error-message"><strong>This field is mandatory</strong></div>
                                        </div>
                                    </div>
                                </div>
                                
                                 
                                
                                
                                
                                 
                                </c:when>
                                
                                <c:otherwise>
                                        
                            <c:forEach items="${Customer.employmentList.employment}" varStatus="status">               
                                
                                 <c:set var="indexVal" value="${status.index}" /> 
                                
                                
                                <%
                                
                                iVal=(Integer)pageContext.getAttribute("indexVal");
                                %>
                                
                                <div class="partTimeJobBlock"> 
                                    <div class="partTimeJob">  
                                        <div class="job-details">
                                             <div class="form-row">
                                                <div class="form-inner-field">
                                                    <label><span>Job title</span></label>
                                                    
                               <form:input path="employmentList.employment[${status.index}].occupation" type="text"
                                                value="" placeholder="Type your role"
                                                class="what-role text-box alphabetonly"   />                     
                                                    
              
                                                </div>
                                                <div class="error-message"><strong>Please enter your job title</strong></div>
                                            </div>
                                            <div class="form-row">
                                                <div class="form-inner-field">
                                                    <label><span>Company name</span></label>
                                                    <form:input path="employmentList.employment[${status.index}].employerName" type="text"
                                                value="" class="text-box alphabetonly company whodo" />
                                                    
                                                   
                                                </div>
                                                <div class="error-message"><strong>Please enter your employers company name </strong></div>
                                            </div>
                                            <div class="form-row small-form-row add-text-box date-to-paid"> 
                        <div class="error-message"><strong>Please enter the years and months you have been in this role</strong></div>
                                                <div class="form-inner-field date-of-birth">
                                                    <label><span>Time in role</span></label>
                                                    <form:input path="employmentList.employment[${status.index}].startDate" type="text" value="" class="text-box number datepicker afford-datepickersecond" readonly="true"/>
                                                    <i class="fa fa-calendar"></i>
                                                </div>
                        <div class="help-message">How long have you been in your current role</div>
                                               
                                            </div>
                                            
                                            <div class="form-row">
                                                <div class="form-inner-field">
                                                    <label><span>Work telephone number</span></label>
                            <form:input path="employmentList.employment[${status.index}].workPhoneNumber"
                                                type="text" value="" 
                                                class="worktelephone text-box number number-field not-mandar" placeholder="Telephone Number"
                                                maxlength="11" />                        
  
                                                </div>
                                                <div class="error-text"><strong>Please enter your valid work telephone number</strong></div>
                                            </div>

                                            <div class="form-row how-often-row">
                                                <div class="form-inner-field">
                                                    <label><span>How often are you paid?</span></label>
                                                    <div class="drop-down">
                  <form:select path="incomeList.incomeItem[${status.index}].frequencyID" class="select-drop-down how-often" id="frequencyList" onchange="getValue()">
                  
                  
                                                <option value="">Please select an option</option>
                                                <form:options items="${frequency}" />
                                            </form:select>   
                                                                                                       
                              
                  
                                                    </div>
                                                </div>
                                                <div class="error-message"><strong>Please select a pay frequency, if your pay is not regular select monthly</strong></div>
                                            </div>

                                            <div class="form-row">
                                                <div class="form-inner-field">
                                                    <label><span>Monthly income</span></label>
                                                    <div class="pound-block number-field">
                                                        <span class="pound-symbol">&pound;</span>
                                         <input type="text" value="" class="monthlyincome text-box number dualZero" maxlength="4">                
                                                        
  <%-- <form:input path="incomeList.incomeItem[${status.index}].amount" type="text" value="" class="monthlyincome text-box number"  maxlength="8" /> --%>                               
                  
                                                    </div>
                                                </div>
                                                <div class="error-message"><strong>Please enter your monthly income after tax and deductions</strong></div>
                                            </div>
                                            <div class="form-row small-form-row add-text-box date-to-paid"> 
                                                <div class="form-inner-field date-of-birth">
                                                    <label><span>Select a repayment date</span></label>
                                                    <form:input path="employmentList.employment[${status.index}].nextPayDate" type="text" value="" class="text-box number datepicker afford-datepicker" readonly=""/>
                                                    <i class="fa fa-calendar"></i>
                                                </div>
                                                <div class="error-message"><strong>Please enter a valid date</strong></div>
                                            </div>
                                        </div>
                                        <div class="form-row more-job" id="radioDiv">
                                            <div class="form-inner-field">
                                                <label>Do you have another job?</label>
                                                <div class="radio radiobutton radioblock">
                                                    <input type="radio" id="radd1" class="other-job partime-job-yes" name="directly" onchange="createForm()">
                                                    <label for="radd1"><span>Yes</span></label>
                                                    <input type="radio" id="radd2" class="partime-job-no other-job" name="directly" onchange="decreaseFormCounter(this)">
                                                    <label for="radd2"><span>No</span></label>
                                                </div>
                                            </div>
                                            <div class="error-message"><strong>This field is mandatory</strong></div>
                                        </div>
                                    </div>
                                </div>
                                 </c:forEach>
                                </c:otherwise>
                            </c:choose>



                                <div class="otherincomehide" id="otherincome">
                               
                                
                                    <%-- <div class="form-row">
                                        <div class="form-inner-field">
                                            <label><span>Benefits income</span></label>
                                            <div class="pound-block">
                                                <span class="pound-symbol">&pound;</span>
                                             <form:input path="incomeList.incomeItem[1].typeDescription" type="hidden" value="Other Income" />
                                                   <form:input path="incomeList.incomeItem[${loop.index + 2}].typeID" type="hidden" value="${incomeCategories.key}" />
                                                <form:input path="incomeList.incomeItem[${loop.index + 2}].frequencyID" type="hidden" value="295"/>
                                                
                                                <span id="otherIncomeInput"></span>
                                                    
                                            </div>
                                        </div>
                                        <!--<i class="fa fa-check"></i>-->
                                        <div class="error-message"><strong>This field is mandatory</strong></div>
                                    </div> --%>
                                </div>
                                <div class="form-row otherIncome">
                                    <div class="error-message"><strong>This field is mandatory</strong></div>
                                    <div class="form-inner-field">
                                        <label>Do you have any other income?</label>
                                        <div class="radio radiobutton radioblock">
                                            <input type="radio" id="otherIncomeYes" class="other-incom other-incom-yes" name="other-incom">
                                            <label for="otherIncomeYes"><span>Yes</span></label>
                                            <input type="radio" id="otherIncomeNo" class="other-incom other-incom-no" name="other-incom">
                                            <label for="otherIncomeNo"><span>No</span></label>
                                        </div>
                                    </div>                                            
                                </div>
                                
                                
                                <div class="otherIncomeBlk">
                                    <div class="form-row">
                                        <div class="form-inner-field">
                                            <label><span>Pension</span></label>
                                            <div class="pound-block number-field">
                                                <span class="pound-symbol">&pound;</span>
                                                <input type="text" value="" class="text-box number dualZero " maxlength="4">
                                            </div>
                                        </div>                                        
                                    </div>
                                    <div class="form-row">
                                        <div class="form-inner-field">
                                            <label><span>Benefits</span></label>
                                            <div class="pound-block number-field">
                                                <span class="pound-symbol">&pound;</span>
                                                <input type="text" value="" class="text-box number  dualZero" maxlength="4">
                                            </div>
                                        </div>                                        
                                    </div>
                                    <div class="form-row">
                                        <div class="form-inner-field">
                                            <label><span>Bonuses</span></label>
                                            <div class="pound-block number-field">
                                                <span class="pound-symbol">&pound;</span>
                                                <input type="text" value="" class="text-box number  dualZero" maxlength="4">
                                            </div>
                                        </div>                                        
                                    </div>
                                    <div class="form-row">
                                        <div class="form-inner-field">
                                            <label><span>Maternity pay</span></label>
                                            <div class="pound-block number-field">
                                                <span class="pound-symbol">&pound;</span>
                                                <input type="text" value="" class="text-box number  dualZero" maxlength="4">
                                            </div>
                                        </div>                                        
                                    </div>
                                    <div class="form-row">
                                        <div class="form-inner-field">
                                            <label><span>Other</span></label>
                                            <div class="pound-block number-field">
                                                <span class="pound-symbol">&pound;</span>
                                                <input type="text" value="" class="text-box number  dualZero" maxlength="4">
                                            </div>
                                        </div>                                        
                                    </div>
                                </div>
                                 
                                
                            </div>
                        <div class="sub-division-row">
                        <div class="sublevel-error">
                                    Please don't put five or more expenses as zero
                                </div>
                                <div id="expenseTitle" class="title-icon">
                                    <h4>Monthly expenses</h4>
                                    <div class="desc-content">
                                     <p>To help us work out your disposable monthly income and your ability to repay your loan, please fill out the following expenses as accurately as you can.</p>
                                   </div>
                                </div>
                                <%
                                int z=1;
                                 %>
                                <c:forEach var="expendtureVar" items="${expendture}"
                                            varStatus="loop">
                                
                                <div class="expanseblk checkForm">
                                    <div class="form-row">
                                    
                                    <%-- <c:set var="index11" value="${loop.index}"/> --%>
                                            
                                    
                                    <div class="error-message"><strong><%=PortletProps.get(z+"_Error")%></strong></div>
                                    
                                        <div class="form-inner-field">
                                           <label><span>${expendtureVar.value}</span></label>
                                            <div class="pound-block number-field">
                                                <span class="pound-symbol">&pound;</span>
                                                <form:input
                                                            path="expenditureList.expenditureItem[${loop.index}].typeDescription"
                                                            type="hidden" value="${expendtureVar.value }" />
                                                        <form:input path="expenditureList.expenditureItem[${loop.index}].typeID"
                                                            type="hidden" value="${expendtureVar.key}" />
                                                        <%-- <form:input
                                                            path="expenditureList.expenditureItem[${loop.index}].frequencyDescription"
                                                            type="hidden" value="Monthly" />
                                                            
                                                        <form:input
                                                            path="expenditureList.expenditureItem[${loop.index}].frequencyID" type="hidden" value="295" /> --%>
                                                        
                                                        
                                                        <c:choose>
    												    <c:when test="${expendtureVar.value=='Food'}">
        														<form:input path="expenditureList.expenditureItem[${loop.index}].amount"
                                                            name="rent/mortgage" type="text" class="text-box number oneToNine"
                                                            maxlength="8" />
   												          </c:when>    
    												     <c:otherwise>
                                                         <form:input path="expenditureList.expenditureItem[${loop.index}].amount"
                                                            name="rent/mortgage" type="text" class="text-box number"
                                                            maxlength="8" />
    											         </c:otherwise>
													  </c:choose>
                                                          
                                                        
                                                             <div class="help-icon"><i class="fa fa-info"></i></div>
                                                            
                                            </div>
                                        </div>
                                        <%-- <div class="error-message"><strong>Please enter what you pay towards rent or <span>${expendtureVar.value}</span>.  If you don't pay towards this you can enter zero.</strong></div> --%>
                                        <div class="help-message"><%=PortletProps.get(z+"_Help")%></div>
                                        <%
                                    z=z+1;
                                     %>
                                    </div>
                                    
                                </div>
                                </c:forEach>
                                
                                <div class="incometable-blk">
                                <%-- <form:input path="incomeList.incomeItem[0].amount" type="hidden" value="" class="text-box number" id="tot-Value"    maxlength="8" />
                                   <form:input path="incomeList.incomeItem[0].typeID" type="hidden" value="1331" />
                                 <form:input path="incomeList.incomeItem[0].frequencyID" value="295" type="hidden"/> --%>
                                 
                                <form:input path="incomeList.incomeItem[0].amount" type="hidden"  value="" id="tot-Value" class="text-box number"  />
                                <form:input path="incomeList.incomeItem[0].typeID" type="hidden" value="1331" />
                                <form:input path="incomeList.incomeItem[0].frequencyID" value="295" type="hidden"/>  
                                 
                                 
                                    <div class="form-row" id="incomeTable">
                                    	 <input type="hidden" id="totalOtherIcom" value="0">
                                        <input type="hidden" id="totalExpenseVal" value="0"> 
                                        <input type="hidden" id="toatlMonthlyVal" value="0"> 
                                        <input type="hidden" id="toatlPermonth" value="0">
                                        <div class="tabTitle mobTitle">Your disposable income</div>
                                        <div class="total-table">
                                            <table width="100%">
                                                <tr>
                                                    <td >Money In </td>
                                                    <td id="perMonth">&pound;0</td>
                                                </tr>
                                                <tr>
                                                    <td>Money Out</td>
                                                    <td id="totalExpense">&pound;0</td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="income-total clearfix">
                                            <div class="tabTitle fL">Disposable Income</div>
                                            <div id="totalIncom" class="tabPrice fL">&pound;0</div>
                                        </div>
                                    </div>
                                        <h4>Credit Reference Agency Check, what it means</h4>
                                        <p>To assess your loan we will submit the details you have entered in this application to credit reference agencies. This helps us to assess whether a loan is right for you or not.</p>
                                        <p>A record of the search we conduct will be stored at the credit reference agency/agencies and will be visible to other companies if they carry out a credit enquiry for you. If false or inaccurate information is provided and fraud is identified, details will be passed to fraud prevention agencies to prevent fraud and money laundering. Further details explaining how the information held by fraud prevention agencies may be used can be obtained by emailing <a href="mailto:customersupport@squaretoday.co.uk">customersupport@squaretoday.co.uk</a></p>
                                        <p>By continuing you agree we can use your information in this way.</p>
                                        <!-- <a href="#" class="alert-message-highlight"> <i class="fa fa-file-pdf-o"></i> Letter Document </a> --> 
                                    <div class="gray-bg">
                                        <div class="form-row checkBox">
                                        
                                        <div class="error-message"><strong>Please agree with this selectbox </strong></div>

                                            <input type="checkbox" id="affordabilityCheck" name="checkbox" class="formcheck">
                                            <label for="affordabilityCheck"><span>I agree that Square Today will now conduct a credit reference agency search to assess my application</span></label>
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Monthly expenses sub division end -->
                        </div>
                        <!-- affordibility form section end -->
                        <!-- contiune and save button section start -->
                        <div class="final-step clearfix">
                            <button type="button" class="button button-primary next-pages afford-final-step fL grey-button" id="continuebtn" value="CONTINUE" >CONTINUE </button>
                            <!-- <button type="button" class="button button-secondary button-small fR"><i class="fa fa-download"></i> SAVE</button> -->
                            
                        <!--  <button type="button"  onclick='javascript:submitForm("SAVE");'
                                        class="button button-secondary button-small fR">
                                        <i class="fa fa-download"></i> SAVE
                                    </button>  -->
                        </div>
                        <!-- contiune and save button section end -->
                        <!-- back and Cancel button section start -->
                        <div class="bottom-button-row clearfix">
                            <div class="fL"> <a href='javascript:submitForm("BACK");'  > <i class="fa fa-chevron-left"></i> Back </a> </div>
                            <div class="fR"> <a href='javascript:submitForm("CANCEL");'> <i class="fa fa-times"></i> Cancel </a> </div>
                        </div>
                        <!-- back and Cancel button section end -->
                        <!-- form section end -->
                    </article>
                    <%@ include file="/html/loanjourney/aside.jsp" %>
                    </form:form>
                <!-- column 8 article end-->

                <!-- Sidebar -->
                
                <!--#include file="aside.html"-->

                <!-- Sidebar end -->
                <!-- Sticky side bar bottom boundary -->
                <div id="stick-offset" class="clear"></div>
            </div>
            <!-- row end-->
        </div>
        <!-- main container end-->
    </section>
    <!-- main section end-->
<!--#include file="footer.html"-->
 <%@ include file="/html/loanjourney/footer.jsp" %>
<script type="text/javascript">
var removeMonthVal;
var indexVal=0;
$(window).load(function() {
	
	
	
	
    indexVal=parseInt($('#indexVariable').val());

});

$(document).ready(function() {
	
	document.getElementById("how-often-paid").selectedIndex = "0";
	//$("#how-often-paid").val("Please select an option");
});
function submitForm(submitVal) {
    $('#affordibility').append("<input type='hidden' name='submitValue' value='"+ submitVal+"' />");
    $('#affordibility').submit();
    return false;
}


function createForm(){
    indexVal++; 
    
$.get("<%=getDynamicFormURL.toString() %>", { indexValue:indexVal, whichJsp:1},
        function(data){ 	    
        $("#otherincome").before(data);            
        $('.how-often').selectmenu();
        $('.radiobutton').buttonset();
        $('.radiobutton').buttonset('refresh');
        $('.more-job').show();  
        $('.dualZero').on('change', function () {
            var myLength = $(this).val().length;
            if (myLength > 0) {
                $(this).val($(this).val()+".00");
            }
        });
        
        $('.help-icon').click(function() {
            $(this).toggleClass('active');
            $(this).parents('.form-row').find('.help-message').slideToggle();
        });
        
        $('.text-box').focusin(function() {
            $(this).parents('.form-row').find('.help-message').slideDown();
        });
        
        $('.text-box').bind('change', function() {
            var valdi = $(this).val();
            if (valdi.length > 0 || valdi != 0) {
                $(this).parents('.form-row').find('.help-message').slideUp(800);
            } else {
                $(this).parents('.form-row').find('.help-message').slideDown(800);
            }
        });
        
        $('.employment2').selectmenu({
 	       change: function(event, ui) {
 	           var selected = $(this).find(":selected").text();
 	           if (!$(this).parent('.drop-down').hasClass('active')) {
 	               $(this).parents('.form-row').append('<i class="fa fa-check"></i>');
 	               $(this).parent('.drop-down').addClass('active');
 	           }

 	           if ($('.employment2 option:selected').val() != 0) {
 	               $('.employmenttyperow').find('.error-message').hide();
 	               $('.employmenttyperow').find('.form-inner-field').removeClass('addRed');
 	               $('.employmenttyperow').find('.form-inner-field').removeClass('redRow');
 	           }
 	       }
 	   });
        
        
        $(this).parents('.partTimeJobBlock').next('.partTimeJobBlock').find('.date-to-paid').remove();
        
        $('.monthlyincome').on('focus', function(e) {
            if($(this).val()==0){
                $(this).select();
            }
            console.log('adadsad');
            
            //bypassIncome();
            
            if (!$(this).parents('.partTimeJobBlock').find('.how-often').parent('.drop-down').hasClass('active')) {
            	$(this).parents('.partTimeJobBlock').find('.how-often-row').find('.error-message').show();
            	$(this).parents('.partTimeJobBlock').find('.how-often-row').find('.form-inner-field').addClass('addRed');
            }
            
            //alert($(this).parents('.partTimeJobBlock').find('.what-role').val());
            
            var role = $(this).parents('.partTimeJobBlock').find('.what-role').val();
            var whodo = $(this).parents('.partTimeJobBlock').find('.whodo').val();
            var time  = $(this).parents('.partTimeJobBlock').find('.afford-datepickersecond').val();

            if(role.length == 0) {
            	$(this).parents('.partTimeJobBlock').find('.what-role').parents('.form-row').find('.error-message').show();
            	$(this).parents('.partTimeJobBlock').find('.what-role').parents('.form-inner-field').addClass('addRed');
            }

            if(role.length == 0) {
            	$(this).parents('.partTimeJobBlock').find('.whodo').parents('.form-row').find('.error-message').show();
            	$(this).parents('.partTimeJobBlock').find('.whodo').parents('.form-inner-field').addClass('addRed');
            }

            if(time.length == 0) {
            	$(this).parents('.partTimeJobBlock').find('.afford-datepickersecond').parents('.form-row').find('.error-message').show();
            	$(this).parents('.partTimeJobBlock').find('.afford-datepickersecond').parents('.form-inner-field').addClass('addRed');
            }
        });
        
        $('#affordibility input').not('.not-mandar').on('change blur', function() {
            var elmt = $(this);
            if (elmt.hasClass('text-box')) {
                var vald = $(this).val();
                if ((!elmt.hasClass('emailonly')) && (!elmt.hasClass('dobIn1')) && (!elmt.hasClass('dobIn2')) && (!elmt.hasClass('dobIn3'))) {
                    if (vald.length != 0 || vald != 0) {
                        if($(this).parents('.form-row').find('i.fa-check').length<1){
                            $(this).parents('.form-row').append('<i class="fa fa-check"></i>');
                        }
                    } else {
                        $(this).parents('.form-row').find('.fa-check').remove();
                    }
                } else {
                    if (elmt.hasClass('emailonly')) {
                        if (emailVal(vald)) {
                            $(this).parents('.form-row').append('<i class="fa fa-check"></i>');
                        } else {
                            $(this).parents('.form-row').find('.fa-check').remove();
                        }
                    } else {
                        /* dob */
                       
                    }
                }
                if($(this).parent('div').hasClass('addRed')){
                    $(this).parents('.form-row').find('.fa-check').remove();
                }
            } 
            validIndivi(elmt);
        });
        
        function validIndivi(fname) {
            var valElement = fname.val();
            if (valElement.length == 0) {
                fname.parents('.form-row').find('.error-message').show();
                fname.parents('.form-inner-field').addClass('addRed');
            } else {
                fname.parents('.form-row').find('.error-message').hide();
                fname.parents('.form-inner-field').removeClass('addRed');
                fname.parents('.form-row').removeClass('redRow');
            }
        }
        
        $('.how-often').selectmenu({
	       change: function(event, ui) {
	           var selected = $(this).find(":selected").text();
	           if (!$(this).parent('.drop-down').hasClass('active')) {
	               $(this).parents('.form-row').append('<i class="fa fa-check"></i>');
	               $(this).parent('.drop-down').addClass('active');
	           }

	           if ($('.how-often option:selected').val() != 0) {
	               $('.how-often-row').find('.error-message').hide();
	               $('.how-often-row').find('.form-inner-field').removeClass('addRed');
	               $('.how-often-row').find('.form-inner-field').removeClass('redRow');
	           }
	       }
	   });
        
        
});

}

 
function decreaseFormCounter(nojob){
     var ids=nojob.id;	
      var res = ids.substring(4, 5);
    var tempres=parseInt(Number(res)+1);
	   $("#monIncome"+tempres).val();
	 
	//otherIncom();
	removeMonthVal=$("#monIncome"+tempres).val();
	
	//alert(removeMonthVal);
	
	if ($('.partTimeJobBlock').length > 1) {
	//$('.partTimeJobBlock').last().remove();
	$(this).parents('.partTimeJobBlock').next('.partTimeJobBlock').slideUp(function(){
        $(this).remove();
    });
	/* $('.partime-job-yes').last().prop('checked', false).button("refresh");
    $('.partime-job-no').last().prop('checked', true).button("refresh"); */
    //$(".datepicker").datepicker('destroy');
	}
	
    if(indexVal > 0){   
        var s=indexVal;
    $.get("<%=getDynamicFormURL.toString() %>", { indexValue: s ,   whichJsp:2},
            function(data){
        $("#otherIncomeInput").text('');
        $("#otherIncomeInput").append(data);
    });
     indexVal=indexVal - 1;
    } else{
        var s=indexVal + 1;
        $.get("<%=getDynamicFormURL.toString() %>", { indexValue: s, whichJsp:2},
                function(data){
            $("#otherIncomeInput").text('');
                    $("#otherIncomeInput").append(data);
        });
        
    }
}
/* $('#frequencyList').on('selectmenuchange', function(e, ui) {    
    var selected = $(this).find(":selected").text();        
    $('#selectValue').val(selected);

}); */
$('#affordabilityCheck').on('change', function() {
    if (!$(this).is(':checked')) {
        $(this).parents('.form-row').addClass('addRed');
        $(this).prev('.error-message').show();

        $('.afford-final-step').addClass('grey-button');
    } 
});  

$("#employmenttype").selectmenu({
	change: function(event, ui) {
		
        $(this).parents('.form-row').append('<i class="fa fa-check"></i>');

        if ($('#employmenttype option:selected').val() != 0) {
            $('.employmenttyperow').find('.error-message').hide();
            $('.employmenttyperow').find('.form-inner-field').removeClass('addRed');
            $('.employmenttyperow').find('.form-inner-field').removeClass('redRow');
            $('.partTimeJob').slideDown();
            $(this).parent('.drop-down').addClass('active');
        }
        
        if ($('#employmenttype option:selected').val() == "6808") {
            $('#jobless-message').slideDown();
            $('.partTimeJob').slideUp();
            $('.otherincomehide').slideUp();
            $('.final-step').slideUp();
            $('.sub-division-row').css({'border-color':'#fff'});
            $('.otherIncome').slideUp();            
            $('.sub-division-row:last-child').slideUp();
        } else {
            $('#jobless-message').stop(true, true).slideUp();
            $('.sub-division-row').css({'border-color':'#eaeaea'});
            $('.otherincomehide').slideDown();
            $('.final-step').slideDown();
            $('.otherIncome').slideDown();
            $('.sub-division-row:last-child').slideDown();
        }

        var seleted = $(this).find(":selected").text();
        if (seleted == "Part-time") {
            $('.more-job').slideDown();
            //$('.more-job label:first').html('Do you have another part time job?');
        } else {
            $('.more-job').slideUp();
            //$('.more-job label:first').html('Do you have another job?');
        }
    }
});

console.log("AAA"+$('#employmenttype-button').length);
setTimeout(function(){
	$('.employmenttyperow').find('.ui-selectmenu-button:last-child').find('.ui-selectmenu-text').text('Please select an option');
	$('.employmenttyperow').find('.ui-selectmenu-button:last-child').prev('#employmenttype-button').hide().remove;
	
}, 100);

if($('#employmenttype-button').length>1){
	//$('.employmenttyperow').find('#employmenttype-button:last-child').remove()
}
 
$('body').on('focus',".afford-datepicker", function(){
    $(this).datepicker({
        dateFormat: 'dd-mm-yy',
        changeMonth: true,
        changeYear: true,
        maxDate: "+30d",
        minDate: "+20d",
        onSelect: function(curDate, instance) {
            if ($(this).val() != '') {
                $(this).parents('.form-row').removeClass('redRow');
                $(this).parents('.form-row').append('<i class="fa fa-check"></i>');
                $(this).parent('.form-inner-field').removeClass('addRed');
                $(this).parents().next('.error-message').hide();
                 
            } else {
                $(this).parents('.form-row').addClass('redRow');
                $(this).parents('.form-row').find('.fa-check').remove();
                $(this).parent('.form-inner-field').addClass('addRed');
                $(this).parents().next('.error-message').show();
                
         
              
            }
            
            bypassDate();
        },
        onClose: function(evt, ui) {
            if ($(this).val() != '') {
                $(this).parents('.form-row').removeClass('redRow');
                $(this).parents('.form-row').append('<i class="fa fa-check"></i>');
                $(this).parent('.form-inner-field').removeClass('addRed');
                $(this).parents().next('.error-message').hide();
            } else {
                $(this).parents('.form-row').addClass('redRow');
                $(this).parents('.form-row').find('.fa-check').remove();
                $(this).parent('.form-inner-field').addClass('addRed');
                $(this).parents().next('.error-message').show();
            }
            bypassDate();
        }
    });
});

function otherIncom(){
	//var removeMonthVal = $(this).parents('.partTimeJobBlock').next('.partTimeJobBlock').find('.monthlyincome').val();
	var removeMonthVal = 0;
    $(this).parents('.partTimeJobBlock').nextAll('.partTimeJobBlock').addClass('removeJobs');
    
    $(".removeJobs").each(function() {
        // var this = $(this).find('.monthlyincome');
        removeMonthVal += parseFloat($(this).find('.monthlyincome').val());
    });
    
    var monthlyincome = $('#toatlPermonth').val();
    var totalExpenseVal = $('#totalExpenseVal').val();
    var toatlMonthlyVal = $('#toatlMonthlyVal').val();

    var setToatlMonthlyVal = toatlMonthlyVal - removeMonthVal;
    $('#toatlMonthlyVal').val(setToatlMonthlyVal);
    var finalIncome = parseInt(monthlyincome) - removeMonthVal;            
    var finalTotal = finalIncome - totalExpenseVal;
    
    if($(this).parent('.radio').hasClass('active')) {
    	$('#perMonth').html('&pound;' + finalIncome.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
    	$('#totalIncom').html('&pound;' + finalTotal.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
    }
} 
 
$(document).on('change', '.other-job', function() {
	$('.radiobutton').buttonset();
    if ($('.partime-job-no').is(':checked')) {       
    	
    	

        otherIncom();
        if ($('.partTimeJob').length > 1) {
            $(this).parents('.partTimeJobBlock').nextAll('.partTimeJobBlock').slideUp(function(){
                $(this).remove();
            });
           $('.partime-job-yes').last().prop('checked', false).button("refresh");
           $('.partime-job-no').last().prop('checked', true).button("refresh");               
        }
        
        $('.expanseblk').slideDown();
        $('.incometable-blk').slideDown(500, function(){
            $(this).parents('.sub-division-row').find('.title-icon').addClass('open');
        });

    } else { 
        //$('#affordibility').find('.partTimeJobBlock').append(partjobClone);
        $('.partTimeJob').slideDown();
        $('.how-often').selectmenu();

        /* $('.more-job').each(function(index) {
            var wrpperCount = index;
            $(this).find('input[type="radio"]').each(function(index) {
                $(this).attr('name', 'directly' + wrpperCount);
                $(this).attr('id', 'radi_' + index + wrpperCount);
                $(this).next('label').attr('for', $(this).attr('id'));
            });
        }); */

        /*
        $('.otherIncome').each(function(index) {
            var wrpperCount = index;
            $(this).find('input[type="radio"]').each(function(index) {
                $(this).attr('name', 'otherIncome' + wrpperCount+1);
                $(this).attr('id', 'otherIncome' + index + wrpperCount);
                $(this).next('label').attr('for', $(this).attr('id'));
            });
        }); */

        /* $('.partTimeJob').each(function(index) {
            if($(this).find('.ui-selectmenu-button').length > 1){
                $(this).find('.ui-selectmenu-button:last-child').remove();
            }
        }); */

        $('.radiobutton').buttonset();

        $('.more-job').show();

        if ($('.partTimeJobBlock').length > 2) {
            $('.partTimeJobBlock:last-child').prepend('<p>Please enter the details of your additional job</p>');
        } else {
            $('.partTimeJobBlock:last-child').prepend('<p>Please enter the details of your second job</p>');
        }

        // $('#otherincome').slideUp();
        //$('.expanseblk').slideUp();
        //$('.incometable-blk').slideUp();
        
        $('.expanseblk').slideUp();
        $('.incometable-blk').slideUp(500, function(){
            $(this).parents('.sub-division-row').find('.title-icon').removeClass('open');
        });

    }   
    
});   

$(document).on('change', '.other-incom', function() {        
    if ($('.other-incom-yes').is(':checked')) {
        $(this).parents('.sub-division-row').find('.otherIncomeBlk').slideDown();
    } else {
        $(this).parents('.sub-division-row').find('.otherIncomeBlk').slideUp();
    }
    
    if($(this).parents('.form-row').prev('.partTimeJobBlock').find('.date-to-paid .datepicker').val()==0){
        $(this).parents('.form-row').prev('.partTimeJobBlock').find('.date-to-paid .error-message').show();
        $(this).parents('.form-row').prev('.partTimeJobBlock').find('.date-to-paid .form-inner-field').addClass('addRed');
    }
    
    $('.expanseblk').slideDown();
    $('.incometable-blk').slideDown(500, function(){
        $(this).parents('.sub-division-row').find('.title-icon').addClass('open');
    });
});

$(document).on('change', '.other-incom', function() {        
    if ($('.other-incom-no').is(':checked')) {
        var otherincome = parseInt($('#totalOtherIcom').val());
        var monthlyincome = $('#toatlPermonth').val();
        var totalExpenseVal = $('#totalExpenseVal').val();

        var finalIncome = parseInt(monthlyincome) - otherincome;            
        var finalTotal = finalIncome - totalExpenseVal;

        $('#perMonth').html('&pound;' + finalIncome.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
        $('#totalIncom').html('&pound;' + finalTotal.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));

        $(".otherIncomeBlk .text-box").each(function() {
            $(this).val('').parents('.form-row').find('i.fa-check').remove();
        });
        $('#totalOtherIcom').val('0');
    } 
});

$(".otherIncomeBlk .text-box").each(function() { 
    $(this).keyup(function(){
        calculateSum();
    });
});

function calculateSum() { 
    var otherincomes = 0;
    $(".otherIncomeBlk .text-box").each(function() {
        if(!isNaN(this.value) && this.value.length!=0) {
            otherincomes += parseInt(this.value);
        }
    });
    
 
    $('#totalOtherIcom').val(otherincomes); 


  //  var monthOtherIncom = parseInt(perMonth) + parseInt(otherincomes)

    console.log(pertotal);
    var perMonth = $('#toatlMonthlyVal').val();
    var totalExpense = $('#totalExpenseVal').val();
    var pertotal = parseInt(perMonth) + parseInt(otherincomes);
    var perMonthtotal = parseInt(perMonth) + parseInt(otherincomes) - parseInt(totalExpense);

    $('#toatlPermonth').val(pertotal);

    $('#perMonth').html('&pound;' + pertotal.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
    $('#totalIncom').html('&pound;' + perMonthtotal.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
}

$('.monthlyincome').on('blur', function(e) {
    if($(this).val()==0){
        $(this).select();
    }
    //alert($(this).parents('.partTimeJobBlock').find('.what-role').val());
    bypassIncome();
});

$(document).on('keyup', '.monthlyincome', function(e) {
    var monthincome = 0;
    $('input.monthlyincome').each(function() {
        if(!isNaN(this.value) && this.value.length!=0) {
            monthincome += parseInt(this.value);
        }
    });

    $('#toatlMonthlyVal').val(monthincome);

    var otherincome = parseInt($('#totalOtherIcom').val());

    var income1 = monthincome + otherincome,
        income2 = $('#totalExpenseVal').val(),
        //totalOtherIcom = $('#totalOtherIcom').val(),
        $perMonth = $('#perMonth'),
        totalIcome = parseInt(income1 - income2);

    $('#toatlPermonth').val(income1);
        
    $perMonth.html('&pound; ' + parseInt(income1).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
    $('#totalIncom').html('&pound; ' + parseInt(totalIcome).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
    
     var totIncome= $("#toatlPermonth").val();
     $('#tot-Value').val(totIncome);
});  

$('.expanseblk .text-box').keyup(function(e) {
    /* calculation */
    var sum = 0; 
    $('.expanseblk .text-box').each(function(index, element) {
        sum += Number(($(this).val()));
    });
    $('#totalExpenseVal').val(sum);

    $('#totalExpense').html('&pound;' + sum.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
});

$('.expanseblk').bind('keyup', function(e) {
    var income_per_mn = $('#perMonth').text().replace(/[^\d.]/g, ''),
        mn_expense = $('#totalExpense').text().replace(/[^\d.]/g, ''),
        total = (parseInt(income_per_mn)) - parseInt(mn_expense);
    $('#totalIncom').html('&pound;' + total.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
});

/* validate js */

/* $('.what-role').on('focus', function () {
    if (!$('#employmenttype-button').parent('.drop-down').hasClass('active')) {
        $('.employmenttyperow').find('.error-message').show();
        $('.employmenttyperow').find('.form-inner-field').addClass('addRed');
    }
}); */

setTimeout(function(){
    $(document).on('change', '.worktelephone.text-box', function () {
            if($(this).attr('maxlength') > $(this).val().length){
                $(this).parents('.form-row').addClass('nonActive');
                $(this).parents('.form-row').find('.error-text').show();
                $(this).parents('.form-inner-field').addClass('addRederror');  
                $(this).parents('.form-row').remove('.fa-check');
            } else {
                $(this).parents('.form-row').removeClass('nonActive');
                $(this).parents('.form-row').find('.error-text').slideUp();
                $(this).parents('.form-inner-field').removeClass('addRederror');
                $(this).parents('.form-row').append('<i class="fa fa-check"></i>')
            }
            if($(this).val().length==0){
                $(this).parents('.form-row').removeClass('nonActive');
                $(this).parents('.form-row').find('.error-text').slideUp();
                $(this).parents('.form-inner-field').removeClass('addRed');
                $(this).parents('.form-row').append('<i class="fa fa-check"></i>')
            }
    });
}, 100);



$('.dualZero').on('change', function () {
    var myLength = $(this).val().length;
    if (myLength > 0) {
        $(this).val($(this).val()+".00");
    }
});

function bypassDate(){
    if (!$('#employmenttype').parent('.drop-down').hasClass('active')) {
        $('.employmenttyperow').find('.error-message').show();
        $('.employmenttyperow').find('.form-inner-field').addClass('addRed');
    }

    if (!$('.how-often').parent('.drop-down').hasClass('active')) {
        $('.how-often-row').find('.error-message').show();
        $('.how-often-row').find('.form-inner-field').addClass('addRed');
    }

    var role = $('.what-role').val();
    var whodo = $('.whodo').val();
    var month = $('.monthlyincome').val();
    //var time  = $('.how-long-u .text-box').val();

    if(role.length == 0) {
        $('.what-role').parents('.form-row').find('.error-message').show();
        $('.what-role').parents('.form-inner-field').addClass('addRed');
    }

    if(role.length == 0) {
        $('.whodo').parents('.form-row').find('.error-message').show();
        $('.whodo').parents('.form-inner-field').addClass('addRed');
    }

    if(role.length == 0) {
        $('.monthlyincome').parents('.form-row').find('.error-message').show();
        $('.monthlyincome').parents('.form-inner-field').addClass('addRed');
    }

    /* if(time.length == 0) {
        $('.how-long-u .form-row').find('.error-message').show();
        $('.how-long-u').find('.form-inner-field').addClass('addRed');
    } */
}

function bypassIncome(data){
    if (!$('#employmenttype').parent('.drop-down').hasClass('active')) {
        $('.employmenttyperow').find('.error-message').show();
        $('.employmenttyperow').find('.form-inner-field').addClass('addRed');
    }

    if (!$('.how-often').parent('.drop-down').hasClass('active')) {
        $('.how-often-row').find('.error-message').show();
        $('.how-often-row').find('.form-inner-field').addClass('addRed');
    }
    
    
    var role = $('.what-role').val();
    var whodo = $('.whodo').val();
    var time  = $('.afford-datepickersecond').val();

    if(role.length == 0) {
    	$('.what-role').parents('.form-row').find('.error-message').show();
    	$('.what-role').parents('.form-inner-field').addClass('addRed');
    }

    if(role.length == 0) {if(!isNaN(this.value) && this.value.length!=0)
        $('.whodo').parents('.form-row').find('.error-message').show();
        $('.whodo').parents('.form-inner-field').addClass('addRed');
    }

    if(time.length == 0) {
        $('.afford-datepickersecond').parents('.form-row').find('.error-message').show();
        $('.afford-datepickersecond').parents('.form-inner-field').addClass('addRed');
    }
}

/* $('.otherIncomeBlk .text-box').on('change', function(){
    $(this).parents('.otherIncomeBlk').find('.text-box').each(function(){
        if($(this).val().length == 0 ) {
             $(this).val('0')
        }
    });
}); */

$('.otherIncomeBlk .text-box').on('change', function(){
    var thisVal = $(this).val();
    if(thisVal > 5000){
        $(this).val('');
        if($(this).parents('.form-row').find('i.fa-check').length<1){
            $(this).parents('.form-row').append('<i class="fa fa-check"></i>');
        }
    }else{
        $(this).parents('.otherIncomeBlk').find('.text-box').each(function(){
        if( $(this).val().length == 0 ) {
             $(this).val('0.00')
        }
     });
    }
});

$('.otherIncomeBlk .text-box').focus(function(){
	$(this).val('');
	if($(this).parents('.form-row').find('i.fa-check').length<1){
        $(this).parents('.form-row').remove('.fa-check');
    }
});

$('.otherIncomeBlk .text-box').keyup(function(e){
	if(e.keyCode == 8){
		$(this).val('');
	}
});


$('.otherIncomeBlk .text-box').focus(function (e) {    
	  if (e.which == 9) {
		  alert('rtre');
		  $(this).val('');
	  }
	});

/* bajb_backdetect.OnBack = function()
{   
	event.preventDefault();
	localStorage.setItem('active', 'aboutyou');
	alert('You clicked it!');
} */
</script>
 