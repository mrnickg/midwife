<?php

include_once(FACETWP_DIR . '/includes/facets/dropdown.php');

class BH_Service_Type_Facet extends FacetWP_Facet_Dropdown
{
	private $postpartum_type = "";

	function __construct() {
		$this->label = __( 'I am looking for...', 'babyhallo' );

		add_filter( 'facetwp_store_unfiltered_post_ids', array( $this, 'store_unfiltered_post_ids' ) );

		$this->postpartum_type = __('Postpartum Care', 'babyhallo');
	}

	/**
	 * Load the available choices
	 */
	function load_values( $params ) {

		$params['facet']['orderby'] = 'raw_value';
		$params['facet']['count'] = 2;

		return parent::load_values($params);
	}


	function render( $params ) {

		$output = '';
		$facet = $params['facet'];
		$values = (array) $params['values'];
		$selected_values = (array) $params['selected_values'];

		foreach ( $values as $result ) {
			$selected = in_array( $result['facet_value'], $selected_values ) ? ' checked' : '';

			$display_value = '';
			for ( $i = 0; $i < (int) $result['depth']; $i++ ) {
				$display_value .= '&nbsp;&nbsp;';
			}

			// Determine whether to show counts
			$display_value .= $result['facet_display_value'];

			$output .= '<input type="radio" name="servicetype" class="facetwp-service_type-radio" value="' . $result['facet_value'] . '"' . $selected . '/><label for="' . $result['facet_value'] . '">' . $display_value . '</label><br/>';
		}

		return $output;
	}

	function admin_scripts() {
		?>
		<script>
			(function($) {
				wp.hooks.addAction('facetwp/load/service_type', function($this, obj) {
					$this.find('.facet-source').val(obj.source);
				});

				wp.hooks.addFilter('facetwp/save/service_type', function($this, obj) {
					obj['source'] = $this.find('.facet-source').val();
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
		<script>
			(function($) {

				FWP.toggle_service_visibility = function() {
					var facet = jQuery('.facetwp-facet-service_type');
					if (facet && facet.length > 0) {
						var elselected = facet.find(':checked');
						var lblselected = jQuery('label[for='+elselected.val()+']');
						var selected = lblselected.text();
						var category =jQuery('.facetwp-facet-category');
						var duedate = jQuery('.facetwp-facet-due_date');

						if (selected.slice(0, <?php echo strlen($this->postpartum_type); ?>) == "<?php echo $this->postpartum_type; ?>") {
							category.parent().show();
							duedate.parent().show();
						}
						else {
							category.find(':input').val('');
							duedate.find(':input').val('');
							category.parent().hide();
							duedate.parent().hide();
						}
					}
				}

				wp.hooks.addAction('facetwp/refresh/service_type', function($this, facet_name) {
					var val = $this.find(':checked').val();
					FWP.facets[facet_name] = val ? [val] : [];
					FWP.toggle_service_visibility();
				});

				wp.hooks.addAction('facetwp/ready', function() {
					$(document).on('change', '.facetwp-service_type-radio', function() {
						FWP.toggle_service_visibility();
						var $facet = $(this).closest('.facetwp-facet');
						if ('' != $facet.find(':checked').val()) {
							FWP.static_facet = $facet.attr('data-name');
						}
						FWP.autoload();
					});
				});

				wp.hooks.addAction('facetwp/loaded', function() {
					FWP.toggle_service_visibility();
				});

				wp.hooks.addFilter('facetwp/selections/service_type', function(output, params) {
					return params.el.find('.facetwp-facet-service_type option:checked').text();
				});



			})(jQuery);

		</script>
		<?php
	}

	function settings_html() {

	}

	/**
	 * Store unfiltered post IDs if a dropdown facet exists
	 */
	function store_unfiltered_post_ids( $boolean ) {
		return true;
	}
}
