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
<h2><?php _e( 'Postpartum Care Details', 'woocommerce' ); ?></h2>
<p>You are now booked for Postpartum Care with <?php echo $midwife_name; ?> with an expected due date of <?php echo $due_date;  ?> </p>
<?php
}
?>

<h2><?php _e( 'Appointment Details', 'woocommerce' ); ?></h2>
<?php
		$order->display_item_meta( $service_item );
?>

<?php wc_get_template( 'templates/midwife-details.php', array( 'order' => $order, 'booking' => $service_item ) ); ?>

<?php wc_get_template( 'templates/customer-details.php', array( 'order' => $order, 'booking' => $service_item ) ); ?>
	