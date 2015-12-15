<?php

/* Plugin Name: Booking Availability Search
 * Description: This plugin allows users to search for WooCommerce Bookable products which are available for booking.
 * Version: 1.3.0
 * Author: WisdmLabs
 * Author URI: http://wisdmlabs.com
 * Plugin URI: http://wisdmlabs.com/woocommerce-bookings-availability-search-widget/
 */

//to avoid direct file access
if (!defined('ABSPATH')) {
    exit;
}
global $wdm_plugin_data;

$wdm_plugin_data = array(
    'plugin_short_name' => 'Bookings Availability Search',
    'plugin_slug' => 'bookings_availability_search',
    'plugin_version' => '1.3.0',
    'plugin_name' => 'Bookings Availability Search',
    'store_url' => 'http://wisdmlabs.com/check-update',
    'author_name' => 'WisdmLabs',
);

include_once ('includes/class-wdm-add-plugin-data-in-db.php');
new Wdm_Add_Plugin_Data_In_DB($wdm_plugin_data);

if (!class_exists('Wdm_Plugin_Updater')) {
    include('includes/wdm-plugin-updater.php' );

    $l_key = trim(get_option('edd_' . $wdm_plugin_data['plugin_slug'] . '_license_key'));

    // setup the updater
    new Wdm_Plugin_Updater($wdm_plugin_data['store_url'], __FILE__, array(
        'version' => $wdm_plugin_data['plugin_version'], // current version number
        'license' => $l_key, // license key (used get_option above to retrieve from DB)
        'item_name' => $wdm_plugin_data['plugin_name'], // name of this plugin
        'author' => $wdm_plugin_data['author_name'], //author of the plugin
            )
    );

    $l_key = null;
}

function requires_wordpress_version() {
    global $wp_version;
    $plugin = plugin_basename(__FILE__);
    $plugin_data = get_plugin_data(__FILE__, false);

    if (version_compare($wp_version, "3.3", "<")) {
        if (is_plugin_active($plugin)) {
            deactivate_plugins($plugin);
            wp_die("'" . $plugin_data['Name'] . "' requires WordPress 3.3 or higher, and has been deactivated! Please upgrade WordPress and try again.<br /><br />Back to <a href='" . admin_url() . "'>WordPress admin</a>.");
        }
    }
}

function requires__plugin() {
    $foundWoo = False;
    foreach (apply_filters('active_plugins', get_option('active_plugins')) as $plugin_name) {
        if (in_array("woocommerce.php", explode('/', $plugin_name))) {
            $foundWoo = True;
            break;
        }
    }
    if (!$foundWoo) {
        $plugin = plugin_basename(__FILE__);
        $plugin_data = get_plugin_data(__FILE__, false);
        deactivate_plugins($plugin);
        wp_die("'" . $plugin_data['Name'] . "' requires the WooCommerce plugin, and has been deactivated! Please install and activate the WooCommerce plugin.<br /><br />Back to <a href='" . admin_url() . "'>WordPress admin</a>.");
    }
}

add_action('admin_init', 'requires_wordpress_version');
add_action('admin_init', 'requires__plugin');
$wdm_search_widget_plugin_path = plugin_dir_path(__FILE__);
define("WDM_BOOKING_SEARCH_PLUGIN_PATH", $wdm_search_widget_plugin_path);
$wdm_search_widget_plugin_url = plugin_dir_url(__FILE__);
define("WDM_BOOKING_SEARCH_PLUGIN_URL", $wdm_search_widget_plugin_url);
$wdm_default_template_path = apply_filters('wdm_booking_search_template_path', WDM_BOOKING_SEARCH_PLUGIN_PATH . 'templates/');
define("WDM_BOOKING_SEARCH_TEMPLATE_PATH", $wdm_default_template_path);

include_once ('includes/class-wdm-get-plugin-data.php');
$get_data_from_db = Wdm_Get_Plugin_Data::get_data_from_db($wdm_plugin_data);
if ($get_data_from_db == 'available' || true) {
    require_once('shortcodes/wdm-results-render-shortcode.php' );
    require_once('shortcodes/wdm-checkin-checkout-search-form-shortcode.php' );
    require_once( 'includes/wdm-booking-search-ajax.php' );
    require_once('includes/wdm-metabox.php');
    require_once('includes/wdm-settings-page.php');
}

add_filter('plugin_action_links_' . plugin_basename(__FILE__), 'my_plugin_action_links');

/**
 * Adds "settings" link to plugin.
 * 
 * var $links, list of links associated with plugin.
 * returns array $links new set of links associated with plugin.
 */
function my_plugin_action_links($links) {
    $wdm_setting_str = '<a href="' . get_admin_url(null, 'options-general.php?page=my-setting-admin') . '">Settings</a>';
    array_unshift($links, $wdm_setting_str);
    return $links;
}
