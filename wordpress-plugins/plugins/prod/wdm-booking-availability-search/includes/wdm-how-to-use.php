
<div id='wdm-entire-wrap'><h1><div class='main-title'>Availability Search Widget for WooCommerce Bookings

</div></h1>

	<h3><div id='wdm-content'>Steps to follow after successfully installing the plugin on your WordPress website.</div>
	</h3><br>
	<h4>Step 1: Activate the plugin ( Plugins -> Bookings Availability Search License -> Enter your License Key -> Activate License )
</h4>
	<h4>Step 2: Use the following shortcode to display the search widget on required page.</h4>
		
		<div id='wdm-content'><h2>[wdm_booking_search_widget]</h2></div>

	<h4>Step 3: Use the below shortcode on the same page, to display the search results. 
</h4>
		
		<div id='wdm-content'><h2>[wdm_booking_search]</h2></div>

	<h4>
		</br></br>
		<hr>

		<div class='main-title'>
			&#8226; Basic way to use shortcodes
		</div>
		</h3>
		<div id='wdm-content'>
			<h2>[wdm_booking_search]</h2>
			<h2>[wdm_booking_search_widget]</h2></div>

		</br></br>
		<h4>
			<div class='main-title'>
				&#8226; Display Custom Labels for Search Widget Fields
			</div>
			</br>
			The ‘from’ and ‘to’ labels of search widget can be customized using the shortcode below.
		</h4>
		<div id='wdm-content'>
			<h2>[wdm_booking_search_widget from="From Date" to="To Date"]</h2></div>

		<br><br>
		<h4>
			<div class='main-title'>
				&#8226; Filter Search Results Based on Category			
			</div></br>
			The search results can be filtered based on category (eg: hotels, restaurants) using the following shortcode. </br>
Note: Go to ‘Bookings Availability Search ‘ -> ‘Create Category String’ to create the category string. 			
		</h4>
		<div id='wdm-content'>
			<h2>[wdm_booking_search_widget category="hotels,restaurants"]</h2></div>

		<br><br>
		<h4>
			<div class="main-title">
				&#8226; Display Custom Title on Search Results Page 
				
			</div><br>
			The title displayed on the search results page can be customized (eg: The search result is: ) using the following shortcode. 

			
		</h4>
		<div id="wdm-content"><h2>[wdm_booking_search title="The search results are:"]</h2>
			</div>

		<br><br>
		<h4>
			<div class="main-title">
				&#8226; Display Custom Label on Search Widget Button 
				
			</div><br>
			Use the following shortcode to display a custom label on the search widget button as per requirement. 
		</h4>
		<div id="wdm-content"><h2>[wdm_booking_search_widget buttonlabel="Search It"]</h2>
			</div>

		<br><br>
		<h4>
			<div class="main-title">
				&#8226; Using all the parameters together in a shortcode
				
			</div>
			
		</h4>
		<div id="wdm-content"><h2>[wdm_booking_search title="The search results are:"]</h2><h2>
[wdm_booking_search_widget from="From" to="To" category="hotels,restaurants" buttonlabel="Search It"]
</h2>
			</div></div>

