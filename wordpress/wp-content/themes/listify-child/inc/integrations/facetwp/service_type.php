<?php

include_once(FACETWP_DIR . '/includes/facets/dropdown.php');

class BH_Service_Type_Facet extends FacetWP_Facet_Dropdown
{
	private $postpartum_type = "";

	function __construct() {
		$this->label = __( 'I am looking for...', 'fwp' );

		//add_filter( 'facetwp_store_unfiltered_post_ids', array( $this, 'store_unfiltered_post_ids' ) );
	}


	/**
	 * Load the available choices
	 */
	function load_values( $params ) {

		$terms = get_terms('service_type');
		foreach ($terms as $term) {
			if ($term->slug == 'postpartum_type') {
				$this->postpartum_type = $term->name;
			}
		}
		$params['facet']['orderby'] = 'raw_value';
		$params['facet']['count'] = count($terms);

		return parent::load_values($params);
	}


	function render( $params ) {

		$output = '';
		$facet = $params['facet'];
		$values = (array) $params['values'];
		$selected_values = (array) $params['selected_values'];

		$output .= '<select class="facetwp-dropdown">';

		foreach ( $values as $result ) {
			$selected = in_array( $result['facet_value'], $selected_values ) ? ' selected' : '';

			$display_value = '';
			for ( $i = 0; $i < (int) $result['depth']; $i++ ) {
				$display_value .= '&nbsp;&nbsp;';
			}

			// Determine whether to show counts
			$display_value .= $result['facet_display_value'];
			$show_counts = apply_filters( 'facetwp_facet_dropdown_show_counts', true, array( 'facet' => $facet ) );

			if ( $show_counts ) {
				$display_value .= ' (' . $result['counter'] . ')';
			}

			$output .= '<option value="' . $result['facet_value'] . '"' . $selected . '>' . $display_value . '</option>';
		}

		$output .= '</select>';
		return $output;
	}

	/**
	 * Output any front-end scripts
	 */
	function front_scripts() {
		?>
		<script>
			(function($) {
				wp.hooks.addAction('facetwp/refresh/service_type', function($this, facet_name) {
					var val = $this.find('.facetwp-dropdown').val();
					FWP.facets[facet_name] = val ? [val] : [];
				});

				wp.hooks.addAction('facetwp/ready', function() {
					$(document).on('change', '.facetwp-facet .facetwp-dropdown', function() {
						var facet = jQuery(this).closest('.facetwp-facet-service_type');
						toggleVisibility(facet);
					});
					toggleVisibility(jQuery('facetwp-facet-service_type'));
				});

				wp.hooks.addFilter('facetwp/selections/service_type', function(output, params) {
					return params.el.find('.facetwp-facet-service_type option:selected').text();
				});

			})(jQuery);

			function toggleVisibility(facet) {
				if (facet.length > 0) {
					var selected = facet.find(':selected').text();
					var category =jQuery('.facetwp-facet-category');
					var duedate = jQuery('.facetwp-facet-due_date');

					if (selected.slice(0, <?php echo strlen($this->postpartum_type); ?>) == "<?php echo $this->postpartum_type; ?>") {
						category.parent().show();
						duedate.parent().show();
					}
					else {
						category.find(':selected').text('Any');
						duedate.find(':selected').text('');
						category.parent().hide();
						duedate.parent().hide();
					}
				}
			}

		</script>
		<?php
	}

	/**
	 * Store unfiltered post IDs if a dropdown facet exists
	 */
	function store_unfiltered_post_ids( $boolean ) {
		if ( FWP()->helper->facet_setting_exists( 'type', 'service_type' ) ) {
			return true;
		}

		return $boolean;
	}
}
