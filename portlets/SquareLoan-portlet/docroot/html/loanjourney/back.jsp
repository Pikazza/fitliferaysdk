<%@page import="com.liferay.portal.kernel.util.ParamUtil"%>
<%@ include file="/html/init.jsp" %>

<portlet:actionURL var="redirecturl">

		<portlet:param name="action" value='saveandforward'/>
		<portlet:param name="redirect" value='<%=(String)request.getAttribute("redirect") %>'/>

</portlet:actionURL>
<portlet:actionURL var="saveandexiturl" windowState="<%=WindowState.NORMAL.toString() %>">

		<portlet:param name="action" value='saveandforward'/>
		<portlet:param name="redirect" value='view'/>

</portlet:actionURL>
<%-- <portlet:renderURL var="redirecturl">

<portlet:param name="action" value='saveandforward'/>
<portlet:param name="redirect" value='<%=(String)request.getAttribute("redirect") %>'/>
</portlet:renderURL>
<portlet:renderURL var="saveredirecturl">
<portlet:param name="action" value='saveandforward'/>
				<portlet:param name="redirect" value='view'/>
</portlet:renderURL> --%>
<div id="main-wrapper" class="application-section sub-page-wrapper">
<!--#include file="header-subheader.html"-->
    <section class="section">
        <div class="container">
            <div class="steps-row flexslider text-center" id="step-carousel">
                    <ul class="slides clearfix">
                        <li id="icon1" class="completed"> 
                            <a href="#"><div>Get Started</div></a>
                        </li>
                        <li id="icon2" class="flex-active-slide progressing">
                            <a href="#"><div>About you</div></a>
                        </li>
                        <li id="icon3" class="">
                            <a href="#"><div>Affordability</div></a>
                        </li>
                        <li id="icon4" class="">
                            <a href="#"><div>Loan review</div></a>
                        </li>
                        <li id="icon5">
                            <a href="#"><div>Confirmation</div></a>
                        </li>
                    </ul>
                </div>
            <div class="row-blk sticky-main">
               <article class="left-column grid-8 middle-content">
                <h3>ARE YOU SURE?</h3>
                <span class="intro-text-block">If you haven’t saved your application the information you have entered on this page will be lost  
Just enter your email address and password to pick up where you left off.
</span>
                <div class="form-section"> 
                    <div class="final-step clearfix">
                        <button type="button" class="button button-primary fL" onClick='window.location.href = "${redirecturl}"'><i class="fa fa-download"></i> CONTINUE APPLICATION</button>
                        <button type="button" class="button fR button-secondary" onClick='window.location.href = "${saveandexiturl}"'>EXIT APPLICATION​</button>
                    </div>
              <!--   <div class="bottom-button-row clearfix">
                <button type="button" class="button button-primary button-small"><i class="fa fa-download"></i> EXIT APPLICATION​ </button>
                </div> -->
                </div>
                </article>
                <!-- Sticky side bar bottom boundary -->
                <div id="stick-offset" class="clear"></div>
            </div>
        </div>
    </section>
<!--#include file="footer.html"-->
 <%@ include file="/html/loanjourney/footer.jsp" %> 
</div>







