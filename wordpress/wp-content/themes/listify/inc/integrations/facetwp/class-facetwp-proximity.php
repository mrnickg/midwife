<?php

// exit if accessed directly
if ( ! defined( 'ABSPATH' ) ) exit;


class FWP_Proximity
{

    function __construct() {

        // Don't load the Google Maps JS
        add_filter( 'facetwp_proximity_load_js', '__return_false' );

        // Load the proximity facet if needed
        if ( version_compare( FACETWP_VERSION, '2.2.3', '<' ) ) {
            add_filter( 'facetwp_facet_types', array( $this, 'register_facet_type' ) );
        }
    }


    function register_facet_type( $facet_types ) {
        include( dirname( __FILE__ ) . '/includes/proximity.php' );
        $facet_types['proximity'] = new FacetWP_Facet_Proximity();
        return $facet_types;
    }
}


new FWP_Proximity();
