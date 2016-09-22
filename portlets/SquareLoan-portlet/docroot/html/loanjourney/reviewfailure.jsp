   <%@ include file="/html/init.jsp" %>
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
                        <li id="icon4" class="flex-active-slide progressing">
                            <a href="#"><div>Loan review</div></a>
                        </li>
                        <li id="icon5">
                            <a href="#"><div>Confirmation</div></a>
                        </li>
                    </ul>
                </div>
            <div class="row-blk sticky-main">
                <article class="left-column grid-8 center-block">
                       <%
                          	  String reviewfailure=PortletProps.get("reviewfailure.content") ;
                            %>
                             <liferay-ui:journal-article articleId="<%= reviewfailure%>" groupId="<%=themeDisplay.getScopeGroupId()%>"/>
                </article>
                <!-- Sidebar -->

                <!-- Sidebar end -->
                <!-- Sticky side bar bottom boundary -->
                <div id="stick-offset" class="clear"></div>
            </div>
        </div>
    </section>
