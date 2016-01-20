<?php
/**
 * Template Name: Landing
 *
 */

get_header();

if (has_post_thumbnail( $post->ID )) :
	$image = wp_get_attachment_image_src( get_post_thumbnail_id( $post->ID ), 'single-post-thumbnail' );
?>

	<div style="background-image: url('<?php echo $image[0]; ?>')"
	     class="landing-cover homepage-cover page-cover entry-cover has-image">
		<div class="cover-wrapper container landing-container">
			<div class="landing-tag">
				Helping parents find midwives - a new service launching in Spring 2016
			</div>
			<div class="landing-brief">
				<p><span class="landing-brief-bold">Are you a parent?</span></p>
				<p>Are you looking for a midwife to help you through pregnancy and your infant's first months?</p>
				<p>At babyhallo we can help.  With us, you will be able to search for qualified local midwives and book services with them directly, without ever needing to pick up the phone or write an email.</p>
				<p>If you are interested in hearing more about our service and our progress towards launch then please fill in your email address below.</p>
				<p>
				<?php echo do_shortcode('[mc4wp_form id="572"]'); ?>
				</p>
			</div>
			<div class="landing-brief">
				<p><span class="landing-brief-bold">Are you a midwife?</span></p>
				<p>Do you want help to manage your business and grow an online presence?</p>
				<p>If so then babyhallo may be the service for you.  Please fill in your email below and we will contact you with details of how you can join our family and start growing your business today!</p>
				<?php echo do_shortcode('[mc4wp_form id="578"]'); ?>
			</div>
		</div>
		<div class="cover-wrapper container landing-container posts-container">
			<?php echo do_shortcode('[rpwe limit="5" excerpt="true" length="10000"]'); ?>
		</div>
	</div>

<?php
endif;

get_footer();