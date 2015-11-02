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

function bhOnSubmit() {
    console.log("Doing onSubmit");
    document.service_form.service_type.value = jQuery( '#booking_type').find(":selected").text().trim();

    return true;
}

function bhOnSubmitPostpartum() {
    console.log("Doing onSubmit Postpartum");


    return true;
}