jQuery( document ).ready(function() {
    FWP.auto_refresh = false;
    FWP.loading_handler = function(params) {}

    jQuery('.tabs .tab-links a').on('click', function(e)  {
        var currentAttrValue = jQuery(this).attr('href');

        if (currentAttrValue == 'postpartum') {
            jQuery('.service').hide();
            jQuery('.event').hide();
            jQuery('.facetwp-submit').removeClass('submit_service').addClass('submit_postpartum');
        }
        else if (currentAttrValue == 'service') {
            jQuery('.postpartum').hide();
            jQuery('.event').hide();
            jQuery('.facetwp-submit').removeClass('submit_postpartum').addClass('submit_service');
        }
        else if (currentAttrValue == 'event') {
            jQuery('.postpartum').hide();
            jQuery('.service').hide();
            jQuery('.facetwp-submit').removeClass('submit_postpartum submit_service');
        }

        jQuery('.'+currentAttrValue).show();

        // Change/remove current tab to active
        jQuery(this).parent('li').addClass('active').siblings().removeClass('active');

        e.preventDefault();
    });
});