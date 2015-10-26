<?php

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}
?>
<header><h2><?php _e( 'Midwife Details', 'woocommerce' ); ?></h2></header>

<?php
	$product = $order->get_product_from_item($booking);
	$midwifeid = $product->get_post_data()->post_author;
	$midwife_data = get_userdata((string)$midwifeid);
	$midwife_name = $midwife_data->first_name." ".$midwife_data->last_name;
?>

<table class="shop_table shop_table_responsive customer_details">
	<?php if ( $midwife_name ) : ?>
		<tr>
			<th><?php _e( 'Name:', 'woocommerce' ); ?></th>
			<td><?php echo esc_html( $midwife_name ); ?></td>
		</tr>
	<?php endif; ?>

	<?php if ( $midwife_data->user_email ) : ?>
		<tr>
			<th><?php _e( 'Email:', 'woocommerce' ); ?></th>
			<td><?php echo esc_html( $midwife_data->user_email ); ?></td>
		</tr>
	<?php endif; ?>
</table>
