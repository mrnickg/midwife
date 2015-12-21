<?php
/**
 * Booking product add to cart
 */
if ( ! defined( 'ABSPATH' ) ) {
	exit; // Exit if accessed directly
}

extract($args);

global $post;

$meta = get_post_meta($post->ID, '_bh_services');
$services = reset($meta);

$has_postpartum = false;
$postpartum_product;
$service_product;

foreach ($products as $product) {
	if (has_term('postpartum', 'bh_booking_type', $product->id )) {
		$has_postpartum = true;
		$postpartum_product = $product;
	}
	else {
		$service_product = $product;
	}
}

$initial_select= 'Postpartum Care';

$initial_select_postpartum = true;

if (isset($_COOKIE['service_type'])) {
	$cookietype = $_COOKIE['service_type'];
	if ($cookietype == 'Postpartum Care' && $has_postpartum) {
		$initial_select = 'Postpartum Care';
	}
	else if (isset($_COOKIE['service']) && $_COOKIE['service'] != '') {
		$initial_select = $_COOKIE['service'];
		$initial_select_postpartum = false;
	}
}

?>

<noscript><?php _e( 'Your browser must support JavaScript in order to make a booking.', 'woocommerce-bookings' ); ?></noscript>

<p class="form-field form-field-wide">
	<label for="type">Service:</label>
	<select name="booking_type" id="booking_type">
		<?php
			if ($has_postpartum) {
				?>
				<option value="Postpartum Care" "<?php echo ( $initial_select_postpartum ) ? "selected" : ""; ?>"><?php _e('Postpartum Care', 'babyhallo'); ?>
				</option>
				<option disabled>
					&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;&#9472;</option>
				<?php
			}
		?>
		<?php foreach ( $services as $value ) :
			$displayText = get_term_by('id', $value, 'service')->name;
			?>
			<option value="<?php echo $value; ?>" <?php if (substr($initial_select, 0, strlen($displayText)) === $displayText) { ?> selected <?php } ?>>
			<?php echo $displayText; ?>
			</option>
		<?php endforeach; ?>
	</select>
</p>

<?php if ($has_postpartum) {
	$pp_booking_form = new WC_Booking_Form( $postpartum_product );
	$pp_booking_form->initial_date = isset($_COOKIE['due_date']) ? $_COOKIE['due_date'] : '';
	$s_booking_form = new WC_Booking_Form( $service_product );
?>
<div name="postpartum_div" id="postpartum_div" style="<?php echo $initial_select_postpartum ? "" : "display:none" ?>">
	<form name="postpartum_hidden_form" id="postpartum_hidden_form" class="cart" method="post" enctype='multipart/form-data'>
		<div id="bh-bookings-pp-div" class="wc-bookings-booking-form">
			<p><?php _e('Please confirm your due date', 'babyhallo'); ?></p>
			<?php $pp_booking_form->output(); ?>
			<input type="hidden" name="add-to-cart" value="<?php echo esc_attr( $postpartum_product->id ); ?>" />
		</div>
	</form>
	<br/>
	<form class="cart" name="postpartum_main_form" id="postpartum_main_form" method="post" enctype='multipart/form-data'>
		<div id="postpartum-service-form" style="display:none">
			<div class="wc-bookings-booking-form">
				<p><?php _e('Please select a date and time for your initial appointment', 'babyhallo'); ?></p>
				<?php $s_booking_form->output(); ?>
			</div>
		</div>


		<input type="hidden" name="pp_wc_bookings_field_start_date_year" id="pp_wc_bookings_field_start_date_year" />
		<input type="hidden" name="pp_wc_bookings_field_start_date_month" id="pp_wc_bookings_field_start_date_month" />
		<input type="hidden" name="pp_wc_bookings_field_start_date_day" id="pp_wc_bookings_field_start_date_day" />
		<input type="hidden" name="appt_type" id="appt_type" value="Introductory Appointment"/>
		<input type="hidden" name="add-to-cart" value="<?php echo esc_attr( $service_product->id ); ?>" />
		<input type="hidden" name="pp_add-to-cart" value="<?php echo esc_attr( $postpartum_product->id ); ?>" />

		<input type="hidden" name="service-type" value="Postpartum Care"/>

		<button type="submit" class="wc-bookings-booking-form-button single_add_to_cart_button button alt disabled" ><?php echo $product->single_add_to_cart_text(); ?></button>

		<?php do_action( 'woocommerce_after_add_to_cart_button' ); ?>

	</form>
</div>
<?php
}
?>
<div name="service_div" id="service_div" style="<?php echo $initial_select_postpartum ? "display:none" : "" ?>">
	<form class="cart" id="service_form" name="service_form" method="post" enctype='multipart/form-data'>

		<?php foreach ($products as $product) {

			if (!has_term('postpartum', 'bh_booking_type', $product->id)) {

				$booking_form = new WC_Booking_Form( $product ); ?>

				<div id="bh-service-form" class="wc-bookings-booking-form">

					<?php do_action( 'woocommerce_before_booking_form' ); ?>

					<?php $booking_form->output(); ?>

					<?php do_action( 'woocommerce_before_add_to_cart_button' ); ?>

				</div>

				<?php
			}
		} ?>

		<input type="hidden" name="add-to-cart" value="<?php echo esc_attr( $service_product->id ); ?>" />

		<input type="hidden" name="service_type" id="service_type" value=""/>
		<input type="hidden" name="appt_type" id="appt_type" value=""/>

		<button type="submit" class="wc-bookings-booking-form-button single_add_to_cart_button button alt disabled" style="display:none"><?php echo $product->single_add_to_cart_text(); ?></button>

		<?php do_action( 'woocommerce_after_add_to_cart_button' ); ?>

	</form>

</div>
<?php do_action( 'woocommerce_after_add_to_cart_form' ); ?>
