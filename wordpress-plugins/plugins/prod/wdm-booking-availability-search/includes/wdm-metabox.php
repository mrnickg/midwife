<?php
//to avoid direct file access
if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

//adds a metabox to admin panel(to "page" and "product")
add_action( 'add_meta_boxes',
			'myplugin_add_meta_box', //callback
			'side' );//place to add the metabox

/**
 * function to add a metabox 
 */
function myplugin_add_meta_box() {



	wp_register_style( 'wdm_abv_search_chosen_css', WDM_BOOKING_SEARCH_PLUGIN_URL . 'assets/css/chosen/chosen.min.css' );
	wp_enqueue_style( 'wdm_abv_search_chosen_css' );
	
	wp_register_script( 'wdm_abv_search_chosen_js', WDM_BOOKING_SEARCH_PLUGIN_URL . 'assets/js/chosen/chosen.jquery.min.js' );
	wp_enqueue_script( 'wdm_abv_search_chosen_js' );

	wp_register_style( 'wdm_categorypicker_css', WDM_BOOKING_SEARCH_PLUGIN_URL . 'assets/css/wdm-category-metabox.css' );
	wp_enqueue_style( 'wdm_categorypicker_css' );
	
	wp_register_script( 'wdm_categorypicker_js', WDM_BOOKING_SEARCH_PLUGIN_URL . 'assets/js/wdm-category-picker.js' , array(  'wdm_abv_search_chosen_js' ) );
	wp_enqueue_script( 'wdm_categorypicker_js' );


	$screens = array( 'page', 'product' ); //adds the metabox to "Page & Products"
	foreach ( $screens as $screen ) {
		add_meta_box(
		'myplugin_sectionid', __( 'Booking searh Plugin <br/> <hr/> Create Category String ( Note: paste the created string in shortcode)', 'select_category' ), 'myplugin_meta_box_callback', $screen
		);
	}//loop is useful if it is required to be added to multiple areas(e.g.page, product, etc)
}

/**
 * adds a metabox with a comboxbox and textarea in the metabox
 * 
 * @global database object $wpdb 
 */
function myplugin_meta_box_callback() {
	
	global $wpdb;
	$sql_query = "select * from {$wpdb->prefix}terms wt
                    join {$wpdb->prefix}term_taxonomy wtt
                    on wt.term_id=wtt.term_id and wtt.taxonomy='product_cat'";

	$results = $wpdb->get_results( $sql_query );
	echo '<script type="text/javascript" src="' . WDM_BOOKING_SEARCH_PLUGIN_URL . 'assets/js/chosen/chosen.jquery.min.js"></script>';
	echo '<link rel="stylesheet" href="' . WDM_BOOKING_SEARCH_PLUGIN_URL . 'assets/css/chosen/chosen.min.css">';
	//chosen.jquery.min.js is used to format combobox enabiling remove items.
	
	echo '<select name="select-category" data-placeholder="Choose categories"  class="wdm-select" id="select-category" multiple> ';
	//echo '<option value="-------Select-------">-------Select-------</option>';
	foreach ( $results as $row ) {
		$content = $row->name;
		echo '<option value="' . $row->slug . '"> ' . $content . '</option>';
	}
	echo '</select>';
	//
	
	echo "<br>";
	echo '<div class="txt-area-page"><textarea name="category-list" id="category-list" value="" readonly></textarea></div>';
}

?>
