<?php
/**
 * Home: Search Listings
 *
 * @since Listify 1.0.0
 */
class Listify_Widget_Search_Listings extends Listify_Widget {

	private $service_type_facet_name = 'service_type';
	private $postpartum_facet_name = 'postpartum_type';
	private $service_facet_name = 'other_type';
	private $title_facet_name = 'title';

	private $services_name = 'services';
	private $service_name = 'service';

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

			?>
			<div class="bh-search-container">
				<div class="bh-search-tabs">
					<ul class="tab-links">
						<li class="active"><a href="postpartum">Postpartum Care</a></li>
						<li><a href="service">Services</a></li>
						<li><a href="event">Classes</a></li>
					</ul>
				</div>
				<div class="bh-search-content active">
					<div class="row bh-search-row active">
						<?php foreach ( $_facets as $facet ) :
							$is_postpartum = apply_filters('search_widget_is_postpartum_facet', $facet);
							$is_service = apply_filters('search_widget_is_service_facet', $facet);
							$is_title = apply_filters('search_widget_is_title_facet', $facet);
							?>
							<div class="search_<?php echo $facet[ 'name' ]; ?> <?php echo $is_title ? 'col-xs-12 col-sm-8 col-md-10' : 'col-xs-12 col-sm-4 col-md-5'; ?> <?php echo $is_postpartum ? 'postpartum active' : ''; ?> <?php echo $is_service ? 'service' : ''; ?> <?php  echo $is_title ? 'title' : ''; ?>">
								<?php echo do_shortcode( '[facetwp facet="' . $facet[ 'name' ] . '"]' ); ?>
							</div>
						<?php endforeach; ?>

						<div class="facetwp-submit col-xs-12 col-sm-4 col-md-2 active postpartum service title submit_postpartum">
							<input type="submit" value="<?php _e( 'Search', 'listify' ); ?>" onclick="fwp_redirect()" />
						</div>
					</div>
					<div class="row bh-search-option">

						<div class="col-xs-12 col-sm-4 col-md-2 bh-search-option-text">
							<a class="bh-search-opt-service" href="change_search_type">or search by midwife name</a>
						</div>
					</div>
					<div style="display: none;">
						<?php echo do_shortcode( '[facetwp template="listings"]' ); ?>
					</div>


					<div class="job_search_form event" id="form_service">


					</div>

				</div>
			</div>
			<?php

			//Sevice Type Facet Config
			$service_facet = FWP()->instance()->helper->get_facet_by_name( $this->service_type_facet_name );
			$facet_helper = FWP()->instance()->helper->facet_types[$this->service_type_facet_name];
			$params = array(
				'facet' => $service_facet
			);
			$service_type_result = $facet_helper->load_values($params);
			$postpartum_facet_value = '';
			$service_facet_value = '';

			foreach ($service_type_result as $result) {
				if (isset($result['term_id']) ) {
					$term = get_term_by('id', $result['term_id'], 'service_type');
					$slug = $term->slug;
					if ($slug == $this->postpartum_facet_name) {
						$postpartum_facet_value = $result['facet_value'];
					}
					else if ($slug == $this->service_facet_name) {
						$service_facet_value = $result['facet_value'];
					}
				}
			}

			?>

			<script>
				function fwp_redirect() {
					FWP.parse_facets();
				    if ( jQuery('.facetwp-submit').hasClass('submit_title') ) {
					    if ( jQuery('.facetwp-submit').hasClass('submit_postpartum') ) {
						    FWP.facets['<?php echo $this->service_type_facet_name;  ?>'] = '<?php echo $postpartum_facet_value; ?>';
					    }
					    else if ( jQuery('.facetwp-submit').hasClass('submit_service') ) {
						    FWP.facets['<?php echo $this->service_type_facet_name;  ?>'] = '<?php echo $service_facet_value; ?>';
					    }
						delete FWP.facets['service'];
						delete FWP.facets['due_date'];
						delete FWP.facets['proximity'];
					}
					else if ( jQuery('.facetwp-submit').hasClass('submit_postpartum') ) {
						FWP.facets['<?php echo $this->service_type_facet_name;  ?>'] = '<?php echo $postpartum_facet_value; ?>';
						delete FWP.facets['service'];
						delete FWP.facets['title'];
					}
					else if ( jQuery('.facetwp-submit').hasClass('submit_service') ) {
						FWP.facets['<?php echo $this->service_type_facet_name;  ?>'] = '<?php echo $service_facet_value; ?>';
						FWP.facets['services'] = FWP.facets['service'];
						delete FWP.facets['service'];
						delete FWP.facets['due_date'];
						delete FWP.facets['title']
					}
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
