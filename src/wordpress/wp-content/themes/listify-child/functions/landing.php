<?php

/*
 * Disable menus for the landing page
 */
function display_menus( $display ) {
	return get_the_title() != 'Landing' && get_the_title() != 'Disclaimer';
}

add_filter( 'listify_display_menus', 'display_menus');

/*
 * Add the 'Coming Soon' banner
 */
function add_header_banner() {
?>
	<div class="header-banner"><?php _e('LAUNCHING SPRING 2016', 'babyhallo'); ?></div>
<?php
}

add_action( 'listify_header_flavour', 'add_header_banner');


/*
 * Redirect everything to landing page
 */
function wpse_131562_redirect() {
	if ( $_SERVER['REQUEST_URI'] != "/") {
		if ( isset( $_SERVER['HTTP_REFERER'] ) ) {
			$refer = trim( $_SERVER['HTTP_REFERER'] );
			if ( empty( $refer ) ) {
				wp_redirect( home_url() );
				exit();
			}
		} else {
			wp_redirect( home_url() );
			exit();
		}
	}

}

add_action('template_redirect', 'wpse_131562_redirect');