
<%@ include file="/html/init.jsp" %>
<%@page import="com.liferay.util.portlet.PortletProps"%>
<%@page import="com.liferay.portlet.journalcontent.util.JournalContentUtil"%>
<% 
String articleidbackground = PortletProps.get("calculator.background.12monthloan.content");
String repexp1 = PortletProps.get("choiceloan.calculator.tab1.repexp");
String repexp2= PortletProps.get("choiceloan.calculator.tab2.repexp");
String calculatorarticleid = PortletProps.get("calculator.data");
long groupid = themeDisplay.getLayout().getGroupId();
%>
    <!--#include file="header.html"-->
    
    <section class="hero-banner cover-image big-banner squareBanner">
      <!--   <img src="images/home-banner.jpg" alt="" class="image-hide"> -->
        <div class="container">
        <div>
        <liferay-ui:journal-article articleId="<%=articleidbackground%>" groupId="<%=groupid%>"></liferay-ui:journal-article>
        <!-- <div class="container">
            <div class="banner-text">
                <h1>Square Today Loan</h1>
                <p>Our small loans are designed to help you out of a bind and back to black in 9 months or less.</p>
            </div>
        
            <div class="tab-header banner-tool">
                <div class="mob-tab-tittle">
                    <h6>Pick option</h6>
                </div>
                <ul class="clearfix text-center">
                    <li class="tab-1">
                        <div class="tab-tit-col">
                            <span>&pound;200  <small>to</small>  &pound;850 <small>at 772% APR</small></span>
                        </div>
                    </li>
                    <li class="tab-2">
                        <div class="tab-tit-col">
                            <span>&pound;1,000  <small>to</small>  &pound;5,000 <small>at 99% APR</small></span>
                        </div>
                    </li>
                </ul> 
            </div> -->

            <!-- Loan Calculation -->
            <div class="tab-section SquareTabBlk">
              <%--   <div class="tab-content-blk" id="tab-1">
                    <section class="section calculator-section">
                        <div class="loanContent">
                            <div id="quickQuote" class="row-blk"> 
                                <aside class="grid-5 calcResults eqc tabAside fR">
                                    <h4>What you're borrowing</h4>
                                    <div class="close-loan"><i class="fa fa-times"></i></div>
                                    <div id="quote_glance" class="yellowPatch">
                                        <div id="glance-table">
                                            <div class="glance-visible-area">
                                                <div class="white-patch-mobile white-patch-tab-1"> 
                                                    <table width="100%">
                                                        <tr>
                                                            <td> Borrow</td>
                                                            <td align="right" width="40%"><div id="borrowamount">&pound;<span></span></div></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Over</td>
                                                            <td align="right" width="40%">
                                                                <div id="borrowmonth">
                                                                    <span></span>  
                                                                    <div class="monthTxt">Months</div> 
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Monthly repayment</td>
                                                            <td align="right" width="40%"><div id="monthly_payment">&pound;<span>40.05</span></div></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Total repayable</td>
                                                            <td align="right"><div id="total_payable">&pound;<span>900.00</span></div></td>
                                                        </tr>
                                                    </table>
                                                </div>    
                                            </div>
                                        </div>
                                    </div>   
                                    <div class="button-row">
                                        <button id="apply" class="button">Apply Now</button>
                                    </div>   
                                </aside>    
                                <article class="grid-7 calculation_section eqc calc-tab-1">
                                    <h2>Get a quick quote</h2>
                                    <!-- Calculation -->
                                    <div id="set_range">
                                        <div class="sliderRowWrap" id="brSlider">
                                            <a href="#" class="deviceTxt rep-ex rep-ex-tab-1">Representative Example</a>
                                            <div class="range_field">
                                                <div class="calcLabel">I would like to borrow</div>
                                            </div>
                                            <div class="slider_row">              
                                                <div class="repAPR clearfix">
                                                    <div class="minValue">£200</div>
                                                    <div id="slider-range"></div>
                                                    <div class="maxValue">£850</div>
                                                </div>
                                            </div>
                                        </div><!-- Borrow -->
                                        <!-- Pay back -->
                                        <div class="sliderRowWrap" id="mnSlider">
                                            <div class="range_field clearfix">
                                                <div class="calcLabel fL">And repay over</div>
                                                <div class="fL">
                                                    <div class="drop-down month-drop">
                                                        <select data-placeholder="0" class="monthDrop" id="month_field">
                                                            <option value="0">0</option>
                                                            <option value="0">0</option>
                                                            <option value="1">1</option>
                                                            <option value="2">2</option>
                                                            <option value="3">3</option>
                                                            <option value="4">4</option>
                                                            <option value="5">5</option>
                                                            <option value="6">6</option>
                                                            <option value="7">7</option>
                                                            <option value="8">8</option>
                                                            <option value="9">9</option>
                                                        </select> 
                                                    </div> 
                                                </div>
                                                <div class="calcLabel fL">months</div>
                                            </div>
                                        </div><!-- Pay back -->
                                        
                                         <liferay-ui:journal-article articleId="<%= repexp1%>" groupId="<%= groupid%>"></liferay-ui:journal-article>
                                        
                                      <!--   <div class="miniTxt" id="rep-example">
                                            <a href="#" id="rep-close"><i class="fa fa-times"></i></a>
                                            <h6>Representative Example</h6>
                                            <p>Loan amount<strong> £400</strong> repayable over 6 months. Total amount repayable <strong> £744.96</strong> in 6 payments of<strong> £124.16.</strong> Interest <strong>255.5%</strong> pa fixed. Representative APR, illustrative and based on a 30 day month, <strong>0.7%</strong> per day</p>  
                                        </div> -->
                                    </div><!-- Calculation -->
                                </article>                                                      
                            </div>
                        </div>
                    </section>
                    <div class="loan-link">
                        <a href="#tab-2">I need a bigger loan</a>
                    </div>
                </div> --%>
                <div class="tab-content-blk" id="tab-2">
                    <section class="section calculator-section">
                        <div class="loanContent">
                            <div id="quickQuote1" class="row-blk">
                                <aside class="grid-5 calcResults eqc tabAside fR">
                                    <h4>What you're borrowing</h4>
                                    <div class="close-loan"><i class="fa fa-times"></i></div>
                                    <div id="quote_glance" class="yellowPatch">
                                        <div id="glance-table">
                                            <div class="glance-visible-area">
                                                <div class="white-patch-mobile white-patch-tab-1"> 
                                                <table width="100%">
                                                        <tr>
                                                            <td>Amount borrowed</td>
                                                            <td align="right" width="40%"><div id="borrowamount1">&pound;<span></span></div></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Over</td>
                                                            <td align="right" width="40%">
                                                                <div id="borrowmonth1">
                                                                    <span></span>  
                                                                    <div class="monthTxt">Months</div> 
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Monthly repayment</td>
                                                            <td align="right" width="40%"><div id="monthly_payment1">&pound;<span>0</span></div></td>
                                                        </tr>
                                                        <tr>
                                                            <td>Total repayable</td>
                                                            <td align="right"><div id="total_payable1">&pound;<span>0</span></div></td>
                                                        </tr>
                                                    </table>                                     
                                                </div>                                     
                                            </div>
                                        </div>                                        
                                    </div>
                                    <div class="button-row">
                                      <button id="applytab2" class="button cal-button" disabled="disabled">Apply Now</button>
                                    </div>
                                </aside>                        
                                <article class="grid-7 calculation_section eqc calc-tab-2">
                                    <h2>Get a quick quote</h2>
                                    <!-- Calculation -->
                                    <div id="set_range1">
                                        <!-- Borrow -->
                                        <div class="sliderRowWrap" id="brSlider1">
                                            <a href="#" class="deviceTxt rep-ex rep-ex-tab-2">Representative Example</a>
                                            <div class="range_field">
                                                <div class="calcLabel">I would like to borrow</div>
                                            </div>
                                            <div class="slider_row">              
                                                <div class="repAPR clearfix">
                                                    <div class="minValue">£1,000</div>
                                                    <div id="slider-range1"></div>
                                                    <div class="maxValue">£5,000</div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Borrow -->
                                        <!-- Pay back -->                                        
                                        <div class="sliderRowWrap" id="mnSlider1">
                                            <div class="range_field clearfix">
                                                <div class="calcLabel">And repay over</div>
                                                <div class="fL">
                                                
                                                    <div class="month-row">
                                                    	<div class="tab-result clearfix"></div>
                                                        <!-- <select data-placeholder="0" class="monthDrop" id="month_field1">
                                                            <option value="0">0</option>
                                                            <option value="0">0</option>
                                                            <option value="1">1</option>
                                                            <option value="2">2</option>
                                                            <option value="3">3</option>
                                                            <option value="4">4</option>
                                                            <option value="5">5</option>
                                                            <option value="6">6</option>
                                                            <option value="7">7</option>
                                                            <option value="8">8</option>
                                                            <option value="9">9</option>
                                                        </select>  -->
                                                    </div> 
                                                </div>
                                                <!-- <div class="calcLabel fL">months</div> -->
                                            </div>
                                        </div>
                                        <!-- Pay back -->
                                        
                                         <liferay-ui:journal-article articleId="<%= repexp2%>" groupId="<%= groupid%>"></liferay-ui:journal-article>
                                       <!--  <div class="miniTxt" id="rep-example1">
                                            <a href="#" id="rep-close1"><i class="fa fa-times"></i></a>
                                            <h6>Representative Example</h6>
                                            <p>Loan amount<strong> £400</strong> repayable over 6 months. Total amount repayable <strong> £744.96</strong> in 6 payments of<strong> £124.16.</strong> Interest <strong>255.5%</strong> pa fixed. Representative APR, illustrative and based on a 30 day month, <strong>0.7%</strong> per day</p>  
                                        </div> -->
                                    </div><!-- Calculation -->
                                </article>                                              
                            </div>
                        </div>
                    </section>
                    <div class="loan-link">
                        <a href="#tab-1">I need a smaller loan</a>
                    </div>
                </div>
            </div>
            <!-- Loan Calculation end -->
            </div>
        </div>
    </section>
    
    <script type="text/javascript">
    
$('#apply').click(function(){
	
	 var url = '<%=renderResponse.encodeURL(getStartedUrl.toString())%>';
	
	  url= url.replace("brwamt",   $("#borrowamount span").html()); 
	 url= url.replace("totrpy",  $('#total_payable span').html());
 url= url.replace("trm", $('#borrowmonth span').html());
	 url= url.replace("mnrpy",$('#monthly_payment span').html());
	
	 window.location.href =url;
});


$('#applytab2').click(function(){
	
	 var url = '<%=renderResponse.encodeURL(getStartedUrl.toString())%>';
	
	 url= url.replace("brwamt",   $("#borrowamount1 span").html()); 
	 url= url.replace("totrpy",  $('#total_payable1 span').html());
     url= url.replace("trm", $('#borrowmonth1 span').html());
	 url= url.replace("mnrpy",$('#monthly_payment1 span').html());
	 window.location.href =url;
});



</script>
     <%
		String contentmessage = StringPool.BLANK;
		try{ 
	
	
		
		contentmessage = JournalContentUtil.getContent(themeDisplay.getLayout().getGroupId(), calculatorarticleid, null,themeDisplay.getLocale().toString() , themeDisplay); 

			}catch(Exception e){
	
	/* System.out.print("exception"+e.getMessage() ); */
		contentmessage = "Please configure eligbilty content";
		}
		%>
    
<script type="text/javascript"> 

 var tablehtml = '<%=contentmessage.replaceAll("\\s+"," ")%>';
  var table ;  
  function tableToJson(tableasstring) { 
	  var data = []; // first row needs to be headers var headers = []; 
	  var headers = []; 
	  console.log("table "+tableasstring);
	  var tempDiv = document.createElement('div');
	  tempDiv.innerHTML = tableasstring;
	  
	  var table =tempDiv.firstChild;
	  for (var i=0; i<table.rows[0].cells.length; i++) {
	   headers[i] = table.rows[0].cells[i].innerHTML.toLowerCase().replace(/ /gi,''); 
	  } 
	  // go through cells 
	  for (var i=1; i<table.rows.length; i++) { 
	  var tableRow = table.rows[i]; var rowData = {}; 
	  for (var j=0; j<tableRow.cells.length; j++) { 
	  rowData[ headers[j] ] = tableRow.cells[j].innerHTML; 
	  } data.push(rowData); 
	  } 
	  return data; 
	  }
/* var arr1 = [200, 210, 220, 230, 240, 250, 260, 270, 280, 200, 210, 200];
var arr2 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
var totRepayment = [220.55, 240.55, 210.55, 250.55, 235.55, 290.55, 270.55, 260.55, 280.55, 290.55, 300.55, 300.65];
var monRepayment = [120.55, 140.55, 110.55, 150.55, 135.55, 190.55, 170.55, 160.55, 180.55, 190.55, 200.55, 200.65]; */


var arr1 = new Array();
var arr2 = new Array();
var totRepayment =  new Array();
var monRepayment = new Array();
/* var tab2Val = 1000;
var arrIndex = arr1.indexOf(tab2Val); */
$( document ).ready( function() {
	/*  console.log(tablehtml); */
/*  table = $('#example-table').tableToJSON(); */
 table = tableToJson(tablehtml);

  populateArrays(table);
 
});
 
 function populateArrays(table) {
	
	$.each(table, function (i, elem) {
		 //  console.log("elment"+JSON.stringify(elem)+i);
		 // console.log("term  "+elem.term +""); 
		  
		  // 
		   
		  arr1.push(parseInt(elem.grade));
		  arr2.push(parseInt(elem.term));
		  totRepayment.push(elem.totalrepayable);
		  monRepayment.push(elem.monthlyrepayment);
		  
		});
	
	
}

</script>



