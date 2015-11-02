<?php

global $wp_locale;

if ( is_admin() ) {
	global $field;
}

?>
<div class="field optional-field">
	Allow <input type="number" class="input-number" name="postpartum[pre_weeks]" id="postpartum[pre_weeks]" value="<?php echo isset( $field['postpartum']['pre_weeks'] ) ? $field['postpartum']['pre_weeks'] : '2'; ?>" maxlength="1"/>
	weeks prior to due date and <input type="number" class="input-number" name="postpartum[post_weeks]" id="postpartum[post_weeks]" value="<?php echo isset( $field['postpartum']['post_weeks'] ) ? $field['postpartum']['post_weeks'] : '4'; ?>" maxlength="1"/>
	weeks after due date for each parent
</div>
<div class="field optional-field">
	Maximum number of postpartum care families at any time:<input type="number" class="input-number" name="postpartum[max_booking]" id="postpartum[max_booking]" value="<?php echo isset( $field['postpartum']['max_booking'] ) ? $field['postpartum']['max_booking'] : '4'; ?>" maxlength="2"/>
</div>