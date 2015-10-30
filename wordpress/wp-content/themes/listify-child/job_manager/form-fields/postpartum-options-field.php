<?php

global $wp_locale;

if ( is_admin() ) {
	global $field;
}

?>
<p>
	Allow <input type="number" class="input-number" name="postpartum_pre_weeks" id="postpartum_pre_weeks" placeholder="2" value="<?php echo isset( $field[ 'postpartum_pre_weeks' ] ) && isset( $field[ 'postpartum_pre_weeks' ] ) ? $field[ 'postpartum_pre_weeks' ] : ''; ?>" maxlength=""/>
	weeks prior to due date and <input type="number" class="input-number" name="postpartum_post_weeks" id="postpartum_post_weeks" placeholder="4" value="<?php echo isset( $field[ 'postpartum_pre_weeks' ] ) && isset( $field[ 'postpartum_post_weeks' ] ) ? $field[ 'postpartum_post_weeks' ] : ''; ?>" maxlength=""/>
	weeks after due date for each parent
</p>
<p>
	Maximum number of postpartum care families at any time:<input type="number" class="input-number" name="postpartum_max_booking" id="postpartum_max_booking" placeholder="4" value="<?php echo isset( $field[ 'postpartum_max_booking' ] ) && isset( $field[ 'postpartum_max_booking' ] ) ? $field[ 'postpartum_max_booking' ] : ''; ?>" maxlength=""/>
</p>