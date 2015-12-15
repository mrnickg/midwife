=== Booking Availability Search ===
Contributors: WisdmLabs
Tested up to:  4.3.1
Current Version: 1.3.0
License: GPLv2 or later
License URI: http://www.gnu.org/licenses/gpl-2.0.html

This WooCommerce Bookings extension plugin allows you to search available bookable products within a date range.
Tested with WooCommerce version 2.4.7
Tested with WooCommerce Bookings version 1.7.13

== Description ==

The Booking Availability Search plugin by WisdmLabs provides WooCommerce store customers an option to search for available bookable products, by entering a date range.

== Features ==
1. Provides a shortcode to display a search widget. This search widget displays a 'From' and 'To' date, and a search button.
2. The results are displayed using a search results shortcode. 

== Installation Guide ==
1. Download the Booking Availability Search plugin using the download link sent to your registered email id.
2. Upload and activate the plugin.
3. A Booking Availability Search License sub-menu will be created under Plugins menu in your admin panel. Click on this menu and enter your purchased product’s license key. Click on Activate License. If license in valid, an ‘Active’ status message will be displayed, else ‘Inactive’ will be displayed.
4. Upon entering a valid license key, and activating the license, you should be able to use the plugin.

== User Guide ==
1. To display the search widget, use the 'wdm_booking_search_widget' shortcode. The shortcode accepts two arguments 'from' and 'two' which can be used to set labels for your 'from date' and 'to date' fields respectively.
For example: To display a widget with check-in/check-out dates, use the  [ wdm_booking_search_widget from="check in" to="check out" ] shortcode.
2. To display the search results, add the [ wdm_booking_search ] on the SAME page.
3. Currently the search is not redirected to a search results page. Hence, for every page you add the search widget, you have to add the search results shortcode to display the results.


== Change Log ==
=1.3.0=
* Feature to search for timed blocks added

=1.2.1=
* Plugin licensing updated

=1.2.0=

* Compatible with Fixed blocks, not time blocks
* Added feature to search based on categories
* Compatible with WooCommerce 2.3.11

=1.1.0=

* Bugs fixed
* Compatible with WooCommerce 2.3.7


=1.0=

* Plugin Released

