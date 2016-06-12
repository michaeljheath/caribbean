
jQuery(document).ready(function() {

    $('#signup').on('click', function(e){
        console.log("Loading from main...");
        e.preventDefault();
        $('#modal-register').modal('show').find('.modal-content').load($(this).attr('href'));
    });
    /*
        Form validation

    $('.new_user input[type="text"]').on('focus', function() {
    	$(this).removeClass('input-error');
    });
    
    $('.new_user').on('submit', function(e) {

    	$(this).find('input[type="text"]', 'input[type="password"]', 'input[type="email"]').each(function(){
    		if( $(this).val() == "" ) {
    			e.preventDefault();
    			$(this).addClass('input-error');
    		}
    		else {
    			$(this).removeClass('input-error');
    		}
    	});
    	
    });    */
});
