<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.Format"%>
<%@ include file="/html/init.jsp"%>
        <%
        Format formatter = new SimpleDateFormat("yyyy-MM-dd");
        String todayDate = formatter.format(new Date());
        pageContext.setAttribute("todayDate",todayDate);
        %>
       <section class="section">
            <div class="container">
                <div class="steps-row flexslider text-center" id="step-carousel">
                    <ul class="slides clearfix">
                        <li id="icon1" class="completed"> 
                            <a href="#"><div>Get Started</div></a>
                        </li>
                        <li id="icon2" class="completed">
                            <a href="#"><div>About you</div></a>
                        </li>
                        <li id="icon3" class="completed">
                            <a href="#"><div>Affordability</div></a>
                        </li>
                        <li id="icon4" class="completed">
                            <a href="#"><div>Loan review</div></a>
                        </li>
                        <li id="icon5" class="flex-active-slide progressing">
                            <a href="#"><div>Confirmation</div></a>
                        </li>
                    </ul>
                </div>
                <div class="row-blk confirmation">
                    <article class="left-column grid-8 center-block">
                        <h1>Your money is on its way! </h1>
                         <h4>Your loan has been sent by faster payment to your bank account.</h4>
                         <h4>You have successfully set up a Direct Debit for your account.</h4>
                         <div class="table-data clearfix ">
                            <div>
                                <table width="100%">
                                <tr>
                                        <td>Today&#39s Date:</td>
                                        <td><c:out value="${todayDate}"/></td>
                                    </tr>
                                    <tr>
                                        <td>Customer Reference Number:</td>
                                        <td>${Customer.customerID}</td>
                                    </tr>
                                    <tr>
                                        <td>Service User Number:</td>
                                        <td>445513</td>
                                    </tr>
                                    <tr>
                                        <td>Account Holder Name:</td>
                                        <td>${Customer.bankAccount.accountName}</td>
                                    </tr>
                                    <tr>
                                        <td>Account Number:</td>
                                        <td>${Customer.bankAccount.accountNumber}</td>
                                    </tr>
                                    <tr>
                                        <td>Sort Code:</td>
                                        <td>${Customer.bankAccount.sortCode}</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                           <%
                          	  String debitDetailsCheckbox=PortletProps.get("confirmation.content") ;
                            %>
                             <liferay-ui:journal-article articleId="<%= debitDetailsCheckbox%>" groupId="<%=themeDisplay.getScopeGroupId()%>"/>
                       
                    </article>
                   <div id="stick-offset" class="clear"></div>
                </div>
            </div>
        </section>
        <!--#include file="footer.html"-->
         <%@ include file="/html/loanjourney/footer.jsp" %> 
   <script>
  
  var loanId='${Customer.agreement.agreementNumber}';
  var loanAmount='${Customer.agreement.advance}';
  var loanTerm='${Customer.agreement.numberOfPayments}';
  
  var dataLayer=[{
	  loan:{
	  id: loanId,
	  amount: loanAmount,
	  term: loanTerm
	  }
	  }];
  
  </script>
  
   
