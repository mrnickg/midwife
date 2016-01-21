<?php
/**
 * Template Name: Landing
 *
 */

get_header();

if (has_post_thumbnail( $post->ID )) :
	$image = wp_get_attachment_image_src( get_post_thumbnail_id( $post->ID ), 'single-post-thumbnail' );
?>

	<div class="landing-cover">
		<div class="landing-block-container col-xs12 col-sm-12 col-md-12" >
			<div class="landing-block col-xs12 col-sm-12 col-md-12" id="tag">
				<p>HELPING PARENTS FIND MIDWIVES - A NEW SERVICE LAUNCHING IN SPRING 2016</p>
			</div>
		</div>
		<div class="landing-block-container col-xs12 col-sm-12 col-md-12" >
			<div class="landing-block col-xs12 col-sm-12 col-md-12" id="action">
				<div class="landing-block-item-container col-xs-12 col-sm-6 col-md-6">
					<div class="landing-block-item" id="parent">
						<p class="landing-block-item-title">PARENTS</p>
						<ul>
							<li>Search for qualified local midwives</li>
							<li>Register with your midwife for Postpartum Care</li>
							<li>Book appointments directly</li>
						</ul>
						<p class="landing-block-item-subscribe">
							<?php echo do_shortcode('[mc4wp_form id="572"]'); ?>
						</p>
					</div>
				</div>
				<div class="landing-block-item-container col-xs-12 col-sm-6 col-md-6">
					<div class="landing-block-item" id="midwife">
						<p class="landing-block-item-title">MIDWIVES</p>
						<ul>
							<li>Create an online profile</li>
							<li>Accept automated booking requests and notifications</li>
							<li>Manage your appointment Calendar</li>
						</ul>
						<p class="landing-block-item-subscribe">
							<?php echo do_shortcode('[mc4wp_form id="578"]'); ?>
						</p>
					</div>
				</div>

			</div>
		</div>
		<div class="landing-block-container col-xs12 col-sm-12 col-md-12">
			<div class="landing-block col-xs12 col-sm-12 col-md-12">
				<div class="landing-block-item-container col-xs12 col-sm-12 col-md-12">
					<div class="landing-block-item has-image">
						<img src="<?php echo get_home_url().'/wp-content/uploads/2016/01/babyhallo_landing_cover.jpg'; ?>"/>
					</div>
				</div>
			</div>
		</div>
		<div class="landing-block-container col-xs12 col-sm-12 col-md-12" >
			<div class="landing-block col-xs12 col-sm-12 col-md-12" id="blog">
				<?php echo do_shortcode('[rpwe limit="5" excerpt="true" length="10000"]'); ?>
			</div>
		</div>
	</div>

<?php
endif;

get_footer();