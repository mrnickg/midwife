<?php



/**
 * Functions associated with Midwife Searches
 */

/**
 * Homepage - Blank the Title created by the Listify theme
 */
function home_page_title($title, $instance, $id) {
	return $id == 'listify_widget_search_listings' ? false : $title;
}

add_filter('widget_title', 'home_page_title', 3, 10);

/**
 * Homepage - Get the FacetWP facets used in the search box
 */
function search_widget_get_all_facets( $args ) {
	$args[ 'facets' ] = 'title,proximity,due_date,service';
	return $args;
}

add_filter('listify_widget_search_listings_default', 'search_widget_get_all_facets');


/**
 * Homepage - Check if the FacetWP facet is used for Postpartum searches
 */
function search_widget_check_postpartum( $facet ) {
	return $facet['name'] === 'proximity' || $facet['name'] === 'due_date';
}

add_filter( 'search_widget_is_postpartum_facet', 'search_widget_check_postpartum');


/**
 * Homepage - Check if the FacetWP facet is used for Service searches
 */
function search_widget_check_service( $facet ) {
	return $facet['name'] === 'proximity' || $facet['name'] === 'service';
}

add_filter( 'search_widget_is_service_facet', 'search_widget_check_service');


/**
 * Homepage - Check if the FacetWP facet is used for Midwife Name searches
 */
function search_widget_check_title( $facet ) {
	return $facet['name'] == 'title';
}

add_filter( 'search_widget_is_title_facet', 'search_widget_check_title');


/*
 * Custom Facet Types
 */
function add_bh_facet_types($types) {
	$types['due_date'] = new BH_Due_Date_Facet();
	$types['service_type'] = new BH_Service_Type_Facet();
	return $types;
}

add_filter('facetwp_facet_types', 'add_bh_facet_types', 10, 1);

/*
 * Default radius of 20km for all proximity searches
 */
function get_proximity_radius($radius) {
	$radius = 20;
	return $radius;
}

add_filter('facetwp_proximity_radius', 'get_proximity_radius');