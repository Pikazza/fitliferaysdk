<%@ include file="/html/init.jsp" %>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

								
								<div class="address-wrapper">
		<div class="form-row address-post">
			<div class="form-inner-field postcode">
			    <label><span>Postcode</span></label>
			    <input type="text" value="" class="text-box postcodeBox" placeholder="AB15XY" maxlength="10" id='postcode${addressid}'	 />
			    <form:input type="hidden" value="" id='postcodee${addressid}'	path="Customer.addressHistory.occupancy[${addressid}].address.postCode" />
													<form:input type="hidden" value="" id='propertyNumber${addressid}'  path="Customer.addressHistory.occupancy[${addressid}].address.propertyNumber" />
													<form:input type="hidden" value="" id='propertyName${addressid}'   path="Customer.addressHistory.occupancy[${addressid}].address.propertyName" />
													<form:input type="hidden" value="" id='flat${addressid}'   path="Customer.addressHistory.occupancy[${addressid}].address.flat" />
													<form:input type="hidden" value="" id='streetName${addressid}'   path="Customer.addressHistory.occupancy[${addressid}].address.streetName" />
													<form:input type="hidden" value="" id='postTown${addressid}'   path="Customer.addressHistory.occupancy[${addressid}].address.postTown" />
													<form:input type="hidden" value="" id='county${addressid}'   path="Customer.addressHistory.occupancy[${addressid}].address.county" />
													<form:input type="hidden" value="" id='district${addressid}'  path="Customer.addressHistory.occupancy[${addressid}].address.district" />
			    <button type="button" class="button button-white addressbutton" id="findAddress${addressid}"  onclick="getAddress('${addressid}')"  disabled="disabled">Find Address</button>
			</div>
			<div class="preloader" id='pre${addressid}'>
				<div class="preloader-cube">
				<img src="${themeDisplay.pathThemeImages}/preloader.GIF"/>
				</div>
	    	</div>							
			<div class="error-message"><strong>This field is mandatory</strong></div>
		</div>
		<div class="address-list">
			<div class="choose-address" id='chooseAdd${addressid}'>
				<div class="list-of-address address-list-block">
					<ul class="address-list-inner" id="${addressid}">
					   
					</ul>
				</div>
				<!-- <button class="button button-white confirmbutton">Locate address</button> -->
			</div>
		</div>
		<div class="choosed-address" id='choosed${addressid}'>
			<label>Address</label>
			<div class="confirm-address" id="confirm${addressid}"></div>
		</div>
		<%-- <div class="form-row occupancy-row">
		<div class="error-message"><strong><i class="fa fa-info-circle"></i>This field is mandatory</strong></div>
		
			<div class="form-inner-field">
				<label><span>Type of occupancy</span></label>
				<input type="hidden" value="0" class="hiddenInput">
				<div class="drop-down">
			         <select name="speed" data-placeholder="Type of occupancy" class="select-drop-down occupancy">
			        	<option value=""> </option>
			        	<option value="1">Home owner</option>
			        	<option value="2">Living with parents</option>
			        	<option value="3">Tenant</option>
			        	<option value="3">Living with partner</option>
					</select> 
					 <div class="help-message">Your select this option</div>
						<form:select  data-placeholder="Type of occupancy" class="select-drop-down occupancy" path="occupancyTypeID" >
												<option value=""></option>
												 <form:options items="${residentialStatus}" /> 
			         </form:select>
			    </div>
			    <div class="help-message">Your select this option</div>
			</div>
			<div class="error-message"><strong><i class="fa fa-info-circle"></i>This field is mandatory</strong></div>
		</div> --%>
		<div class="form-row small-form-row add-text-box how-long-u">
			<div class="form-inner-field clearfix ">
				<label><span>How long you have lived at this address</span></label>
				<div class="small-box">
	     	<form:input  type="text" value="" class="text-box small-text-box number time-year" placeholder="" maxlength="2" id="year${addressid}" path="Customer.addressHistory.occupancy[${addressid}].stayYear" />			
					<label><span>Years</span></label>
				</div>
				<div class="small-box">
					<form:input type="text" value=""  class="text-box number time-month" placeholder="" maxlength="2" id="month${addressid}" path="Customer.addressHistory.occupancy[${addressid}].stayMonth" />
					<label><span>Months</span></label>
					<%
					SimpleDateFormat marshaldateFormat  = new SimpleDateFormat("dd-MM-yyyy");
					String date=marshaldateFormat.format(new Date());
					%>
					
<form:hidden  path="Customer.addressHistory.occupancy[${addressid}].movingInDate"  value="<%=date%>"/>
				</div>
				</div>
				<div class="error-message"><strong>This field is mandatory</strong></div>
			</div>
			<!--<div class="help-message">Please let us know in years & months, for how long you have lived at this address</div>-->
			
		</div>
	</div>
						<div class="poscodeErrorMsg" id='poscodeErrorMsg${addressid}'> </div>		
								
							