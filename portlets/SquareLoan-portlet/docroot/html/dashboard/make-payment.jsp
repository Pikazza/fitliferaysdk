<%@ include file="/html/init.jsp" %>

    <!--#include file="header-dashboard.html"-->
    <div class="my-account-section">
        <div class="container">
            <div class="my-account-header">
                <!-- dashboard breadcrumb start  -->
                <ul class="breadcrumb">
                    <li>YOU’RE HERE :</li>
                    <li><a href="#">my account</a></li>
                    <li>MAKE A PAYMENT</li>
                </ul>
                <!-- dashboard breadcrumb end  -->
                <div class="row-blk">
                    <div class="grid-8">
                        <h3><strong>Make a payment</strong></h3>
                    </div>
                    <div class="grid-4">
                    <%
										String helpLine = StringPool.BLANK;
										try {
											String articleidhelpLine = PortletProps.get("dashboard.myAccount.helpline");											
											helpLine = JournalContentUtil.getContent(themeDisplay.getLayout().getGroupId(), articleidhelpLine, null,
													themeDisplay.getLocale().toString(), themeDisplay);											
										} catch (Exception e) {
											helpLine = "Please configure update Help Line Content";
										}
									%>
									<%=helpLine%>                       
                       
                    </div>  
                </div> 
            </div>
            <!-- make payment form section -->
            <section class="make-payment-section remove-tick">
                <div class="form-block">
                    <div class="form-row">
                        <div class="radio radiobutton clearfix">
                            <input type="radio" id="radio1" name="radio">
                            <label for="radio1"><span>HSBC Card</span></label>

                            <input type="radio" id="radio2" name="radio">
                            <label for="radio2"><span>New Debit / Credit Card</span></label>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-inner-field">
                            <label><span>Payment amount</span></label>
                            <div class="pound-block">
                                <span class="pound-symbol">&pound;</span>
                                <input type="text" value="" id="monthlyincome" class="text-box Payment-amount number" maxlength="8">
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-inner-field">
                            <label><span>Card Number</span></label>
                            <input type="text" value="" class="text-box number card-number">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-inner-field">
                            <label><span>Card Type</span></label>
                            <div class="drop-down">
                                <select name="speed" class="select-drop-down ">
                                    <option value=""></option>
                                    <option>visa Card</option>
                                    <option>master Card</option>
                                </select>
                            </div>
                        </div>


                        
                    </div>
                    <div class="form-row small-form-row add-text-box date-to-paid">
                        <div class="form-inner-field clearfix">
                            <label><span>Valid From</span></label>
                            <div class="small-box">
                                <input type="text" value="" id="datepaid" class="text-box small-text-box number" placeholder="MM" maxlength="2">
                            </div>
                            <div class="small-box">
                                <input type="text" value="" id="datePaid1" class="text-box small-text-box number" placeholder="YY" maxlength="2">
                            </div>
                        </div>
                    </div>
                    <div class="form-row small-form-row add-text-box date-to-paid">
                        <div class="form-inner-field clearfix">
                            <label><span>Expiry Date</span></label>
                            <div class="small-box">
                                <input type="text" value="" id="datepaid" class="text-box small-text-box number" placeholder="MM" maxlength="2">
                            </div>
                            <div class="small-box">
                                <input type="text" value="" id="datePaid1" class="text-box small-text-box number" placeholder="YY" maxlength="2">
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-inner-field">
                            <label><span>CVV</span></label>
                            <input type="text" value="" class="text-box cvv-number number">
                        </div>
                    </div>
                    <!-- <div class="save-card-details">
                        <div class="checkBox">
                            <input type="checkbox" id="eligible" name="checkbox">
                            <label for="eligible"><span>Save card details</span></label>
                        </div>
                    </div> -->
                    <input type="submit" class="button button-primary button-pay" value="PAY">
                    <button type="button" class="button button-secondary" value="CANCEL" onclick="goToDashboard()">CANCEL</button>
                </div>
            </section>
            <!-- make payment form section -->
        </div></div>
    </div>
</div>
    <!-- problem-block start-->
    <section class="problem-block text-center">
        <div class="container">
            Late repayment can cause you serious money problems. <strong>For help go to <a href="mailto:moneyadviceservice.co.uk" title="moneyadviceservice.co.uk">moneyadviceservice.co.uk</a></strong>
        </div>
    </section>
    <!-- problem-block end-->
<!--#include file="footer.html"-->

<script type="text/javascript">
function goToDashboard(){
	window.location.href="${dashboardURL}";
}
<!--

//-->
</script>
