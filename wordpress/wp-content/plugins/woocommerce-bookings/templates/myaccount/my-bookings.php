<?php
/**
 * My Bookings
 *
 * Shows bookings on the account page
 */

if ( ! defined( 'ABSPATH' ) ) exit; // Exit if accessed directly
?>
<h2><?php echo apply_filters( 'woocommerce_my_account_bookings_title', __( 'My bookings', 'woocommerce-bookings' ) ); ?></h2>

<?php
$postpartum_booking;
foreach ($bookings as $booking) {
	$type = reset(wp_get_object_terms($booking->get_product()->post->ID, 'bh_booking_type'));
	if ($type->slug == 'postpartum' && ( $booking->get_status() == 'confirmed'
	                                     || $booking->get_status() == 'paid'
	                                     || $booking->get_status() == 'complete') ) {
		$postpartum_booking = $booking;
		break;
	}
}

if ($postpartum_booking) {

	$vendor_login = reset(wp_get_object_terms($postpartum_booking->get_product()->post->ID, 'shop_vendor'));
	$args = array(
		'author' => get_user_by('login', $vendor_login->slug)->ID,
		'post_type'		=>	'job_listing',
		'post_status'	=>	'publish',
		'posts_per_page' => 1
	);
	$posts = get_posts($args);

	if (count($posts) > 0) {
		$profile = reset( $posts );
	}

	printf(
		__('You are booked for Postpartum Care with <a href="%1$%s">%2$s</a> for an expected due date of %3$s</p>', 'babyhallo'), get_permalink($profile->ID), get_the_title($profile->ID), $postpartum_booking->get_start_date( wc_date_format())
	);
	?>

	<p><a href="<?php echo $postpartum_booking->get_cancel_url(); ?>" class="button cancel"><?php _e( 'Cancel Postpartum Care', 'babyhallo' ); ?></a></p>
	<?php
}
?>

<table class="shop_table my_account_bookings">
	<thead>
	<tr>
		<th scope="col" class="booking-id"><?php _e( 'ID', 'babyhallo' ); ?></th>
		<th scope="col" class="booked-product"><?php _e( 'Appointment', 'babyhallo' ); ?></th>
		<th scope="col" class="booked-product"><?php _e( 'Midwife', 'babyhallo' ); ?></th>
		<th scope="col" class="booking-start-date"><?php _e( 'Time', 'woocommerce-bookings' ); ?></th>
		<th scope="col" class="booking-status"><?php _e( 'Status', 'woocommerce-bookings' ); ?></th>
		<th scope="col" class="booking-cancel"></th>
	</tr>
	</thead>
	<tbody>
	<?php foreach ( $bookings as $booking ) :

		$type = reset(wp_get_object_terms($booking->get_product()->post->ID, 'bh_booking_type'));
		if ($type->slug == 'postpartum') {
			continue;
		}

		$vendor_login = reset(wp_get_object_terms($booking->get_product()->post->ID, 'shop_vendor'));
		$args = array(
			'author' => get_user_by('login', $vendor_login->slug)->ID,
			'post_type'		=>	'job_listing',
			'post_status'	=>	'publish',
			'posts_per_page' => 1
		);
		$posts = get_posts($args);
		$profile = null;
		if (count($posts) > 0) {
			$profile = reset( $posts );
		}

		?>
		<tr>
			<td class="booking-id"><?php echo $booking->get_id(); ?></td>
			<td class="booked-product">
				<?php if ( $booking->get_product() ) : ?>
					<?php echo reset($booking->custom_fields['_booking_appt_type']); ?>
				<?php endif; ?>
			</td>
			<td class="booked-product">
				<?php if ( $booking->get_order() ) : ?>
					<?php
					if ($profile != null) {
						?>
						<a href="<?php echo get_permalink($profile->ID); ?>">
							<?php echo get_the_title($profile->ID); ?>
						</a>
						<?php
					}
					?>

				<?php endif; ?>
			</td>
			<td class="booking-start-date"><?php echo $booking->get_start_date( wc_date_format() ); ?></td>
			<td class="booking-status">
				<?php
				$status = $booking->get_status();
				if ($status == 'cancelled') {
					_e('Cancelled', 'babyhallo');
				}
				else if ($status == 'complete') {
					_e('Completed', 'babyhallo');
				}
				else {
					_e('Confirmed', 'babyhallo');
				}
				?>
			</td>
			<td class="booking-cancel">
				<?php
				if ( $booking->get_status() != 'cancelled' && $booking->get_status() != 'complete' && ! $booking->passed_cancel_day() ) {
				?>
					<a href="<?php echo $booking->get_cancel_url(); ?>" class="button cancel"><?php _e( 'Cancel', 'woocommerce-bookings' ); ?></a>
				<?php
					}
					else if ( $booking->get_status() == 'complete' && $profile != null ) {
				?>
						<a href="<?php echo get_permalink($profile->ID).'/#respond'; ?>" class="button cancel"><?php _e( 'Review', 'babyhallo' ); ?></a>
				<?php
					}
				?>
			</td>
		</tr>
	<?php endforeach; ?>
	</tbody>
</table>
