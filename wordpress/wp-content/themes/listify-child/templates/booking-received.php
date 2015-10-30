<?php


if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

$order = wc_get_order( $order_id );
$order_item = reset($order->get_items());

?>
<h2><?php _e( 'Appointment Details', 'woocommerce' ); ?></h2>
<?php
		$order->display_item_meta( $order_item );
?>

<?php wc_get_template( 'templates/midwife-details.php', array( 'order' => $order, 'booking' => $order_item ) ); ?>

<?php wc_get_template( 'templates/customer-details.php', array( 'order' => $order, 'booking' => $order_item ) ); ?>
	