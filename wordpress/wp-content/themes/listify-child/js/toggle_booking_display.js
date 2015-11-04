jQuery( document ).ready(function() {
    jQuery( '#booking_type' ).change(function() {
        console.log("."+jQuery(this).find(":selected").text().trim()+".");
        if (jQuery(this).find(":selected").text().trim() === 'Postpartum Care') {
            jQuery( '#postpartum_div' ).show();
            jQuery( '#service_div' ).hide();
        }
        else {
            jQuery( '#postpartum_div' ).hide();
            jQuery( '#service_div' ).show();
        }
    });
});

jQuery( document ).ready(function() {
    jQuery( '#postpartum_main_form' ).submit(function() {
        console.log("Doing onSubmit Postpartum");

        jQuery( '#pp_wc_bookings_field_start_date_year').val( jQuery('#postpartum_hidden_form').find('input[name="wc_bookings_field_start_date_year"]').val());
        jQuery( '#pp_wc_bookings_field_start_date_month').val( jQuery('#postpartum_hidden_form').find('input[name="wc_bookings_field_start_date_month"]').val());
        jQuery( '#pp_wc_bookings_field_start_date_day').val( jQuery('#postpartum_hidden_form').find('input[name="wc_bookings_field_start_date_day"]').val());

        return true;
    });
});

jQuery( document ).ready(function() {
    jQuery( '#service_form' ).submit(function() {
        console.log("Doing onSubmit");
        document.service_form.service_type.value = jQuery( '#booking_type').find(":selected").text().trim();

        return true;
    });
});