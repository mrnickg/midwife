<?php
/**
 * Listify child theme.
 */

require_once('inc/integrations/facetwp/due_date.php');
require_once('inc/integrations/facetwp/service_type.php');

function bh_enqueue_scripts() {
	wp_enqueue_script( 'bh_booking', get_stylesheet_directory_uri() . "/js/booking.js", array( 'jquery' ) );
	wp_enqueue_script( 'bh_profile', get_stylesheet_directory_uri() . "/js/profile.js", array( 'jquery' ) );

	if (is_front_page()) {
		wp_enqueue_script( 'bh_facets', get_stylesheet_directory_uri() . "/js/facetsupport.js", array( 'jquery' ) );
	}
}

add_action('wp_enqueue_scripts', 'bh_enqueue_scripts', 999);

function listify_child_styles() {
    wp_enqueue_style( 'listify-child', get_stylesheet_uri() );
}
add_action( 'wp_enqueue_scripts', 'listify_child_styles', 999 );

/** Place any new code below this line */

function search_widget_get_all_facets( $args ) {
	$args[ 'facets' ] = 'proximity,due_date,service';
	return $args;
}

add_filter('listify_widget_search_listings_default', 'search_widget_get_all_facets', 10, 1);

function search_widget_check_postpartum( $facet ) {
	return $facet['name'] == 'proximity' || $facet['name'] == 'due_date';
}

add_filter( 'search_widget_is_postpartum_facet', 'search_widget_check_postpartum', 10, 1);

function search_widget_check_service( $facet ) {
	return $facet['name'] == 'proximity' || $facet['name'] == 'service';
}

add_filter( 'search_widget_is_service_facet', 'search_widget_check_service', 10, 1);

function custom_listify_the_location_formatted_parts( $output, $location, $post ) {

	$output[ 'address' ] = '<span itemprop="address" itemscope itemtype="http://schema.org/PostalAddress">' . $post->geolocation_city . '</span>';
	//$output[ 'address' ] = html_entity_decode( $output[ 'address' ] );
	$output[ 'map-link-start' ] = '';
	$output[ 'map-link-end' ] = '';

	return $output;
}

add_filter( 'listify_the_location_formatted_parts', 'custom_listify_the_location_formatted_parts', 10, 3);

/**
 * internet_allow_email_login filter to the authenticate filter hook, to fetch a username based on entered email
 * @param  obj $user
 * @param  string $username [description]
 * @param  string $password [description]
 * @return boolean
 */
function internet_allow_email_login( $user, $username, $password ) {
    if ( is_email( $username ) ) {
        $user = get_user_by_email( $username );
        if ( $user ) $username = $user->user_login;
    }
    return wp_authenticate_username_password( null, $username, $password );
}

add_filter('authenticate', 'internet_allow_email_login', 20, 3);


function wooc_extra_register_fields() {
	?>
	<p class="form-row form-row-wide">
	<label for="reg_user_role"><?php _e( 'I am a...', 'woocommerce' ); ?> <span class="required">*</span></label>
		<input type="radio" name="role" id="role" value="customer" checked="checked">Parent<br/>
		<input type="radio" name="role" id="role" value="midwife">Midwife
	</p>

	<?php
}

add_action( 'woocommerce_register_form_start', 'wooc_extra_register_fields' );

function wooc_extra_register_fields_after() {
	?>
	<p class="form-row form-row-wide">
		<label for="reg_first_name" class="midwife"><?php _e( 'First Name', 'woocommerce' ); ?> <span class="required">*</span></label>
		<input type="text" class="input-text midwife" name="first_name" id="first_name" value="<?php if ( ! empty( $_POST['first_name'] ) ) echo esc_attr( $_POST['first_name'] ); ?>" />
	</p>
	<p class="form-row form-row-wide">
		<label for="reg_last_name" class="midwife"><?php _e( 'Last Name', 'woocommerce' ); ?> <span class="required">*</span></label>
		<input type="text" class="input-text midwife" name="last_name" id="last_name" value="<?php if ( ! empty( $_POST['last_name'] ) ) echo esc_attr( $_POST['last_name'] ); ?>" />
	</p>
	<?php
}

add_action( 'woocommerce_register_form', 'wooc_extra_register_fields_after');

function wooc_validate_extra_register_fields( $username, $email, $validation_errors ) {
	if ( isset( $_POST['role'] ) && empty( $_POST['role'] ) ) {
		$validation_errors->add( 'roles_error', __( 'Please select Parent or Midwife', 'woocommerce' ) );
	}
	if ( isset( $_POST['first_name'] ) && empty( $_POST['first_name'] ) ) {
		$validation_errors->add( 'roles_error', __( 'Please enter your first name', 'woocommerce' ) );
	}
	if ( isset( $_POST['last_name'] ) && empty( $_POST['last_name'] ) ) {
		$validation_errors->add( 'roles_error', __( 'Please enter your last name', 'woocommerce' ) );
	}

}

add_action( 'woocommerce_register_post', 'wooc_validate_extra_register_fields', 10, 3 );


function custom_new_customer_data($new_customer_data){
	if ( isset( $_POST['role'])) {
		$new_customer_data['role'] = $_POST['role'];
	}
	if ( isset( $_POST['first_name'])) {
		$new_customer_data['first_name'] = $_POST['first_name'];
	}
	if ( isset( $_POST['last_name'])) {
		$new_customer_data['last_name'] = $_POST['last_name'];
	}
    
    return $new_customer_data;
}

add_filter( 'woocommerce_new_customer_data', 'custom_new_customer_data');


function wooc_save_extra_register_fields( $customer_id ) {
	if ( isset( $_POST['role'] ) ) {
		// WordPress default first name field.
		update_user_meta( $customer_id, 'role', sanitize_text_field( $_POST['role'] ) );

	}

}

add_action( 'woocommerce_created_customer', 'wooc_save_extra_register_fields' );

function wc_create_vendor_on_registration( $customer_id, $new_customer_data ) {
	if ( $new_customer_data['role'] == 'midwife') {

		$username = $new_customer_data['user_login'];
	$email    = $new_customer_data['user_email'];

	// Ensure vendor name is unique
	if ( term_exists( $username, 'shop_vendor' ) ) {
		$append     = 1;
		$o_username = $username;

		while ( term_exists( $username, 'shop_vendor' ) ) {
			$username = $o_username . $append;
			$append ++;
		}
	}

	// Create the new vendor
	$return = wp_insert_term(
		$username,
		'shop_vendor',
		array(
			'description' => sprintf( __( 'The vendor %s', 'localization-domain' ), $username ),
			'slug'        => sanitize_title( $username )
		)
	);

	if ( is_wp_error( $return ) ) {
		wc_add_notice( __( '<strong>ERROR</strong>: Unable to create the vendor account for this user. Please contact the administrator to register your account.', 'localization-domain' ), 'error' );
	} else {
		// Update vendor data
		$vendor_data['paypal_email'] = $email; // The email used for the account will be used for the payments
		$vendor_data['commission']   = '0'; // The commission is 50% for each order
		$vendor_data['admins'][]     = $customer_id; // The registered account is also the admin of the vendor

		update_option( 'shop_vendor_' . $return['term_id'], $vendor_data );
		
		$caps = array(
			"edit_product",
			"read_product",
			"delete_product",
			"edit_products",
			"edit_others_products",
			"delete_products",
			"delete_published_products",
			"delete_others_products",
			"edit_published_products",
			"assign_product_terms",
			"upload_files",
			"manage_bookings",
		);

		$skip_review = get_option( 'woocommerce_product_vendors_skip_review' ) == 'yes' ? true : false;
		if( $skip_review ) {
			$caps[] = 'publish_products';
		}

		$caps = apply_filters( 'product_vendors_admin_caps', $caps );

		$user = new WP_User( $customer_id );
		update_user_meta($user->ID, 'product_vendor', $return['term_id']);

		foreach( $caps as $cap ) {
			$user->add_cap( $cap );
		}

	}

	}

	
}

add_action( 'woocommerce_created_customer', 'wc_create_vendor_on_registration', 10, 2 );

/**
	First of all we have to remove the product input from the form
*/
function custom_submit_job_form_fields( $fields ) {
	unset($fields['company']['products']);

	$fields[ 'job' ][ 'bh_max_bookings' ] = array(
		'label' => __( 'Maximum Postpartum Bookings', 'listify' ),
		'type' => 'number',
		'placeholder' => '',
		'required' => true,
		'priority' => 4.26,
		'description' => 'The maximum number of families per month you will support for postpartum care'
	);

	$fields['job']['bh_has_postpartum'] = array(
		'label' => __( 'Do you offer Postpartum Care?', 'listify' ),
		'type' => 'actionhook',
		'placeholder' => '',
		'required' => false,
		'priority' => 4.25,
		'meta_key' => 'bh_has_postpartum',
		'description' => ''
	);

	$hours = array();

	$hours[0] = array( 'start' => 'Closed', 'end' => 'Closed' );
	$hours[1] = array( 'start' => '09:00', 'end' => '17:00' );
	$hours[2] = array( 'start' => '09:00', 'end' => '17:00' );
	$hours[3] = array( 'start' => '09:00', 'end' => '17:00' );
	$hours[4] = array( 'start' => '09:00', 'end' => '17:00' );
	$hours[5] = array( 'start' => '09:00', 'end' => '17:00' );
	$hours[6] = array( 'start' => 'Closed', 'end' => 'Closed' );

	$fields['job']['job_hours']['value'] = $hours;

	return $fields;
}

add_filter( 'submit_job_form_fields', 'custom_submit_job_form_fields', 999, 1);


function render_postpartum_check_field($field, $key) {
	?>
	<div class="field required-field">
		<input value="1" type="checkbox" name="<?php echo $field['meta_key']; ?>" id="<?php echo $field['meta_key']; ?>" <?php echo isset($field['value']) && ( $field['value'] == '1' ) ? 'checked' : ''; ?>/>
	</div>
	<?php
}

add_action('job_manager_field_actionhook_bh_has_postpartum', 'render_postpartum_check_field', 10, 2);

/**
	Now we have to create our own job when the form is submitted
*/
function custom_update_job_data_products( $job_id, $values ) {

	$user_id 		= get_current_user_id();
	$current_user   = wp_get_current_user();

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
		}
		else if (has_term( 'serviceappt', 'bh_booking_type', $val)) {
			update_post_meta( $val->ID, '_wc_booking_availability', parse_booking_availability($values['job']['job_hours']));
		}
		$products[$ind] = $val->ID;
		$ind++;
	}

	//TODO Need a way to disable postpartum product if the midwife deselects

	if (count($posts) > 0) {

		update_post_meta( $job_id, '_products', $products );
		FWP()->indexer->index( $job_id );
		return;
	}

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
//	if($service_product_id){
//	 	$attach_id = get_post_meta($service_product->parent_id, "_thumbnail_id", true);
//	 	add_post_meta($service_product_id, '_thumbnail_id', $attach_id);
//	}

	//Set Terms
	wp_set_object_terms($service_product_id, 'booking', 'product_type');
	wp_set_object_terms($service_product_id, $current_user->user_login, 'shop_vendor');
	wp_set_object_terms($service_product_id, 'serviceappt', 'bh_booking_type');

	// update_post_meta( $service_product_id, '_visibility', 'visible' );
	// update_post_meta( $service_product_id, '_stock_status', 'instock');
	// update_post_meta( $service_product_id, 'total_sales', '0');
	// update_post_meta( $service_product_id, '_downloadable', 'no');
	update_post_meta( $service_product_id, '_virtual', 'yes');
	// update_post_meta( $service_product_id, '_regular_price', "" );
	// update_post_meta( $service_product_id, '_sale_price', "" );
	// update_post_meta( $service_product_id, '_purchase_note', "" );
	// update_post_meta( $service_product_id, '_featured', "no" );
	// update_post_meta( $service_product_id, '_weight', "" );
	// update_post_meta( $service_product_id, '_length', "" );
	// update_post_meta( $service_product_id, '_width', "" );
	// update_post_meta( $service_product_id, '_height', "" );
	// update_post_meta( $service_product_id, '_sku', "");
	// update_post_meta( $service_product_id, '_product_attributes', array());
	// update_post_meta( $service_product_id, '_sale_price_dates_from', "" );
	// update_post_meta( $service_product_id, '_sale_price_dates_to', "" );
	// update_post_meta( $service_product_id, '_price', "0" );
	// update_post_meta( $service_product_id, '_manage_stock', "no" );
	// update_post_meta( $service_product_id, '_backorders', "no" );
	// update_post_meta( $service_product_id, '_upsell_ids', array() );
	// update_post_meta( $service_product_id, '_crosssell_ids', array() );
	update_post_meta( $service_product_id, '_wc_booking_min_duration', "1" );
	update_post_meta( $service_product_id, '_wc_booking_max_duration', "1" );
	update_post_meta( $service_product_id, '_wc_booking_enable_range_picker', "no" );
	update_post_meta( $service_product_id, '_wc_booking_calendar_display_mode', "always_visible");
	update_post_meta( $service_product_id, '_wc_booking_qty', "1" );
	// update_post_meta( $service_product_id, '_wc_booking_has_persons', "no" );
	// update_post_meta( $service_product_id, '_wc_booking_person_qty_multiplier', "no" );
	// update_post_meta( $service_product_id, '_wc_booking_person_cost_multiplier', "no" );
	// update_post_meta( $service_product_id, '_wc_booking_min_persons_group', "1" );
	// update_post_meta( $service_product_id, '_wc_booking_max_persons_group', "1" );
	// update_post_meta( $service_product_id, '_wc_booking_has_person_types', "no" );
	// update_post_meta( $service_product_id, '_wc_booking_has_resources', "yes" );
	// update_post_meta( $service_product_id, '_wc_booking_resources_assignment', "customer" );
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
	// update_post_meta( $service_product_id, '_wc_booking_resouce_label', "" );
	// update_post_meta( $service_product_id, '_wc_booking_pricing', array() );
	// update_post_meta( $service_product_id, '_has_additional_costs', "no" );
	// update_post_meta( $service_product_id, '_product_vendors_commission', "" );
	// update_post_meta( $service_product_id, '_sold_individually', "" );
	// update_post_meta( $service_product_id, '_stock', "" );
	// update_post_meta( $service_product_id, '_wc_booking_base_cost', "" );
	// update_post_meta( $service_product_id, '_wc_booking_cost', "" );
	// update_post_meta( $service_product_id, '_wc_display_cost', "" );
	// update_post_meta( $service_product_id, '_wc_booking_first_block_time', "" );
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
//	if($postpartum_product_id){
//		$attach_id = get_post_meta($postpartum_product->parent_id, "_thumbnail_id", true);
//		add_post_meta($postpartum_product_id, '_thumbnail_id', $attach_id);
//	}

	//Set Terms
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

	update_post_meta( $job_id, '_products', array('0'=>strval($service_product_id), '1'=>strval($postpartum_product_id)) );

	//TODO sort this out for postpartum
	wp_set_object_terms($job_id, 'postpartum_type', 'service_type', true);
	wp_set_object_terms($job_id, 'other_type', 'service_type', true);

	FWP()->indexer->index( $job_id );

	//update_post_meta( $job_id, '_products', array('0'=>strval($service_product_id)) );

}

add_action( 'job_manager_update_job_data', 'custom_update_job_data_products', 99, 2);

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


function submit_midwife_profile_steps( $steps ) {
	unset($steps['preview']);

	return $steps;
}

add_filter('submit_job_steps', 'submit_midwife_profile_steps', 10, 1);


function submit_midwife_submit_button_text( $text ) {
	$text = 'Submit';
	return $text;
}

add_filter('submit_job_form_submit_button_text', 'submit_midwife_submit_button_text', 10, 1);

function submit_midwife_valid_statuses( $statuses ) {
	unset($statuses['preview']);
	return $statuses;
}

add_filter('job_manager_valid_submit_job_statuses', 'submit_midwife_valid_statuses', 10, 1);

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

function add_edit_button() {

	global $post;
	global $current_user;

	/**if (is_active_sidebar( 'single-job_listing-widget-area' ) || 'preview' == $post->post_type ) {
		return;
	}*/
	if ($post->post_author == $current_user->ID) {
		$action_url = '/my-account/listings?action=edit&job_id='.$post->ID;
	?>
		<a href="<?php echo esc_url( $action_url ); ?>" class="single-job_listing-respond button button-secondary"><?php _e( 'Edit Profile', 'listify' ); ?></a>
	<?php
	}

}

add_action( 'listify_single_job_listing_actions_after', 'add_edit_button');

function billing_details_title( $title ) {
	$title = 'Your Details';
	return $title;
}

add_filter( 'woocommerce_billing_details_title', 'billing_details_title');

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

	$vendorid = $service_booking['data']->get_post_data()->post_author;
	$vendor_data = get_userdata((string)$vendorid);
	$vendor_name = $vendor_data->first_name." ".$vendor_data->last_name;

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

/**function our_order_review_template($located, $template_name, $args, $template_path, $default_path) {
	if ($template_name == 'checkout/review-order.php') {
		$located = wc_locate_template( 'templates/bh-order-review.php', '', '');
		if ( ! file_exists( $located ) ) {
			_doing_it_wrong( __FUNCTION__, sprintf( '<code>%s</code> does not exist.', $located ), '2.1' );
			return null;
		}
	}

	return $located;
}

add_filter( 'wc_get_template', 'our_order_review_template', 10, 5);*/

function show_order_review( $show_order_review) {
	$show_order_review = false;
	return $show_order_review;
}

add_filter( 'woocommerce_show_order_review', 'show_order_review');

function order_button_text( $text ) {
	$text = 'Book Now';
	return $text;
}

add_filter( 'woocommerce_order_button_text', 'order_button_text');

function order_received_text( $text, $order ) {
	$text = "Thank you.  Your booking has been made.  Your midwife will visit you at the time and location provided.";
	return $text;
}

add_filter( 'woocommerce_thankyou_order_received_text', 'order_received_text', 10, 2);

function order_received_display_order_details ( $display_details ) {
	$display_details = false;
	return $display_details;
}

add_filter( 'woocommerce_order_received_display_details', 'order_received_display_order_details');

function booking_details_table( $order_id ) {

	if ( ! $order_id ) return;

	wc_get_template( 'templates/booking-received.php', array(
		'order_id' => $order_id
	) );

}

remove_action( 'woocommerce_thankyou', 'woocommerce_order_details_table', 10 );
remove_action( 'woocommerce_order_details_after_order_table', 'woocommerce_order_again_button', 10 );
add_action( 'woocommerce_thankyou', 'booking_details_table', 10 );

function remove_items_from_cart() {
//TODO do this cleaner
	WC()->cart->empty_cart();
}

add_action('woocommerce_before_add_to_cart_button', 'remove_items_from_cart');

/*function add_custom_booking_template($template, $template_name, $template_path) {
	if ($template_name == 'booking-form/due-date.php') {
		$template_path = get_stylesheet_directory()
		$template = $template_path.$template;
	}

	return $template;
}

add_filter('woocommerce_locate_template', 'add_custom_booking_template', 10, 3);*/

function booking_form_main( $products ) {
	$booking_widget = Listify_Widget_Listing_Bookings::this();
	remove_action('listify_widget_job_listing_bookings', array($booking_widget,'output_bookings'), 10);
	woocommerce_get_template( 'templates/booking-form/bh_booking.php', array( 'products' => $products ), 'woocommerce-bookings', WC_BOOKINGS_TEMPLATE_PATH );
}

add_action('listify_widget_job_listing_bookings', 'booking_form_main', 5, 1);

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

function bh_add_to_cart_handler_service( $handler, $was_added_to_cart ) {
	$product_id = $_REQUEST['add-to-cart'];
	$quantity 			= empty( $_REQUEST['quantity'] ) ? 1 : wc_stock_amount( $_REQUEST['quantity'] );
	$passed_validation 	= apply_filters( 'woocommerce_add_to_cart_validation', true, $product_id, $quantity );

	if ( $passed_validation && WC()->cart->add_to_cart( $product_id, $quantity ) !== false ) {
		return true;
	}
}

add_action('woocommerce_add_to_cart_handler_service', 'bh_add_to_cart_handler_service', 10, 1);



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

function bh_get_booking_range_start($start_date, $product) {
	if (has_term('postpartum', 'bh_booking_type', $product->id)) {
		$start_date = strtotime(date('Y-m-01', $start_date));
	}

	return $start_date;
}

add_filter('woocommerce_get_bookings_in_range_start', 'bh_get_booking_range_start', 10, 2);


function bh_get_booking_range_end($end_date, $product) {
	if (has_term('postpartum', 'bh_booking_type', $product->id)) {
		$end_date = strtotime(date('Y-m-t', $end_date));
	}

	return $end_date;
}

add_filter('woocommerce_get_bookings_in_range_end', 'bh_get_booking_range_end', 10, 2);


function add_bh_facet_types($types) {
	$types['due_date'] = new BH_Due_Date_Facet();
	$types['service_type'] = new BH_Service_Type_Facet();
	return $types;
}

add_filter('facetwp_facet_types', 'add_bh_facet_types', 10, 1);


function get_proximity_radius($radius) {
	$radius = 20;
	return $radius;
}

add_filter('facetwp_proximity_radius', 'get_proximity_radius');