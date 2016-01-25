<?php
/**
 * Listify child theme.
 */

require_once('inc/integrations/facetwp/due_date.php');
require_once('inc/integrations/facetwp/service_type.php');

include_once('functions/account.php');
include_once('functions/booking.php');
include_once('functions/profile.php');
include_once('functions/search.php');
include_once('functions/landing.php');
include_once('functions/site.php');

define( 'BH_VERSION', '1.0.0' );

load_theme_textdomain( 'babyhallo', get_stylesheet_directory() . "/languages" );

function bh_enqueue_scripts() {
	wp_enqueue_script( 'bh_booking', get_stylesheet_directory_uri() . "/js/booking.js", array( 'jquery' ), BH_VERSION );
	wp_enqueue_script( 'bh_profile', get_stylesheet_directory_uri() . "/js/profile.js", array( 'jquery' ), BH_VERSION );

	if (is_front_page()) {
		wp_enqueue_script( 'bh_facets', get_stylesheet_directory_uri() . "/js/facetsupport.js", array( 'jquery' ), BH_VERSION );
		wp_enqueue_script( 'bh_landing', get_stylesheet_directory_uri() . "/js/landing.js", array( 'jquery' ), BH_VERSION );

		wp_localize_script( 'bh_landing', 'objectL10n', array(
			'email'  => esc_html__('Your email address', 'babyhallo'),
			'submit' => esc_html__( 'Tell me more', 'babyhallo' ),
		) );
	}
}

add_action('wp_enqueue_scripts', 'bh_enqueue_scripts', 999);

function listify_child_styles() {
    wp_enqueue_style( 'listify-child', get_stylesheet_uri() );
}
add_action( 'wp_enqueue_scripts', 'listify_child_styles', 999 );


function load_fonts() {
	wp_register_style('et-googleFonts', 'https://fonts.googleapis.com/css?family=Lato:400,700');
	wp_enqueue_style('et-googleFonts');
}

add_action('wp_print_styles', 'load_fonts');








