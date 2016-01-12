<?php


if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

$order = wc_get_order( $order_id );
$postpartum_item = null;
$service_item = null;

$order_items = $order->get_items();

foreach( $order_items as $item) {
	if ($item['name'] === 'Postpartum Care') {
		$postpartum_item = $item;
	}
	else {
		$service_item = $item;
	}
}

if ($postpartum_item) {
	$product = $order->get_product_from_item($postpartum_item);
	$midwifeid = $product->get_post_data()->post_author;
	$midwife_data = get_userdata((string)$midwifeid);
	$midwife_name = $midwife_data->first_name." ".$midwife_data->last_name;
	$due_date = $postpartum_item['item_meta']['Booking Date'][0];
?>
<h2><?php _e( 'Postpartum Care Details', 'babyhallo' ); ?></h2>
<p><?php printf(
		_e('You are now booked for Postpartum Care with %1$s with an expected due date of %2$s', 'babyhallo'), $midwife_name, $due_date
);
?>
</P>
<?php
}
?>

<h2><?php _e( 'Appointment Details', 'babyhallo' ); ?></h2>
<?php
		$order->display_item_meta( $service_item );
?>

<?php wc_get_template( 'templates/midwife-details.php', array( 'order' => $order, 'booking' => $service_item ) ); ?>

<?php wc_get_template( 'templates/customer-details.php', array( 'order' => $order, 'booking' => $service_item ) ); ?>
	