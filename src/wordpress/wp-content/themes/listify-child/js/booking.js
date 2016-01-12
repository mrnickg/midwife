jQuery( document ).ready(function() {
    jQuery( '#booking_type' ).change(function() {
        if (jQuery(this).find(":selected").val() === 'Postpartum Care') {
            jQuery( '#postpartum_div' ).show();
            jQuery( '#service_div' ).hide();
        }
        else {
            jQuery( '#postpartum_div' ).hide();
            jQuery( '#service_div' ).show();
        }
    });

    wp.hooks.addAction('facetwp/loaded', function() {
        document.cookie='service_type='+jQuery('.facetwp-facet-service_type').find('input:checked').next('label').text()+'; path=/';
        document.cookie='due_date='+jQuery('.facetwp-facet-due_date').find('input').val()+'; path=/';
        document.cookie='service='+jQuery('.facetwp-facet-services').find('.checked').first().text()+'; path=/';
    });

    jQuery( '#postpartum_main_form' ).submit(function() {
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

    jQuery( '#service_form' ).submit(function() {
        document.service_form.service_type.value = jQuery( '#booking_type').find(":selected").text().trim();
        document.service_form.appt_type.value = jQuery( '#booking_type').find(":selected").text().trim();

        return true;
    });
});