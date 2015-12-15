
/**
 * used to set the duration and date in woocommerce calendar
 */

jQuery( window ).on( "load", function () {

    if ( vars.duration !== null && vars.startdate !== null )
    {
        //sets the duration
        jQuery( "#wc_bookings_field_duration" ).attr( "value", vars.duration );

        //sets the calendar date
        var wdm_date = vars.startdate;
        var wdm_arr = wdm_date.split( "-" );//The date is in format yyyy-mm-dd
        var currentMonth = ( new Date ).getMonth() + 1;
        var currentYear = ( new Date() ).getFullYear();
        var selectedYear = wdm_arr[0];
        var yearDifference = selectedYear - currentYear;
        if ( currentMonth < parseInt( wdm_arr[1] ) || currentYear < selectedYear )
        {
            var wdm_current_month = currentMonth;
            var wdm_selected_month = parseInt( wdm_arr[1] );//arr[1] holds the month

            //used to change the month
            var monthtoselect = ( wdm_selected_month - wdm_current_month ) + ( yearDifference * 12 );
            for ( i = 0; i < monthtoselect; i++ )
            {
                jQuery( ".ui-datepicker-next" ).trigger( "click" );
            }

            //after the month is changed by above step, the date specified will be clicked
            jQuery( ".bookable a" ).each( function () {

                if ( parseInt( jQuery( this ).html() ) === parseInt( wdm_arr[2] ) )//arr[2] holds the day
                {
                    jQuery( this ).trigger( "click" );
                }
            } );

        }
        else
        {
            //if the user is making booking with out changing from the current month
            jQuery( ".bookable a" ).each( function () {

                if ( parseInt( jQuery( this ).html() ) === parseInt( wdm_arr[2] ) )//arr[2] holds the day
                {
                    jQuery( this ).trigger( "click" );
                }
            } );
        }
    }

} );


