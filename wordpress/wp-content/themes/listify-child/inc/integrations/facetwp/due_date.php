<?php

class BH_Due_Date_Facet {

	function __construct() {
		$this->label = __( 'Due Date', 'fwp' );

		add_filter( 'facetwp_index_row', array( $this, 'index_row' ), 5, 2 );
	}


	/**
	 * Generate the facet HTML
	 */
	function render( $params ) {

		$value = $params['selected_values'];

		$output = '<input type="text" class="facetwp-date facetwp-date-min" value="' . $value[0] . '" placeholder="' . __( 'Due Date', 'fwp' ) . '" />';

		return $output;
	}


	/**
	 * Filter the query based on selected values
	 */
	function filter_posts( $params ) {

		$available_ids = array();
		$date  = $params['selected_values'];

		$start_date = strtotime( date( 'Y-m-1', strtotime( $date[0] ) ) );
		$end_date   = date( 'Y-m-t', strtotime( $date[0] ) );
		$end_date   = strtotime( "$end_date 23:59" );

		$all_products = $this->get_all_postpartum_products();

		foreach ($all_products as $val) {
			$product = wc_get_product( $val->ID );
			$bookings = $product->get_bookings_in_date_range($start_date, $end_date);
			$qty = $product->get_qty();
			if (count($bookings) < $qty) {
				$vendors = get_product_vendors($val->ID);
				foreach ($vendors as $vendor) {
					$userid = $vendor->admins[0]->ID;
					$args = array(
						'posts_per_page'   => 1,
						'post_type'        => 'job_listing',
						'author'	       => $userid,
						'post_status'      => 'publish'
					);
					$vendorpage = reset(get_posts($args));
					$available_ids[] = $vendorpage->ID;
				}
			}
		}

		return $available_ids;
	}


	/**
	 * Output any admin scripts
	 */
	function admin_scripts() {

		?>
		<script>
			(function($) {
				wp.hooks.addAction('facetwp/load/due_date', function($this, obj) {
					$this.find('.facet-source').val(obj.source);
				});

				wp.hooks.addFilter('facetwp/save/due_date', function($this, obj) {
					obj['source'] = $this.find('.facet-source').val();
					obj['fields'] = $this.find('.facet-date-fields').val();
					return obj;
				});
			})(jQuery);
		</script>
		<?php

	}


	/**
	 * Output any front-end scripts
	 */
	function front_scripts() {
		?>
		<link
			href="<?php echo FACETWP_URL; ?>/assets/js/bootstrap-datepicker/datepicker.css?ver=<?php echo FACETWP_VERSION; ?>"
			rel="stylesheet">
		<script
			src="<?php echo FACETWP_URL; ?>/assets/js/bootstrap-datepicker/bootstrap-datepicker.js?ver=<?php echo FACETWP_VERSION; ?>"></script>
		<script>
			(function ($) {
				wp.hooks.addAction('facetwp/refresh/due_date', function ($this, facet_name) {
					var date = $this.find('.facetwp-date-min').val() || '';
					FWP.facets[facet_name] = ('' != date ) ? [date] : [];
				});

				wp.hooks.addFilter('facetwp/selections/due_date', function (output, params) {
					return params.selected_values[0];
				});

				wp.hooks.addAction('facetwp/ready', function () {
					$(document).on('facetwp-loaded', function () {
						$('.facetwp-date').datepicker({
							format: 'yyyy-mm-dd',
							autoclose: true,
							clearBtn: true
						}).on('changeDate', function (e) {
							FWP.autoload();
						});
					});
				});
			})(jQuery);
		</script>
		<?php
	}


	/**
	 * Output admin settings HTML
	 */
	function settings_html() {

	}


	/**
	 * Index the 2nd data source
	 * @since 2.1.1
	 */
	function index_row( $params, $class ) {
		return $params;
		//TODO Add indexing
//		$facet = FWP()->helper->get_facet_by_name( $params['facet_name'] );
//
//		if ( 'date_range' == $facet['type'] && ! empty( $facet['source_other'] ) ) {
//			$other_params = $params;
//			$other_params['facet_source'] = $facet['source_other'];
//			$rows = $class->get_row_data( $other_params );
//			$params['facet_display_value'] = $rows[0]['facet_display_value'];
//		}
//
//		return $params;
	}


	private function get_all_postpartum_products() {
		$args = array(
			'tax_query'      => array( array (
					'taxonomy' => 'bh_booking_type',
					'field'    => 'slug',
					'terms'    => 'postpartum'
			)),
			'post_type'      => 'product'
		);

		$products = get_posts($args);

		return $products;
	}

}