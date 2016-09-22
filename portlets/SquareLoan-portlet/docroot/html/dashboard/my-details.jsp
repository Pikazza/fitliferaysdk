 <%@ include file="/html/init.jsp" %>


<portlet:actionURL var="updateURL">
<portlet:param name="action" value="update"/>
</portlet:actionURL>
 <div class="my-account-section">
        <div class="container">
            <div class="my-account-header">
                <h1>My details</h1>
            </div>
            <div class="row-blk">
                <div class="grid-8">
                <%
										String documnetmsg = StringPool.BLANK;
										try {
											String articleid = PortletProps.get("my.details.message");											
											documnetmsg = JournalContentUtil.getContent(themeDisplay.getLayout().getGroupId(), articleid, null,
													themeDisplay.getLocale().toString(), themeDisplay);											
										} catch (Exception e) {
											documnetmsg = "Please configure cms id";
										}
									%>
									<%=documnetmsg%>
                    
                    <div class="my-details">
                        <div class="my-details-infomation">
                            <div class="form-block">
                                <div class="form-row">
                                    <div class="form-inner-field">
                                        <label><span>First Name</span></label>
                                        <div class="no-edite"><span>${Customer.firstName}</span></div>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-inner-field">
                                        <label><span>Last Name</span></label>
                                        <div class="no-edite"><span>${Customer.lastName}</span></div>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-inner-field">
                                        <label><span>Email Address</span></label>
                                        <div class="no-edite"><span>${Customer.emailAddress}</span></div>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-inner-field">
                                        <label><span>Mobile Number</span></label>
                                        <div class="no-edite mobile-edite"><span>${Customer.mobilePhoneNumber}</span></div>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-inner-field">
                                        <label><span>Home Number</span></label>
                                        <div class="no-edite"><span>${Customer.homePhoneNumber}</span></div>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-inner-field">
                                        <label><span>Home address</span></label>
                                        <div class="no-edite no-edite-my-details">
                                        <span>${Customer.addressHistory.occupancy[0].address.propertyNumber}  ${Customer.addressHistory.occupancy[0].address.propertyName}<br/> 
                                        ${Customer.addressHistory.occupancy[0].address.streetName} <br/> 
                                        ${Customer.addressHistory.occupancy[0].address.postTown} <br/> 
                                         ${Customer.addressHistory.occupancy[0].address.county} <br/>
                                        ${Customer.addressHistory.occupancy[0].address.postCode}</span>
                                        
                                        </div>
                                        
                                        	
                                        
                                    </div>
                                </div>
                            </div>
                             <form:form action="${updateURL}" commandName="Customer" method="post" >   
                                <h4>Marketing Preferences</h4>
                                <p>From time to time Square Today would like to contact you about offers and messages we think would be of interest to you.  We never pass your details to third parties without your consent. Square Today takes your privacy very seriously.  You can find information on our <a href="http://edi02-ukol01.axcess-financial.com:8080/web/squaretoday/privacy-policy">privacy policy</a> page. Please select how you would like to receive promotional communications from Square Today:</p>
                                <div class="marketing-preferences-checkbox clearfix">
                                    <div class="checkBox">
                                        <form:checkbox  id="Email" path="contactByEmail"  />
                                        <label for="Email"><span>Email</span></label>
                                    </div>
                                    <div class="checkBox">
                                        <form:checkbox  id="sms" path="contactBySMS" />
                                        <label for="sms"><span>SMS</span></label>
                                    </div>
                                    <div class="checkBox">
                                        <form:checkbox  id="post"  path="contactByPost" />
                                        <label for="post"><span>Post</span></label>
                                    </div>
                                    <div class="checkBox">
                                        <input type="checkbox" id="nomarket" name="checkbox">
                                        <label for="nomarket"><span>No marketing</span></label>
                                    </div>
                                </div>
                                <div class="details-save">
                                    <input type="submit" class="button button-primary" value="SAVE">
                                    <!-- <input type="submit" class="button button-secondary" value="CANCEL"> -->
                                </div>
                            </form:form>
                        </div>
                    </div>
                </div>
                <div class="grid-4 aside-sub">
                    <div class="our-products-side"> 
                        <h6>Your account</h6>
                        <ul>
                            <li>
                                <a href="${dashboardURL}" >My Square Today loan</a>
                            </li>
                            <li class="active" >
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
									<%-- <%=dashboard%> --%>
                </div>
            </div>
        </div>
    </div>
</div>