<?php
if ( ! defined( 'ABSPATH' ) ) {
	exit; // Exit if accessed directly
}

add_shortcode( 'wdm_booking_search', 'wdm_add_search_result_div' );

function wdm_add_search_result_div( $atts ) {
	wp_register_style( 'wdm_results_css', WDM_BOOKING_SEARCH_PLUGIN_URL . 'assets/css/wdm-widget-results.css' );
	wp_enqueue_style( 'wdm_results_css' );		
	ob_start();
	?>	
	<div class = "wdm_booking_search" id="wdm-title"><h1>
			<?php
			//title set in the shortcode.
			if ( isset( $atts[ 'title' ] ) ) {
				echo $atts[ 'title' ];
			} else {
				echo "The search results are:";
			}
			?></h1>
	</div> 
	<div class="wdm_booking_search wdm-clearfix" id="wdm_booking_search_id">
<!--		<div id="wdm-loading-txt">Loading, Please wait........!</div>-->
		<!--The search result goes here-->
	</div>
	<?php
	$html = ob_get_clean();
	return $html;
}
