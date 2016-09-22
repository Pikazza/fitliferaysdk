<%@page import="javax.portlet.PortletSession"%>
<%@page import="com.liferay.portal.kernel.util.PropsUtil"%>
<%@ include file="/html/init.jsp" %>
<portlet:resourceURL var="proceedURL" id="proceedAgreement"/>


<portlet:resourceURL var="viewContractURL" id="viewAgreementContract"/>
<portlet:renderURL var="confirmationURL" >
<portlet:param name="action" value="confirmation"/>
</portlet:renderURL>
          <section class="section">
            <div class="container">
                <div class="steps-row flexslider text-center" id="step-carousel">
                    <ul class="slides clearfix">
                        <li id="icon1" class="completed">
                            <a href="javascript:void(0)">
                                <div>Get Started</div>
                            </a>
                        </li>
                        <li id="icon2" class="completed">
                            <a href="javascript:void(0)">
                                <div>About you</div>
                            </a>
                        </li>
                        <li id="icon3" class="completed">
                            <a href="javascript:void(0)">
                                <div>Affordability</div>
                            </a>
                        </li>
                        <li id="icon4" class="flex-active-slide progressing">
                            <a href="javascript:void(0)">
                                <div>Loan review</div>
                            </a>
                        </li>
                        <li id="icon5">
                            <a href="javascript:void(0)">
                                <div>Confirmation</div>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="row-blk loadreview">
                <%-- <a href="${confirmationURL}">confirmation</a> --%>
                    <article class="left-column grid-8 center-block">
                    <%
                    PortletSession psession= renderRequest.getPortletSession();
                    String attributeValue = (String) psession.getAttribute("applyAmmount", PortletSession.PORTLET_SCOPE);
                    pageContext.setAttribute("appamount",attributeValue);
                    %>
                      <c:set var="addAmount" value="${appamount}" />
                    
                        <h1>Congratulations! You have been approved for a loan of &pound;${Customer.agreement.advance }</h1>
                        <div class="loan-intro">
                          <% 
						String introArticleId = PortletProps.get("review.loan.intro");
								%>
                           <liferay-ui:journal-article articleId="<%= introArticleId%>" groupId="<%=themeDisplay.getScopeGroupId()%>"/>
                        </div>
                        <!-- Repayment Schedule -->
                        <div class="repay-next-div">
                            <div class="repay-title selected">Your loan offer</div>
                            <div class="loan-content-box">
                                <div class="table-data clearfix">
                                    <div>
                                        <table width="100%">	
                                            <tr>
                                                <td>Loan reference number</td>
                                                <td>${Customer.agreement.agreementNumber}</td>
                                            </tr>
                                            <tr>
                                                <td>Loan amount</td>
                                                <td> &pound;${Customer.agreement.advance}</td>
                                            </tr>
                                            <c:choose>
 								            <c:when test="${addAmount == Customer.agreement.advance}">
 									        </c:when>
 									        <c:when test="${empty addAmount}">
 									        </c:when>
  								            <c:otherwise>
     										<tr class="note"><td colspan="2"><p>
                                             Unfortunately, we were unable to offer you the full amount requested. If you are happy with the proposed amount, please continue to review your documents.</p></td></tr>
  								            </c:otherwise>
							                </c:choose>
                                             <tr>
                                                <td>APR</td>
                                                <td>${Customer.agreement.customerAPR}%</td>
                                              </tr>
                                             <tr>
                                                <td>Total to be repaid</td>
                                                <c:set var="temp" value="${0}" />
                                                <c:set var="currencybalancetemp" value="${temp + Customer.agreement.advance}" />
                                                <c:set var="totalbalancetemp" value="${temp + Customer.agreement.totalChargeForCredit}" />
                                                   <c:set var="totalpayable" value="${currencybalancetemp + totalbalancetemp}" />
                                                  <td>&pound; <fmt:formatNumber value='${totalpayable}' /> </td>
                                                  <%--  <td>&pound;${Customer.agreement.totalChargeForCredit}</td> --%>
                                            </tr>
                                            <tr>
                                           
                                           <td>Loan term</td>
                                           <td>${Customer.agreement.numberOfPayments} Instalments</td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="gray-bg">
                                    <div class="checkBox">
                                        <input type="checkbox" class="loan-offer proceed" id="loan-offer" name="checkbox">
                                        <label for="loan-offer"><span>
                                        <%
                                        String reviewYourloanoffercheckbox=PortletProps.get("review.Yourloanoffer.checkbox");
                                        %>
                                        <liferay-ui:journal-article articleId="<%= reviewYourloanoffercheckbox%>" groupId="<%=themeDisplay.getScopeGroupId()%>"/>
                                        </span></label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="repay-next-div">
                            <div class="repay-title">Payment schedule</div>
                            <div class="loan-content-box">
                                <div class="table-data clearfix">
                                    <div>
                                        <table width="100%">
                                            <tr>
                                                <td>First payment date</td>
                                                <td id="datePayment">
                                                <fmt:parseDate value="${Customer.agreement.firstDueDate}" pattern="yyyy-MM-dd" var="mydate"/>
  <fmt:formatDate value="${mydate}" pattern="dd MMMMMMMM YYYY" dateStyle="long"  />
                                                 
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Frequency of subsequent payments</td>
                                                <td id="frequency"><c:out value='${requestScope.frequencyofpayment}'/></td>
                                            </tr>
                                            <tr>
                                                <td>Instalment amount</td>
                                                <td>&pound;${Customer.agreement.instalment}</td>
                                            </tr>
                                            <tr>
                                                <td>Number of instalments</td>
                                                <td>${Customer.agreement.numberOfPayments}</td>
                                            </tr>
                                            <tr>
                                                <td>Total repayment amount</td>
                                                 <td id="amount">&pound; <fmt:formatNumber value='${totalpayable}' /> </td>
                                                <%-- <td id="amount">&pound;${Customer.agreement.totalChargeForCredit}</td> --%>
                                            </tr>
                                            <!-- <tr>
                                                <td colspan="2">
                                                    <a href="#" class="alert-message-highlight"> <i class="fa fa-file-pdf-o"></i>DOWNLOAD FULL PAYMENT SCHEDULE</a>
                                                </td>
                                            </tr> -->
                                        </table>
                                    </div>
                                </div>
                                <div class="gray-bg">
                                    <div class="checkBox">
                                        <input type="checkbox" class="loan-offer" id="loan-schedule" name="checkbox">
                                        <label for="loan-schedule"><span>
                                        <%
                                        String reviewPaymentschedulecheckbox=PortletProps.get("review.Paymentschedule.checkbox");
                                        %>
                                        
                                        <liferay-ui:journal-article articleId="<%= reviewPaymentschedulecheckbox%>" groupId="<%=themeDisplay.getScopeGroupId()%>"/>
                                       
                                        </span></label>
                                    </div>
                                </div>
                            </div>
                        </div>
                       
                        <div class="repay-next-div">
                         <%   String reviewAdequateEexplanationsIntro =PortletProps.get("review.adequate.eexplanations.intro");
                          %>
                             <liferay-ui:journal-article articleId="<%= reviewAdequateEexplanationsIntro%>" groupId="<%=themeDisplay.getScopeGroupId()%>"/>
                               
                        
                        <%--     <div class="repay-title">Adequate explanations </div>
                            <div class="loan-content-box loan-terms-row">
                          <%   String reviewAdequateEexplanationsIntro =PortletProps.get("review.adequate.eexplanations.intro");
                          %>
                             <liferay-ui:journal-article articleId="<%= reviewAdequateEexplanationsIntro%>" groupId="<%=themeDisplay.getScopeGroupId()%>"/>
                                       
                                <div class="loan-condition">
                                    <div class="loan-condition-details">
                                      ============  Document ==============
                                        
                                    </div>
                                </div>
                                <div class="gray-bg">
                                    <div class="checkBox">
                                        <input type="checkbox" class="loan-offer loan-offer-condition" id="loan-information" name="checkbox">
                                        <label for="loan-information"><span>
                                        <%
                                        String reviewAdequateExplanationsCheckbox=PortletProps.get("review.adequate.explanations.checkbox");
                                        %>
                                        <liferay-ui:journal-article articleId="<%= reviewAdequateExplanationsCheckbox%>" groupId="<%=themeDisplay.getScopeGroupId()%>"/>
                              
                                        
                                        </span></label>
                                    </div>
                                </div>
                            </div> --%>
                        </div> 
 						<div class="repay-next-div">
 						<%
                            String reviewPrecontractintro=PortletProps.get("review.pre.contract.intro") ;
                            %>
                             <liferay-ui:journal-article articleId="<%= reviewPrecontractintro%>" groupId="<%=themeDisplay.getScopeGroupId()%>"/>
                               
 						
                           <%--  <div class="repay-title">Pre-contract credit information</div>
                            <div  class="loan-content-box"> 
                            
                            <%
                            String reviewPrecontractintro=PortletProps.get("review.pre.contract.intro") ;
                            %>
                             <liferay-ui:journal-article articleId="<%= reviewPrecontractintro%>" groupId="<%=themeDisplay.getScopeGroupId()%>"/>
                               
                                 <div class="loan-condition">
                                    <div id ="precontract" class="loan-condition-details">
                                    
                                    </div>
                                </div>
                                <div class="gray-bg">
                                    <div class="checkBox">
                                        <input type="checkbox" class="loan-offer loan-offer-condition" id="explanations-credit" name="checkbox">
                                        <label for="explanations-credit"><span>
                                         <%
                            String reviewPrecontractCheckbox=PortletProps.get("review.precontract.checkbox") ;
                            %>
                             <liferay-ui:journal-article articleId="<%= reviewPrecontractCheckbox%>" groupId="<%=themeDisplay.getScopeGroupId()%>"/>
                               
                                       </span></label>  
                                        
                                       
                                    </div>
                                </div>
                            </div> --%>
                         </div> 
                        <div class="repay-next-div">
                         
                          <%
                            String reviewContractIntro=PortletProps.get("review.Contract.Intro") ;
                            %>
                             <liferay-ui:journal-article articleId="<%= reviewContractIntro%>" groupId="<%=themeDisplay.getScopeGroupId()%>"/>
                              
                         
                         
                          <%--   <div class="repay-title">Your contract</div>
                            <div class="loan-content-box">
                            
                            <%
                            String reviewContractIntro=PortletProps.get("review.Contract.Intro") ;
                            %>
                             <liferay-ui:journal-article articleId="<%= reviewContractIntro%>" groupId="<%=themeDisplay.getScopeGroupId()%>"/>
                              
                            
                                <div class="loan-condition">
                                    <div class="loan-condition-details">
                               ============Docs===================
                                    </div>
                                </div>
                                <div class="gray-bg"> 
                                    <div class="checkBox">
                                        <input type="checkbox" class="loan-offer loan-offer-condition" id="explanations" name="checkbox">
                                        <label for="explanations"><span>
                                        <%
                                        String reviewContractCheckbox=PortletProps.get("review.contract.checkbox");
                                        %>
                                        <liferay-ui:journal-article articleId="<%= reviewContractCheckbox%>" groupId="<%=themeDisplay.getScopeGroupId()%>"/>
                             
                                        
                                        </span></label>
                                    </div>
                                </div>
                            </div> --%>
                         </div>   

                         <div class="repay-next-div">
                             <div class="repay-title">Your direct debit details</div>
                                <div class="loan-content-box">
                                    <h5>Almost there, we just need to set up your direct debit.</h5>
                                <div class="table-data clearfix">
                                    <div>
                                         <table width="100%">
                                            <tr>
                                                <td>Account name</td>
                                                <td>${Customer.bankAccount.accountName}</td>
                                            </tr>                                           
                                            <tr>
                                                <td>Account Number</td>
                                                <td>${Customer.bankAccount.accountNumber}</td>
                                            </tr>
                                            <tr>
                                                <td>Sort code</td>
                                                <td>${Customer.bankAccount.sortCode}</td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="loan-condition last-box">
                                     <%
                            String loanConditions=PortletProps.get("review.bank.details") ;
                            %>
                             <liferay-ui:journal-article articleId="<%= loanConditions%>" groupId="<%=themeDisplay.getScopeGroupId()%>"/>
                              
                         
                                </div>
                                </div>
                                <div class="gray-bg">
                                 <%
                          	  String debitDetailsCheckbox=PortletProps.get("review.Your.direct.debit.details.checkbox") ;
                            %>
                             <liferay-ui:journal-article articleId="<%= debitDetailsCheckbox%>" groupId="<%=themeDisplay.getScopeGroupId()%>"/>
                                </div>
                            </div>
                         </div>              
				<div class="final-step clearfix" id="loan-accept">
                             <p>That&#39s everything sorted. If you are happy for us to put the loan in your bank in accordance with the terms above please select accept below.</p>
                            <button type="button" class="button button-primary next-pages fL grey-button" data-link="${confirmationURL}">Accept
                            </button>
                        </div>
                        <div class="bottom-button-row clearfix margintop10">
                            <div class="fL">
                                <a href="#"> <i class="fa fa-chevron-left" onClick="goBack()"></i> Back </a>
                            </div>
                            <div class="fR">
                                <a href="winBack.shtml"> <i class="fa fa-times"></i> Cancel </a>
                            </div>
                        </div>                  
                        
                    </article>
                    <div id="stick-offset" class="clear"></div>
                </div>
            </div>
        </section>
        <!--#include file="footer.html"-->

<script type="text/javascript">
	$(document).ready(function() {	 
		var agrId='${Customer.agreement.agreementNumber}';
		// $('.loader-wrapper').fadeIn(); 
		//viewContract('${Customer.agreement.agreementNumber}');	
			/* var tnk="STO000062601" */				
		/* viewContractDocuments(agrId,1,"adequate"); */
		viewContractDocuments(agrId,2,"precontract");
		viewContractDocuments(agrId,3,"contract");
		var refrenceNumber='${Customer.agreement.agreementNumber}';
		$("a#ml").attr('href','mailto:authorisations@squaretoday.co.uk?subject='+refrenceNumber);
	});	
	 
	
 function proceed(agNumber){
	  
	 //agNumber="STO000062601"	
	if($('.proceed').prop('checked')){
		
	$.ajax({
	url : '${proceedURL}',
	type : 'GET',
	data : {				
		agreementNumber:agNumber	
	},
	async : false,
	success : function(serverResponse) {	
		
		var jsonObj=$.parseJSON(serverResponse);		
		$('#frequency').html(jsonObj.paymentFrequencyDescription);
		$('#datePayment').html(jsonObj.firstDueDate);
		$('#instalment').html('&pound;'+jsonObj.instalment );
		$('#amount').html('&pound;'+jsonObj.totalChargeForCredit);
	},
	error:function(errorStatus){
		alert(errorStatus);		
	}
	});
	}	
}
 
 function reIntializeScroll(){
	 $(".loan-condition-details").mCustomScrollbar({
	        callbacks:{
	            onTotalScroll:function(){
	                $(this).parents('.loan-content-box').find('.loan-offer-condition').attr('disabled', false);
	                $(this).parents('.loan-content-box').find('.loan-offer-condition').removeClass('ui-button-disabled ui-state-disabled');
	                $(this).parents('.loan-content-box').find(".loan-offer-condition").button('refresh');
	            }
	        },
	        advanced:{
	            updateOnContentResize: true
	        }
	    });
 }
 
 function viewContractDocuments(agNumber,docType,displayDiv){
     //  var tempAggrementNumber='STO000064576';
	    $.ajax({
		url : '${viewContractURL}',
		type : 'GET',
		data : {				
			agreementNumber:agNumber,
			documentType:docType,
			displayDivision:displayDiv
		},
		async : true,
		success : function(serverResponse) {
			console.log("serverResponse "+serverResponse)
			
			//sleepFor(30000);
			$(".loan-offer-condition").button('refresh');
			
			
			var jsonObj=$.parseJSON(serverResponse);
			var HTMLContent='';		
			var showDiv=jsonObj[0].whichDiv;			
			for(var i=1;i<jsonObj.length;i++){			
				var Value = jsonObj[i];
				HTMLContent +='<img src="'+Value.image+'" alt="image"/><br/>';
			}
			$('#' + showDiv ).html(HTMLContent);
			reIntializeScroll();
		},
		error:function(errorStatus){		
			alert(errorStatus);		
		}
		});
	}

 function sleepFor( sleepDuration ){
	    var now = new Date().getTime();
	    while(new Date().getTime() < now + sleepDuration){ /* do nothing */ } 
	}
 
 
</script>
