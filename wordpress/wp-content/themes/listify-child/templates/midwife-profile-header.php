<div class="midwife-meta-wrapper">
	<?php
	$txt = get_avatar(get_the_author_meta( 'ID' ), 167, 'mystery');
	$txt = str_replace('class="', 'class="midwife-meta-image ', $txt);
	echo $txt;
	?>
	<div class="midwife-meta-inner-wrapper">
		<div class="midwife-meta-text-wrapper">
			<span>
				<h1><?php the_title(); ?></h1>
				<?php do_action('single_job_listing_meta_location'); ?>
				<?php
					$rating = new Listify_Rating_Listing( array(
						'object_id' => get_post()->ID
					) );
				?>
				<div itemprop="aggregateRating" itemscope itemtype="http://schema.org/AggregateRating" class="rating-<?php echo floor(
					$rating->output() ); ?> job_listing-rating-wrapper midwife-meta-rating" title="<?php printf( '%d Reviews', $rating->count() ); ?>">
					<span class="job_listing-rating-stars">
						<?php echo $rating->stars(); ?>
					</span>

					<span class="job_listing-rating-average">
						<span itemprop="ratingValue"><?php echo $rating->output(); ?></span>
					</span>
					<span class="job_listing-rating-count">
						<?php printf( _n( '<span itemprop="reviewCount">%d</span> Review', '<span itemprop="reviewCount">%d</span> Reviews', $rating->count(), 'listify' ), $rating->count() ); ?>
					</span>
				</div>
			</span>
		</div>
	</div>
</div>