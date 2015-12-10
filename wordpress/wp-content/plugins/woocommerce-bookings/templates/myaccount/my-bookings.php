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

		?>
			You are booked for Postpartum Care with <a href="<?php echo get_permalink($profile->ID); ?>">
									<?php echo get_the_title($profile->ID); ?>
								</a> for an expected due date of <?php echo $postpartum_booking->get_start_date( wc_date_format() ); ?></p>
			<p><a href="<?php echo $postpartum_booking->get_cancel_url(); ?>" class="button cancel"><?php _e( 'Cancel Postpartum Care', 'woocommerce-bookings' ); ?></a></p>
		<?php
	}
?>

<table class="shop_table my_account_bookings">
	<thead>
	<tr>
		<th scope="col" class="booking-id"><?php _e( 'ID', 'woocommerce-bookings' ); ?></th>
		<th scope="col" class="booked-product"><?php _e( 'Appointment', 'woocommerce-bookings' ); ?></th>
		<th scope="col" class="booked-product"><?php _e( 'Midwife', 'woocommerce-bookings' ); ?></th>
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
						$vendor_login = reset(wp_get_object_terms($booking->get_product()->post->ID, 'shop_vendor'));
						$args = array(
							'author' => get_user_by('login', $vendor_login->slug)->ID,
							'post_type'		=>	'job_listing',
							'post_status'	=>	'publish',
							'posts_per_page' => 1
						);
						$posts = get_posts($args);

						if (count($posts) > 0) {
							$profile = reset($posts);
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
			<td class="booking-status"><?php echo $booking->get_status( false ); ?></td>
			<td class="booking-cancel">
				<?php if ( $booking->get_status() != 'cancelled' && $booking->get_status() != 'completed' && ! $booking->passed_cancel_day() ) : ?>
					<a href="<?php echo $booking->get_cancel_url(); ?>" class="button cancel"><?php _e( 'Cancel', 'woocommerce-bookings' ); ?></a>
				<?php endif ?>
			</td>
		</tr>
	<?php endforeach; ?>
	</tbody>
</table>
