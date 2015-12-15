<?php
/**
 * Template Name: Profile
 *
 */

global $current_user;
get_currentuserinfo();

$args = array(
	    'author'        =>  (string)$current_user->ID,
	    'orderby'       =>  'post_date',
	    'order'         =>  'ASC',
	    'post_type'		=>	'job_listing',
	    'post_status'	=>	'publish',
	    'posts_per_page' => 1
);

$current_user_posts = get_posts( $args );

if (count($current_user_posts) > 0) {

	$jobid = reset($current_user_posts)->ID;

	//$action_url = '/my-account/listings?action=edit&job_id='.$jobid;
    $action_url = get_permalink($jobid);
    //header('Location: ' . $action_url, true, 301 );
    //die();
	wp_safe_redirect($action_url);
	exit;
}
else {

	//$action_url = get_permalink(wc_get_page_id('submit-listing'));
    $action_url = '/submit-profile';
    //header('Location: ' . $action_url, true, 301 );
    //die();
	wp_safe_redirect($action_url);
	exit;

}

?>





