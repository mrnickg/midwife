<?php

/*
 * Add Disclaimer link to footer
 */
function add_disclaimer_link() {
?>

	<div class="footer-disclaimer">
		<a href="<?php echo get_home_url().'/disclaimer'; ?>"><?php _e('Disclaimer', 'babyhallo'); ?></a>
	</div>

<?php
}
add_action('listify-footer-flavour', 'add_disclaimer_link');