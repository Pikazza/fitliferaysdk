$(function(){
	$('#navigation li').each(function(){
		var hoverImg = $(this).find('a').attr('data-image');
		var cuurentImg = $(this).find('img').attr('src');
		$(this).hover(function(){			
			$(this).find('img').attr('src', hoverImg);
		}, function(){
			$(this).find('img').attr('src', cuurentImg);
		});
	});	

	$('#menu-trigger').on('click', function(){
		$('header').addClass('open');
	});
	$('#close-trigger').on('click', function(){
		$('header').removeClass('open');
	});

	$( ".selectMenu" ).selectmenu( { placeholder: 'Please select' } );

	$( ".checkBox" ).buttonset();

	$('.close-error').on('click', function(){
		$('.globalError').slideUp();
	});
	
	$('.close-error').on('click', function(){
		$('.serverInfo').slideUp();
	});


		
	
	$('.descriptionArea').each(function(){
		
		$(this).parents('.formRow').find('.totalCount').text($(this).attr('maxLength'));
		$(this).parents('.formRow').find('.hintPara').text('Upto '+$(this).attr('maxLength')+' characters allowed');
		var totalCount = parseInt($(this).parents('.formRow').find('.totalCount').text());

		var typeCount = $(this).val().length;
		$(this).parents('.formRow').find('.totalCount').text(totalCount-typeCount);

		$(this).on('keyup', function(){
			var typeCount = $(this).val().length;
			$(this).parents('.formRow').find('.totalCount').text(totalCount-typeCount);
		});
	});
	


	/* numeric value */
    $('.number').keypress(function(e) {
        if (  e.which != 8 && e.which != 0 && ( e.which < 46 || e.which > 57 || e.which == 47 )) {
            return false;
        }
    });

    // Email ID  validation function start
	function emailVal(email) {
	    var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	    return regex.test(email);
	}
	// Email ID  validation function end
	/* Date picker */
	if($('.dateBlk').length>0){
		
		$( ".dateBlk input" ).datepicker({
			onSelect: function(date) {
	            date = date.split(/\//g);
	            var day = date[1];
	            var month = date[0];
	            var year = date[2];
	            $('#day').val(day);
	            $('#month').val(month);
	            $('#year').val(year);

	            var $thisValue = $(this).val();
				if ($thisValue.length != 0) {
					$(this).parents('.formRow').removeClass('errorRow');
					$(this).parents('.formRow').find('.errorBox').slideUp(function(){
						$(this).remove();
					});
				}


	    	}
	    });
	}

	if($('.dateBlkExpiry').length>0){
		
	    $( ".dateBlkExpiry input" ).datepicker({
			onSelect: function(date) {
	            date = date.split(/\//g);
	            var day = date[1];
	            var month = date[0];
	            var year = date[2];
	            $('#dayExpiry').val(day);
	            $('#monthExpiry').val(month);
	            $('#yearExpiry').val(year);

	            var $thisValue = $(this).val();
				if ($thisValue.length != 0) {
					$(this).parents('.formRow').removeClass('errorRow');
					$(this).parents('.formRow').find('.errorBox').slideUp(function(){
						$(this).remove();
					});
				}
	    	}
	    });
	}

	if($('.dateBlkSrart').length>0){
		
	    $( ".dateBlkSrart input" ).datepicker({
			onSelect: function(date) {
	            date = date.split(/\//g);
	            var day = date[1];
	            var month = date[0];
	            var year = date[2];
	            $('#dayStart').val(day);
	            $('#monthStart').val(month);
	            $('#yearStart').val(year);

	            var $thisValue = $(this).val();
				if ($thisValue.length != 0) {
					$(this).parents('.formRow').removeClass('errorRow');
					$(this).parents('.formRow').find('.errorBox').slideUp(function(){
						$(this).remove();
					});
				}
	    	}
	    });
	}

	var errorCount = 0;
	
	$( ".tetxBox, .textArea" ).not( ".nonMandatory" ).bind({				
		keyup: function() {
			var $thisValue = $(this).val();
			var errorText  = $(this).parents('.formRow').find('label').attr('data-error');
			if ($thisValue.length != 0) {
				$(this).parents('.formRow').removeClass('errorRow');
				$(this).parents('.formRow').find('.errorBox').slideUp(function(){
					$(this).remove();
				});
			}
		},
		blur: function() {
			var $thisValue = $(this).val();
			var errorText  = $(this).parents('.formRow').find('label').attr('data-error');

			if ($thisValue.length == 0) {
				$(this).parents('.formRow').addClass('errorRow');
				if($(this).parents('.formRow').find('.errorBox').length==0) {
					$(this).parents('.formRow').append('<div class="errorBox">'+errorText+'</div>');
				}
								
			} else {
				$(this).parents('.formRow').removeClass('errorRow');
			}
		}
	});

	$('.content-block input').bind({
		blur: function() {
	        var elmt = $(this);
	        var errorText  = $(this).parents('.formRow').find('label').attr('data-error');
	        if (elmt.hasClass('tetxBox')) {
	            var vald = $(this).val();
				if (elmt.hasClass('emailonly')) {
			        if (!emailVal(vald)) {
			        	$(this).parents('.formRow').addClass('errorRow');
			            if($(this).parents('.formRow').find('.errorBox').length==0) {
							$(this).parents('.formRow').append('<div class="errorBox">'+errorText+'</div>');
						}
			        } else {
			        	$(this).parents('.formRow').removeClass('errorRow');
			            $(this).parents('.formRow').find('.errorBox').slideUp(function(){
							$(this).remove();
						});
			        }
			    }
			}
		}
	});

	if($('.selectMenu').length>0){
		$(".selectMenu").not( ".nonMandatory" ).selectmenu({
	        select: function(event, ui) {
	        	var errorText  = $(this).parents('.formRow').find('label').attr('data-error');
	        	if($('option:selected',$(this)).index()>0) {
	        		$(this).parents('.formRow').removeClass('errorRow');
	        		$(this).parents('.formRow').find('.errorBox').slideUp(function(){
						$(this).remove();
					});
	        	} else {
	        		$(this).parents('.formRow').addClass('errorRow');
					if($(this).parents('.formRow').find('.errorBox').length==0) {
						$(this).parents('.formRow').append('<div class="errorBox">'+errorText+'</div>');
					}	
	        	}
	        }
	    });
	}

    $('#profile-button').on('change', function(event){
		var selectedFile = event.target.files[0];
		var reader = new FileReader();
		var imgtag = document.getElementById("profileImg");
		imgtag.title = selectedFile.name;
		reader.onload = function(event) {
			imgtag.src = event.target.result;
		};
		reader.readAsDataURL(selectedFile);
		$(this).parents('.formRow').addClass('imgAdded');

		$(this).parents('.formRow').removeClass('errorRow');
		$(this).parents('.formRow').find('.errorBox').slideUp(function(){
			$(this).remove();
		});
    });

    $(document).on('change', '.influence-profile-button', function(event){
    	$(this).parents('.formRow').find('.tetxBox').val($(this).val());
    });


    var count = $('.influencerRow').length;

    $('.influencerRow').each(function(index){
    	$(this).find('.tetxBox').attr('id','fileBox'+index).attr('name','fileBox'+index);
		$(this).find('.file-button').attr('id','fileButton'+index).attr('name','fileButton'+index);
		$(this).find('.textArea').attr('id','fileArea'+index).attr('name','fileArea'+index);
    });    

    $(document).on('click', '.add-influencer a', function(e){
    	var influencerRow = $(this).parents('.influencerBlock').find('.influencerRow').length;
    	
    	if(influencerRow<3){
    		$('.influencerBlock').append($('<div class="influencerRow"><div class="formRow"><div class="formInnerField"><label data-error="Please enter your event title"><span>Influencer image</span></label><input type="text" value="" class="tetxBox nonMandatory" placeholder=""><div class="file-button-block"><button class="button button-primary">Add / Change image</button><input type="file" class="file-button influence-profile-button" /></div><i class="fa fa-times-circle close-influence"></i></div></div><div class="formRow"><div class="formInnerField textareaRow"><label data-error="Please enter event description"><span>Influencer Description</span></label><textarea class="textArea nonMandatory"></textarea><div class="add-influencer"><a href="javascript:void(0)"><strong>Add Influencer</strong></a></div></div></div></div>'));
    	}
    	$(this).parents('.influencerBlock').find('.influencerRow:last-child').find('.tetxBox').attr('id','fileBox'+count);
    	$(this).parents('.influencerBlock').find('.influencerRow:last-child').find('.file-button').attr('id','fileButton'+count);
    	$(this).parents('.influencerBlock').find('.influencerRow:last-child').find('.textArea').attr('id','fileArea'+count);

    	$(this).parents('.influencerBlock').find('.influencerRow:last-child').find('.tetxBox').attr('name','fileBox'+count);
    	$(this).parents('.influencerBlock').find('.influencerRow:last-child').find('.file-button').attr('name','fileButton'+count);
    	$(this).parents('.influencerBlock').find('.influencerRow:last-child').find('.textArea').attr('name','fileArea'+count);
    	count++;
    });
    


    $(document).on('click', '.close-influence', function(e){
    	$(this).parents('.influencerRow').slideUp(function(){
    		$(this).remove();
    	})
    });

    $('#cover-button').on('change', function(event){
		var selectedFile = event.target.files[0];
		var reader = new FileReader();
		var imgtag = document.getElementById("cover-img");
		imgtag.title = selectedFile.name;
		reader.onload = function(event) {
			imgtag.src = event.target.result;
		};
		reader.readAsDataURL(selectedFile);
		$(this).parents('.formRow').addClass('imgAdded');

		$(this).parents('.formRow').removeClass('errorRow');
		$(this).parents('.formRow').find('.errorBox').slideUp(function(){
			$(this).remove();
		});
    });

    $('.timeBox').keypress(function(e) {
        var verified = (e.which == 8 || e.which == undefined || e.which == 0) ? null : String.fromCharCode(e.which).match(/[^0-9]/);
            if (verified) {e.preventDefault();}

            content=$(this).val();
	        content1 = content.replace(/\:/g, '');
	        length=content1.length;
	        if(((length % 2) == 0) && length < 6 && length > 1){
	            $(this).val($(this).val() + ' : ');
	        }
    });

	$('.checkBox').not( ".nonMandatory" ).bind('change', function(){
		if($(this).find('input').is(':checked')){
	        $(this).parents('.formRow').removeClass('errorRow');
	        $(this).parents('.formRow').find('.errorBox').slideUp(function(){
				$(this).remove();
			});
	    } 
	});



	$('#freeBox').not( ".nonMandatory" ).bind('change', function(){
		if($(this).is(':checked')){
	        $(this).parents('.formRow').removeClass('errorRow');
	        $(this).parents('.formRow').find('.errorBox').slideUp(function(){
				$(this).remove();
			});
			$(this).parents('.formRow').find('.tetxBox').attr("disabled", "disabled").addClass('nonMandatory'); 
	    } else {
	    	$(this).parents('.formRow').find('.tetxBox').removeAttr( "disabled" ).removeClass('nonMandatory'); 
	    }
	});

	$('.content-block').on('change', function(){
		var errorRow = $(this).find('.errorRow').length;
	    if(errorRow<1){
	    	$('.globalError').slideUp();
	    } 
	});


	if($('.selectMenu').length>0){
		$(".selectMenu").selectmenu({
	        change: function(event, ui) {
	        	var errorRowlength = $('.content-block').find('.errorRow').length;
	        	if($('option:selected',$(this)).index()>0) {	        		
				    if(errorRowlength<1){
				    	$('.globalError').slideUp();
				    } 
	        	} 
	        }
	    });
	}
	
	$('.participant-list .button-active').on('click', function(){
		$(this).toggleClass('green-btn')
		if("Select winner"==$(this).text()){
			$(this).text('winner');
		} else {
			$(this).text("Select winner");
		}
	});
	
	

    $('#add-button').on('click', function(event){	    
	    $('.tetxBox, .textArea').not( ".nonMandatory" ).each(function(){
	    	var errorText  = $(this).parents('.formRow').find('label').attr('data-error');
	       if (this.value == "") {
				$(this).parents('.formRow').addClass('errorRow');
				if($(this).parents('.formRow').find('.errorBox').length==0) {
					$(this).parents('.formRow').append('<div class="errorBox">'+errorText+'</div>');
				}				
	       }
	    });

	    $('.selectMenu').not( ".nonMandatory" ).each(function(){
	    	var errorText  = $(this).parents('.formRow').find('label').attr('data-error');
	    	if($('option:selected',$(this)).index()>0) {
        		$(this).parents('.formRow').removeClass('errorRow');
        	} else {
        		$(this).parents('.formRow').addClass('errorRow');
				if($(this).parents('.formRow').find('.errorBox').length==0) {
					$(this).parents('.formRow').append('<div class="errorBox">'+errorText+'</div>');
				}	
        	}
	    });

	    $('.uploadImg').not( ".nonMandatory" ).each(function(){
	    	var errorText  = $(this).find('label').attr('data-error');
	    	if(!$(this).hasClass('imgAdded')){
	    		$(this).addClass('errorRow');
	    		if($(this).find('.errorBox').length==0) {
					$(this).append('<div class="errorBox">'+errorText+'</div>');
				}	
	    	} else {
	    		$(this).removeClass('errorRow');
	    		$(this).find('.errorBox').slideUp(function(){
					$(this).remove();
				});
	    	}
	    });

	    $('.checkBox').each(function(){
	    	var errorText  = $(this).parents('.formRow').find('label').attr('data-error');
			if($(this).find('.ui-state-active').length>0){
		        $(this).parents('.formRow').removeClass('errorRow');
		        $(this).parents('.formRow').find('.errorBox').slideUp(function(){
					$(this).remove();
				});
		    } else {
		    	$(this).parents('.formRow').addClass('errorRow');
		    	if($(this).parents('.formRow').find('.errorBox').length==0) {
					$(this).parents('.formRow').append('<div class="errorBox">'+errorText+'</div>');
				}
				if($(this).prev('.tetxBox').length>0){
					if ($(this).prev('.tetxBox').value != "") {
						$(this).parents('.formRow').removeClass('errorRow');
				        $(this).parents('.formRow').find('.errorBox').slideUp(function(){
							$(this).remove();
						});			
			       }
				}		
		    }
		});

	  /*  var url = $(this).attr('data-location');
	    var errorRow = $(this).parents('.content-block').find('.errorRow').length;
	    console.log(errorRow);
	    if(errorRow>0){
	    	$('.globalError').slideDown();
	    } else {
	    	$('.globalError').slideUp(function(){	    		
	    		window.location.href = url;
	    	});
	    }*/
	    
	});
});

