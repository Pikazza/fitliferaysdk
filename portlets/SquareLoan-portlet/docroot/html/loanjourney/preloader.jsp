<%@ include file="/html/init.jsp" %>

<portlet:actionURL var="checkAgrementStatus" >
<portlet:param name="action" value="preloader"/>
</portlet:actionURL>

   <div class="loader-wrapper">
        <div class="loder-content text-center">
            <div>
                <div class="preloader-cube">
                     <img src="${themeDisplay.pathThemeImages}/preloader.gif"/>
                </div>
                <div class="first-loader application-loader">
                    <div>
                        <p>We are reviewing your application, we won&#39;t be long! Please don&#39;t refresh or hit the back button.</p>
                    </div>
                </div>
                <div class="second-loader application-loader">
                    <div>
                        <p>It&#39;s taking a little bit longer to review your application than hoped. Don&#39;t worry, it&#39;s not you, it&#39;s us! We&#39;ll have an answer shortly. Please don&#39;t refresh or hit the back button.</p>
                    </div>                    
                </div>
                <!-- <div class="third-loader application-loader">
                      <div>
                        <p>It looks like we are having some issues getting an answer for you. Your details are with our applications team, we&#39;ll be in touch with an answer shortly or you can login later to check your application.</p>
                    </div>                   
                </div> -->
            </div>
        </div>
        <form id="preForm" method="post" name="preForm" action="<%=checkAgrementStatus%>" >
        
        </form>
</div>
<script>

$(document).ready(function() {
	$('.first-loader').fadeIn(300, function() {
        $(this).delay(29000).fadeOut(1000, function() {
            $('.second-loader').fadeIn(1000, function() {
                $(this).delay(59000).fadeOut(1000);
            });
        });
    });
	//sleepFor(3000);
	document.getElementById('preForm').submit();
});
/* setTimeout(function() {
	
}, 30000); */

$(window).load(function() {
    
});


function sleepFor( sleepDuration ){
	    var now = new Date().getTime();
	    while(new Date().getTime() < now + sleepDuration){ /* do nothing */ } 
	}
</script>
 