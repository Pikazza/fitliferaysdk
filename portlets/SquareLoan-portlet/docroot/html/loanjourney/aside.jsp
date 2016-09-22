
 <%@ include file="/html/init.jsp" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page import="com.liferay.portlet.journalcontent.util.JournalContentUtil"%>
<%@page import="com.liferay.util.portlet.PortletProps"%>
<%@page import="com.liferay.portal.kernel.util.StringPool"%>
<aside class="right-column grid-4 sticky-table">
    <div class="details_table" id="side-bar"> 
        <!--<a class="live-chat" href="#"><img src="images/liveChat.png" alt=""/>LIVE CHAT available<span class="dots"></span></a>-->
        <div class="calcResults eqc">
            <h2>Your loan summary</h2>
            <div class="borrowDetails">
                <!-- <div class="sideBar-detail">
                    <h4>Useful Documents</h4>
                    <ul>
                        <li><a href="#"><i class="fa fa-file-pdf-o"></i> Our Adequate Explanations</a></li>
                        <li><a href="#"><i class="fa fa-file-pdf-o"></i> Our Adequate Explanations</a></li>
                    </ul>
                </div> -->
                <div class="slideBar-table">
                    <table width="100%">
                        <tr>
                            <td>Amount borrowed</td>
                          
                            	 
                            	
                            	<td>&pound;<fmt:formatNumber value="${Customer.agreement.advance}"  minFractionDigits="2"  type="number" ></fmt:formatNumber>
                            	<%-- <c:out value="${Customer.agreement.advance}" default="" /> --%>
                            	
                            	
                            	
                            
                              <form:input type="hidden" path="agreement.advance"  /> 
                            	</td>
                            	   
                           
                            	
                        
                            	
                            	
                            	
                          
                           
                        </tr>
                        <tr>
                            <td>Over</td>
                            <td>
                            	
                            	<c:out value="${Customer.agreement.numberOfPayments}" default="" />
                            	
                            	
                            	
                            	
                            	 <form:input type="hidden" path="agreement.numberOfPayments"  />
                            
                            <span> MONTHS</span></td>
                          
                        </tr>
                        <tr>
                            <!-- <td>Representative</td>
                            <td>87% <span>APR</span></td> -->
                            <input type="hidden" name="loanRepAPR" value="87">
                        </tr>
                          <tr>
                                <td>Monthly repayments</td>
                                <td><div id="monthly_payment">&pound;<fmt:formatNumber value="${Customer.agreement.instalment}"  minFractionDigits="2"  type="number"  ></fmt:formatNumber>                             
                             
                            	
                            		<%-- 	<c:out value="${Customer.agreement.instalment}" default="" /> --%>
                            	
                            	
                            	
                            	
                            		 <form:input type="hidden" path="agreement.instalment"  />
                                
                                                               
                                
                                
                                </div></td> 
                             
                            </tr>
                            <tr>
                                <td>Total repayable</td>
                                <td><div id="repAPR">&pound;<fmt:formatNumber value="${Customer.agreement.totalChargeForCredit}"  minFractionDigits="2" type="number"  ></fmt:formatNumber>
                                
                                 <%-- <c:out value="${Customer.agreement.totalChargeForCredit}" default="0" /></div></td> --%>
                                <form:input type="hidden" path="agreement.totalChargeForCredit"  />
                            </tr>
                    </table>
                   <%--  <div class="total-details">
                        <table>
                            <tr>
                                <td>Monthly Repayments</td>
                                <td><div id="monthly_payment">&pound; 
                                
                             
                            	<fmt:formatNumber value="${Customer.agreement.instalment}"  minFractionDigits="2"></fmt:formatNumber>
                            			<c:out value="${Customer.agreement.instalment}" default="" />
                            	
                            	
                            	
                            	
                            		 <form:input type="hidden" path="agreement.instalment"  />
                                
                                                               
                                
                                
                                </div></td> 
                             
                            </tr>
                            <tr>
                                <td>Total repayable</td>
                                <td><div id="repAPR">&pound; <fmt:formatNumber value="${Customer.agreement.totalChargeForCredit}"  minFractionDigits="2"></fmt:formatNumber>
                                
                                 <c:out value="${Customer.agreement.totalChargeForCredit}" default="0" /></div></td>
                                <form:input type="hidden" path="agreement.totalChargeForCredit"  />
                            </tr>
                        </table>
                    </div> --%>
                   <%--  <div class="tableMore_info clearfix">
                        <div class="details"> <a href="#">DETAILS</a> </div>
                        <div class="change-loan"> <a href="${changeLoan}">CHANGE LOAN</a> </div>
                    </div> --%>
                </div>
            </div>
            <div class="problem-block clearfix">
            
                 <%
		String contentmessage = StringPool.BLANK;
		try{ 
	
		String articleid = PortletProps.get("contact.number");

		contentmessage = JournalContentUtil.getContent(themeDisplay.getLayout().getGroupId(), articleid, null,themeDisplay.getLocale().toString() , themeDisplay);

			}catch(Exception e){
	
	/* System.out.print("exception"+e.getMessage() ); */
		contentmessage = "Please configure eligbilty content";
		}
		%>

<%= contentmessage %>     
            
            </div>
        </div>
    </div>
</aside>