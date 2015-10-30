<?php extract( $field ); ?>
<p class="form-field form-field-wide <?php echo implode( ' ', $class ); ?>">
	<label for="<?php echo $name; ?>"><?php echo $label; ?>:</label>
	<input name="<?php echo $name; ?>" id="<?php echo $name; ?>" value="<?php echo $value; ?>"/>
</p>