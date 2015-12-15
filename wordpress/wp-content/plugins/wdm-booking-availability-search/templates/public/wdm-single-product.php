<?php
//to avoid direct file access
if ( ! defined( 'ABSPATH' ) ) {
	exit; // Exit if accessed directly
}
$title = get_the_title( $poduct_id );
?>

<article id='product_<?php echo $poduct_id; ?>' class='wdm-col wdm-span-1-of-4'>
   <div class="wdm_dur">	   
	   <?php 
	   
	   $wdm_duration= $total_days/$duration;
	   if( ! strpos( $url,"?" ))
	   {
		   $url.="?dur=".$wdm_duration."&start_date=".$start_date;	
	   }
	   else{
		   $url.="&dur=".$wdm_duration."&start_date=".$start_date;	
	   }
	   
	   ?>
       <a href='<?php echo $url?>' id="test">	   
		   
       <img class='wdm-img' src='<?php echo $image_src; ?>' />
	   
       </a>
   </div>
   <div>
       <a href='<?php echo $url; ?>'>
		   <h3 class='wdm-product-title'><?php echo $title; ?></h3>
		   <h3 class='wdm-product-title'>Price:<span  class='wdm-product-price'><?php echo get_woocommerce_currency_symbol(); echo $price; ?></span></h3>
		   
	   </a>
   </div>
</article>


