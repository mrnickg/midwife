<?php
/**
 * Template Name: Landing
 *
 */

get_header();

if (has_post_thumbnail( $post->ID )) :
	$image = wp_get_attachment_image_src( get_post_thumbnail_id( $post->ID ), 'single-post-thumbnail' );
?>

	<div class="bh-cover container">
		<div class="landing-block-container col-xs12 col-sm-12 col-md-12" >
			<div class="landing-block col-xs12 col-sm-12 col-md-12" id="tag">
				<p><?php _e('CONNECTING PARENTS AND MIDWIVES', 'babyhallo'); ?></p>
			</div>
		</div>
		<div class="landing-block-container col-xs12 col-sm-12 col-md-12" >
			<div class="landing-block col-xs12 col-sm-12 col-md-12" id="action">
				<div class="landing-block-item-container col-xs-12 col-sm-6 col-md-6">
					<div class="landing-block-item" id="parent">
						<div class="landing-block-item-title"><?php _e('PARENTS', 'babyhallo'); ?></div>
						<ul>
							<li><?php _e('Looking for postnatal care, lactation consultation, mother baby courses and more?', 'babyhallo'); ?></li>
							<li><span class="logo_baby">baby</span><span class="logo_hallo">hallo</span> <?php _e('is the simplest way to find your perfect midwife!', 'babyhallo'); ?></li>
						</ul>
						<ul class="aligned">
							<li><?php _e('<b>Search</b> for local midwives', 'babyhallo'); ?></li>
							<li><?php _e('<b>Browse</b> midwife profiles to learn about their experience and qualifications', 'babyhallo'); ?></li>
							<li><?php _e('<b>Read</b> reviews written by other parents', 'babyhallo'); ?></li>
							<li><?php _e('<b>Contact</b> midwives directly', 'babyhallo'); ?></li>
							<li><?php _e('<b>Book</b> appointments with one click', 'babyhallo'); ?></li>
						</ul>
						<div class="buffer"></div>
						<div class="landing-block-item-subscribe">
							<?php echo do_shortcode('[mc4wp_form id="572"]'); ?>
						</div>
					</div>
				</div>
				<div class="landing-block-item-container col-xs-12 col-sm-6 col-md-6">
					<div class="landing-block-item" id="midwife">
						<div class="landing-block-item-title"><?php _e('MIDWIVES', 'babyhallo'); ?></div>
						<ul>
							<li><?php _e('Do you need help managing your busy schedule and building an online presence?', 'babyhallo'); ?></li>
							<li><span class="logo_baby">baby</span><span class="logo_hallo">hallo</span> <?php _e('is the digital assistant for your midwifery business!', 'babyhallo'); ?></li>
						</ul>
						<ul class="aligned">
							<li><?php _e('<b>Create</b> your profile page as if it were your own website', 'babyhallo'); ?></li>
							<li><?php _e('<b>Advertise</b> your services and classes', 'babyhallo'); ?></li>
							<li><?php _e('<b>Manage</b> your availability and appointments automatically', 'babyhallo'); ?></li>
							<li><?php _e('<b>Receive</b> email and SMS notifications about upcoming activities', 'babyhallo'); ?></li>
							<li><?php _e('<b>Receive</b> monthly summaries about your business activities', 'babyhallo'); ?></li>
						</ul>
						<div class="landing-block-item-subscribe">
							<?php echo do_shortcode('[mc4wp_form id="578"]'); ?>
						</div>
					</div>
				</div>

			</div>
		</div>
		<div class="landing-block-container col-xs12 col-sm-12 col-md-12">
			<div class="landing-block col-xs12 col-sm-12 col-md-12">
				<div class="landing-block-item-container col-xs12 col-sm-12 col-md-12">
					<div class="landing-block-item has-image">
						<img src="<?php echo $image[0]; ?>"/>
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