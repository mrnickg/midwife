<?php
/**
 * Listify child theme.
 */

function listify_child_styles() {
    wp_enqueue_style( 'listify-child', get_stylesheet_uri() );
}
add_action( 'wp_enqueue_scripts', 'listify_child_styles', 999 );

/** Place any new code below this line */

/**function custom_listify_widget_search_listings_default( $args ) {
	$args[ 'facets' ] = 'job_location';

	return $args
}

add_filter( 'listify_widget_search_listings_default', 'custom_listify_widget_search_listings_default');*/
