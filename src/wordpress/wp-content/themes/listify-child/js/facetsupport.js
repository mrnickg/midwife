jQuery( document ).ready(function() {
    FWP.auto_refresh = false;
    FWP.loading_handler = function(params) {}

    jQuery('.bh-search-tabs .tab-links a').on('click', function(e)  {
        var isTitle = jQuery('.bh-search-option .bh-search-option-text a').hasClass('bh-search-opt-midwife');
        if (!isTitle) {
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
        }

        // Change/remove current tab to active
        jQuery(this).parent('li').addClass('active').siblings().removeClass('active');

        e.preventDefault();
    });

    jQuery('.bh-search-option .bh-search-option-text a').on('click', function(e)  {
        var service = jQuery(this).hasClass('bh-search-opt-service');

        if (service) {
            jQuery(this).removeClass('bh-search-opt-service').addClass('bh-search-opt-midwife');
            jQuery('.service').hide();
            jQuery('.event').hide();
            jQuery('.postpartum').hide();
            jQuery('.title').show();
            jQuery('.facetwp-submit').removeClass('submit_service').removeClass('submit_postpartum').addClass('submit_title');
            jQuery(this).text('or search by midwife service');
        }
        else {
            jQuery(this).removeClass('bh-search-opt-midwife').addClass('bh-search-opt-service');
            var currentAttrValue = jQuery('.bh-search-tabs .tab-links a').attr('href');
            jQuery('.title').hide();
            jQuery('.facetwp-submit').removeClass('submit_title');
            jQuery(this).text('or search by midwife name');

            if (currentAttrValue == 'postpartum') {
                jQuery('.service').hide();
                jQuery('.event').hide();
                jQuery('.postpartum').show();
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

        }

        e.preventDefault();
    });

});