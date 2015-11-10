<?php
/*
 Plugin Name: The Events Calendar: Community Events
 Description: Community Events is an add-on providing additional functionality to the open source plugin The Events Calendar. Empower users to submit and manage their events on your website. <a href="http://tri.be/shop/wordpress-community-events/?utm_campaign=in-app&utm_source=docblock&utm_medium=plugin-community">Check out the full feature list</a>. Need more features? Peruse our selection of <a href="http://tri.be/products/?utm_campaign=in-app&utm_source=docblock&utm_medium=plugin-community" target="_blank">plugins</a>.
 Version: 3.12
 Author: Modern Tribe, Inc.
 Author URI: http://m.tri.be/21
 Text Domain: tribe-events-community
 License: GPLv2 or later
*/

/*
Copyright 2011-2012 by Modern Tribe Inc and the contributors

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
*/

/**
 * Instantiate class and get the party started!
 *
 * @since 1.0
 */
function Tribe_CE_Load() {
	tribe_community_events_autoloading();

	$classes_exist = class_exists( 'Tribe__Events__Main' ) && class_exists( 'Tribe__Events__Community__Main' );
	$version_ok = defined( 'Tribe__Events__Main::VERSION' ) && version_compare( Tribe__Events__Main::VERSION, Tribe__Events__Community__Main::REQUIRED_TEC_VERSION, '>=' );

	if ( ! ( $classes_exist && $version_ok ) ) {
		add_action( 'admin_notices', 'tribe_ce_show_fail_message' );
		return;
	}

	require_once( 'vendor/tribe-common-libraries/tribe-common-libraries.class.php' );
	require_once( 'src/functions/template-tags.php' );
	new Tribe__Events__Community__PUE( __FILE__ );
	Tribe__Events__Community__Main::instance();
	Tribe__Events__Community__Templates::instance();
	add_action( 'admin_init', array( 'Tribe__Events__Community__Schema', 'init' ) );
}

function tribe_community_events_autoloading() {
	if ( ! class_exists( 'Tribe__Events__Autoloader' ) ) {
		return;
	}
	$autoloader = Tribe__Events__Autoloader::instance();

	$autoloader->register_prefix( 'Tribe__Events__Community__', dirname( __FILE__ ) . '/src/Tribe' );

	// deprecated classes are registered in a class to path fashion
	foreach ( glob( dirname( __FILE__ ) . '/src/deprecated/*.php' ) as $file ) {
		$class_name = str_replace( '.php', '', basename( $file ) );
		$autoloader->register_class( $class_name, $file );
	}
	$autoloader->register_autoloader();
}

/**
 * Shows message if the plugin can't load due to TEC not being installed.
 *
 * @return void
 * @author Nick Ciske
 * @since  1.0
 */
function tribe_ce_show_fail_message() {
	if ( current_user_can( 'activate_plugins' ) ) {
		$url = 'plugin-install.php?tab=plugin-information&plugin=the-events-calendar&TB_iframe=true';
		$title = __( 'The Events Calendar', 'tribe-events-community' );
		echo '<div class="error"><p>' . sprintf( __( 'To begin using The Events Calendar: Community Events, please install the latest version of <a href="%s" class="thickbox" title="%s">The Events Calendar</a>.', 'tribe-events-community' ), esc_url( $url ), $title ) . '</p></div>';
	}
}

register_activation_hook( __FILE__, 'tribe_ce_activate' );
function tribe_ce_activate() {
	tribe_community_events_autoloading();
	if ( ! class_exists( 'Tribe__Events__Community__Main' ) ) {
		return;
	}
	Tribe__Events__Community__Main::activateFlushRewrite();
}

add_action( 'plugins_loaded', 'Tribe_CE_Load', 1 ); // high priority so that it's not too late for tribe_register-helpers class
