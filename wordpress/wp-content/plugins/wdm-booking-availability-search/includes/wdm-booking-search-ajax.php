<?php

if ( ! defined( 'ABSPATH' ) ) {
	exit; // Exit if accessed directly
}

/**
 * constant for show all products
 */
if(!defined('WDM_SHOW_ALL'))
{
	define('WDM_SHOW_ALL',"show_all_products");
}

require_once( 'wdm-booking-json-response.php' );
add_action( 'wp_ajax_availablity_product_cico', 'get_available_product_cico' );
add_action( 'wp_ajax_nopriv_availablity_product_cico', 'get_available_product_cico' );
add_action( 'wp_ajax_mode_of_charging', 'set_mode_of_charging' );

function set_mode_of_charging(){
	$mode=  filter_input(INPUT_POST,'mode_of_charging');
	//saves mode of charging in options table
	update_option( "mode-of-charging", $mode  );
}

function get_available_product_cico() {
	$action = filter_input( INPUT_POST, 'action' ); //$_POST;
	$wdm_nonce = filter_input( INPUT_POST, 'wdm_nonce' );
	$wdm_check_in = filter_input( INPUT_POST, 'wdm_check_in' );
	$wdm_check_out = filter_input( INPUT_POST, 'wdm_check_out' );
	$wdm_categories_rqd = filter_input( INPUT_POST, 'wdm_category' );	
	
	$result_array = array( );
	if ( ! isset( $wdm_nonce ) || ! wp_verify_nonce( $wdm_nonce, 'wdm_cin_cout' ) || $action != 'availablity_product_cico' ) {
		//security error
		$result_array = array(
			'success' => 0,
			'response' => __( 'Security Error:Illegal attempt to access server', 'wdm_							   search' )
		);
	} elseif ( empty( $wdm_check_in ) || empty( $wdm_check_out ) || trim( $wdm_check_in ) === '' || trim( $wdm_check_out ) === '' ) {
		//wrong response recived error
		$result_array = array(
			'success' => 0,
			'response' => __( 'Wrong Respose recieved', 'wdm_search' )
		);
	} else {
		//final code
		$wdm_check_in = date( 'Y-m-d', strtotime( $wdm_check_in ) );
		$wdm_check_out = date( 'Y-m-d', strtotime( $wdm_check_out ) );

		if ( empty( $wdm_categories_rqd ) ) {
			$wdm_categories_rqd = SHOW_ALL;
		}
		$booking_product_ids = get_all_booking_products( $wdm_categories_rqd );

		if ( empty( $booking_product_ids ) ) {
			$result_array = array(
				'success' => 2,
				'response' => __( 'No booking product available in the system', 'wdm_									search' )
			);
		} else {
			$result_array = get_response_json_for_products_cico( $booking_product_ids, $wdm_check_in, $wdm_check_out );
		}
	}
	die( json_encode( $result_array ) );
}

add_action("wp_footer","call_in_footer");
/**
 * function to enque wdm-set-duration with paramters duration and startdate which will be used in single product page
 */
function call_in_footer()
{
	//checks if the page is a single product page
	if(is_product())
	{
		wp_register_script( 'wdm-set-duration', WDM_BOOKING_SEARCH_PLUGIN_URL.'/assets/js/wdm-set-duration.js',array(jquery),true);
	    wp_localize_script( 'wdm-set-duration', 'vars', array (
	      'duration' => filter_input( INPUT_GET, 'dur' ),
	      'startdate' => filter_input( INPUT_GET,'start_date')  
	    ) );
		wp_enqueue_script( 'wdm-set-duration' );
	}
}

