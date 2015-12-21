<?php
/**
 * Functions associated with Midwife Profiles
 */

/*
 * Profile - Output just the city name for location on profiles
 */
function custom_listify_the_location_formatted_parts( $output, $location, $post ) {

	$output[ 'address' ] = '<span itemprop="address" itemscope itemtype="http://schema.org/PostalAddress">' . $post->geolocation_city . '</span>';
	$output[ 'map-link-start' ] = '';
	$output[ 'map-link-end' ] = '';

	return $output;
}

add_filter( 'listify_the_location_formatted_parts', 'custom_listify_the_location_formatted_parts', 10, 3);


/*
 * Profile - Change the setup of input fields on the Profile Submission/Edit page
 */
function custom_submit_job_form_fields( $fields ) {
	unset($fields['company']['products']);

	$fields[ 'job' ][ 'bh_max_bookings' ] = array(
		'label' => __( 'Maximum Postpartum Bookings', 'babyhallo' ),
		'type' => 'number',
		'placeholder' => '',
		'required' => true,
		'priority' => 4.26,
		'description' => __('The maximum number of families per month you will support for postpartum care', 'babyhallo')
	);

	$fields['job']['bh_has_postpartum'] = array(
		'label' => __( 'Do you offer Postpartum Care?', 'babyhallo' ),
		'type' => 'actionhook',
		'placeholder' => '',
		'required' => false,
		'priority' => 4.25,
		'meta_key' => 'bh_has_postpartum',
		'description' => ''
	);

	$hours = array();

	$hours[0] = array( 'start' => __('Closed','babyhallo'), 'end' => __('Closed','babyhallo') );
	$hours[1] = array( 'start' => '09:00', 'end' => '17:00' );
	$hours[2] = array( 'start' => '09:00', 'end' => '17:00' );
	$hours[3] = array( 'start' => '09:00', 'end' => '17:00' );
	$hours[4] = array( 'start' => '09:00', 'end' => '17:00' );
	$hours[5] = array( 'start' => '09:00', 'end' => '17:00' );
	$hours[6] = array( 'start' => __('Closed','babyhallo'), 'end' => __('Closed','babyhallo') );

	$fields['job']['job_hours']['value'] = $hours;

	return $fields;
}

add_filter( 'submit_job_form_fields', 'custom_submit_job_form_fields', 999, 1);


/*
 * Profile - Add a checkbox input for Postpartum Care
 */
function render_postpartum_check_field($field, $key) {
	?>
	<div class="field required-field">
		<input value="1" type="checkbox" name="<?php echo $field['meta_key']; ?>" id="<?php echo $field['meta_key']; ?>" <?php echo isset($field['value']) && ( $field['value'] == '1' ) ? 'checked' : ''; ?>/>
	</div>
	<?php
}

add_action('job_manager_field_actionhook_bh_has_postpartum', 'render_postpartum_check_field', 10, 2);


/*
 * Profile - Save additional fields when the profile is submitted
 */
function custom_update_job_data_products( $job_id, $values ) {

	$user_id 		= get_current_user_id();
	$current_user   = wp_get_current_user();


	// First check if this user has previously selected Postpartum Care on their profile.
	// If they have then update the Postpartum Product with any details they edited on the profile,
	// including deactivating the product if they have unchecked it on the profile.
	$post_args = array(
		'author' => $user_id,
		'post_type' => "product"
	);

	$haspostpartum = $values['job']['bh_has_postpartum'] == '1';

	$posts = get_posts($post_args);

	$products = array();
	$ind = 0;
	foreach ( $posts as $val ) {
		if (has_term( 'postpartum', 'bh_booking_type', $val)) {
			update_post_meta( $val->ID, '_wc_booking_qty', $values['job']['bh_max_bookings'] );
			update_post_meta( $val->ID, '_vendor_name', $haspostpartum ? $current_user->display_name : '' );
			if ($haspostpartum) {
				wp_set_object_terms($job_id, 'postpartum_type', 'service_type', true);
				$products[$ind] = $val->ID;
				$ind++;
			}
			else {
				wp_remove_object_terms($job_id, 'postpartum_type', 'service_type');
			}
		}
		else if (has_term( 'serviceappt', 'bh_booking_type', $val)) {
			update_post_meta( $val->ID, '_wc_booking_availability', parse_booking_availability($values['job']['job_hours']));
			$products[$ind] = $val->ID;
			$ind++;
		}

	}

	// CHeck if this is a profile edit and not a new profile
	if (count($posts) > 0) {

		//If this is just a profile edit then simply reindex the FacetWP fields and quit
		update_post_meta( $job_id, '_products', $products );
		FWP()->indexer->index( $job_id );
		return;
	}


	//This is a new profile being created so let's set up the new products

	//THe Service Product

	$service_product = array(
		'author' => $user_id,
		'post_content' => '',
		'post_status' => "publish",
		'post_title' => "Service Appointment",
		'post_parent' => '',
		'post_type' => "product",

	);

	//Create post
	$service_product_id = wp_insert_post( $service_product, false );

	//Set Terms
	wp_set_object_terms($service_product_id, 'booking', 'product_type');
	wp_set_object_terms($service_product_id, $current_user->user_login, 'shop_vendor');
	wp_set_object_terms($service_product_id, 'serviceappt', 'bh_booking_type');

	update_post_meta( $service_product_id, '_virtual', 'yes');
	update_post_meta( $service_product_id, '_wc_booking_min_duration', "1" );
	update_post_meta( $service_product_id, '_wc_booking_max_duration', "1" );
	update_post_meta( $service_product_id, '_wc_booking_enable_range_picker', "no" );
	update_post_meta( $service_product_id, '_wc_booking_calendar_display_mode', "always_visible");
	update_post_meta( $service_product_id, '_wc_booking_qty', "1" );
	update_post_meta( $service_product_id, '_wc_booking_duration_type', "fixed" );
	update_post_meta( $service_product_id, '_wc_booking_duration', "1" );
	update_post_meta( $service_product_id, '_wc_booking_duration_unit', "hour" );
	update_post_meta( $service_product_id, '_wc_booking_user_can_cancel', "yes" );
	update_post_meta( $service_product_id, '_wc_booking_cancel_limit', "1" );
	update_post_meta( $service_product_id, '_wc_booking_cancel_limit_unit', "day" );
	update_post_meta( $service_product_id, '_wc_booking_max_date', "12" );
	update_post_meta( $service_product_id, '_wc_booking_max_date_unit', "month" );
	update_post_meta( $service_product_id, '_wc_booking_min_date', "" );
	update_post_meta( $service_product_id, '_wc_booking_min_date_unit', "month" );
	update_post_meta( $service_product_id, '_wc_booking_default_date_availability', "non-available" );
	update_post_meta( $service_product_id, '_wc_booking_check_availability_against', "" );
	update_post_meta( $service_product_id, '_wc_booking_requires_confirmation', "no" );
	update_post_meta( $service_product_id, '_wc_booking_availability', parse_booking_availability($values['job']['job_hours']) );

	update_post_meta( $service_product_id, '_vendor_name', $current_user->display_name );

	update_post_meta( $service_product_id, '_wc_booking_min_duration', "1" );
	update_post_meta( $service_product_id, '_wc_booking_max_duration', "1" );
	update_post_meta( $service_product_id, '_wc_booking_max_date', "12" );
	update_post_meta( $service_product_id, '_wc_booking_max_date_unit', "month" );
	update_post_meta( $service_product_id, '_wc_booking_min_date', "" );
	update_post_meta( $service_product_id, '_wc_booking_min_date_unit', "month" );
	update_post_meta( $service_product_id, '_wc_booking_check_availability_against', "" );


	//THe Postpartum Product

	$postpartum_product = array(
		'author' => $user_id,
		'post_content' => '',
		'post_status' => "publish",
		'post_title' => "Postpartum Care",
		'post_parent' => '',
		'post_type' => "product",

	);

	//Create post
	$postpartum_product_id = wp_insert_post( $postpartum_product, false );

	wp_set_object_terms($postpartum_product_id, 'booking', 'product_type');
	wp_set_object_terms($postpartum_product_id, $current_user->user_login, 'shop_vendor');
	wp_set_object_terms($postpartum_product_id, 'postpartum', 'bh_booking_type');

	update_post_meta( $postpartum_product_id, '_virtual', 'yes');
	update_post_meta( $postpartum_product_id, '_wc_booking_min_duration', "1" );
	update_post_meta( $postpartum_product_id, '_wc_booking_max_duration', "1" );
	update_post_meta( $postpartum_product_id, '_wc_booking_enable_range_picker', "no" );
	update_post_meta( $postpartum_product_id, '_wc_booking_calendar_display_mode', "");
	update_post_meta( $postpartum_product_id, '_wc_booking_qty', $values['job']['bh_max_bookings'] );
	update_post_meta( $postpartum_product_id, '_wc_booking_duration_type', "fixed" );
	update_post_meta( $postpartum_product_id, '_wc_booking_duration', "1" );
	update_post_meta( $postpartum_product_id, '_wc_booking_duration_unit', "day" );
	update_post_meta( $postpartum_product_id, '_wc_booking_user_can_cancel', "yes" );
	update_post_meta( $postpartum_product_id, '_wc_booking_cancel_limit', "2" );
	update_post_meta( $postpartum_product_id, '_wc_booking_cancel_limit_unit', "month" );
	update_post_meta( $postpartum_product_id, '_wc_booking_requires_confirmation', "no" );
	update_post_meta( $postpartum_product_id, '_wc_booking_default_date_availability', "available" );
	update_post_meta( $postpartum_product_id, '_wc_booking_min_duration', "1" );
	update_post_meta( $postpartum_product_id, '_wc_booking_max_duration', "1" );
	update_post_meta( $postpartum_product_id, '_wc_booking_max_date', "12" );
	update_post_meta( $postpartum_product_id, '_wc_booking_max_date_unit', "month" );
	update_post_meta( $postpartum_product_id, '_wc_booking_min_date', "" );
	update_post_meta( $postpartum_product_id, '_wc_booking_min_date_unit', "month" );
	update_post_meta( $postpartum_product_id, '_wc_booking_check_availability_against', "" );

	update_post_meta( $postpartum_product_id, '_vendor_name', $current_user->display_name );


	//Now add the products to the midwife's profile

	$productarr = array( '0' => strval($service_product_id));
	if ($haspostpartum) {
		$productarr['1'] = strval($postpartum_product_id);
		wp_set_object_terms($job_id, 'postpartum_type', 'service_type', true);
	}
	update_post_meta( $job_id, '_products', $productarr );

	wp_set_object_terms($job_id, 'other_type', 'service_type', true);


	//And reindex FacetWP
	FWP()->indexer->index( $job_id );

}

add_action( 'job_manager_update_job_data', 'custom_update_job_data_products', 99, 2);


/*
 * Profile - Get the booking availability from the input array
 */
function parse_booking_availability( $jobHours ) {
	$days = array();
	foreach( $jobHours as $key => $value ) {
		if ($value['start'] != 'Closed') {
			$days[$key] = array(
				'type' => 'time:'.$key,
				'bookable' => 'yes',
				'from' => date("H:i", strtotime($value['start'])),
				'to' => date("H:i", strtotime($value['end']))
			);
		}
	}

	return $days;
}


/*
 * Profile - Additional fields to update on the profile
 */
function custom_update_job_data_profile( $job_id, $values ) {
	$user_id = get_current_user_id();

	if (isset($values['company']['phone']) && !empty($values['company']['phone'])) {
		update_user_meta($user_id, '_phone', $values['company']['phone']);
	}
	if (isset($values['job']['job_first_name']) && !empty($values['job']['job_first_name'])) {
		update_user_meta($user_id, 'first_name', $values['job']['job_first_name']);
	}
	if (isset($values['job']['job_last_name']) && !empty($values['job']['job_last_name'])) {
		update_user_meta($user_id, 'last_name', $values['job']['job_last_name']);
	}

}

add_action( 'job_manager_update_job_data', 'custom_update_job_data_profile', 10, 2);


/*
 * Profile - Remove the Preview step from profile submission
 */
function submit_midwife_profile_steps( $steps ) {
	unset($steps['preview']);

	return $steps;
}

add_filter('submit_job_steps', 'submit_midwife_profile_steps');

/*
 * Profile - Remove the Preview status from profile states
 */
function submit_midwife_valid_statuses( $statuses ) {
	unset($statuses['preview']);
	return $statuses;
}

add_filter('job_manager_valid_submit_job_statuses', 'submit_midwife_valid_statuses');


/*
 * Profile - Change the text on the Submit Button
 */
function submit_midwife_submit_button_text( $text ) {
	$text = __('Submit', 'babyhallo');
	return $text;
}

add_filter('submit_job_form_submit_button_text', 'submit_midwife_submit_button_text');


/*
 *
 */
function done_submit_midwife( $job_id ) {
	$job = get_post( $job_id );
	if ( in_array( $job->post_status, array( 'preview', 'expired' ) ) ) {
		// Reset expiry
		delete_post_meta( $job->ID, '_job_expires' );
		// Update job listing
		$update_job                  = array();
		$update_job['ID']            = $job->ID;
		$update_job['post_status']   = get_option( 'job_manager_submission_requires_approval' ) ? 'pending' : 'publish';
		$update_job['post_date']     = current_time( 'mysql' );
		$update_job['post_date_gmt'] = current_time( 'mysql', 1 );
		wp_update_post( $update_job );
	}
}
add_action( 'job_manager_job_submitted', 'done_submit_midwife' );

/*
 * Profile - Add an Edit button to redirect to Profile Edit if it is the logged in user's Profile
 */
function add_edit_button() {

	global $post;
	global $current_user;

	/**if (is_active_sidebar( 'single-job_listing-widget-area' ) || 'preview' == $post->post_type ) {
	return;
	}*/
	if ($post->post_author == $current_user->ID) {
		$action_url = '/my-account/listings?action=edit&job_id='.$post->ID;
		?>
		<a href="<?php echo esc_url( $action_url ); ?>" class="single-job_listing-respond button button-secondary"><?php _e( 'Edit Profile', 'babyhallo' ); ?></a>
		<?php
	}

}

add_action( 'listify_single_job_listing_actions_after', 'add_edit_button');

/*
 * Profile - Custom header
 */
function add_profile_meta_header( ) {
	wc_get_template( 'templates/midwife-profile-header.php' );
}

add_action( 'single_job_listing_meta_hook', 'add_profile_meta_header', 10 );

/*
 * Profile - Only allow picture uploads if it is the logged in user's profile
 */
function can_upload_pictures( $can ) {
	global $post;
	$author_id=$post->post_author;
	$current = get_current_user_id();
	$can = $author_id == $current;
	return $can;
}

add_filter( 'listify_can_upload_to_listing', 'can_upload_pictures');

/*
 * Profile - Only allow comments if the current user has had a booking with this midwife before
 */
function should_allow_comments( $allow ) {
	$userid = get_current_user_id();
	$midwife_id = get_the_author_meta( 'ID');

	$args = array(
		'author'    => $midwife_id,
		'post_type'      => 'product'
	);

	$products = get_posts($args);

	$allow = false;
	foreach ($products as $val) {
		$product  = wc_get_product( $val->ID );
		$bookings = $product->get_bookings_in_date_range( strtotime( '2015-01-01') , strtotime( 'midnight tomorrow', current_time( 'timestamp' ) ), $product->ID );
		foreach( $bookings as $booking ) {
			if ($booking->customer_id == $userid) {
				$allow = true;
				break;
			}
		}
		if ($allow) {
			break;
		}
	}

	return $allow;
}

add_filter('listify_allow_comments', 'should_allow_comments');

/*
 * Use the standard media upload directory for Job Manager.  This is to ensure Cloudfront works correctly
 */
function job_manager_upload_dir_for_cdn($upload_dir) {
	$upload_dir = "";
	return $upload_dir;
}

add_filter('job_manager_upload_dir', 'job_manager_upload_dir_for_cdn', 99);