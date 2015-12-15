<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
if ( ! defined( 'ABSPATH' ) ) {
	exit; // Exit if accessed directly
}
add_shortcode( 'wdm_booking_search_widget', 'wdm_add_search_widget_div' );

function wdm_add_search_widget_div( $atts ) {

	wp_register_script( 'wdm_get_products_ajax', WDM_BOOKING_SEARCH_PLUGIN_URL . '/assets/js/wdm-products-ajax.js', array( 'jquery' ), true );
	wp_enqueue_script( 'wdm_get_products_ajax' );
	wp_localize_script( 'wdm_get_products_ajax', 'wdm_ajax_obj', array( 'ajax_url' => admin_url( 'admin-ajax.php' ) ) );

	//date picker
	wp_register_script( 'wdm_datepicker_js', WDM_BOOKING_SEARCH_PLUGIN_URL . 'assets/js/wdm-datepicker.js', array( 'jquery-ui-datepicker' ), true );
	wp_enqueue_script( 'wdm_datepicker_js' );
		
	wp_register_style( 'wdm_datepicker_css', WDM_BOOKING_SEARCH_PLUGIN_URL . 'assets/css/wdm-datepicker.css' );
	wp_enqueue_style( 'wdm_datepicker_css' );
	
//	wp_register_script( 'wdm_duration', WDM_BOOKING_SEARCH_PLUGIN_URL . 'assets/js/wdm-set-duration.js', array( 'jquery' ), true );
//	wp_enqueue_script( 'wdm_duration' );

	wp_register_style( 'wdm_widget_form_public_css', WDM_BOOKING_SEARCH_PLUGIN_URL . 'assets/css/wdm-widget-form-public.css' );
	wp_enqueue_style( 'wdm_widget_form_public_css' );
	
	$from_string = __( "Check In", 'wdm_search' );
	$to_string = __( "Check Out", 'wdm_search' );
	if ( isset( $atts ) && ! empty( $atts ) ) {
		if ( isset( $atts[ 'from' ] ) && ! empty( $atts[ 'from' ] ) ) {
			$from_string = $atts[ 'from' ];
		}
		if ( isset( $atts[ 'to' ] ) && ! empty( $atts[ 'to' ] ) ) {
			$to_string = $atts[ 'to' ];
		}
	}
	if ( !isset( $atts[ 'buttonlabel' ] ) ) {
		$button_string= __( "Search", 'wdm_search' );		
	}
	else
	{
		$button_string=$atts[ 'buttonlabel' ];
	}
	
	//category from the shortcode is checked for validility and set to $wdm_category
	if ( isset( $atts[ 'category' ] ) ) {
		$wdm_category = $atts[ 'category' ];
		if ( $wdm_category === "" ) {
			$wdm_category = WDM_SHOW_ALL;
			
		} elseif ( ! preg_match( '/^[a-z0-9]+-?[a-z0-9-*,?]*$/', $wdm_category ) ) {
			$wdm_category = WDM_SHOW_ALL;
			
		} else {
			$wdm_category = addslashes( $wdm_category );
			$wdm_temp = explode( ",", trim( $wdm_category ) );
			$wdm_category = "'" . implode( "','", $wdm_temp ) . "'";
					
		}
	} else {
		$wdm_category = WDM_SHOW_ALL;
	}

	ob_start();
	require(WDM_BOOKING_SEARCH_TEMPLATE_PATH . 'public/wdm-checkin-checkout-widget-front-ui.php');
	
	$form_html = ob_get_clean();
	return $form_html;
}

