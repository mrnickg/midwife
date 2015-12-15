
/**
 * used to populate the textarea in the admin panel metabox with the selection made from the category combobox
 * @param {type} $
 * 
 */
jQuery( function ( $ ) {
    $( ".wdm-select" ).chosen();
    $count = 0;
    $( "#select_category_chosen" ).css( 'width', '100%' );
    ;
    $( '#select-category' ).on( 'change', function ()
    {

        $( '#category-list' ).html( "" );
        if ( $( this ).val() !== "-------Select-------" )
        {
            $( '#select-category' ).each( function () {
                $( '#category-list' ).append( "," + $( this ).val() );
            } );
        }
        $( '#category-list' ).html( 'category="' + $( "#category-list" ).val().substring( 1 ) + '"' );

    } );
} );

