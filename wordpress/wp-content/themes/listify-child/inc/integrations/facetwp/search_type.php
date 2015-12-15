<?php

class BH_Service_Type_Facet
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

		$types = get_terms('service_type');

		$result = array();

		foreach ($types as $type) {
			if ($type->slug === 'postpartum_type') {
				$this->postpartum_type = $type->name;
			}
			$result[] = $type->name;
		}

		return $result;

	}


	/**
	 * Generate the facet HTML
	 */
	function render( $params ) {

		$output = '';
		$facet = $params['facet'];
		$values = (array) $params['values'];
		$selected_values = (array) $params['selected_values'];

		$output .= '<select class="facetwp-service_type">';

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
	 * Filter the query based on selected values
	 */
	function filter_posts( $params ) {
		global $wpdb;

		$facet = $params['facet'];
		$selected_values = $params['selected_values'];
		$selected_values = is_array( $selected_values ) ? $selected_values[0] : $selected_values;

		$sql = "
        SELECT DISTINCT post_id FROM {$wpdb->prefix}facetwp_index
        WHERE facet_name = '{$facet['name']}' AND facet_value IN ('$selected_values')";
		return $wpdb->get_col( $sql );
	}


	/**
	 * Output any admin scripts
	 */
	function admin_scripts() {
		?>
		<script>
			(function($) {
				wp.hooks.addAction('facetwp/load/dropdown', function($this, obj) {
					$this.find('.facet-source').val(obj.source);
					$this.find('.facet-label-any').val(obj.label_any);
					$this.find('.facet-parent-term').val(obj.parent_term);
					$this.find('.facet-orderby').val(obj.orderby);
					$this.find('.facet-hierarchical').val(obj.hierarchical);
					$this.find('.facet-count').val(obj.count);
				});

				wp.hooks.addFilter('facetwp/save/dropdown', function($this, obj) {
					obj['source'] = $this.find('.facet-source').val();
					obj['label_any'] = $this.find('.facet-label-any').val();
					obj['parent_term'] = $this.find('.facet-parent-term').val();
					obj['orderby'] = $this.find('.facet-orderby').val();
					obj['hierarchical'] = $this.find('.facet-hierarchical').val();
					obj['count'] = $this.find('.facet-count').val();
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
				wp.hooks.addAction('facetwp/refresh/service_type', function($this, facet_name) {
					var val = $this.find('.facetwp-service_type').val();
					FWP.facets[facet_name] = val ? [val] : [];
				});

				wp.hooks.addFilter('facetwp/selections/service_type', function(output, params) {
					return params.el.find('.facetwp-service_type option:selected').text();
				});

				wp.hooks.addAction('facetwp/ready', function() {
					$(document).on('change', '.facetwp-facet .facetwp-service_type', function() {
						var $facet = $(this).closest('.facetwp-facet');
						var $selected = $facet.find(':selected').val();
						var $category = $(this).closest('.facetwp-facet-category');
						var $duedate = $(this).closest('.facetwp-facet-due_date');
						if ('' != $selected) {
							FWP.static_facet = $facet.attr('data-name');
						}
						if ($selected == "<?php echo $this->postpartum_type ?>") {
							$category.find(':selected').val('Any');
							$duedate.find(':selected').val('');
							$category.hide();
							$duedate.hide();
						}
						else {
							$category.show();
							$duedate.show();
						}
						FWP.autoload();
					});
				});
			})(jQuery);
			(function($).on)
		</script>
		<?php
	}


	/**
	 * Output admin settings HTML
	 */
	function settings_html() {

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
