<?php
/**
 * Home: Search Listings
 *
 * @since Listify 1.0.0
 */
class Listify_Widget_Search_Listings extends Listify_Widget {

	private $service_type_facet_name = 'service_type';
	private $postpartum_facet_display = 'Postpartum Care';

	/**
	 * Constructor
	 */
	public function __construct() {
		global $listify_facetwp;

		$this->widget_description = __( 'Display a search form to search listings', 'listify' );
		$this->widget_id          = 'listify_widget_search_listings';
		$this->widget_name        = __( 'Listify - Page: Search Listings', 'listify' );
		$this->settings           = array(
			'title' => array(
				'type'  => 'text',
				'std'   => '',
				'label' => __( 'Title:', 'listify' )
			),
			'description' => array(
				'type'  => 'text',
				'std'   => '',
				'label' => __( 'Description:', 'listify' )
			)
		);

		if ( listify_has_integration( 'facetwp' ) ) {
			$this->settings[ 'facets' ] = array(
				'type'  => 'text',
				'std'   => listify_theme_mod( 'listing-archive-facetwp-defaults' ),
				'label' => __( 'Facets:', 'listify' )
			);
		}

		parent::__construct();

		add_filter( 'facetwp_load_assets', '__return_true' );
	}

	/**
	 * widget function.
	 *
	 * @see WP_Widget
	 * @access public
	 * @param array $args
	 * @param array $instance
	 * @return void
	 */
	function widget( $args, $instance ) {
		if ( $this->get_cached_widget( $args ) )
			return;

		extract( $args );

		$title = apply_filters( 'widget_title', $instance[ 'title' ], $instance, $this->id_base );
		$description = isset( $instance[ 'description' ] ) ? esc_attr( $instance[ 'description' ] ) : false;

		$after_title = '<h2 class="home-widget-description">' . $description . '</h2>' . $after_title;

		ob_start();

		echo $before_widget;

		if ( $title ) echo $before_title . $title . $after_title;

		if ( listify_has_integration( 'facetwp' ) ) {
			global $listify_facetwp;

			$facets = isset( $instance[ 'facets' ] ) ? array_map( 'trim', explode( ',', $instance[ 'facets' ] ) ) : listify_theme_mod( 'listing-archive-facetwp-defaults' );
			$_facets = $listify_facetwp->get_homepage_facets( $facets );

			$count  = count( $_facets );
			$column = ( 0 == $count ) ? 12 : round( 12 / $count );

			if ( $count > 4 ) {
				$column = 4;
			}

			$done = 0;

			?>
			<div class="tabs">
				<ul class="tab-links">
					<li class="active"><a href="#form_postpartum">Postpartum Care</a></li>
					<li><a href="#form_service">Services</a></li>
					<li><a href="#form_class">Classes</a></li>
				</ul>
			</div>
			<div>
				<div class="job_search_form tab active" id="form_postpartum">
					<div class="row">
						<?php foreach ( $_facets as $facet ) : ?>
						<?php if ( $count > 4 && $done == 3 ) : ?>
					</div><div class="row">
						<?php endif; ?>

						<div class="search_<?php echo $facet[ 'name' ]; ?> col-xs-12 col-sm-4 col-md-<?php echo $column; ?>">
							<?php echo do_shortcode( '[facetwp facet="' . $facet[ 'name' ] . '"]' ); ?>
						</div>
						<?php $done++; endforeach; ?>
					</div>

					<div class="facetwp-submit row">
						<div class="col-xs-12">
							<input type="submit" value="<?php _e( 'Search', 'listify' ); ?>" onclick="fwp_redirect()" />
						</div>
					</div>

					<div style="display: none;">
						<?php echo do_shortcode( '[facetwp template="listings"]' ); ?>
					</div>

				</div>

				<div class="job_search_form tab" id="form_service">


				</div>

				<div class="job_search_form tab" id="form_class">
					<div class="row">
						<?php foreach ( $_facets as $facet ) : ?>
						<?php if ( $count > 4 && $done == 3 ) : ?>
					</div><div class="row">
						<?php endif; ?>

						<div class="search_<?php echo $facet[ 'name' ]; ?> col-xs-12 col-sm-4 col-md-<?php echo $column; ?>">
							<?php echo do_shortcode( '[facetwp facet="' . $facet[ 'name' ] . '"]' ); ?>
						</div>
						<?php $done++; endforeach; ?>
					</div>

					<div class="facetwp-submit row">
						<div class="col-xs-12">
							<input type="submit" value="<?php _e( 'Search', 'listify' ); ?>" onclick="fwp_redirect()" />
						</div>
					</div>

					<div style="display: none;">
						<?php echo do_shortcode( '[facetwp template="listings"]' ); ?>
					</div>

				</div>

			</div>

			<?php

			$service_facet = FWP()->instance()->helper->get_facet_by_name( $this->service_type_facet_name );
			$facet_helper = FWP()->instance()->helper->facet_types['service_type'];
			$params = array(
				'facet' => $service_facet
			);
			$service_type_result = $facet_helper->load_values($params);
			$facet_value = '';

			foreach ($service_type_result as $result) {
				if (isset($result['facet_display_value']) && $result['facet_display_value'] == $this->postpartum_facet_display ) {
					$facet_value = $result['facet_value'];
					break;
				}
			}

			?>

			<script>
				function fwp_redirect() {
					FWP.parse_facets();
					FWP.facets['<?php echo $this->service_type_facet_name;  ?>'] = '<?php echo $facet_value; ?>';
					if ('get' == FWP.permalink_type) {
						var query_string = FWP.build_query_string();
						if ('' != query_string) {
							query_string = '?' + query_string;
						}
						var url = query_string;
					}
					else {
						var url = window.location.hash;
					}
					window.location.href = '<?php echo get_post_type_archive_link( 'job_listing' ); ?>' + url;
				}
			</script>
			<?php
		} else {
			locate_template( array( 'job-filters-flat.php', 'job-filters.php'), true, false );
		}

		echo $after_widget;

		$content = ob_get_clean();

		echo apply_filters( $this->widget_id, $content );

		$this->cache_widget( $args, $content );
	}
}
