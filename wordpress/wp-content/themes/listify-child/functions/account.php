<?php


/**
 * Login - Allows login by email by fetching the user from the database using their email address
 */
function internet_allow_email_login( $user, $username, $password ) {
	if ( is_email( $username ) ) {
		$user = get_user_by_email( $username );
		if ( $user ) {
			$username = $user->user_login;
		}
	}
	return wp_authenticate_username_password( null, $username, $password );
}

add_filter('authenticate', 'internet_allow_email_login', 20, 3);


/*
 * Register - Adds an additional radio check for Midwife or Parent
 */
function wooc_extra_register_fields() {
	?>
	<p class="form-row form-row-wide">
		<label for="reg_user_role"><?php _e( 'I am a...', 'babyhallo' ); ?> <span class="required">*</span></label>
		<input type="radio" name="role" id="role" value="customer" checked="checked"><?php _e('Parent', 'babyhallo'); ?><br/>
		<input type="radio" name="role" id="role" value="midwife"><?php _e('Midwife', 'babyhallo'); ?>
	</p>

	<?php
}

add_action( 'woocommerce_register_form_start', 'wooc_extra_register_fields' );


/**
 * Register - Adds additional First Name and Last Name fields to the registration form
 */
function wooc_extra_register_fields_after() {
	?>
	<p class="form-row form-row-wide">
		<label for="reg_first_name" class="midwife"><?php _e( 'First Name', 'babyhallo' ); ?> <span class="required">*</span></label>
		<input type="text" class="input-text midwife" name="first_name" id="first_name" value="<?php if ( ! empty( $_POST['first_name'] ) ) echo esc_attr( $_POST['first_name'] ); ?>" />
	</p>
	<p class="form-row form-row-wide">
		<label for="reg_last_name" class="midwife"><?php _e( 'Last Name', 'babyhallo' ); ?> <span class="required">*</span></label>
		<input type="text" class="input-text midwife" name="last_name" id="last_name" value="<?php if ( ! empty( $_POST['last_name'] ) ) echo esc_attr( $_POST['last_name'] ); ?>" />
	</p>
	<?php
}

add_action( 'woocommerce_register_form', 'wooc_extra_register_fields_after');


/**
 * Register - Validates the additional registration fields
 */
function wooc_validate_extra_register_fields( $username, $email, $validation_errors ) {
	if ( isset( $_POST['role'] ) && empty( $_POST['role'] ) ) {
		$validation_errors->add( 'roles_error', __( 'Please select Parent or Midwife', 'babyhallo' ) );
	}
	if ( isset( $_POST['first_name'] ) && empty( $_POST['first_name'] ) ) {
		$validation_errors->add( 'first_name_error', __( 'Please enter your first name', 'babyhallo' ) );
	}
	if ( isset( $_POST['last_name'] ) && empty( $_POST['last_name'] ) ) {
		$validation_errors->add( 'last_name_error', __( 'Please enter your last name', 'babyhallo' ) );
	}

}

add_action( 'woocommerce_register_post', 'wooc_validate_extra_register_fields', 10, 3 );


/**
 * Register - Adds the new registration fields to the customer data
 */
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


/**
 * Register - Saves the new registration fields
 */
function wooc_save_extra_register_fields( $customer_id ) {
	if ( isset( $_POST['role'] ) ) {
		update_user_meta( $customer_id, 'role', sanitize_text_field( $_POST['role'] ) );
	}
	//TODO: Update FIrst Name and Last Name on customer
}

add_action( 'woocommerce_created_customer', 'wooc_save_extra_register_fields' );


/**
 * Register - Creates a new Product Vendor on Midwife registration.
 * THis vendor will be associated with the Midwife's Booking Products when a Profile is created
 */
function wc_create_vendor_on_registration( $customer_id, $new_customer_data ) {
	if ( $new_customer_data['role'] === 'midwife') {

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
				'description' => $username,
				'slug'        => sanitize_title( $username )
			)
		);

		if ( is_wp_error( $return ) ) {
			wc_add_notice( __( '<strong>ERROR</strong>: Unable to create the vendor account for this user. Please contact the administrator to register your account.', 'babyhallo' ), 'error' );
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