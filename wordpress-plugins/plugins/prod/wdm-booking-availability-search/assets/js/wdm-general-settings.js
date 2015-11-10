
/**
 * used to set the mode of charging in wp_options table.
 */
jQuery( document ).ready( function () {
    jQuery( "#mode-of-charging-submit" ).on( 'click', function () {

        jQuery.ajax( {
            type: "POST",
            url: wdm_ajax_obj.ajax_url,
            data: {
                action: "mode_of_charging",
                mode_of_charging: jQuery( '#mode-of-charging option:selected' ).val()
            },
            success: function ( data )
            {
                alert( 'Settings saved successfully!!!' );
            }
        } );
    } );
} );



