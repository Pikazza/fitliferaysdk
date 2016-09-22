
<%@ include file="/html/init.jsp" %>
<% 
String eligibilityid = PortletProps.get("eligibility.article");
String detailsid = PortletProps.get("details.needed.article");

long groupid = themeDisplay.getScopeGroupId();
%>
<div class="global-error">
    <div class="container">Please confirm eligibilty to proceed<a href="#"><i class="fa fa-times-circle"></i></a></div>
  </div>
    <section class="section">
        <div class="container">
            <!-- steps-row start start-->
            <div class="steps-row flexslider text-center" id="step-carousel">
                <ul class="slides clearfix">
                    <li id="icon1" class="flex-active-slide progressing"> 
                        <a href="javascript:void(0)"><div>Get Started</div></a>
                    </li>
                    <li id="icon2">
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
             <!-- steps-row start end-->
            <div class="row-blk sticky-main">
               <form:form name="eligibiltyform" action="${aboutyouurl}" method="POST"  commandName="Customer" id="eligibiltyform" >
                <article class="left-column grid-9">
                <!-- Eligibility Criteria -->
                    <div class="bottom-fourty">
                    
                     <liferay-ui:journal-article articleId="<%=eligibilityid%>" groupId="<%=groupid%>"></liferay-ui:journal-article>
                    
                     <!--    <h1>Eligibility</h1>
                        <div class="intro-text">
                            <strong>Before you start, make sure you can say yes to all of the below</strong>
                        </div>
                        <div class="common_list">
                            <ul>
                                <li>You are 18 or older</li>
                                <li>You are a UK resident or have the right to work in the UK</li>
                                <li>You don't already have a loan with us that you are still repaying</li>
                                <li>You are employed and receiving a regular wage</li>
                                <li>You are not currently bankrupt, insolvent or using debt management </li>
                                <li>You do not have any outstanding county court judgments or sheriff court decrees</li>
                                <li> You have a mobile number we can contact you on about your account</li>
                                <li>You have a UK bank account with a debit card, that we will pay your loan into</li>
                            </ul>
                        </div> -->
                        <div class="gray-bg">
                            <div class="checkBox">
                                <form:checkbox  id="eligible" path="eligiblity" />
                              
                                
                                
                                
                               
                                
                                
                                <label for="eligible"><span>I <strong>am eligible</strong> to continue with the loan application</span></label>
                            </div>
                        </div>
                        <!-- <a href="#" class="btn" id="eligible">Yes, I am eligible to continue</a> -->
                    </div>
                    <!-- Information application -->
                    <div class="disabled_block" id="eligibility_main">
                        <div id="eligibility_info">
                         <liferay-ui:journal-article articleId="<%=detailsid%>" groupId="<%=groupid%>"></liferay-ui:journal-article>
                           <!--   <div class="intro-text"><strong>You will also need to have ready the following information for your application</strong></div>
                            <div class="common_list">
                                <ul>
                                    <li>Your employer's details</li>
                                    <li>Your bank account details</li>
                                    <li>Your address details for the past 12 months</li>
                                    <li>Detail of your monthly outgoings</li>
                                </ul>
                            </div> -->
                        </div>
                    </div>
                    <!-- Navigate option -->
                    <div class="final-step clearfix">
                        <button type="button" id="conTBtn" class="button button-primary next-pages fL grey-button" >CONTINUE</button>
                    </div>
                    <div class="bottom-button-row clearfix">
                        <div class="fR"> <a href="${cancelurl}"> <i class="fa fa-times"></i> Cancel </a> </div>
                    </div>
                </article>
                <!-- Sidebar -->
              
               <%@ include file="/html/loanjourney/aside.jsp" %> 
               </form:form>
                <!--#include file="aside.html"-->
                
                <!-- Sidebar end -->
                <!-- Sticky side bar bottom boundary -->
                <div id="stick-offset" class="clear"></div>
            </div>
        </div>
    </section>
<!--#include file="footer.html"-->
 <%@ include file="/html/loanjourney/footer.jsp" %>
 
   <c:if test="${Customer.eligiblity eq true}">
                                
                                 <script type="text/javascript">
                               
                                var $eligible_main = $('#eligibility_main'),
                                $eligible_content = $('#eligibility_info');
                                 $('.next-pages').removeClass('grey-button');
                                 $eligible_main.removeClass('disabled_block');
                                 $eligible_content.slideDown(function() {
                                     $('html, body').animate({
                                         scrollTop: $('#eligibility_info').offset().top - 92
                                     }, 1500);
                                     setSidebarHeight();
                                 });
                                
                                </script>
                                
                                </c:if>