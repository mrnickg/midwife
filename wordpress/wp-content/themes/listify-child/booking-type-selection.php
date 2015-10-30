<?php 
$services = reset(get_post_meta($post->ID, '_bh_services'));
?>
<p class="form-field form-field-wide">
	<label for="type">Type:</label>
	<select name="booking_type" id="booking_type">
		<?php foreach ( $services as $key => $value ) : ?>
			<option value="<?php echo $key; ?>"><?php echo get_term($value, 'service')->name; ?></option>
		<?php endforeach; ?>
	</select>
</p>