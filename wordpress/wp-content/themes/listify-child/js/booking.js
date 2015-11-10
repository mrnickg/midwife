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
        var year =  jQuery('#postpartum_hidden_form').find('input[name="wc_bookings_field_start_date_year"]').val();
        var month = jQuery('#postpartum_hidden_form').find('input[name="wc_bookings_field_start_date_month"]').val();
        var day = jQuery('#postpartum_hidden_form').find('input[name="wc_bookings_field_start_date_day"]').val();

        //jQuery( '#pp_due_date').val( year + '-' + month + '-' + day);
        //jQuery( '#pp_wc_bookings_field_start_date_year').val(year);
        //jQuery( '#pp_wc_bookings_field_start_date_month').val(month);
        //jQuery( '#pp_wc_bookings_field_start_date_day').val(1);

        jQuery( '#pp_wc_bookings_field_start_date_year').val(year);
        jQuery( '#pp_wc_bookings_field_start_date_month').val(month);
        jQuery( '#pp_wc_bookings_field_start_date_day').val(day);

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