<?php

if ( ! defined( 'ABSPATH' ) ) {
	exit; // Exit if accessed directly
}

function get_response_json_for_products_cico( $booking_product_ids, $start_date, $end_date ) {
	$count	 = 0;
	$result	 = array();
	$html	 = '';
	foreach ( $booking_product_ids as $poduct_id ) {

		/**
		 * @var string $price, holds price of the product with id $poduct_id
		 */
		$price			 = get_post_meta( $poduct_id, '_price', true );
		//checks availability of the product
		$is_available	 = check_availability_cico( $poduct_id, $start_date, $end_date );
		$url			 = get_post_permalink( $poduct_id, false, false );
		$post_img_src	 = wp_get_attachment_image_src( get_post_thumbnail_id( $poduct_id ), 'large' );
		$image_src		 = empty( $post_img_src ) ? wc_placeholder_img_src() : $post_img_src[ 0 ];
		$mode			 = get_option( "mode-of-charging" );
		if ( $mode == 1 ) {
			$total_days = get_total_days( $start_date, $end_date );
		} else {
			$total_days = get_total_days( $start_date, $end_date ) - 1;
		}
		$duration = get_post_meta( $poduct_id, '_wc_booking_duration', true );
		if ( $is_available ) {
			$count ++;
			$html .= create_single_product_html( $poduct_id, $url, $image_src, $start_date, $total_days, $duration, $price );
		}
	}

	if ( $count === 0 ) {
		$result = array(
			'success'	 => 3,
			'response'	 => __( 'No bookings available for these dates', 'wdm_search' )
		);
	} else {
		$result = array(
			'success'		 => 1,
			'product_count'	 => $count,
			'response'		 => $html
		);
	}
	return $result;
}

function create_single_product_html( $poduct_id, $url, $image_src, $start_date, $total_days, $duration, $price ) {
	ob_start();
	require( WDM_BOOKING_SEARCH_TEMPLATE_PATH . 'public/wdm-single-product.php');
	$html		 = ob_get_clean();
	$html_new	 = apply_filters( 'wdm_single_product_html', $html, $poduct_id, $url, $price );
	return $html_new;
}

/**
 * get all bookable product of specified categories in DESC order of their post_modified time
 * 
 * @param string $wdm_categories_rqd , list of comma separated categories strings for which the search needs to be done.
 * @return array $result, the ids of the products of the specified categories.
 */
function get_all_booking_products( $wdm_categories_rqd ) {

	/**
	 * @var array $wdm_categories holds the array after exploding the comma separated categories 
	 */
	$wdm_categories = explode( ",", $wdm_categories_rqd );

	/**
	 * this condition will be true if the category is not specified or else if the
	 * category passed is not of the expected format
	 */
	if ( $wdm_categories == array( WDM_SHOW_ALL ) ) {
		$args = array(
			'posts_per_page' => -1,
			'fields'		 => 'ids',
			'tax_query'		 => array(
				'taxonomy'	 => 'product_type',
				'field'		 => 'name',
				'terms'		 => 'booking'
			),
			'post_type'		 => 'product',
			'orderby'		 => 'title'
		);
	} else {
		$args = array(
			'posts_per_page' => -1,
			'fields'		 => 'ids',
			'tax_query'		 => array(
				'relation' => 'AND',
				array(
					'taxonomy'	 => 'product_type',
					'field'		 => 'name',
					'terms'		 => 'booking'
				),
				array(
					'taxonomy'	 => 'product_cat',
					'field'		 => 'slug',
					'relation'	 => 'OR',
					'terms'		 => $wdm_categories
				)
			),
			'post_type'		 => 'product',
			'orderby'		 => 'title'
		);
	}
	$products	 = new WP_Query( $args );
	$post_ids	 = $products->posts;
	return $post_ids;
}

//availability checkin check out function ,only works with customer specific 
function check_availability_cico( $prod_id, $start_date, $end_date, $qty = 1 ) {
	$product_obj = wc_get_product( $prod_id );
	if ( $product_obj->product_type === 'booking' ) {

		$duration_type	 = get_post_meta( $prod_id, '_wc_booking_duration_type', true );
		$unit_type		 = get_post_meta( $prod_id, '_wc_booking_duration_unit', true );
		$duration		 = get_post_meta( $prod_id, '_wc_booking_duration', true );
		$min_duration	 = get_post_meta( $prod_id, '_wc_booking_min_duration', true );
		$max_duration	 = get_post_meta( $prod_id, '_wc_booking_max_duration', true );
		$min_days		 = $min_duration * $duration;
		$max_days		 = $max_duration * $duration;
		$mode			 = get_option( "mode-of-charging" );
		if ( $mode == 1 ) {
			$total_days = get_total_days( $start_date, $end_date );
		} else {
			$total_days = get_total_days( $start_date, $end_date ) - 1;
		}
		
		//$duration_type != 'customer' || 
		//if ( $unit_type != 'day' && $unit_type!= 'hour' && $unit_type!='minute' ) {
		//	return false;
		//} else
		//echo '**'.$prod_id;
		//echo '*'.$total_days;
		//echo '*'.$min_days;
		//echo '*'.$max_days;
		//echo '*'.$duration;
			if($duration_type!=fixed)
			if ( $total_days < $min_days || $total_days > $max_days || $total_days % $duration != 0 ) {
			return false;
		}
		$start_date		 = strtotime( "$start_date 00:00" );
		$end_date		 = strtotime( "$end_date 23:59" );
		$availability	 = $product_obj->get_available_bookings( $start_date, $end_date, 0, $qty );
		$avb_var_type	 = gettype( $availability );


		if ( is_wp_error( $availability ) ) {
			return false;
		} elseif ( ! $availability ) {
			return false;
		} elseif ( $availability >= 1 && $avb_var_type == 'integer' ) {
			return true;
		} elseif ( ! empty( $availability ) && $avb_var_type == 'array' && sizeof( $availability ) > 0 ) {
			return true;
		} else {
			return false;
		}
	}
	return false;
}

function get_total_days( $start_date, $end_date ) {
	$date1	 = date_create( $start_date );
	$date2	 = date_create( $end_date );
	$diff	 = date_diff( $date1, $date2 );
	$tot	 = $diff->format( "%a" ) + 1;
	return $tot;
}
