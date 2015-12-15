<?php

//to avoid direct file access
if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

/**
 * function to add "WDM Availability Search" menu admin dashboard
 */
add_action( 'admin_menu', 'availability_search_top_menu' );

function availability_search_top_menu() {
	wp_register_style( 'wdm_settings_css', WDM_BOOKING_SEARCH_PLUGIN_URL . 'assets/css/wdm-settings-page.css' );
	wp_enqueue_style( 'wdm_settings_css' );
	
	wp_register_style( 'wdm_categorypicker_css', WDM_BOOKING_SEARCH_PLUGIN_URL . 'assets/css/wdm-category-metabox.css' );
	wp_enqueue_style( 'wdm_categorypicker_css' );
	add_menu_page( 'Bookings Availability Search', //Page Title
				'Bookings Availability Search', //Menu Title 
				'manage_options', //capability
				'wdm_availability_search', //menu-slug
				'wdm_av_search_call_back', //function
				WDM_BOOKING_SEARCH_PLUGIN_URL . '/assets/images/Search.png', 9//position
	);
	add_submenu_page( 'wdm_availability_search', //parent slug
				   'Instructions', //page title
				   'How to use', //Menu title
				   'manage_options', //capability
				   'wdm_availability_search', //menu slug 
				   '' ); // menu callback function name
	add_submenu_page( 'wdm_availability_search', //parent slug
				   'Create Category String', //page title
				   'Create Category String', //Menu title
				   'manage_options', //capability
				   'category_sub_menu', //menu slug 
				   'wdm_category_callback' ); // menu callback function name
	add_submenu_page( 'wdm_availability_search', //parent slug
				   'General Settings', //page title
				   'General Settings', //Menu title
				   'manage_options', //capability
				   'general_settings_sub_menu', //menu slug 
				   'wdm_general_settings_callback' ); // menu callback function name
}

function wdm_general_settings_callback()
{
	wp_register_script( 'wdm_general_settings', WDM_BOOKING_SEARCH_PLUGIN_URL . 'assets/js/wdm-general-settings.js' );
	wp_enqueue_script( 'wdm_general_settings' );
	wp_localize_script( 'wdm_general_settings', 'wdm_ajax_obj', array( 'ajax_url' => admin_url( 'admin-ajax.php' ) ) );
	require_once('wdm-general-settings.php');
}
/**
 * will be called when the main menu 'WDM Availability Search' is clicked
 */
function wdm_av_search_call_back() {
	require_once("wdm-how-to-use.php");
}

/**
 * will be called when the main menu 'Create Category String' is clicked
 * @global databaseobject $wpdb
 */
function wdm_category_callback() {

	echo "<h1><div class='main-title'>Bookings Availiability Search</div></h1>";
	echo "<br><div id='wdm-main-wrap'>";
	echo "<h1>select category</h1>";

	wp_register_script( 'wdm_categorypicker_js', WDM_BOOKING_SEARCH_PLUGIN_URL . 'assets/js/wdm-category-picker.js' );
	wp_enqueue_script( 'wdm_categorypicker_js' );

	global $wpdb;
	$sql_query = "select * from {$wpdb->prefix}terms wt
                    join {$wpdb->prefix}term_taxonomy wtt
                    on wt.term_id=wtt.term_id and wtt.taxonomy='product_cat'";

	$results = $wpdb->get_results( $sql_query );
	echo '<script type="text/javascript" src="' . WDM_BOOKING_SEARCH_PLUGIN_URL . 'assets/js/chosen/chosen.jquery.min.js"></script>';
	echo '<link rel="stylesheet" href="' . WDM_BOOKING_SEARCH_PLUGIN_URL . 'assets/css/chosen/chosen.min.css">';
	//chosen.jquery.min.js is used to format combobox enabiling remove items.
	echo "<div class='wdm-select-box'>";
	echo '<select name="select-category" class="wdm-select" id="select-category" multiple> ';
	echo '<option value="-------Select-------">-------Select-------</option>';
	foreach ( $results as $row ) {
		$content = $row->name;
		echo '<option value="' . $row->slug . '"> ' . $content . '</option>';
	}
	echo '</select>';
	echo "</div>";
	echo '<textarea "name="category-list" id="category-list" value="" readonly></textarea></div>';
	echo "</br>";
	echo "<div id='wdm-content'>		
	
	<h3>Note: Copy the above string and paste it in shortcode as shown in below e.g.:<br>
	</h3>
	<h2>[wdm_booking_search]</h2>";
	echo '<h2>[wdm_booking_search_widget category="hotels,restaurants"]</h2></div>';
}

?>
