<?php

/*
 * Booking - If a date has been entered from a search request then add it as the default on the booking form here
 */
function get_default_booking_date( $date, $booking_form ) {
	if ( $booking_form->initial_date != '') {
		$date = $booking_form->initial_date;
	}
	return $date;
}

add_filter('woocommerce_initial_booking_date', 'get_default_booking_date', 10, 2);


/*
 * Use our custom template for booking
 */
function booking_form_main( $products ) {
	$booking_widget = Listify_Widget_Listing_Bookings::this();
	remove_action('listify_widget_job_listing_bookings', array($booking_widget,'output_bookings'), 10);
	$productarr = $products;
	if (!is_array($productarr)) {
		$productarr = array( $products );
	}
	woocommerce_get_template( 'templates/booking-form/bh_booking.php', array( 'products' => $productarr ), 'woocommerce-bookings', WC_BOOKINGS_TEMPLATE_PATH );
}

add_action('listify_widget_job_listing_bookings', 'booking_form_main', 5, 1);

/*
 * Booking - use our custom product handlers for WooCommerce
 */
function get_product_handler($product_type, $product) {
	if ($_POST['service-type'] === 'Postpartum Care') {
		return "postpartum";
	}
	else {
		return "service";
	}

	return "";
}

add_filter('woocommerce_add_to_cart_handler', 'get_product_handler', 10, 2);

/*
 * Booking - Postpartum Handler
 */
function bh_add_to_cart_handler_postpartum( $handler, $was_added_to_cart ) {
	$added_to_cart     = array();

	if ( !empty($_REQUEST['service-type']) && $_REQUEST['service-type'] === 'Postpartum Care' ) {

		// Process the appointment first

		$productIds = array($_REQUEST['add-to-cart'], $_REQUEST['pp_add-to-cart']);

		$passed_validation = true;
		$was_added_to_cart = true;
		foreach ($productIds as $id) {
			$passed_validation 	&= apply_filters( 'woocommerce_add_to_cart_validation', true, $id, 1 );
			if ( $passed_validation && WC()->cart->add_to_cart( $id, 1 ) !== false ) {
				$was_added_to_cart &= true;
			}
			else {
				$was_added_to_cart = false;
			}
		}
		if ( ! $was_added_to_cart ) {
			wc_add_notice( __( 'Please choose a product to add to your cart&hellip;', 'woocommerce' ), 'error' );
		} elseif ( $was_added_to_cart ) {
			//wc_add_to_cart_message( $added_to_cart );
			return true;
		}
	}
	else {
		/* Link on product archives */
		wc_add_notice( __( 'Please choose a product to add to your cart&hellip;', 'woocommerce' ), 'error' );
	}
	return false;

}

add_action('woocommerce_add_to_cart_handler_postpartum', 'bh_add_to_cart_handler_postpartum', 10, 1);

/*
 * Booking - Service Handler
 */
function bh_add_to_cart_handler_service( $handler, $was_added_to_cart ) {
	$product_id = $_REQUEST['add-to-cart'];
	$quantity 			= empty( $_REQUEST['quantity'] ) ? 1 : wc_stock_amount( $_REQUEST['quantity'] );
	$passed_validation 	= apply_filters( 'woocommerce_add_to_cart_validation', true, $product_id, $quantity );

	if ( $passed_validation && WC()->cart->add_to_cart( $product_id, $quantity ) !== false ) {
		return true;
	}
}

add_action('woocommerce_add_to_cart_handler_service', 'bh_add_to_cart_handler_service', 10, 1);

/*
 * Booking - Get the custom posted data from the request
 */
function bh_get_posted_data( $postedData, $product ) {
	if ($postedData['service-type'] != 'Postpartum Care') {
		return $postedData;
	}

	$newPostedData = $postedData;
	if (has_term('postpartum', 'bh_booking_type', $product->id)) {
		$newPostedData['wc_bookings_field_start_date_year'] = $newPostedData['pp_wc_bookings_field_start_date_year'];
		$newPostedData['wc_bookings_field_start_date_month'] = $newPostedData['pp_wc_bookings_field_start_date_month'];
		$newPostedData['wc_bookings_field_start_date_day'] = $newPostedData['pp_wc_bookings_field_start_date_day'];
		$newPostedData['add-to-cart'] = $newPostedData['pp_add-to-cart'];
		$newPostedData['wc_bookings_field_start_date_time'] = "";
	}

	return $newPostedData;
}

add_filter('woocommerce_booking_get_posted_data', 'bh_get_posted_data', 10, 2);

/*
 *
 */
function bh_get_booking_range_start($start_date, $product) {
	if (has_term('postpartum', 'bh_booking_type', $product->id)) {
		$start_date = strtotime(date('Y-m-01', $start_date));
	}

	return $start_date;
}

add_filter('woocommerce_get_bookings_in_range_start', 'bh_get_booking_range_start', 10, 2);


/*
 *
 */
function bh_get_booking_range_end($end_date, $product) {
	if (has_term('postpartum', 'bh_booking_type', $product->id)) {
		$end_date = strtotime(date('Y-m-t', $end_date));
	}

	return $end_date;
}

add_filter('woocommerce_get_bookings_in_range_end', 'bh_get_booking_range_end', 10, 2);


/*
 * Checkout - Change the title header
 */
function billing_details_title( $title ) {
	$title = __('Your Details', 'babyhallo');
	return $title;
}

add_filter( 'woocommerce_billing_details_title', 'billing_details_title');


/*
 * Checkout - Add the description depending on booking type (Postpartum or Appointment)
 */
function add_booking_details() {
	$cart = WC()->cart->get_cart();
	$service_booking = array_values($cart)[0];
	$postpartum_booking = null;

	if (count($cart) > 1) {
		foreach (array_values($cart) as $booking) {
			if (has_term('postpartum', 'bh_booking_type', $booking['product_id'])) {
				$postpartum_booking = $booking;
			}
			else {
				$service_booking = $booking;
			}
		}
	}

	//TODO maybe we should diplay title here
	$vendorid = $service_booking['data']->get_post_data()->post_author;
	$vendor_data = get_userdata((string)$vendorid);
	$vendor_name = $vendor_data->first_name." ".$vendor_data->last_name;

	//TODO figure out how to internationlaise this
	if ($postpartum_booking) {
		?>
		<p>You have requested <b>Postpartum Care Services</b> from <?php echo $vendor_name; ?></p>
		<p>Please confirm your details below and your Midwife will visit you at the address listed at <b><?php echo $service_booking['booking']['time']." on ".$service_booking['booking']['date']; ?></b> for your initial appointment.</p>
		<?php
	}
	else {
		?>
		<p>You have requested an appointment with <?php echo $vendor_name; ?> on <b></b><?php echo $service_booking['booking']['date']." at ".$service_booking['booking']['time']; ?></b></p>
		<p>Please confirm your details below and your Midwife will visit you at the address listed.</p>
		<?php
	}

}

add_action( 'woocommerce_checkout_before_customer_details', 'add_booking_details');

/*
 *
 */
function show_order_review( $show_order_review) {
	$show_order_review = false;
	return $show_order_review;
}

add_filter( 'woocommerce_show_order_review', 'show_order_review');

/*
 *
 */
function order_button_text( $text ) {
	$text = __('Book Now', 'babyhallo');
	return $text;
}

add_filter( 'woocommerce_order_button_text', 'order_button_text');

/*
 *
 */
function order_received_text( $text, $order ) {
	$text = __("Thank you.  Your booking has been made.  Your midwife will visit you at the time and location provided.", 'babyhallo');
	return $text;
}

add_filter( 'woocommerce_thankyou_order_received_text', 'order_received_text', 10, 2);

/*
 *
 */
function order_received_display_order_details ( $display_details ) {
	$display_details = false;
	return $display_details;
}

add_filter( 'woocommerce_order_received_display_details', 'order_received_display_order_details');

/*
 * Display a custom template for the booking details
 */
function booking_details_table( $order_id ) {

	if ( ! $order_id ) return;

	wc_get_template( 'templates/booking-received.php', array(
		'order_id' => $order_id
	) );

}

/*
 * Remove the default woocommerce templates for the booking received screen
 */
remove_action( 'woocommerce_thankyou', 'woocommerce_order_details_table', 10 );
remove_action( 'woocommerce_order_details_after_order_table', 'woocommerce_order_again_button', 10 );
add_action( 'woocommerce_thankyou', 'booking_details_table', 10 );

/*
 * We do not use a persistent cart so only want a maximum of one item in there at a time.
 */
function remove_items_from_cart() {
//TODO do this cleaner
	WC()->cart->empty_cart();
}

add_action('woocommerce_before_add_to_cart_button', 'remove_items_from_cart');

