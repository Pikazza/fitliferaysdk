<%@page import="javax.portlet.PortletSession"%>
<%@ include file="/html/init.jsp" %>

<portlet:defineObjects />



 <div class="dashboard-block">
        <div class="container">
            <div class="title-row">
                <h1>My Square Today Loan</h1>
            </div>
        </div>
    </div>
    <!-- dashboard-block end -->
    <!-- error message start -->
  <%--   <div class="my-account-errormsg">
        <div class="container">
            <p><i class="fa fa-exclamation-triangle"></i>${Customer.firstName}, our customer services team are tying to contact you. Please call us when you can <span class="my-acoount-close"><i class="fa fa-times-circle-o"></i></span></p>
        </div>
    </div> --%>
    <!-- error message end -->
    <!-- my-payment section start -->
    <div class="my-account-section my-payment">
        <div class="container">
            <div class="row-blk">
                <div class="grid-8">
                    <div class="payment-details">
                        <div class="amount-due clearfix">
                            <div class="grid-8 total-due equal-height">
                                <span>Total Amount Payable</span>
                                <c:set var="temp" value="${0}" />
                                <c:set var="currencybalancetemp" value="${temp + Customer.agreement.currentBalance}" />
                                <c:set var="totalbalancetemp" value="${temp + Customer.agreement.totalChargeForCredit}" />
                                <c:set var="totalpayable" value="${currencybalancetemp + totalbalancetemp}" />
                                <p>&pound; <fmt:formatNumber value='${totalpayable}' minFractionDigits="2" /> </p>
                            </div>
                            <div class="grid-4 current-arp equal-height">
                                <div class="current-arp-pad">
                                    <span>Current Rate</span>
                                    <p>${Customer.agreement.customerAPR} % <small>APR</small></p>
                                </div>
                            </div>
                        </div>
                        <!--  <div class="next-box-error clearfix">
                            <span class="fL"><i class="fa fa-exclamation-triangle"></i> <strong>You are late</strong> in repaying your loan this month</span>
                            <a href="#" class="fR"><i class="fa fa-caret-right"></i> make a payment</a>
                        </div>  -->
                        <div class="next-payment clearfix">
                            <div class="grid-8 total-due total-due-payment equal-height">
                                <span>Next Payment</span>
                                <p>&pound;${Customer.agreement.instalment}</p>
                            </div>
                            <div class="grid-4 current-arp equal-height">
                                <div class="current-arp-payment-date">
                                    <span>Next Payment Date</span>
                                  
  <fmt:parseDate value="${Customer.agreement.firstDueDate}" pattern="yyyy-MM-dd" var="mydate"/>
  <p><fmt:formatDate value="${mydate}" pattern="dd MMMMMMMM YYYY" dateStyle="long"  /><p>
                                   
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="payment-mode">
                        <div class="scroll-hide">
                            <ul class="clearfix">
                                <li>Remaining payments <span>${Customer.agreement.numberOfPayments}</span></li>
                                <li>Of the amount <span>&pound;${Customer.agreement.instalment}</span></li>
                                <li>Final payment due 
                                
                               
                                <fmt:parseDate value="${finaldate}"  pattern="yyyy-MM-dd" var="finalmydate"/>
                               
                                <span> <fmt:formatDate value="${finalmydate}" pattern="dd MMMMMMMM YYYY" dateStyle="long"  /></span></li>
                            </ul>
                        </div>
                        <c:if test="${not empty transactionList}">
                        <div class="payment-due-date">
                            <table width="100%">
                                <tr>
                                    <th>Amount</th>
                                    <th>Transaction type</th>
                                    <th>Date</th>
                                </tr>
                                <c:forEach items="${transactionList}" var="ftransaction"> 
								  <tr>
								    <td>${ftransaction.creditAmount}  ${ftransaction.debitAmount} </td>
								    <td>${ftransaction.description}</td>
								    <fmt:parseDate value="${ftransaction.effectiveDate}" pattern="yyyy-MM-dd" var="mytrdate"/>
								    <td><fmt:formatDate value="${mytrdate}" pattern="dd MMM YYYY" dateStyle="long"  /></td>
								    </tr>
								</c:forEach>
                            
                            </table>
                        </div>
                        </c:if>
                    </div>
                   
                    <div class="bottom-row clearfix">
                     <c:if test="${not empty transactionList}">
                        <div class="view-payment fL">
                           <a href="#"><i class="fa fa-angle-down"></i> Show past transactions</a>
                        </div>
                         </c:if>
                          <c:if test="${not empty docurl}">
                        <div class="download-statement fR">
                            <a href="${viewDocumetURL}&docurl=${docurl}"><i class="fa fa-arrow-circle-o-down"></i> DOWNLOAD STATEMENT</a>
                        </div>
                         </c:if>
                    </div>
                   
                </div>
                <div class="grid-4 aside-sub">
                    <div class="our-products-side"> 
                        <h6>Your account</h6>
                        <ul>
                           <li class="active" >
                                <a href="${dashboardURL}" >My Square Today loan</a>
                            </li>
                            <li>
                                <a href="${updateViewUrl}" >My details</a>
                            </li>
                            <li>
                                <a href="${mydocumentUrl}" >My documents</a>
                                
                            </li>
                        </ul>
                    </div>
                     
                       	<%
										String dashboard = StringPool.BLANK;
										try {
											String articleid = PortletProps.get("dashboard.refer.friend");											
											dashboard = JournalContentUtil.getContent(themeDisplay.getLayout().getGroupId(), articleid, null,
													themeDisplay.getLocale().toString(), themeDisplay);											
										} catch (Exception e) {
											dashboard = "Please configure cms id";
										}
									%>
								<%-- 	<%=dashboard%> --%>
                    
                </div>
            </div>
        </div>
    </div>