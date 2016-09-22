$(function(){

    function ajaxcall(){	
    	 	var selectStd = document.getElementById("selectStd");
			var studioId = selectStd.options[selectStd.selectedIndex].value;   
			var selectRwdType = document.getElementById("selectRwdType");
			var rewardId = selectRwdType.options[selectRwdType.selectedIndex].value;
			var searchquery = document.getElementById("searchquery").value;
			var rewardListingURL = $("#rewardListingURL").val();
			var editlink = $("#editlink").val();
			
			$.ajax({ 
				url : rewardListingURL,
				type : 'GET',
				data : {	
				stdId:studioId,
				rewardType:rewardId,	
				searchString:searchquery	
				},
				async : false,
				success : function(serverResponse) {	
				var myArray=$.parseJSON(serverResponse);
				$('#tblajax tbody').html('');
				for(i=0; i<myArray.length;i++)
				{
					if(myArray[i].RWD_STD_ID>0){
					var editlink1=editlink+"&_rewards_WAR_fiternityserviceimplportlet_rwdId="+myArray[i].RWD_ID;
					var rwdName='<td><a href="'+editlink1+'">'+myArray[i].RWD_NAME +'</a></td>';
					var exdate=getFormattedDate(myArray[i].RWD_EXPIRY_DATE);
					if(myArray[i].RWD_STATUS=="ACTIVE"){ var currentStatus='<td><button class="button button-small button-active"><span>Active</span></button></td>'}
					else{var currentStatus='<td><button class="button button-small button-deactive"><span>Inactive</span></button></td>'}

					$('#tblajax tbody').append('<tr>'+ rwdName +'<td>'+myArray[i].STD_NAME +' </td><td> '+exdate+'</td><td> '+myArray[i].RWD_POINTS +'</td>'+currentStatus +'</tr>');
				}
				}
				 $('.pagination-block').html('');
				},
				error:function(errorStatus){
				alert(errorStatus);	
				}
				});
			}
    	 
    	
    	$( ".rewardList" ).selectmenu({
    		  select: function( event, ui ) {  
    			  ajaxcall();             
    		  }
    		});
    	
    	
    	$( "#stdName" ).selectmenu({ 		
    		change: function( event, ui ) {
    		var e = document.getElementById("stdName"); 
    		stdid = e.options[e.selectedIndex].value;
    	    stdname = e.options[e.selectedIndex].text;
    		$('#stdId').val(stdid);
    		$('#stdNameHidden').val(stdname);  
    
    		
    		//$('#stdName').val(stdname);
    		
  		  }
  		});
    	
    	/*$('#login-page').parents('.portlet-borderless-container').css({height:'auto !important'})*/
    
    	
    	$('#searchquery').on('change', function(){
    		ajaxcall();
    	});
    	
    	
    		$('#studioSearch').on('change', function(){
    		
    		
			var searchquery = document.getElementById("studioSearch").value;
			var studioListingURL = $("#studioListingURL").val();
			var studioEditLink = $("#studioEditLink").val();
			
			$.ajax({ 
				url : studioListingURL,
				type : 'GET',
				data : {	
				searchString:searchquery	
				},
				async : false,
				success : function(serverResponse) {	
				var myArray=$.parseJSON(serverResponse);
				$('#studioajax tbody').html('');
				for(i=0; i<myArray.length;i++)
				{
					
					if(myArray[i].STD_NAME.toLowerCase().includes(searchquery.toLowerCase()) || myArray[i].STD_MAILID.toLowerCase().includes(searchquery.toLowerCase()) || myArray[i].STD_PHONENO.toLowerCase().includes(searchquery.toLowerCase())){	
					if(myArray[i].STD_ID>0){
					var editlink1=studioEditLink+"&_studios_WAR_fiternityserviceimplportlet_stdid="+myArray[i].STD_ID;
					var rwdName='<td><a href="'+editlink1+'">'+myArray[i].STD_NAME +'</a></td>';
					if(myArray[i].STD_STATUS=="ACTIVE"){ var currentStatus='<td><button class="button button-small button-active"><span>Active</span></button></td>'}
					else{var currentStatus='<td><button class="button button-small button-deactive"><span>Inactive</span></button></td>'}

					$('#studioajax tbody').append('<tr>'+ rwdName +'<td>'+myArray[i].STD_MAILID +' </td><td> '+myArray[i].STD_PHONENO +'</td>'+currentStatus +'</tr>');
						}
					
					}	
					
				}	
				 $('.pagination-block').html('');
				},
				error:function(errorStatus){
				alert(errorStatus);	
				}
				});
    	});
    		
    		$('.hideStd').next('.ui-selectmenu-button').hide(); 	    	
});

function getFormattedDate(input){
    var pattern=/(.*?)\-(.*?)\-(.*?)$/;
    var result = input.replace(pattern,function(match,p3,p1,p2){
        var months=['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
        return (p2)+" "+months[(p1-1)]+" "+p3;
    });
    return result;
}