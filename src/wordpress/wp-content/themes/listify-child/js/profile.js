jQuery( document ).ready(function() {
    if (jQuery('#bh_has_postpartum').is(':checked')) {
        jQuery( '.fieldset-bh_max_bookings' ).show();
    }
    else {
        jQuery( '.fieldset-bh_max_bookings' ).hide();
    }
    jQuery( '#bh_has_postpartum' ).change(function() {
        if (this.checked) {
            jQuery( '.fieldset-bh_max_bookings' ).show();
        }
        else {
            jQuery( '.fieldset-bh_max_bookings' ).hide();
        }
    });
});