 <%@ include file="/html/init.jsp" %>


<portlet:defineObjects />
 <div class="my-account-section">
        <div class="container">
            <div class="my-account-header">
                <h1>My documents</h1>
            </div>
            <div class="row-blk">
                <div class="grid-8">
                 	<%
										String documnetmsg = StringPool.BLANK;
										try {
											String articleid = PortletProps.get("my.documents.message");											
											documnetmsg = JournalContentUtil.getContent(themeDisplay.getLayout().getGroupId(), articleid, null,
													themeDisplay.getLocale().toString(), themeDisplay);											
										} catch (Exception e) {
											documnetmsg = "Please configure cms id";
										}
									%>
									<%=documnetmsg%>
                    
                    <div class="my-details">
                        <div class="my-details-infomation">
                        
                        
                            <ul>
                            <c:if test="${empty listofDocuments}">
                            <li> Currently there are no documents for your account</li>
                            </c:if>
                             <c:forEach items="${listofDocuments}" var="document" varStatus="loop"> 
								<li><a href="${viewDocumetURL}&docurl=${document.documentUrl}&agreementNumber=${agreementNumber}"  target="_blank">
								<c:choose>
 								  <c:when test="${loop.index == 0}">
 							      PRE-CONTRACT
 								</c:when>
 								
 								<c:when test="${loop.index == 1}">
 							      CONTRACT
 								</c:when>
 								
  								 <c:otherwise>
  								   
  								</c:otherwise>
							    </c:choose>
								
								</a> </li>
								
								    
								   
								   
								</c:forEach>
                              
                            </ul>                            
                        </div>
                    </div>
                </div>
                <div class="grid-4 aside-sub">
                    <div class="our-products-side"> 
                        <h6>Your account</h6>
                        <ul>
                            <li>
                                <a href="${dashboardURL}">My Square Today loan</a>
                            </li>
                            <li >
                                <a href="${updateViewUrl}" >My details</a>
                            </li>
                            <li class="active" >
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