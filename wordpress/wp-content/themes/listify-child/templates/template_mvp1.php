<?php
/**
 * Template Name: MVP1
 *
 */

get_header();

if (has_post_thumbnail( $post->ID )) :
	$image = wp_get_attachment_image_src( get_post_thumbnail_id( $post->ID ), 'single-post-thumbnail' );
	?>

	<p class="hidden"><?php _e("Midwife Frankfurt Search and Book.", "babyhallo"); ?></p>

	<div class="bh-banner-container container">
		<div style="background-image: url(<?php echo $image[0]; ?>);" class="banner-image">
			<div class="bh-block-container col-xs12 col-sm-12 col-md-12" >
				<div class="bh-block col-xs12 col-sm-12 col-md-12">
					<div class="bh-content-container col-xs-12 col-sm-12 col-md-12">
						<div class="bh-content no-box">
							<div class="banner-title blue"><?php _e('Welcome to', 'babyhallo'); ?></div>
							<div class="banner-title blue"><?php _e('BABYHALLO', 'babyhallo'); ?></div>
							<br/>
							<br/>
							<h1 class="banner-sub-title"><?php _e('Find and book a Midwife in Frankfurt', 'babyhallo'); ?></h1>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="bh-cover container">
		<div class="bh-block-container col-xs12 col-sm-12 col-md-12" >
			<div class="bh-block col-xs12 col-sm-12 col-md-12">
				<div class="bh-content-container col-xs-12 col-sm-12 col-md-12">
					<div class="bh-content no-box">
						<h1><?php _e('HOW IT WORKS', 'babyhallo'); ?></h1>
						<ul class="horizontal">
							<li>
								<div class="bh-content-container">
									<ul class="vertical">
										<li>
											<div class="bh-content no-box">
												<img alt="<?php _e('Midwife Frankfurt details', "babyhallo"); ?>" src="<?php echo get_home_url().'/wp-content/uploads/how_it_works_form.jpg'; ?>"/>
											</div>
										</li>
										<li>
											<div class="bh-content no-box max-width-160">
												<p><?php _e('You tell us what you need from your Midwife', 'babyhallo'); ?></p>
											</div>
										</li>
									</ul>
								</div>
							</li>
							<li>
								<div class="bh-content-container">
									<ul class="vertical">
										<li>
											<div class="bh-content no-box">
												<img alt="<?php _e('Midwife Frankfurt search', "babyhallo"); ?>" src="<?php echo get_home_url().'/wp-content/uploads/how_it_works_search.jpg'; ?>"/>
											</div>
										</li>
										<li>
											<div class="bh-content no-box max-width-160">
												<p><?php _e('We search for local Midwives that fit your needs', 'babyhallo'); ?></p>
											</div>
										</li>
									</ul>
								</div>
							</li>
							<li>
								<div class="bh-content-container">
									<ul class="vertical">
										<li>
											<div class="bh-content no-box">
												<img alt="<?php _e('Midwife Frankfurt choose', "babyhallo"); ?>" src="<?php echo get_home_url().'/wp-content/uploads/how_it_works_tick.jpg'; ?>"/>
											</div>
										</li>
										<li>
											<div class="bh-content no-box max-width-160">
												<p><?php _e('We send you a shortlist of the best profiles and you pick the Midwife that you prefer', 'babyhallo'); ?></p>
											</div>
										</li>
									</ul>
								</div>
							</li>
							<li>
								<div class="bh-content-container">
									<ul class="vertical">
										<li>
											<div class="bh-content no-box">
												<img alt="<?php _e('Midwife Frankfurt book', "babyhallo"); ?>" src="<?php echo get_home_url().'/wp-content/uploads/how_it_works_cal.jpg'; ?>"/>
											</div>
										</li>
										<li>
											<div class="bh-content no-box max-width-160">
												<p><?php _e('We register you for Postpartum Care and book your initial appointment', 'babyhallo'); ?></p>
											</div>
										</li>
									</ul>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<div class="bh-content-container col-xs-12 col-sm-12 col-md-12">
					<div class="bh-content no-box">
						<h1><?php _e('WHAT IT COSTS', 'babyhallo'); ?></h1>
						<ul class="horizontal">
							<li>
								<div class="bh-content-container">
									<div class="bh-content no-box">
										<p class="huge">10€</p>
									</div>
								</div>
							</li>
							<li>
								<div class="horizontal-padding-2"/>
							</li>
							<li>
								<div class="bh-content-container">
									<div class="bh-content no-box align-left">
										<ul class="vertical bullet max-width-320">
											<li>
												<div class="vertical-padding"/>
											</li>
											<li>
												<p><?php _e('No payment upfront.  You pay if you wish to see the shortlist of Midwives we have selected', 'babyhallo'); ?></p>
											</li>
											<li>
												<p><?php _e('We will immediately refund the full amount with no questions asked if you are unsatisfied with our selection', 'babyhallo'); ?></p>
											</li>
										</ul>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<div class="bh-content-container col-xs-12 col-sm-12 col-md-12">
					<div class="bh-content align-left">
						<h1><?php _e('LET US FIND YOU A MIDWIFE TODAY', 'babyhallo'); ?></h1>
						<p><?php _e('Fill in your details below and we will get back to you within 10 days with your shortlist of personally selected Midwives.', 'babyhallo'); ?></p>
						<?php echo do_shortcode('[mc4wp_form id="597"]'); ?>
					</div>
				</div>

			</div>
		</div>

		<div class="bh-block-container col-xs12 col-sm-12 col-md-12" >
			<div class="bh-block col-xs12 col-sm-12 col-md-12">
				<?php echo do_shortcode('[rpwe limit="5" excerpt="true" length="10000"]'); ?>
			</div>
		</div>
	</div>

	<?php
endif;

get_footer();