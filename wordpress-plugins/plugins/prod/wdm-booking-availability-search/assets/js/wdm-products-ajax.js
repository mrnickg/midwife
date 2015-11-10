jQuery( function ( $ ) {

    //checkin checkout widget
    $( document ).ajaxComplete(function( event,request, settings ) {
  $( "#loader" ).hide();
  
});
    $(document).ready(function(){
        $('#wdm-title').hide();
        $('#loader').hide();       
        
    });
    $( '#wdm_search_cin_cout' ).click( function () {
        $('#loader').show();        
        if ( $( '#wdm_booking_search_id' ).length === 0 ) {
            $( '#wdm_error_div' ).html( "Error:Result cannot be displayed.<br />Search Result div not added to this page" );
        } 
        else {
//            $('#wdm-loading-txt').show();
            
            $('#wdm_before_search').hide();
            $('#wdm-title').show();
//            $(window).scrollTop($('#wdm-title').offset().top);//brings the focus(scrolls the page) to the title of the search result
            $check_in_date = $( "#wdm_checkin_date" ).val();
            if ( $.trim( $check_in_date ) === '' ) {
                $( "#wdm_checkin_date" ).css( 'border', '1px solid red' );
                return;
            } else {
                $( "#wdm_checkin_date" ).css( 'border', '' );
            }

            $check_out_date = $( "#wdm_checkout_date" ).val();
            if ( $.trim( $check_out_date ) === '' ) {
                $( "#wdm_checkout_date" ).css( 'border', '1px solid red' );
                return;
            } else {
                $( "#wdm_checkout_date" ).css( 'border', '' );
            }

            $wdm_nonce = $( "#wdm_nonce" ).val();
            $wdm_category=$("#category_rqd").val();
            $.ajax( {
                type: "POST",
                url: wdm_ajax_obj.ajax_url,
                data: {
                    action: "availablity_product_cico", 
                    wdm_check_in: $check_in_date, 
                    wdm_check_out: $check_out_date, 
                    wdm_nonce: $wdm_nonce,
                    wdm_category:$wdm_category
                }
            } )
            .done( function ( response ) {
                response_obj = JSON.parse( response );
                if ( response_obj.success === 1 ) {
                    $( '#wdm_booking_search_id' ).html( response_obj.response );
                } else if ( response_obj.success === 0 ) {
                    $( '#wdm_error_div' ).html( response_obj.response );

                } else if ( response_obj.success === 2 || response_obj.success === 3 ) {
                    $( '#wdm_booking_search_id' ).html( response_obj.response );
                }


            } );

        }

    } );

} );