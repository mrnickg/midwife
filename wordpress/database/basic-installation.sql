# WordPress MySQL database migration
#
# Generated: Friday 30. October 2015 14:41 UTC
# Hostname: localhost
# Database: `wordpress`
# --------------------------------------------------------

/*!40101 SET NAMES utf8mb4 */;

SET sql_mode='NO_AUTO_VALUE_ON_ZERO';



#
# Delete any existing table `wp_commentmeta`
#

DROP TABLE IF EXISTS `wp_commentmeta`;


#
# Table structure of table `wp_commentmeta`
#

CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `wp_commentmeta`
#

#
# End of data contents of table `wp_commentmeta`
# --------------------------------------------------------



#
# Delete any existing table `wp_comments`
#

DROP TABLE IF EXISTS `wp_comments`;


#
# Table structure of table `wp_comments`
#

CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `wp_comments`
#
INSERT INTO `wp_comments` ( `comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'Mr WordPress', '', 'https://wordpress.org/', '', '2015-10-30 13:27:36', '2015-10-30 13:27:36', 'Hi, this is a comment.\nTo delete a comment, just log in and view the post&#039;s comments. There you will have the option to edit or delete them.', 0, '1', '', '', 0, 0) ;

#
# End of data contents of table `wp_comments`
# --------------------------------------------------------



#
# Delete any existing table `wp_facetwp_index`
#

DROP TABLE IF EXISTS `wp_facetwp_index`;


#
# Table structure of table `wp_facetwp_index`
#

CREATE TABLE `wp_facetwp_index` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(10) unsigned DEFAULT NULL,
  `facet_name` varchar(255) DEFAULT NULL,
  `facet_source` varchar(255) DEFAULT NULL,
  `facet_value` text,
  `facet_display_value` text,
  `term_id` int(10) unsigned DEFAULT '0',
  `parent_id` int(10) unsigned DEFAULT '0',
  `depth` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `facet_name_idx` (`facet_name`),
  KEY `facet_source_idx` (`facet_source`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


#
# Data contents of table `wp_facetwp_index`
#

#
# End of data contents of table `wp_facetwp_index`
# --------------------------------------------------------



#
# Delete any existing table `wp_links`
#

DROP TABLE IF EXISTS `wp_links`;


#
# Table structure of table `wp_links`
#

CREATE TABLE `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `wp_links`
#

#
# End of data contents of table `wp_links`
# --------------------------------------------------------



#
# Delete any existing table `wp_options`
#

DROP TABLE IF EXISTS `wp_options`;


#
# Table structure of table `wp_options`
#

CREATE TABLE `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=591 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `wp_options`
#
INSERT INTO `wp_options` ( `option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost:8888', 'yes'),
(2, 'home', 'http://localhost:8888', 'yes'),
(3, 'blogname', 'babyhallo', 'yes'),
(4, 'blogdescription', 'Just another WordPress site', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'mr.nicholas.goodall@gmail.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '0', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'jS F Y', 'yes'),
(24, 'time_format', 'g:i a', 'yes'),
(25, 'links_updated_date_format', 'jS F Y g:i a', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%postname%/', 'yes'),
(29, 'gzipcompression', '0', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:23:{i:0;s:36:"contact-form-7/wp-contact-form-7.php";i:1;s:77:"enhanced-admin-bar-with-codex-search/enhanced-admin-bar-with-codex-search.php";i:2;s:43:"events-calendar-pro/events-calendar-pro.php";i:3;s:17:"facetwp/index.php";i:4;s:33:"nav-menu-roles/nav-menu-roles.php";i:5;s:13:"pods/init.php";i:6;s:43:"post-meta-inspector/post-meta-inspector.php";i:7;s:63:"the-events-calendar-community-events/tribe-community-events.php";i:8;s:43:"the-events-calendar/the-events-calendar.php";i:9;s:53:"widget-importer-exporter/widget-importer-exporter.php";i:10;s:46:"woocommerce-bookings/woocommmerce-bookings.php";i:11;s:59:"woocommerce-checkout-field-editor/checkout-field-editor.php";i:12;s:59:"woocommerce-product-vendors/woocommerce-product-vendors.php";i:13;s:67:"woocommerce-simple-registration/woocommerce-simple-registration.php";i:14;s:27:"woocommerce/woocommerce.php";i:15;s:65:"wp-job-manager-contact-listing/wp-job-manager-contact-listing.php";i:16;s:69:"wp-job-manager-extended-location/wp-job-manager-extended-location.php";i:17;s:59:"wp-job-manager-field-editor/wp-job-manager-field-editor.php";i:18;s:53:"wp-job-manager-locations/wp-job-manager-locations.php";i:19;s:51:"wp-job-manager-products/wp-job-manager-products.php";i:20;s:33:"wp-job-manager/wp-job-manager.php";i:21;s:31:"wp-migrate-db/wp-migrate-db.php";i:22;s:33:"wp-user-avatar/wp-user-avatar.php";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'advanced_edit', '0', 'yes'),
(37, 'comment_max_links', '2', 'yes'),
(38, 'gmt_offset', '0', 'yes'),
(39, 'default_email_category', '1', 'yes'),
(40, 'recently_edited', '', 'no'),
(41, 'template', 'listify', 'yes'),
(42, 'stylesheet', 'listify-child', 'yes'),
(43, 'comment_whitelist', '1', 'yes'),
(44, 'blacklist_keys', '', 'no'),
(45, 'comment_registration', '0', 'yes'),
(46, 'html_type', 'text/html', 'yes'),
(47, 'use_trackback', '0', 'yes'),
(48, 'default_role', 'subscriber', 'yes'),
(49, 'db_version', '33056', 'yes'),
(50, 'uploads_use_yearmonth_folders', '1', 'yes'),
(51, 'upload_path', '', 'yes'),
(52, 'blog_public', '1', 'yes'),
(53, 'default_link_category', '2', 'yes'),
(54, 'show_on_front', 'page', 'yes'),
(55, 'tag_base', '', 'yes'),
(56, 'show_avatars', '1', 'yes'),
(57, 'avatar_rating', 'G', 'yes'),
(58, 'upload_url_path', '', 'yes'),
(59, 'thumbnail_size_w', '150', 'yes'),
(60, 'thumbnail_size_h', '150', 'yes'),
(61, 'thumbnail_crop', '1', 'yes'),
(62, 'medium_size_w', '300', 'yes'),
(63, 'medium_size_h', '300', 'yes'),
(64, 'avatar_default', 'mystery', 'yes'),
(65, 'large_size_w', '1024', 'yes'),
(66, 'large_size_h', '1024', 'yes'),
(67, 'image_default_link_type', 'file', 'yes'),
(68, 'image_default_size', '', 'yes'),
(69, 'image_default_align', '', 'yes'),
(70, 'close_comments_for_old_posts', '0', 'yes'),
(71, 'close_comments_days_old', '14', 'yes'),
(72, 'thread_comments', '1', 'yes'),
(73, 'thread_comments_depth', '5', 'yes'),
(74, 'page_comments', '0', 'yes'),
(75, 'comments_per_page', '50', 'yes'),
(76, 'default_comments_page', 'newest', 'yes'),
(77, 'comment_order', 'asc', 'yes'),
(78, 'sticky_posts', 'a:0:{}', 'yes'),
(79, 'widget_categories', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(80, 'widget_text', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(81, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(82, 'uninstall_plugins', 'a:0:{}', 'no'),
(83, 'timezone_string', 'Europe/London', 'yes'),
(84, 'page_for_posts', '0', 'yes'),
(85, 'page_on_front', '46', 'yes'),
(86, 'default_post_format', '0', 'yes'),
(87, 'link_manager_enabled', '0', 'yes'),
(88, 'finished_splitting_shared_terms', '1', 'yes'),
(89, 'initial_db_version', '33056', 'yes'),
(90, 'wp_user_roles', 'a:8:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:183:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:9:"add_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;s:18:"manage_woocommerce";b:1;s:24:"view_woocommerce_reports";b:1;s:12:"edit_product";b:1;s:12:"read_product";b:1;s:14:"delete_product";b:1;s:13:"edit_products";b:1;s:20:"edit_others_products";b:1;s:16:"publish_products";b:1;s:21:"read_private_products";b:1;s:15:"delete_products";b:1;s:23:"delete_private_products";b:1;s:25:"delete_published_products";b:1;s:22:"delete_others_products";b:1;s:21:"edit_private_products";b:1;s:23:"edit_published_products";b:1;s:20:"manage_product_terms";b:1;s:18:"edit_product_terms";b:1;s:20:"delete_product_terms";b:1;s:20:"assign_product_terms";b:1;s:15:"edit_shop_order";b:1;s:15:"read_shop_order";b:1;s:17:"delete_shop_order";b:1;s:16:"edit_shop_orders";b:1;s:23:"edit_others_shop_orders";b:1;s:19:"publish_shop_orders";b:1;s:24:"read_private_shop_orders";b:1;s:18:"delete_shop_orders";b:1;s:26:"delete_private_shop_orders";b:1;s:28:"delete_published_shop_orders";b:1;s:25:"delete_others_shop_orders";b:1;s:24:"edit_private_shop_orders";b:1;s:26:"edit_published_shop_orders";b:1;s:23:"manage_shop_order_terms";b:1;s:21:"edit_shop_order_terms";b:1;s:23:"delete_shop_order_terms";b:1;s:23:"assign_shop_order_terms";b:1;s:16:"edit_shop_coupon";b:1;s:16:"read_shop_coupon";b:1;s:18:"delete_shop_coupon";b:1;s:17:"edit_shop_coupons";b:1;s:24:"edit_others_shop_coupons";b:1;s:20:"publish_shop_coupons";b:1;s:25:"read_private_shop_coupons";b:1;s:19:"delete_shop_coupons";b:1;s:27:"delete_private_shop_coupons";b:1;s:29:"delete_published_shop_coupons";b:1;s:26:"delete_others_shop_coupons";b:1;s:25:"edit_private_shop_coupons";b:1;s:27:"edit_published_shop_coupons";b:1;s:24:"manage_shop_coupon_terms";b:1;s:22:"edit_shop_coupon_terms";b:1;s:24:"delete_shop_coupon_terms";b:1;s:24:"assign_shop_coupon_terms";b:1;s:17:"edit_shop_webhook";b:1;s:17:"read_shop_webhook";b:1;s:19:"delete_shop_webhook";b:1;s:18:"edit_shop_webhooks";b:1;s:25:"edit_others_shop_webhooks";b:1;s:21:"publish_shop_webhooks";b:1;s:26:"read_private_shop_webhooks";b:1;s:20:"delete_shop_webhooks";b:1;s:28:"delete_private_shop_webhooks";b:1;s:30:"delete_published_shop_webhooks";b:1;s:27:"delete_others_shop_webhooks";b:1;s:26:"edit_private_shop_webhooks";b:1;s:28:"edit_published_shop_webhooks";b:1;s:25:"manage_shop_webhook_terms";b:1;s:23:"edit_shop_webhook_terms";b:1;s:25:"delete_shop_webhook_terms";b:1;s:25:"assign_shop_webhook_terms";b:1;s:19:"manage_job_listings";b:1;s:16:"edit_job_listing";b:1;s:16:"read_job_listing";b:1;s:18:"delete_job_listing";b:1;s:17:"edit_job_listings";b:1;s:24:"edit_others_job_listings";b:1;s:20:"publish_job_listings";b:1;s:25:"read_private_job_listings";b:1;s:19:"delete_job_listings";b:1;s:27:"delete_private_job_listings";b:1;s:29:"delete_published_job_listings";b:1;s:26:"delete_others_job_listings";b:1;s:25:"edit_private_job_listings";b:1;s:27:"edit_published_job_listings";b:1;s:24:"manage_job_listing_terms";b:1;s:22:"edit_job_listing_terms";b:1;s:24:"delete_job_listing_terms";b:1;s:24:"assign_job_listing_terms";b:1;s:15:"manage_bookings";b:1;s:25:"read_private_tribe_events";b:1;s:17:"edit_tribe_events";b:1;s:24:"edit_others_tribe_events";b:1;s:25:"edit_private_tribe_events";b:1;s:27:"edit_published_tribe_events";b:1;s:19:"delete_tribe_events";b:1;s:26:"delete_others_tribe_events";b:1;s:27:"delete_private_tribe_events";b:1;s:29:"delete_published_tribe_events";b:1;s:20:"publish_tribe_events";b:1;s:29:"read_private_tribe_organizers";b:1;s:21:"edit_tribe_organizers";b:1;s:28:"edit_others_tribe_organizers";b:1;s:29:"edit_private_tribe_organizers";b:1;s:31:"edit_published_tribe_organizers";b:1;s:23:"delete_tribe_organizers";b:1;s:30:"delete_others_tribe_organizers";b:1;s:31:"delete_private_tribe_organizers";b:1;s:33:"delete_published_tribe_organizers";b:1;s:24:"publish_tribe_organizers";b:1;s:25:"read_private_tribe_venues";b:1;s:17:"edit_tribe_venues";b:1;s:24:"edit_others_tribe_venues";b:1;s:25:"edit_private_tribe_venues";b:1;s:27:"edit_published_tribe_venues";b:1;s:19:"delete_tribe_venues";b:1;s:26:"delete_others_tribe_venues";b:1;s:27:"delete_private_tribe_venues";b:1;s:29:"delete_published_tribe_venues";b:1;s:20:"publish_tribe_venues";b:1;s:17:"manage_job_fields";b:1;s:20:"manage_resume_fields";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:64:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:25:"read_private_tribe_events";b:1;s:17:"edit_tribe_events";b:1;s:24:"edit_others_tribe_events";b:1;s:25:"edit_private_tribe_events";b:1;s:27:"edit_published_tribe_events";b:1;s:19:"delete_tribe_events";b:1;s:26:"delete_others_tribe_events";b:1;s:27:"delete_private_tribe_events";b:1;s:29:"delete_published_tribe_events";b:1;s:20:"publish_tribe_events";b:1;s:29:"read_private_tribe_organizers";b:1;s:21:"edit_tribe_organizers";b:1;s:28:"edit_others_tribe_organizers";b:1;s:29:"edit_private_tribe_organizers";b:1;s:31:"edit_published_tribe_organizers";b:1;s:23:"delete_tribe_organizers";b:1;s:30:"delete_others_tribe_organizers";b:1;s:31:"delete_private_tribe_organizers";b:1;s:33:"delete_published_tribe_organizers";b:1;s:24:"publish_tribe_organizers";b:1;s:25:"read_private_tribe_venues";b:1;s:17:"edit_tribe_venues";b:1;s:24:"edit_others_tribe_venues";b:1;s:25:"edit_private_tribe_venues";b:1;s:27:"edit_published_tribe_venues";b:1;s:19:"delete_tribe_venues";b:1;s:26:"delete_others_tribe_venues";b:1;s:27:"delete_private_tribe_venues";b:1;s:29:"delete_published_tribe_venues";b:1;s:20:"publish_tribe_venues";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:25:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;s:17:"edit_tribe_events";b:1;s:27:"edit_published_tribe_events";b:1;s:19:"delete_tribe_events";b:1;s:29:"delete_published_tribe_events";b:1;s:20:"publish_tribe_events";b:1;s:21:"edit_tribe_organizers";b:1;s:31:"edit_published_tribe_organizers";b:1;s:23:"delete_tribe_organizers";b:1;s:33:"delete_published_tribe_organizers";b:1;s:24:"publish_tribe_organizers";b:1;s:17:"edit_tribe_venues";b:1;s:27:"edit_published_tribe_venues";b:1;s:19:"delete_tribe_venues";b:1;s:29:"delete_published_tribe_venues";b:1;s:20:"publish_tribe_venues";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:11:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:17:"edit_tribe_events";b:1;s:19:"delete_tribe_events";b:1;s:21:"edit_tribe_organizers";b:1;s:23:"delete_tribe_organizers";b:1;s:17:"edit_tribe_venues";b:1;s:19:"delete_tribe_venues";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}s:8:"customer";a:2:{s:4:"name";s:8:"Customer";s:12:"capabilities";a:3:{s:4:"read";b:1;s:10:"edit_posts";b:0;s:12:"delete_posts";b:0;}}s:12:"shop_manager";a:2:{s:4:"name";s:12:"Shop Manager";s:12:"capabilities";a:111:{s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:4:"read";b:1;s:18:"read_private_pages";b:1;s:18:"read_private_posts";b:1;s:10:"edit_users";b:1;s:10:"edit_posts";b:1;s:10:"edit_pages";b:1;s:20:"edit_published_posts";b:1;s:20:"edit_published_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"edit_private_posts";b:1;s:17:"edit_others_posts";b:1;s:17:"edit_others_pages";b:1;s:13:"publish_posts";b:1;s:13:"publish_pages";b:1;s:12:"delete_posts";b:1;s:12:"delete_pages";b:1;s:20:"delete_private_pages";b:1;s:20:"delete_private_posts";b:1;s:22:"delete_published_pages";b:1;s:22:"delete_published_posts";b:1;s:19:"delete_others_posts";b:1;s:19:"delete_others_pages";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:17:"moderate_comments";b:1;s:15:"unfiltered_html";b:1;s:12:"upload_files";b:1;s:6:"export";b:1;s:6:"import";b:1;s:10:"list_users";b:1;s:18:"manage_woocommerce";b:1;s:24:"view_woocommerce_reports";b:1;s:12:"edit_product";b:1;s:12:"read_product";b:1;s:14:"delete_product";b:1;s:13:"edit_products";b:1;s:20:"edit_others_products";b:1;s:16:"publish_products";b:1;s:21:"read_private_products";b:1;s:15:"delete_products";b:1;s:23:"delete_private_products";b:1;s:25:"delete_published_products";b:1;s:22:"delete_others_products";b:1;s:21:"edit_private_products";b:1;s:23:"edit_published_products";b:1;s:20:"manage_product_terms";b:1;s:18:"edit_product_terms";b:1;s:20:"delete_product_terms";b:1;s:20:"assign_product_terms";b:1;s:15:"edit_shop_order";b:1;s:15:"read_shop_order";b:1;s:17:"delete_shop_order";b:1;s:16:"edit_shop_orders";b:1;s:23:"edit_others_shop_orders";b:1;s:19:"publish_shop_orders";b:1;s:24:"read_private_shop_orders";b:1;s:18:"delete_shop_orders";b:1;s:26:"delete_private_shop_orders";b:1;s:28:"delete_published_shop_orders";b:1;s:25:"delete_others_shop_orders";b:1;s:24:"edit_private_shop_orders";b:1;s:26:"edit_published_shop_orders";b:1;s:23:"manage_shop_order_terms";b:1;s:21:"edit_shop_order_terms";b:1;s:23:"delete_shop_order_terms";b:1;s:23:"assign_shop_order_terms";b:1;s:16:"edit_shop_coupon";b:1;s:16:"read_shop_coupon";b:1;s:18:"delete_shop_coupon";b:1;s:17:"edit_shop_coupons";b:1;s:24:"edit_others_shop_coupons";b:1;s:20:"publish_shop_coupons";b:1;s:25:"read_private_shop_coupons";b:1;s:19:"delete_shop_coupons";b:1;s:27:"delete_private_shop_coupons";b:1;s:29:"delete_published_shop_coupons";b:1;s:26:"delete_others_shop_coupons";b:1;s:25:"edit_private_shop_coupons";b:1;s:27:"edit_published_shop_coupons";b:1;s:24:"manage_shop_coupon_terms";b:1;s:22:"edit_shop_coupon_terms";b:1;s:24:"delete_shop_coupon_terms";b:1;s:24:"assign_shop_coupon_terms";b:1;s:17:"edit_shop_webhook";b:1;s:17:"read_shop_webhook";b:1;s:19:"delete_shop_webhook";b:1;s:18:"edit_shop_webhooks";b:1;s:25:"edit_others_shop_webhooks";b:1;s:21:"publish_shop_webhooks";b:1;s:26:"read_private_shop_webhooks";b:1;s:20:"delete_shop_webhooks";b:1;s:28:"delete_private_shop_webhooks";b:1;s:30:"delete_published_shop_webhooks";b:1;s:27:"delete_others_shop_webhooks";b:1;s:26:"edit_private_shop_webhooks";b:1;s:28:"edit_published_shop_webhooks";b:1;s:25:"manage_shop_webhook_terms";b:1;s:23:"edit_shop_webhook_terms";b:1;s:25:"delete_shop_webhook_terms";b:1;s:25:"assign_shop_webhook_terms";b:1;s:15:"manage_bookings";b:1;}}s:8:"employer";a:2:{s:4:"name";s:8:"Employer";s:12:"capabilities";a:3:{s:4:"read";b:1;s:10:"edit_posts";b:0;s:12:"delete_posts";b:0;}}}', 'yes'),
(91, 'WPLANG', 'en_GB', 'yes'),
(92, 'widget_search', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(93, 'widget_recent-posts', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(94, 'widget_recent-comments', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(95, 'widget_archives', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(96, 'widget_meta', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(97, 'sidebars_widgets', 'a:12:{s:19:"wp_inactive_widgets";a:0:{}s:21:"widget-area-sidebar-1";a:0:{}s:16:"widget-area-home";a:0:{}s:20:"widget-area-footer-1";a:0:{}s:20:"widget-area-footer-2";a:0:{}s:20:"widget-area-footer-3";a:0:{}s:27:"widget-area-sidebar-product";a:0:{}s:24:"widget-area-sidebar-shop";a:0:{}s:19:"archive-job_listing";a:0:{}s:30:"single-job_listing-widget-area";a:0:{}s:18:"single-job_listing";a:2:{i:0;s:37:"listify_widget_panel_listing_auhtor-2";i:1;s:39:"listify_widget_panel_listing_bookings-2";}s:13:"array_version";i:3;}', 'yes'),
(99, 'cron', 'a:43:{i:1446217507;a:1:{s:32:"woocommerce_cancel_unpaid_orders";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:2:{s:8:"schedule";b:0;s:4:"args";a:0:{}}}}i:1446217509;a:1:{s:34:"job_manager_check_for_expired_jobs";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:6:"hourly";s:4:"args";a:0:{}s:8:"interval";i:3600;}}}i:1446217511;a:1:{s:41:"tribe_events_pro_process_recurring_events";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:12:"every_30mins";s:4:"args";a:0:{}s:8:"interval";i:1800;}}}i:1446220294;a:1:{s:26:"upgrader_scheduled_cleanup";a:1:{s:32:"adcb9b75260590ff6058773ddcb9ddd6";a:2:{s:8:"schedule";b:0;s:4:"args";a:1:{i:0;i:4;}}}}i:1446220575;a:1:{s:26:"upgrader_scheduled_cleanup";a:1:{s:32:"c9059feef497c200e69cb9956a81f005";a:2:{s:8:"schedule";b:0;s:4:"args";a:1:{i:0;i:5;}}}}i:1446220634;a:1:{s:26:"upgrader_scheduled_cleanup";a:1:{s:32:"686c8315be36c96dc00d0d7ed3656b43";a:2:{s:8:"schedule";b:0;s:4:"args";a:1:{i:0;i:6;}}}}i:1446220682;a:1:{s:26:"upgrader_scheduled_cleanup";a:1:{s:32:"d63aca0b7e6237c7964320bd7fc95644";a:2:{s:8:"schedule";b:0;s:4:"args";a:1:{i:0;i:7;}}}}i:1446220697;a:1:{s:26:"upgrader_scheduled_cleanup";a:1:{s:32:"60fda3b54003017dc64a0c492471bbfe";a:2:{s:8:"schedule";b:0;s:4:"args";a:1:{i:0;i:8;}}}}i:1446220713;a:1:{s:26:"upgrader_scheduled_cleanup";a:1:{s:32:"b4b17768ecd6a3369b716a0ce3abb8f6";a:2:{s:8:"schedule";b:0;s:4:"args";a:1:{i:0;i:9;}}}}i:1446220728;a:1:{s:26:"upgrader_scheduled_cleanup";a:1:{s:32:"c8bde69a9f79ca24059e3807f9a3bcf8";a:2:{s:8:"schedule";b:0;s:4:"args";a:1:{i:0;i:10;}}}}i:1446220743;a:1:{s:26:"upgrader_scheduled_cleanup";a:1:{s:32:"a33bdbdff47548655d9bd9c05ea3930a";a:2:{s:8:"schedule";b:0;s:4:"args";a:1:{i:0;i:11;}}}}i:1446220757;a:1:{s:26:"upgrader_scheduled_cleanup";a:1:{s:32:"25117f4b9fd9bb6384d0eb8ea708c8b9";a:2:{s:8:"schedule";b:0;s:4:"args";a:1:{i:0;i:12;}}}}i:1446220772;a:1:{s:26:"upgrader_scheduled_cleanup";a:1:{s:32:"9009088b2ab6f9f0dd1e36df2da38ce7";a:2:{s:8:"schedule";b:0;s:4:"args";a:1:{i:0;i:13;}}}}i:1446220789;a:1:{s:26:"upgrader_scheduled_cleanup";a:1:{s:32:"78525e41f5c2848ff7e1a2337fb96361";a:2:{s:8:"schedule";b:0;s:4:"args";a:1:{i:0;i:14;}}}}i:1446220804;a:1:{s:26:"upgrader_scheduled_cleanup";a:1:{s:32:"64fe7e19c11c6aa5ae4105b856a866cd";a:2:{s:8:"schedule";b:0;s:4:"args";a:1:{i:0;i:15;}}}}i:1446220821;a:1:{s:26:"upgrader_scheduled_cleanup";a:1:{s:32:"dd07e4db14c3f5ea561b3bed7428c6ab";a:2:{s:8:"schedule";b:0;s:4:"args";a:1:{i:0;i:16;}}}}i:1446220835;a:1:{s:26:"upgrader_scheduled_cleanup";a:1:{s:32:"8ed56e6c25286330953b4891a51c25d9";a:2:{s:8:"schedule";b:0;s:4:"args";a:1:{i:0;i:17;}}}}i:1446220851;a:1:{s:26:"upgrader_scheduled_cleanup";a:1:{s:32:"bad9df8a7c3fa92d28999d03f4ccb29e";a:2:{s:8:"schedule";b:0;s:4:"args";a:1:{i:0;i:18;}}}}i:1446220903;a:1:{s:26:"upgrader_scheduled_cleanup";a:1:{s:32:"45f91c1ee81280c48cfb715d2c9931b0";a:2:{s:8:"schedule";b:0;s:4:"args";a:1:{i:0;i:19;}}}}i:1446220920;a:1:{s:26:"upgrader_scheduled_cleanup";a:1:{s:32:"c235acd81e1457babc4e93303796723c";a:2:{s:8:"schedule";b:0;s:4:"args";a:1:{i:0;i:20;}}}}i:1446220938;a:1:{s:26:"upgrader_scheduled_cleanup";a:1:{s:32:"c4b66550e50f6ae8347c6592ebc1a4d1";a:2:{s:8:"schedule";b:0;s:4:"args";a:1:{i:0;i:21;}}}}i:1446220956;a:1:{s:26:"upgrader_scheduled_cleanup";a:1:{s:32:"26e9e6ff95b3d23cf3d0202a8d7dfd36";a:2:{s:8:"schedule";b:0;s:4:"args";a:1:{i:0;i:22;}}}}i:1446220971;a:1:{s:26:"upgrader_scheduled_cleanup";a:1:{s:32:"24daa8f49584a6f1b1395d475758a1de";a:2:{s:8:"schedule";b:0;s:4:"args";a:1:{i:0;i:23;}}}}i:1446220988;a:1:{s:26:"upgrader_scheduled_cleanup";a:1:{s:32:"799be243d6827cc0bc0951691920a50b";a:2:{s:8:"schedule";b:0;s:4:"args";a:1:{i:0;i:24;}}}}i:1446221003;a:1:{s:26:"upgrader_scheduled_cleanup";a:1:{s:32:"2af2e0878689b7c2fa62ccf0765f5768";a:2:{s:8:"schedule";b:0;s:4:"args";a:1:{i:0;i:25;}}}}i:1446221020;a:1:{s:26:"upgrader_scheduled_cleanup";a:1:{s:32:"4334b88fe3501b2f0e4f630eb24f7ca5";a:2:{s:8:"schedule";b:0;s:4:"args";a:1:{i:0;i:26;}}}}i:1446221045;a:1:{s:26:"upgrader_scheduled_cleanup";a:1:{s:32:"4fde22776ee75e22ac8342be3aa0c974";a:2:{s:8:"schedule";b:0;s:4:"args";a:1:{i:0;i:27;}}}}i:1446221059;a:1:{s:26:"upgrader_scheduled_cleanup";a:1:{s:32:"17f415781210aaa50f7cb291eccfc7af";a:2:{s:8:"schedule";b:0;s:4:"args";a:1:{i:0;i:28;}}}}i:1446221076;a:1:{s:26:"upgrader_scheduled_cleanup";a:1:{s:32:"1aee8163cf336b6de8481860de53f230";a:2:{s:8:"schedule";b:0;s:4:"args";a:1:{i:0;i:29;}}}}i:1446222739;a:1:{s:26:"upgrader_scheduled_cleanup";a:1:{s:32:"1f2017e1ed51c7e11ca55ed0583ac79c";a:2:{s:8:"schedule";b:0;s:4:"args";a:1:{i:0;i:60;}}}}i:1446234480;a:1:{s:20:"wp_maybe_auto_update";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1446249600;a:1:{s:27:"woocommerce_scheduled_sales";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1446254856;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1446257107;a:1:{s:28:"woocommerce_cleanup_sessions";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1446257109;a:1:{s:36:"job_manager_clear_expired_transients";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1446299433;a:1:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1446300307;a:1:{s:30:"woocommerce_tracker_send_event";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1446300309;a:1:{s:31:"job_manager_delete_old_previews";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1446300311;a:1:{s:21:"tribe-recurrence-cron";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1446300477;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1446508800;a:1:{s:25:"woocommerce_geoip_updater";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:7:"monthly";s:4:"args";a:0:{}s:8:"interval";i:2635200;}}}i:1446818769;a:1:{s:28:"job_manager_verify_no_errors";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:6:"weekly";s:4:"args";a:0:{}s:8:"interval";i:604800;}}}s:7:"version";i:2;}', 'yes'),
(115, 'can_compress_scripts', '1', 'yes'),
(133, 'recently_activated', 'a:0:{}', 'yes') ;
INSERT INTO `wp_options` ( `option_id`, `option_name`, `option_value`, `autoload`) VALUES
(140, 'theme_mods_twentyfifteen', 'a:1:{s:16:"sidebars_widgets";a:2:{s:4:"time";i:1446213438;s:4:"data";a:2:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}}}}', 'yes'),
(141, 'current_theme', 'Listify - Child Theme', 'yes'),
(142, 'theme_mods_listify', 'a:2:{i:0;b:0;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1446214021;s:4:"data";a:6:{s:19:"wp_inactive_widgets";a:0:{}s:21:"widget-area-sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:16:"widget-area-home";N;s:20:"widget-area-footer-1";N;s:20:"widget-area-footer-2";N;s:20:"widget-area-footer-3";N;}}}', 'yes'),
(143, 'theme_switched', '', 'yes'),
(144, 'listify_version', '1.0.0', 'yes'),
(171, 'wpcf7', 'a:1:{s:7:"version";s:3:"4.3";}', 'yes'),
(174, 'tribe_community_events_options', 'a:1:{s:17:"maybeFlushRewrite";b:0;}', 'yes'),
(175, 'woocommerce_default_country', 'GB', 'yes'),
(176, 'woocommerce_allowed_countries', 'all', 'yes'),
(177, 'woocommerce_specific_allowed_countries', '', 'yes'),
(178, 'woocommerce_default_customer_address', 'geolocation', 'yes'),
(179, 'woocommerce_demo_store', 'no', 'yes'),
(180, 'woocommerce_demo_store_notice', 'This is a demo store for testing purposes &mdash; no orders shall be fulfilled.', 'no'),
(181, 'woocommerce_currency', 'GBP', 'yes'),
(182, 'woocommerce_currency_pos', 'left', 'yes'),
(183, 'woocommerce_price_thousand_sep', ',', 'yes'),
(184, 'woocommerce_price_decimal_sep', '.', 'yes'),
(185, 'woocommerce_price_num_decimals', '2', 'yes'),
(186, 'woocommerce_weight_unit', 'kg', 'yes'),
(187, 'woocommerce_dimension_unit', 'cm', 'yes'),
(188, 'woocommerce_enable_review_rating', 'yes', 'no'),
(189, 'woocommerce_review_rating_required', 'yes', 'no'),
(190, 'woocommerce_review_rating_verification_label', 'yes', 'no'),
(191, 'woocommerce_review_rating_verification_required', 'no', 'no'),
(192, 'woocommerce_shop_page_id', '', 'yes'),
(193, 'woocommerce_shop_page_display', '', 'yes'),
(194, 'woocommerce_category_archive_display', '', 'yes'),
(195, 'woocommerce_default_catalog_orderby', 'menu_order', 'yes'),
(196, 'woocommerce_cart_redirect_after_add', 'no', 'yes'),
(197, 'woocommerce_enable_ajax_add_to_cart', 'yes', 'yes'),
(198, 'shop_catalog_image_size', 'a:3:{s:5:"width";s:3:"300";s:6:"height";s:3:"300";s:4:"crop";i:1;}', 'yes'),
(199, 'shop_single_image_size', 'a:3:{s:5:"width";s:3:"600";s:6:"height";s:3:"600";s:4:"crop";i:1;}', 'yes'),
(200, 'shop_thumbnail_image_size', 'a:3:{s:5:"width";s:3:"180";s:6:"height";s:3:"180";s:4:"crop";i:1;}', 'yes'),
(201, 'woocommerce_enable_lightbox', 'yes', 'yes'),
(202, 'woocommerce_manage_stock', 'yes', 'yes'),
(203, 'woocommerce_hold_stock_minutes', '60', 'no'),
(204, 'woocommerce_notify_low_stock', 'yes', 'no'),
(205, 'woocommerce_notify_no_stock', 'yes', 'no'),
(206, 'woocommerce_stock_email_recipient', 'mr.nicholas.goodall@gmail.com', 'no'),
(207, 'woocommerce_notify_low_stock_amount', '2', 'no'),
(208, 'woocommerce_notify_no_stock_amount', '0', 'no'),
(209, 'woocommerce_hide_out_of_stock_items', 'no', 'yes'),
(210, 'woocommerce_stock_format', '', 'yes'),
(211, 'woocommerce_file_download_method', 'force', 'no'),
(212, 'woocommerce_downloads_require_login', 'no', 'no'),
(213, 'woocommerce_downloads_grant_access_after_payment', 'yes', 'no'),
(214, 'woocommerce_calc_taxes', 'no', 'yes'),
(215, 'woocommerce_prices_include_tax', 'no', 'yes'),
(216, 'woocommerce_tax_based_on', 'shipping', 'yes'),
(217, 'woocommerce_shipping_tax_class', 'title', 'yes'),
(218, 'woocommerce_tax_round_at_subtotal', 'no', 'yes'),
(219, 'woocommerce_tax_classes', 'Reduced Rate\nZero Rate', 'yes'),
(220, 'woocommerce_tax_display_shop', 'excl', 'yes'),
(221, 'woocommerce_tax_display_cart', 'excl', 'no'),
(222, 'woocommerce_price_display_suffix', '', 'yes'),
(223, 'woocommerce_tax_total_display', 'itemized', 'no'),
(224, 'woocommerce_enable_coupons', 'yes', 'no'),
(225, 'woocommerce_calc_discounts_sequentially', 'no', 'no'),
(226, 'woocommerce_enable_guest_checkout', 'yes', 'no'),
(227, 'woocommerce_force_ssl_checkout', 'no', 'yes'),
(228, 'woocommerce_unforce_ssl_checkout', 'no', 'yes'),
(229, 'woocommerce_cart_page_id', '', 'yes'),
(230, 'woocommerce_checkout_page_id', '', 'yes'),
(231, 'woocommerce_terms_page_id', '', 'no'),
(232, 'woocommerce_checkout_pay_endpoint', 'order-pay', 'yes'),
(233, 'woocommerce_checkout_order_received_endpoint', 'order-received', 'yes'),
(234, 'woocommerce_myaccount_add_payment_method_endpoint', 'add-payment-method', 'yes'),
(235, 'woocommerce_calc_shipping', 'no', 'yes'),
(236, 'woocommerce_enable_shipping_calc', 'yes', 'no'),
(237, 'woocommerce_shipping_cost_requires_address', 'no', 'no'),
(238, 'woocommerce_shipping_method_format', '', 'no'),
(239, 'woocommerce_ship_to_destination', 'billing', 'no'),
(240, 'woocommerce_ship_to_countries', '', 'yes'),
(241, 'woocommerce_specific_ship_to_countries', '', 'yes'),
(242, 'woocommerce_myaccount_page_id', '', 'yes'),
(243, 'woocommerce_myaccount_view_order_endpoint', 'view-order', 'yes'),
(244, 'woocommerce_myaccount_edit_account_endpoint', 'edit-account', 'yes'),
(245, 'woocommerce_myaccount_edit_address_endpoint', 'edit-address', 'yes'),
(246, 'woocommerce_myaccount_lost_password_endpoint', 'lost-password', 'yes'),
(247, 'woocommerce_logout_endpoint', 'customer-logout', 'yes'),
(248, 'woocommerce_enable_signup_and_login_from_checkout', 'yes', 'no'),
(249, 'woocommerce_enable_myaccount_registration', 'no', 'no'),
(250, 'woocommerce_enable_checkout_login_reminder', 'yes', 'no'),
(251, 'woocommerce_registration_generate_username', 'yes', 'no'),
(252, 'woocommerce_registration_generate_password', 'no', 'no'),
(253, 'woocommerce_email_from_name', 'babyhallo', 'no'),
(254, 'woocommerce_email_from_address', 'mr.nicholas.goodall@gmail.com', 'no'),
(255, 'woocommerce_email_header_image', '', 'no'),
(256, 'woocommerce_email_footer_text', 'babyhallo - Powered by WooCommerce', 'no'),
(257, 'woocommerce_email_base_color', '#557da1', 'no'),
(258, 'woocommerce_email_background_color', '#f5f5f5', 'no'),
(259, 'woocommerce_email_body_background_color', '#fdfdfd', 'no'),
(260, 'woocommerce_email_text_color', '#505050', 'no'),
(261, 'woocommerce_api_enabled', 'yes', 'yes'),
(263, 'woocommerce_admin_notices', 'a:1:{i:0;s:7:"install";}', 'yes'),
(266, 'woocommerce_db_version', '2.4.7', 'yes'),
(267, 'woocommerce_version', '2.4.7', 'yes'),
(269, 'woocommerce_language_pack_version', 'a:2:{i:0;s:5:"2.4.7";i:1;s:5:"en_GB";}', 'yes'),
(275, 'job_listing_type_children', 'a:0:{}', 'yes'),
(276, 'job_manager_installed_terms', '1', 'yes') ;
INSERT INTO `wp_options` ( `option_id`, `option_name`, `option_value`, `autoload`) VALUES
(277, 'job_manager_enable_categories', '1', 'yes'),
(280, 'wp_job_manager_version', '1.23.9', 'yes'),
(285, 'wc_bookings_version', '1.7.13', 'yes'),
(286, 'tribe_last_save_post', '1446216084', 'yes'),
(289, 'tribe_events_calendar_options', 'a:8:{s:16:"tribeEnableViews";a:5:{i:0;s:4:"list";i:1;s:5:"month";i:2;s:4:"week";i:3;s:3:"day";i:4;s:5:"photo";}s:14:"schema-version";s:6:"3.12.3";s:27:"recurring_events_are_hidden";s:7:"exposed";s:21:"previous_ecp_versions";a:1:{i:0;s:1:"0";}s:18:"latest_ecp_version";s:6:"3.12.3";s:29:"disable_metabox_custom_fields";s:4:"hide";s:18:"pro-schema-version";s:6:"3.12.4";s:19:"last-update-message";s:6:"3.12.3";}', 'yes'),
(295, 'pods_framework_version', '2.5.5', 'yes'),
(296, 'pods_framework_db_version', '2.3.5', 'yes'),
(310, 'facetwp_settings', '{"facets":[{"label":"Categories","name":"categories","type":"checkboxes","source":"tax\\/category","parent_term":"","orderby":"count","operator":"and","hierarchical":"no","ghosts":"no","preserve_ghosts":"no","count":"10"}],"templates":[{"label":"Default","name":"default","query":"<?php\\nreturn array(\\n    \'post_type\' => \'any\',\\n    \'posts_per_page\' => 15,\\n);","template":"<?php while ( have_posts() ) : the_post(); ?>\\n    <div><a href=\\"<?php the_permalink(); ?>\\"><?php the_title(); ?><\\/a><\\/div>\\n<?php endwhile; ?>"}],"settings":{"permalink_type":"get","thousands_separator":",","decimal_separator":"."}}', 'yes'),
(311, 'facetwp_version', '2.2.6', 'yes'),
(312, 'WP_Router_route_hash', 'a9dc694584be3afbd3769eacbb582e16', 'yes'),
(318, 'eab-codex-search-submenu', 'yes', 'yes'),
(319, 'eab-admin-searches', 'yes', 'yes'),
(320, 'jmfe_output_wpautop', 's:45:"a:2:{i:0;s:9:"wp-editor";i:1;s:8:"textarea";}";', 'yes'),
(321, 'wp_job_manager_field_editor_version', '1.3.8', 'yes'),
(322, 'jmfe_update_origin', '1.3.8', 'yes'),
(323, 'jmfe_set_core_company_auto_output', '1.3.8', 'yes'),
(324, 'jmfe_enable_required_label', '0', 'yes'),
(325, 'jmfe_enable_optional_label', '0', 'yes'),
(326, 'jmfe_enable_job_submit_button', '0', 'yes'),
(327, 'jmfe_recaptcha_label', 'Are you human?', 'yes'),
(328, 'jmfe_recaptcha_enable_job', '0', 'yes'),
(329, 'jmfe_fields_dp_custom', '', 'yes'),
(330, 'jmfe_fields_dp_i18n', '0', 'yes'),
(331, 'jmfe_enable_bug_reporter', '0', 'yes'),
(332, 'jmfe_disable_license_deactivate', '0', 'yes'),
(333, 'jmfe_field_dump', '0', 'yes'),
(334, 'wp-job-manager-field-editor_instance', 'sCZn24GOCIiu', 'yes'),
(335, 'job_manager_per_page', '10', 'yes'),
(336, 'job_manager_hide_filled_positions', '', 'yes'),
(337, 'job_manager_hide_expired_content', '1', 'yes'),
(338, 'job_manager_enable_default_category_multiselect', '', 'yes'),
(339, 'job_manager_category_filter_type', 'any', 'yes'),
(340, 'job_manager_regions_filter', '', 'yes'),
(341, 'job_manager_user_requires_account', '1', 'yes'),
(342, 'job_manager_enable_registration', '1', 'yes'),
(343, 'job_manager_generate_username_from_email', '1', 'yes'),
(344, 'job_manager_registration_role', 'shop_manager', 'yes'),
(345, 'job_manager_submission_requires_approval', '', 'yes'),
(346, 'job_manager_user_can_edit_pending_submissions', '', 'yes'),
(347, 'job_manager_submission_duration', '', 'yes'),
(348, 'job_manager_allowed_application_method', 'email', 'yes'),
(349, 'job_manager_submit_job_form_page_id', '51', 'yes'),
(350, 'job_manager_job_dashboard_page_id', '39', 'yes'),
(351, 'job_manager_jobs_page_id', '49', 'yes'),
(352, 'wpjmel_enable_city_suggest', '1', 'yes'),
(353, 'wpjmel_enable_map', '1', 'yes'),
(354, 'wpjmel_map_start_location', '', 'yes'),
(355, 'wp-job-manager-extended-location', '', 'yes'),
(356, 'wpjmp_select_products_text', 'Select Your Services & Products', 'yes'),
(357, 'wpjmp_listing_products_text', 'Listing products', 'yes'),
(358, 'wp-job-manager-products', '6477c40a5b3ad8a669f635a079365d01', 'yes'),
(359, 'Tribe__Events__Community__Schemaschema_version', '3', 'yes'),
(374, 'woocommerce_meta_box_errors', 'a:0:{}', 'yes'),
(391, 'theme_mods_listify-child', 'a:8:{i:0;b:0;s:18:"nav_menu_locations";a:4:{s:7:"primary";i:12;s:9:"secondary";i:13;s:8:"tertiary";i:0;s:6:"social";i:0;}s:14:"label-singular";s:7:"Midwife";s:12:"label-plural";s:8:"Midwives";s:11:"region-bias";s:2:"GB";s:22:"listing-archive-output";s:7:"results";s:8:"nav-cart";b:0;s:12:"nav-megamenu";s:4:"none";}', 'yes'),
(393, 'external_updates-events-calendar-pro', 'O:8:"stdClass":3:{s:9:"lastCheck";i:1446215563;s:14:"checkedVersion";s:6:"3.12.4";s:6:"update";N;}', 'yes'),
(394, 'external_updates-events-community', 'O:8:"stdClass":3:{s:9:"lastCheck";i:1446215563;s:14:"checkedVersion";s:4:"3.12";s:6:"update";N;}', 'yes'),
(460, 'job_manager_form_contact', '30', 'yes'),
(461, 'job_manager_form_claim', '0', 'yes'),
(462, 'wpjmp_products_limit', 'own', 'yes'),
(463, 'wp-job-manager-products_status', 'valid', 'yes'),
(464, 'wpjmel_start_geo_lat', '40.712784', 'yes'),
(465, 'wpjmel_start_geo_long', '-74.005941', 'yes'),
(469, 'product_measurement_options', '', 'yes'),
(470, 'product_rating_options', '', 'yes'),
(473, 'widget_listify_widget_panel_listing_auhtor', 'a:2:{i:2;a:2:{s:10:"descriptor";s:7:"Midwife";s:9:"biography";s:1:"1";}s:12:"_multiwidget";i:1;}', 'yes'),
(474, 'widget_listify_widget_panel_listing_bookings', 'a:2:{i:2;a:2:{s:5:"title";s:4:"Book";s:4:"icon";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(475, 'widget_calendar', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(476, 'widget_jmfe_widget', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(477, 'widget_nav_menu', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(478, 'widget_tribe-mini-calendar', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(479, 'widget_tribe-events-countdown-widget', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(480, 'widget_tribe-events-venue-widget', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(481, 'widget_tribe-events-adv-list-widget', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(482, 'widget_listify_widget_panel_listing_business_hours', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(483, 'widget_listify_widget_panel_listing_content', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(484, 'widget_listify_widget_panel_listing_map', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(485, 'widget_listify_widget_panel_listing_gallery', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(486, 'widget_listify_widget_panel_listing_gallery_slider', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(487, 'widget_listify_widget_panel_listing_products_main', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(488, 'widget_listify_widget_panel_listing_products', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(489, 'widget_listify_widget_panel_listing_comments', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(490, 'widget_listify_widget_panel_listing_social_profiles', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(491, 'widget_listify_widget_panel_listing_tags', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(492, 'widget_listify_widget_panel_listing_video', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(493, 'widget_listify_widget_feature_callout', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(494, 'widget_listify_widget_features', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(495, 'widget_listify_widget_taxonomy_image_grid', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(496, 'widget_listify_widget_map_listings', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(497, 'widget_listify_widget_recent_listings', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(498, 'widget_listify_widget_search_listings', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(499, 'widget_listify_widget_tabbed_listings', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(500, 'widget_listify_widget_taxonomy_term_lists', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(501, 'widget_listify_widget_ad', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(502, 'widget_pages', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(503, 'widget_pods_widget_field', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(504, 'widget_pods_widget_form', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(505, 'widget_pods_widget_list', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(506, 'widget_pods_widget_single', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(507, 'widget_pods_widget_view', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(509, 'widget_tag_cloud', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes') ;
INSERT INTO `wp_options` ( `option_id`, `option_name`, `option_value`, `autoload`) VALUES
(511, 'widget_woocommerce_widget_cart', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(512, 'widget_woocommerce_layered_nav', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(513, 'widget_woocommerce_layered_nav_filters', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(514, 'widget_woocommerce_price_filter', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(515, 'widget_woocommerce_product_categories', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(516, 'widget_woocommerce_products', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(517, 'widget_woocommerce_product_search', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(518, 'widget_woocommerce_product_tag_cloud', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(519, 'widget_product_vendors', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(520, 'widget_woocommerce_recently_viewed_products', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(521, 'widget_woocommerce_recent_reviews', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(522, 'widget_woocommerce_top_rated_products', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(523, 'widget_wp_user_avatar_profile', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(541, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:"auto_add";a:0:{}}', 'yes'),
(547, 'woocommerce_permalinks', 'a:4:{s:13:"category_base";s:0:"";s:8:"tag_base";s:0:"";s:14:"attribute_base";s:0:"";s:12:"product_base";s:8:"/product";}', 'yes'),
(549, 'rewrite_rules', 'a:414:{s:35:"^events/community/edit/venue/(\\d+)$";s:65:"index.php?tribe_event_id=$matches[1]&WP_Route=ce-edit-venue-route";s:39:"^events/community/edit/organizer/(\\d+)$";s:69:"index.php?tribe_event_id=$matches[1]&WP_Route=ce-edit-organizer-route";s:37:"^events/community/edit/event/(\\d+/?)$";s:69:"index.php?tribe_community_event_id=$matches[1]&WP_Route=ce-edit-route";s:29:"^events/community/edit/(\\d+)$";s:62:"index.php?tribe_id=$matches[1]&WP_Route=ce-edit-redirect-route";s:22:"^events/community/add$";s:31:"index.php?WP_Route=ce-add-route";s:19:"events/community/?$";s:43:"index.php?WP_Route=ce-redirect-to-add-route";s:31:"^events/community/delete/(\\d+)$";s:61:"index.php?tribe_event_id=$matches[1]&WP_Route=ce-delete-route";s:39:"^events/community/list(/page/(\\d+))?/?$";s:49:"index.php?page=$matches[2]&WP_Route=ce-list-route";s:17:"^wp_router/(.*?)$";s:63:"index.php?sample_argument=$matches[1]&WP_Route=wp-router-sample";s:10:"events/map";s:49:"index.php?post_type=tribe_events&eventDisplay=map";s:45:"(.*)events/category/(?:[^/]+/)*([^/]+)/map/?$";s:78:"index.php?tribe_events_cat=$matches[2]&post_type=tribe_events&eventDisplay=map";s:29:"(.*)events/tag/([^/]+)/map/?$";s:65:"index.php?tag=$matches[2]&post_type=tribe_events&eventDisplay=map";s:22:"(?:events)/(?:week)/?$";s:50:"index.php?post_type=tribe_events&eventDisplay=week";s:30:"(?:events)/(?:week)/(\\d{2})/?$";s:72:"index.php?post_type=tribe_events&eventDisplay=week&eventDate=$matches[1]";s:42:"(?:events)/(?:week)/(\\d{4}-\\d{2}-\\d{2})/?$";s:72:"index.php?post_type=tribe_events&eventDisplay=week&eventDate=$matches[1]";s:54:"(?:events)/(?:category)/(?:[^/]+/)*([^/]+)/(?:week)/?$";s:79:"index.php?post_type=tribe_events&tribe_events_cat=$matches[1]&eventDisplay=week";s:74:"(?:events)/(?:category)/(?:[^/]+/)*([^/]+)/(?:week)/(\\d{4}-\\d{2}-\\d{2})/?$";s:101:"index.php?post_type=tribe_events&tribe_events_cat=$matches[1]&eventDisplay=week&eventDate=$matches[2]";s:38:"(?:events)/(?:tag)/([^/]+)/(?:week)/?$";s:66:"index.php?post_type=tribe_events&tag=$matches[1]&eventDisplay=week";s:58:"(?:events)/(?:tag)/([^/]+)/(?:week)/(\\d{4}-\\d{2}-\\d{2})/?$";s:88:"index.php?post_type=tribe_events&tag=$matches[1]&eventDisplay=week&eventDate=$matches[2]";s:23:"(?:events)/(?:photo)/?$";s:51:"index.php?post_type=tribe_events&eventDisplay=photo";s:43:"(?:events)/(?:photo)/(\\d{4}-\\d{2}-\\d{2})/?$";s:73:"index.php?post_type=tribe_events&eventDisplay=photo&eventDate=$matches[1]";s:55:"(?:events)/(?:category)/(?:[^/]+/)*([^/]+)/(?:photo)/?$";s:80:"index.php?post_type=tribe_events&tribe_events_cat=$matches[1]&eventDisplay=photo";s:39:"(?:events)/(?:tag)/([^/]+)/(?:photo)/?$";s:67:"index.php?post_type=tribe_events&tag=$matches[1]&eventDisplay=photo";s:40:"(?:event)/([^/]+)/(\\d{4}-\\d{2}-\\d{2})/?$";s:56:"index.php?tribe_events=$matches[1]&eventDate=$matches[2]";s:28:"(?:event)/([^/]+)/(?:all)/?$";s:74:"index.php?tribe_events=$matches[1]&post_type=tribe_events&eventDisplay=all";s:45:"(?:event)/([^/]+)/(\\d{4}-\\d{2}-\\d{2})/ical/?$";s:63:"index.php?tribe_events=$matches[1]&eventDate=$matches[2]&ical=1";s:25:"(?:event)/([^/]+)/ical/?$";s:56:"index.php?ical=1&name=$matches[1]&post_type=tribe_events";s:28:"(?:events)/(?:page)/(\\d+)/?$";s:68:"index.php?post_type=tribe_events&eventDisplay=list&paged=$matches[1]";s:38:"(?:events)/(feed|rdf|rss|rss2|atom)/?$";s:67:"index.php?post_type=tribe_events&eventDisplay=list&feed=$matches[1]";s:23:"(?:events)/(?:month)/?$";s:51:"index.php?post_type=tribe_events&eventDisplay=month";s:37:"(?:events)/(?:list)/(?:page)/(\\d+)/?$";s:68:"index.php?post_type=tribe_events&eventDisplay=list&paged=$matches[1]";s:22:"(?:events)/(?:list)/?$";s:50:"index.php?post_type=tribe_events&eventDisplay=list";s:23:"(?:events)/(?:today)/?$";s:49:"index.php?post_type=tribe_events&eventDisplay=day";s:27:"(?:events)/(\\d{4}-\\d{2})/?$";s:73:"index.php?post_type=tribe_events&eventDisplay=month&eventDate=$matches[1]";s:33:"(?:events)/(\\d{4}-\\d{2}-\\d{2})/?$";s:71:"index.php?post_type=tribe_events&eventDisplay=day&eventDate=$matches[1]";s:13:"(?:events)/?$";s:53:"index.php?post_type=tribe_events&eventDisplay=default";s:18:"(?:events)/ical/?$";s:39:"index.php?post_type=tribe_events&ical=1";s:38:"(?:events)/(\\d{4}-\\d{2}-\\d{2})/ical/?$";s:78:"index.php?post_type=tribe_events&ical=1&eventDisplay=day&eventDate=$matches[1]";s:60:"(?:events)/(?:category)/(?:[^/]+/)*([^/]+)/(?:page)/(\\d+)/?$";s:97:"index.php?post_type=tribe_events&tribe_events_cat=$matches[1]&eventDisplay=list&paged=$matches[2]";s:55:"(?:events)/(?:category)/(?:[^/]+/)*([^/]+)/(?:month)/?$";s:80:"index.php?post_type=tribe_events&tribe_events_cat=$matches[1]&eventDisplay=month";s:69:"(?:events)/(?:category)/(?:[^/]+/)*([^/]+)/(?:list)/(?:page)/(\\d+)/?$";s:97:"index.php?post_type=tribe_events&tribe_events_cat=$matches[1]&eventDisplay=list&paged=$matches[2]";s:54:"(?:events)/(?:category)/(?:[^/]+/)*([^/]+)/(?:list)/?$";s:79:"index.php?post_type=tribe_events&tribe_events_cat=$matches[1]&eventDisplay=list";s:55:"(?:events)/(?:category)/(?:[^/]+/)*([^/]+)/(?:today)/?$";s:78:"index.php?post_type=tribe_events&tribe_events_cat=$matches[1]&eventDisplay=day";s:73:"(?:events)/(?:category)/(?:[^/]+/)*([^/]+)/(?:day)/(\\d{4}-\\d{2}-\\d{2})/?$";s:100:"index.php?post_type=tribe_events&tribe_events_cat=$matches[1]&eventDisplay=day&eventDate=$matches[2]";s:59:"(?:events)/(?:category)/(?:[^/]+/)*([^/]+)/(\\d{4}-\\d{2})/?$";s:102:"index.php?post_type=tribe_events&tribe_events_cat=$matches[1]&eventDisplay=month&eventDate=$matches[2]";s:65:"(?:events)/(?:category)/(?:[^/]+/)*([^/]+)/(\\d{4}-\\d{2}-\\d{2})/?$";s:100:"index.php?post_type=tribe_events&tribe_events_cat=$matches[1]&eventDisplay=day&eventDate=$matches[2]";s:50:"(?:events)/(?:category)/(?:[^/]+/)*([^/]+)/feed/?$";s:89:"index.php?post_type=tribe_events&tribe_events_cat=$matches[1]&eventDisplay=list&feed=rss2";s:50:"(?:events)/(?:category)/(?:[^/]+/)*([^/]+)/ical/?$";s:68:"index.php?post_type=tribe_events&tribe_events_cat=$matches[1]&ical=1";s:75:"(?:events)/(?:category)/(?:[^/]+/)*([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:78:"index.php?post_type=tribe_events&tribe_events_cat=$matches[1]&feed=$matches[2]";s:45:"(?:events)/(?:category)/(?:[^/]+/)*([^/]+)/?$";s:80:"index.php?post_type=tribe_events&tribe_events_cat=$matches[1]&eventDisplay=month";s:44:"(?:events)/(?:tag)/([^/]+)/(?:page)/(\\d+)/?$";s:84:"index.php?post_type=tribe_events&tag=$matches[1]&eventDisplay=list&paged=$matches[2]";s:39:"(?:events)/(?:tag)/([^/]+)/(?:month)/?$";s:67:"index.php?post_type=tribe_events&tag=$matches[1]&eventDisplay=month";s:53:"(?:events)/(?:tag)/([^/]+)/(?:list)/(?:page)/(\\d+)/?$";s:84:"index.php?post_type=tribe_events&tag=$matches[1]&eventDisplay=list&paged=$matches[2]";s:38:"(?:events)/(?:tag)/([^/]+)/(?:list)/?$";s:66:"index.php?post_type=tribe_events&tag=$matches[1]&eventDisplay=list";s:39:"(?:events)/(?:tag)/([^/]+)/(?:today)/?$";s:65:"index.php?post_type=tribe_events&tag=$matches[1]&eventDisplay=day";s:57:"(?:events)/(?:tag)/([^/]+)/(?:day)/(\\d{4}-\\d{2}-\\d{2})/?$";s:87:"index.php?post_type=tribe_events&tag=$matches[1]&eventDisplay=day&eventDate=$matches[2]";s:43:"(?:events)/(?:tag)/([^/]+)/(\\d{4}-\\d{2})/?$";s:89:"index.php?post_type=tribe_events&tag=$matches[1]&eventDisplay=month&eventDate=$matches[2]";s:49:"(?:events)/(?:tag)/([^/]+)/(\\d{4}-\\d{2}-\\d{2})/?$";s:87:"index.php?post_type=tribe_events&tag=$matches[1]&eventDisplay=day&eventDate=$matches[2]";s:34:"(?:events)/(?:tag)/([^/]+)/feed/?$";s:76:"index.php?post_type=tribe_events&tag=$matches[1]&eventDisplay=list&feed=rss2";s:34:"(?:events)/(?:tag)/([^/]+)/ical/?$";s:55:"index.php?post_type=tribe_events&tag=$matches[1]&ical=1";s:59:"(?:events)/(?:tag)/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:65:"index.php?post_type=tribe_events&tag=$matches[1]&feed=$matches[2]";s:29:"(?:events)/(?:tag)/([^/]+)/?$";s:67:"index.php?post_type=tribe_events&tag=$matches[1]&eventDisplay=month";s:12:"WP_Router/?$";s:34:"index.php?post_type=wp_router_page";s:22:"^wc-api/v([1-3]{1})/?$";s:51:"index.php?wc-api-version=$matches[1]&wc-api-route=/";s:24:"^wc-api/v([1-3]{1})(.*)?";s:61:"index.php?wc-api-version=$matches[1]&wc-api-route=$matches[2]";s:24:"^wc-auth/v([1]{1})/(.*)?";s:63:"index.php?wc-auth-version=$matches[1]&wc-auth-route=$matches[2]";s:11:"listings/?$";s:31:"index.php?post_type=job_listing";s:41:"listings/feed/(feed|rdf|rss|rss2|atom)/?$";s:48:"index.php?post_type=job_listing&feed=$matches[1]";s:36:"listings/(feed|rdf|rss|rss2|atom)/?$";s:48:"index.php?post_type=job_listing&feed=$matches[1]";s:7:"shop/?$";s:27:"index.php?post_type=product";s:46:"shop/feed/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:44:"index.php?post_type=product&feed=$matches[1]";s:41:"shop/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:44:"index.php?post_type=product&feed=$matches[1]";s:24:"shop/page/([0-9]{1,})/?$";s:45:"index.php?post_type=product&paged=$matches[1]";s:8:"event/?$";s:32:"index.php?post_type=tribe_events";s:47:"event/feed/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:49:"index.php?post_type=tribe_events&feed=$matches[1]";s:42:"event/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:49:"index.php?post_type=tribe_events&feed=$matches[1]";s:25:"event/page/([0-9]{1,})/?$";s:50:"index.php?post_type=tribe_events&paged=$matches[1]";s:17:"jm-ajax/([^/]*)/?";s:29:"index.php?jm-ajax=$matches[1]";s:27:"index.php/jm-ajax/([^/]*)/?";s:29:"index.php?jm-ajax=$matches[1]";s:18:"shop_commission/?$";s:35:"index.php?post_type=shop_commission";s:57:"shop_commission/feed/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:52:"index.php?post_type=shop_commission&feed=$matches[1]";s:52:"shop_commission/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:52:"index.php?post_type=shop_commission&feed=$matches[1]";s:35:"shop_commission/page/([0-9]{1,})/?$";s:53:"index.php?post_type=shop_commission&paged=$matches[1]";s:37:"WP_Router/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:47:"WP_Router/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:76:"WP_Router/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:71:"WP_Router/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:62:"WP_Router/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:30:"WP_Router/([^/]+)/trackback/?$";s:41:"index.php?wp_router_page=$matches[1]&tb=1";s:38:"WP_Router/([^/]+)/page/?([0-9]{1,})/?$";s:54:"index.php?wp_router_page=$matches[1]&paged=$matches[2]";s:45:"WP_Router/([^/]+)/comment-page-([0-9]{1,})/?$";s:54:"index.php?wp_router_page=$matches[1]&cpage=$matches[2]";s:35:"WP_Router/([^/]+)/wc-api(/(.*))?/?$";s:55:"index.php?wp_router_page=$matches[1]&wc-api=$matches[3]";s:36:"WP_Router/([^/]+)/gallery(/(.*))?/?$";s:56:"index.php?wp_router_page=$matches[1]&gallery=$matches[3]";s:41:"WP_Router/[^/]+/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:52:"WP_Router/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:30:"WP_Router/([^/]+)(/[0-9]+)?/?$";s:53:"index.php?wp_router_page=$matches[1]&page=$matches[2]";s:26:"WP_Router/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:36:"WP_Router/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:65:"WP_Router/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:60:"WP_Router/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:51:"WP_Router/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:56:"category/(.+?)/feed/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:51:"category/(.+?)/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:35:"category/(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:32:"category/(.+?)/wc-api(/(.*))?/?$";s:54:"index.php?category_name=$matches[1]&wc-api=$matches[3]";s:17:"category/(.+?)/?$";s:35:"index.php?category_name=$matches[1]";s:53:"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:48:"tag/([^/]+)/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:32:"tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:29:"tag/([^/]+)/wc-api(/(.*))?/?$";s:44:"index.php?tag=$matches[1]&wc-api=$matches[3]";s:14:"tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:54:"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:49:"type/([^/]+)/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:33:"type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:15:"type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:46:"jmfe_custom_fields/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:56:"jmfe_custom_fields/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:85:"jmfe_custom_fields/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:80:"jmfe_custom_fields/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:71:"jmfe_custom_fields/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:39:"jmfe_custom_fields/([^/]+)/trackback/?$";s:45:"index.php?jmfe_custom_fields=$matches[1]&tb=1";s:47:"jmfe_custom_fields/([^/]+)/page/?([0-9]{1,})/?$";s:58:"index.php?jmfe_custom_fields=$matches[1]&paged=$matches[2]";s:54:"jmfe_custom_fields/([^/]+)/comment-page-([0-9]{1,})/?$";s:58:"index.php?jmfe_custom_fields=$matches[1]&cpage=$matches[2]";s:44:"jmfe_custom_fields/([^/]+)/wc-api(/(.*))?/?$";s:59:"index.php?jmfe_custom_fields=$matches[1]&wc-api=$matches[3]";s:45:"jmfe_custom_fields/([^/]+)/gallery(/(.*))?/?$";s:60:"index.php?jmfe_custom_fields=$matches[1]&gallery=$matches[3]";s:50:"jmfe_custom_fields/[^/]+/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:61:"jmfe_custom_fields/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:39:"jmfe_custom_fields/([^/]+)(/[0-9]+)?/?$";s:57:"index.php?jmfe_custom_fields=$matches[1]&page=$matches[2]";s:35:"jmfe_custom_fields/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:45:"jmfe_custom_fields/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:74:"jmfe_custom_fields/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:69:"jmfe_custom_fields/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:60:"jmfe_custom_fields/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:64:"listing-region/([^/]+)/feed/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:57:"index.php?job_listing_region=$matches[1]&feed=$matches[2]";s:59:"listing-region/([^/]+)/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:57:"index.php?job_listing_region=$matches[1]&feed=$matches[2]";s:43:"listing-region/([^/]+)/page/?([0-9]{1,})/?$";s:58:"index.php?job_listing_region=$matches[1]&paged=$matches[2]";s:25:"listing-region/([^/]+)/?$";s:40:"index.php?job_listing_region=$matches[1]";s:66:"listing-category/([^/]+)/feed/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:59:"index.php?job_listing_category=$matches[1]&feed=$matches[2]";s:61:"listing-category/([^/]+)/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:59:"index.php?job_listing_category=$matches[1]&feed=$matches[2]";s:45:"listing-category/([^/]+)/page/?([0-9]{1,})/?$";s:60:"index.php?job_listing_category=$matches[1]&paged=$matches[2]";s:27:"listing-category/([^/]+)/?$";s:42:"index.php?job_listing_category=$matches[1]";s:66:"job_listing_type/([^/]+)/feed/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:55:"index.php?job_listing_type=$matches[1]&feed=$matches[2]";s:61:"job_listing_type/([^/]+)/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:55:"index.php?job_listing_type=$matches[1]&feed=$matches[2]";s:45:"job_listing_type/([^/]+)/page/?([0-9]{1,})/?$";s:56:"index.php?job_listing_type=$matches[1]&paged=$matches[2]";s:27:"job_listing_type/([^/]+)/?$";s:38:"index.php?job_listing_type=$matches[1]";s:35:"listing/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:45:"listing/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:74:"listing/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:69:"listing/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:60:"listing/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:28:"listing/([^/]+)/trackback/?$";s:38:"index.php?job_listing=$matches[1]&tb=1";s:57:"listing/([^/]+)/feed/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:50:"index.php?job_listing=$matches[1]&feed=$matches[2]";s:52:"listing/([^/]+)/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:50:"index.php?job_listing=$matches[1]&feed=$matches[2]";s:36:"listing/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?job_listing=$matches[1]&paged=$matches[2]";s:43:"listing/([^/]+)/comment-page-([0-9]{1,})/?$";s:51:"index.php?job_listing=$matches[1]&cpage=$matches[2]";s:33:"listing/([^/]+)/wc-api(/(.*))?/?$";s:52:"index.php?job_listing=$matches[1]&wc-api=$matches[3]";s:34:"listing/([^/]+)/gallery(/(.*))?/?$";s:53:"index.php?job_listing=$matches[1]&gallery=$matches[3]";s:39:"listing/[^/]+/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:50:"listing/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:28:"listing/([^/]+)(/[0-9]+)?/?$";s:50:"index.php?job_listing=$matches[1]&page=$matches[2]";s:24:"listing/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:34:"listing/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:63:"listing/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:58:"listing/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:49:"listing/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:64:"product-category/(.+?)/feed/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:50:"index.php?product_cat=$matches[1]&feed=$matches[2]";s:59:"product-category/(.+?)/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:50:"index.php?product_cat=$matches[1]&feed=$matches[2]";s:43:"product-category/(.+?)/page/?([0-9]{1,})/?$";s:51:"index.php?product_cat=$matches[1]&paged=$matches[2]";s:25:"product-category/(.+?)/?$";s:33:"index.php?product_cat=$matches[1]";s:61:"product-tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:50:"index.php?product_tag=$matches[1]&feed=$matches[2]";s:56:"product-tag/([^/]+)/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:50:"index.php?product_tag=$matches[1]&feed=$matches[2]";s:40:"product-tag/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?product_tag=$matches[1]&paged=$matches[2]";s:22:"product-tag/([^/]+)/?$";s:33:"index.php?product_tag=$matches[1]";s:35:"product/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:45:"product/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:74:"product/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:69:"product/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:60:"product/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:28:"product/([^/]+)/trackback/?$";s:34:"index.php?product=$matches[1]&tb=1";s:57:"product/([^/]+)/feed/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:46:"index.php?product=$matches[1]&feed=$matches[2]";s:52:"product/([^/]+)/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:46:"index.php?product=$matches[1]&feed=$matches[2]";s:36:"product/([^/]+)/page/?([0-9]{1,})/?$";s:47:"index.php?product=$matches[1]&paged=$matches[2]";s:43:"product/([^/]+)/comment-page-([0-9]{1,})/?$";s:47:"index.php?product=$matches[1]&cpage=$matches[2]";s:33:"product/([^/]+)/wc-api(/(.*))?/?$";s:48:"index.php?product=$matches[1]&wc-api=$matches[3]";s:34:"product/([^/]+)/gallery(/(.*))?/?$";s:49:"index.php?product=$matches[1]&gallery=$matches[3]";s:39:"product/[^/]+/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:50:"product/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:28:"product/([^/]+)(/[0-9]+)?/?$";s:46:"index.php?product=$matches[1]&page=$matches[2]";s:24:"product/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:34:"product/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:63:"product/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:58:"product/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:49:"product/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:45:"product_variation/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:55:"product_variation/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:84:"product_variation/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:79:"product_variation/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:70:"product_variation/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:38:"product_variation/([^/]+)/trackback/?$";s:44:"index.php?product_variation=$matches[1]&tb=1";s:46:"product_variation/([^/]+)/page/?([0-9]{1,})/?$";s:57:"index.php?product_variation=$matches[1]&paged=$matches[2]";s:53:"product_variation/([^/]+)/comment-page-([0-9]{1,})/?$";s:57:"index.php?product_variation=$matches[1]&cpage=$matches[2]";s:43:"product_variation/([^/]+)/wc-api(/(.*))?/?$";s:58:"index.php?product_variation=$matches[1]&wc-api=$matches[3]";s:44:"product_variation/([^/]+)/gallery(/(.*))?/?$";s:59:"index.php?product_variation=$matches[1]&gallery=$matches[3]";s:49:"product_variation/[^/]+/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:60:"product_variation/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:38:"product_variation/([^/]+)(/[0-9]+)?/?$";s:56:"index.php?product_variation=$matches[1]&page=$matches[2]";s:34:"product_variation/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:44:"product_variation/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:73:"product_variation/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:68:"product_variation/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:59:"product_variation/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:45:"shop_order_refund/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:55:"shop_order_refund/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:84:"shop_order_refund/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:79:"shop_order_refund/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:70:"shop_order_refund/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:38:"shop_order_refund/([^/]+)/trackback/?$";s:44:"index.php?shop_order_refund=$matches[1]&tb=1";s:46:"shop_order_refund/([^/]+)/page/?([0-9]{1,})/?$";s:57:"index.php?shop_order_refund=$matches[1]&paged=$matches[2]";s:53:"shop_order_refund/([^/]+)/comment-page-([0-9]{1,})/?$";s:57:"index.php?shop_order_refund=$matches[1]&cpage=$matches[2]";s:43:"shop_order_refund/([^/]+)/wc-api(/(.*))?/?$";s:58:"index.php?shop_order_refund=$matches[1]&wc-api=$matches[3]";s:44:"shop_order_refund/([^/]+)/gallery(/(.*))?/?$";s:59:"index.php?shop_order_refund=$matches[1]&gallery=$matches[3]";s:49:"shop_order_refund/[^/]+/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:60:"shop_order_refund/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:38:"shop_order_refund/([^/]+)(/[0-9]+)?/?$";s:56:"index.php?shop_order_refund=$matches[1]&page=$matches[2]";s:34:"shop_order_refund/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:44:"shop_order_refund/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:73:"shop_order_refund/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:68:"shop_order_refund/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:59:"shop_order_refund/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:33:"event/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:43:"event/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:72:"event/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:67:"event/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:58:"event/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:26:"event/([^/]+)/trackback/?$";s:39:"index.php?tribe_events=$matches[1]&tb=1";s:55:"event/([^/]+)/feed/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:51:"index.php?tribe_events=$matches[1]&feed=$matches[2]";s:50:"event/([^/]+)/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:51:"index.php?tribe_events=$matches[1]&feed=$matches[2]";s:34:"event/([^/]+)/page/?([0-9]{1,})/?$";s:52:"index.php?tribe_events=$matches[1]&paged=$matches[2]";s:41:"event/([^/]+)/comment-page-([0-9]{1,})/?$";s:52:"index.php?tribe_events=$matches[1]&cpage=$matches[2]";s:31:"event/([^/]+)/wc-api(/(.*))?/?$";s:53:"index.php?tribe_events=$matches[1]&wc-api=$matches[3]";s:32:"event/([^/]+)/gallery(/(.*))?/?$";s:54:"index.php?tribe_events=$matches[1]&gallery=$matches[3]";s:37:"event/[^/]+/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:48:"event/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:26:"event/([^/]+)(/[0-9]+)?/?$";s:51:"index.php?tribe_events=$matches[1]&page=$matches[2]";s:22:"event/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:32:"event/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:61:"event/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:56:"event/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:47:"event/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:33:"venue/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:43:"venue/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:72:"venue/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:67:"venue/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:58:"venue/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:26:"venue/([^/]+)/trackback/?$";s:38:"index.php?tribe_venue=$matches[1]&tb=1";s:34:"venue/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?tribe_venue=$matches[1]&paged=$matches[2]";s:41:"venue/([^/]+)/comment-page-([0-9]{1,})/?$";s:51:"index.php?tribe_venue=$matches[1]&cpage=$matches[2]";s:31:"venue/([^/]+)/wc-api(/(.*))?/?$";s:52:"index.php?tribe_venue=$matches[1]&wc-api=$matches[3]";s:32:"venue/([^/]+)/gallery(/(.*))?/?$";s:53:"index.php?tribe_venue=$matches[1]&gallery=$matches[3]";s:37:"venue/[^/]+/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:48:"venue/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:26:"venue/([^/]+)(/[0-9]+)?/?$";s:50:"index.php?tribe_venue=$matches[1]&page=$matches[2]";s:22:"venue/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:32:"venue/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:61:"venue/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:56:"venue/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:47:"venue/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:37:"organiser/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:47:"organiser/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:76:"organiser/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:71:"organiser/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:62:"organiser/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:30:"organiser/([^/]+)/trackback/?$";s:42:"index.php?tribe_organizer=$matches[1]&tb=1";s:38:"organiser/([^/]+)/page/?([0-9]{1,})/?$";s:55:"index.php?tribe_organizer=$matches[1]&paged=$matches[2]";s:45:"organiser/([^/]+)/comment-page-([0-9]{1,})/?$";s:55:"index.php?tribe_organizer=$matches[1]&cpage=$matches[2]";s:35:"organiser/([^/]+)/wc-api(/(.*))?/?$";s:56:"index.php?tribe_organizer=$matches[1]&wc-api=$matches[3]";s:36:"organiser/([^/]+)/gallery(/(.*))?/?$";s:57:"index.php?tribe_organizer=$matches[1]&gallery=$matches[3]";s:41:"organiser/[^/]+/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:52:"organiser/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:30:"organiser/([^/]+)(/[0-9]+)?/?$";s:54:"index.php?tribe_organizer=$matches[1]&page=$matches[2]";s:26:"organiser/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:36:"organiser/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:65:"organiser/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:60:"organiser/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:51:"organiser/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:63:"events/category/(.+?)/feed/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:55:"index.php?tribe_events_cat=$matches[1]&feed=$matches[2]";s:58:"events/category/(.+?)/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:55:"index.php?tribe_events_cat=$matches[1]&feed=$matches[2]";s:42:"events/category/(.+?)/page/?([0-9]{1,})/?$";s:56:"index.php?tribe_events_cat=$matches[1]&paged=$matches[2]";s:24:"events/category/(.+?)/?$";s:38:"index.php?tribe_events_cat=$matches[1]";s:43:"bookable_person/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:53:"bookable_person/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:82:"bookable_person/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:77:"bookable_person/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:68:"bookable_person/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:36:"bookable_person/([^/]+)/trackback/?$";s:42:"index.php?bookable_person=$matches[1]&tb=1";s:44:"bookable_person/([^/]+)/page/?([0-9]{1,})/?$";s:55:"index.php?bookable_person=$matches[1]&paged=$matches[2]";s:51:"bookable_person/([^/]+)/comment-page-([0-9]{1,})/?$";s:55:"index.php?bookable_person=$matches[1]&cpage=$matches[2]";s:41:"bookable_person/([^/]+)/wc-api(/(.*))?/?$";s:56:"index.php?bookable_person=$matches[1]&wc-api=$matches[3]";s:42:"bookable_person/([^/]+)/gallery(/(.*))?/?$";s:57:"index.php?bookable_person=$matches[1]&gallery=$matches[3]";s:47:"bookable_person/[^/]+/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:58:"bookable_person/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:36:"bookable_person/([^/]+)(/[0-9]+)?/?$";s:54:"index.php?bookable_person=$matches[1]&page=$matches[2]";s:32:"bookable_person/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:42:"bookable_person/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:71:"bookable_person/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:66:"bookable_person/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:57:"bookable_person/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:56:"vendor/([^/]+)/feed/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:50:"index.php?shop_vendor=$matches[1]&feed=$matches[2]";s:51:"vendor/([^/]+)/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:50:"index.php?shop_vendor=$matches[1]&feed=$matches[2]";s:35:"vendor/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?shop_vendor=$matches[1]&paged=$matches[2]";s:17:"vendor/([^/]+)/?$";s:33:"index.php?shop_vendor=$matches[1]";s:41:"shop_commission/.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:51:"shop_commission/.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:80:"shop_commission/.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:75:"shop_commission/.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:66:"shop_commission/.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:34:"shop_commission/(.+?)/trackback/?$";s:61:"index.php?post_type=shop_commission&pagename=$matches[1]&tb=1";s:63:"shop_commission/(.+?)/feed/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:73:"index.php?post_type=shop_commission&pagename=$matches[1]&feed=$matches[2]";s:58:"shop_commission/(.+?)/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:73:"index.php?post_type=shop_commission&pagename=$matches[1]&feed=$matches[2]";s:42:"shop_commission/(.+?)/page/?([0-9]{1,})/?$";s:74:"index.php?post_type=shop_commission&pagename=$matches[1]&paged=$matches[2]";s:49:"shop_commission/(.+?)/comment-page-([0-9]{1,})/?$";s:74:"index.php?post_type=shop_commission&pagename=$matches[1]&cpage=$matches[2]";s:39:"shop_commission/(.+?)/wc-api(/(.*))?/?$";s:75:"index.php?post_type=shop_commission&pagename=$matches[1]&wc-api=$matches[3]";s:40:"shop_commission/(.+?)/gallery(/(.*))?/?$";s:76:"index.php?post_type=shop_commission&pagename=$matches[1]&gallery=$matches[3]";s:45:"shop_commission/.+?/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:56:"shop_commission/.+?/attachment/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:34:"shop_commission/(.+?)(/[0-9]+)?/?$";s:73:"index.php?post_type=shop_commission&pagename=$matches[1]&page=$matches[2]";s:12:"robots\\.txt$";s:18:"index.php?robots=1";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:20:".*wp-app\\.php(/.*)?$";s:19:"index.php?error=403";s:18:".*wp-register.php$";s:23:"index.php?register=true";s:41:"feed/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:27:"index.php?&feed=$matches[1]";s:36:"(feed|rdf|rss|rss2|atom|job_feed)/?$";s:27:"index.php?&feed=$matches[1]";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:27:"comment-page-([0-9]{1,})/?$";s:39:"index.php?&page_id=46&cpage=$matches[1]";s:17:"wc-api(/(.*))?/?$";s:29:"index.php?&wc-api=$matches[2]";s:20:"order-pay(/(.*))?/?$";s:32:"index.php?&order-pay=$matches[2]";s:25:"order-received(/(.*))?/?$";s:37:"index.php?&order-received=$matches[2]";s:21:"view-order(/(.*))?/?$";s:33:"index.php?&view-order=$matches[2]";s:23:"edit-account(/(.*))?/?$";s:35:"index.php?&edit-account=$matches[2]";s:23:"edit-address(/(.*))?/?$";s:35:"index.php?&edit-address=$matches[2]";s:24:"lost-password(/(.*))?/?$";s:36:"index.php?&lost-password=$matches[2]";s:26:"customer-logout(/(.*))?/?$";s:38:"index.php?&customer-logout=$matches[2]";s:29:"add-payment-method(/(.*))?/?$";s:41:"index.php?&add-payment-method=$matches[2]";s:50:"comments/feed/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:45:"comments/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:26:"comments/wc-api(/(.*))?/?$";s:29:"index.php?&wc-api=$matches[2]";s:53:"search/(.+)/feed/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:48:"search/(.+)/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:29:"search/(.+)/wc-api(/(.*))?/?$";s:42:"index.php?s=$matches[1]&wc-api=$matches[3]";s:14:"search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:56:"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:51:"author/([^/]+)/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:35:"author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:32:"author/([^/]+)/wc-api(/(.*))?/?$";s:52:"index.php?author_name=$matches[1]&wc-api=$matches[3]";s:17:"author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:78:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:73:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:54:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/wc-api(/(.*))?/?$";s:82:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&wc-api=$matches[5]";s:39:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:65:"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:60:"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:44:"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:41:"([0-9]{4})/([0-9]{1,2})/wc-api(/(.*))?/?$";s:66:"index.php?year=$matches[1]&monthnum=$matches[2]&wc-api=$matches[4]";s:26:"([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:52:"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:47:"([0-9]{4})/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:31:"([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:28:"([0-9]{4})/wc-api(/(.*))?/?$";s:45:"index.php?year=$matches[1]&wc-api=$matches[3]";s:13:"([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:27:".?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:".?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:66:".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:61:".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:20:"(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:49:"(.?.+?)/feed/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:44:"(.?.+?)/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:28:"(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:35:"(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:25:"(.?.+?)/wc-api(/(.*))?/?$";s:49:"index.php?pagename=$matches[1]&wc-api=$matches[3]";s:28:"(.?.+?)/order-pay(/(.*))?/?$";s:52:"index.php?pagename=$matches[1]&order-pay=$matches[3]";s:33:"(.?.+?)/order-received(/(.*))?/?$";s:57:"index.php?pagename=$matches[1]&order-received=$matches[3]";s:29:"(.?.+?)/view-order(/(.*))?/?$";s:53:"index.php?pagename=$matches[1]&view-order=$matches[3]";s:31:"(.?.+?)/edit-account(/(.*))?/?$";s:55:"index.php?pagename=$matches[1]&edit-account=$matches[3]";s:31:"(.?.+?)/edit-address(/(.*))?/?$";s:55:"index.php?pagename=$matches[1]&edit-address=$matches[3]";s:32:"(.?.+?)/lost-password(/(.*))?/?$";s:56:"index.php?pagename=$matches[1]&lost-password=$matches[3]";s:34:"(.?.+?)/customer-logout(/(.*))?/?$";s:58:"index.php?pagename=$matches[1]&customer-logout=$matches[3]";s:37:"(.?.+?)/add-payment-method(/(.*))?/?$";s:61:"index.php?pagename=$matches[1]&add-payment-method=$matches[3]";s:26:"(.?.+?)/gallery(/(.*))?/?$";s:50:"index.php?pagename=$matches[1]&gallery=$matches[3]";s:31:".?.+?/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:42:".?.+?/attachment/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:20:"(.?.+?)(/[0-9]+)?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";s:27:"[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:"[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:66:"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:61:"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:20:"([^/]+)/trackback/?$";s:31:"index.php?name=$matches[1]&tb=1";s:49:"([^/]+)/feed/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:44:"([^/]+)/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:28:"([^/]+)/page/?([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&paged=$matches[2]";s:35:"([^/]+)/comment-page-([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&cpage=$matches[2]";s:25:"([^/]+)/wc-api(/(.*))?/?$";s:45:"index.php?name=$matches[1]&wc-api=$matches[3]";s:26:"([^/]+)/gallery(/(.*))?/?$";s:46:"index.php?name=$matches[1]&gallery=$matches[3]";s:31:"[^/]+/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:42:"[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$";s:51:"index.php?attachment=$matches[1]&wc-api=$matches[3]";s:20:"([^/]+)(/[0-9]+)?/?$";s:43:"index.php?name=$matches[1]&page=$matches[2]";s:16:"[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:26:"[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:55:"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:50:"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom|job_feed)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";}', 'yes'),
(552, 'facetwp_activation', '{"status":"error","message":"The license does not exist"}', 'yes'),
(554, 'avatar_default_wp_user_avatar', '', 'yes'),
(555, 'wp_user_avatar_allow_upload', '0', 'yes'),
(556, 'wp_user_avatar_disable_gravatar', '0', 'yes'),
(557, 'wp_user_avatar_edit_avatar', '1', 'yes'),
(558, 'wp_user_avatar_resize_crop', '0', 'yes'),
(559, 'wp_user_avatar_resize_h', '96', 'yes'),
(560, 'wp_user_avatar_resize_upload', '0', 'yes'),
(561, 'wp_user_avatar_resize_w', '96', 'yes'),
(562, 'wp_user_avatar_tinymce', '1', 'yes'),
(563, 'wp_user_avatar_upload_size_limit', '0', 'yes'),
(564, 'wp_user_avatar_default_avatar_updated', '1', 'yes'),
(565, 'wp_user_avatar_users_updated', '1', 'yes'),
(566, 'wp_user_avatar_media_updated', '1', 'yes') ;

#
# End of data contents of table `wp_options`
# --------------------------------------------------------



#
# Delete any existing table `wp_podsrel`
#

DROP TABLE IF EXISTS `wp_podsrel`;


#
# Table structure of table `wp_podsrel`
#

CREATE TABLE `wp_podsrel` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pod_id` int(10) unsigned DEFAULT NULL,
  `field_id` int(10) unsigned DEFAULT NULL,
  `item_id` bigint(20) unsigned DEFAULT NULL,
  `related_pod_id` int(10) unsigned DEFAULT NULL,
  `related_field_id` int(10) unsigned DEFAULT NULL,
  `related_item_id` bigint(20) unsigned DEFAULT NULL,
  `weight` smallint(5) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `field_item_idx` (`field_id`,`item_id`),
  KEY `rel_field_rel_item_idx` (`related_field_id`,`related_item_id`),
  KEY `field_rel_item_idx` (`field_id`,`related_item_id`),
  KEY `rel_field_item_idx` (`related_field_id`,`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `wp_podsrel`
#

#
# End of data contents of table `wp_podsrel`
# --------------------------------------------------------



#
# Delete any existing table `wp_postmeta`
#

DROP TABLE IF EXISTS `wp_postmeta`;


#
# Table structure of table `wp_postmeta`
#

CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `wp_postmeta`
#
INSERT INTO `wp_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 4, '_wp_attached_file', '2015/10/themeforest-9602611-wordpress-directory-theme-listify.zip'),
(3, 4, '_wp_attachment_context', 'upgrader'),
(4, 5, '_wp_attached_file', '2015/10/themeforest-9602611-wordpress-directory-theme-listify-wordpress-theme.zip'),
(5, 5, '_wp_attachment_context', 'upgrader'),
(54, 30, '_form', '<p>Your Name (required)<br />\n    [text* your-name] </p>\n\n<p>Your Email (required)<br />\n    [email* your-email] </p>\n\n<p>Subject<br />\n    [text your-subject] </p>\n\n<p>Your Message<br />\n    [textarea your-message] </p>\n\n<p>[submit "Send"]</p>'),
(55, 30, '_mail', 'a:8:{s:7:"subject";s:14:"[your-subject]";s:6:"sender";s:43:"[your-name] <mr.nicholas.goodall@gmail.com>";s:4:"body";s:168:"From: [your-name] <[your-email]>\nSubject: [your-subject]\n\nMessage Body:\n[your-message]\n\n--\nThis e-mail was sent from a contact form on babyhallo (http://localhost:8888)";s:9:"recipient";s:29:"mr.nicholas.goodall@gmail.com";s:18:"additional_headers";s:22:"Reply-To: [your-email]";s:11:"attachments";s:0:"";s:8:"use_html";i:0;s:13:"exclude_blank";i:0;}'),
(56, 30, '_mail_2', 'a:9:{s:6:"active";b:0;s:7:"subject";s:14:"[your-subject]";s:6:"sender";s:41:"babyhallo <mr.nicholas.goodall@gmail.com>";s:4:"body";s:110:"Message Body:\n[your-message]\n\n--\nThis e-mail was sent from a contact form on babyhallo (http://localhost:8888)";s:9:"recipient";s:12:"[your-email]";s:18:"additional_headers";s:39:"Reply-To: mr.nicholas.goodall@gmail.com";s:11:"attachments";s:0:"";s:8:"use_html";i:0;s:13:"exclude_blank";i:0;}'),
(57, 30, '_messages', 'a:8:{s:12:"mail_sent_ok";s:43:"Your message was sent successfully. Thanks.";s:12:"mail_sent_ng";s:93:"Failed to send your message. Please try later or contact the administrator by another method.";s:16:"validation_error";s:74:"Validation errors occurred. Please confirm the fields and submit it again.";s:4:"spam";s:93:"Failed to send your message. Please try later or contact the administrator by another method.";s:12:"accept_terms";s:35:"Please accept the terms to proceed.";s:16:"invalid_required";s:34:"Please fill in the required field.";s:16:"invalid_too_long";s:23:"This input is too long.";s:17:"invalid_too_short";s:24:"This input is too short.";}'),
(58, 30, '_additional_settings', ''),
(59, 2, '_wp_trash_meta_status', 'publish'),
(60, 2, '_wp_trash_meta_time', '1446214073'),
(61, 2, 'enable_tertiary_navigation', '0'),
(62, 2, 'hero_style', ''),
(63, 32, '_edit_last', '1'),
(64, 32, '_edit_lock', '1446213967:1'),
(65, 32, '_wp_page_template', 'page-templates/template-full-width.php'),
(66, 32, 'enable_tertiary_navigation', '0'),
(67, 32, 'hero_style', 'image'),
(68, 35, '_edit_last', '1'),
(69, 35, '_edit_lock', '1446213998:1'),
(70, 35, '_wp_page_template', 'page-templates/template-single-column.php'),
(71, 35, 'enable_tertiary_navigation', '0'),
(72, 35, 'hero_style', 'image'),
(73, 37, '_edit_last', '1'),
(74, 37, '_edit_lock', '1446214034:1'),
(75, 37, '_wp_page_template', 'page-templates/template-full-width.php'),
(76, 37, 'enable_tertiary_navigation', '1'),
(77, 37, 'hero_style', 'image'),
(78, 39, '_edit_last', '1'),
(79, 39, '_edit_lock', '1446214086:1'),
(80, 39, '_wp_page_template', 'page-templates/template-full-width.php'),
(81, 39, 'enable_tertiary_navigation', '0'),
(82, 39, 'hero_style', 'image'),
(83, 41, '_edit_last', '1'),
(84, 41, '_edit_lock', '1446214110:1'),
(85, 41, '_wp_page_template', 'templates/template-profile.php'),
(86, 41, 'enable_tertiary_navigation', '0'),
(87, 41, 'hero_style', 'image'),
(88, 44, '_edit_last', '1'),
(89, 44, '_edit_lock', '1446214131:1'),
(90, 44, '_wp_page_template', 'default'),
(91, 44, 'enable_tertiary_navigation', '0'),
(92, 44, 'hero_style', 'none'),
(93, 46, '_edit_last', '1'),
(94, 46, '_edit_lock', '1446214347:1'),
(95, 47, '_wp_attached_file', '2015/10/family-commons-clipped.jpg'),
(96, 47, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:4267;s:6:"height";i:2839;s:4:"file";s:34:"2015/10/family-commons-clipped.jpg";s:5:"sizes";a:7:{s:9:"thumbnail";a:4:{s:4:"file";s:34:"family-commons-clipped-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:34:"family-commons-clipped-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:35:"family-commons-clipped-1024x681.jpg";s:5:"width";i:1024;s:6:"height";i:681;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:34:"family-commons-clipped-180x180.jpg";s:5:"width";i:180;s:6:"height";i:180;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:34:"family-commons-clipped-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:34:"family-commons-clipped-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:34:"family-commons-clipped-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(97, 46, '_thumbnail_id', '47'),
(98, 46, '_wp_page_template', 'page-templates/template-home.php'),
(99, 46, 'enable_tertiary_navigation', '0'),
(100, 46, 'hero_style', 'image'),
(101, 49, '_edit_last', '1'),
(102, 49, '_edit_lock', '1446214390:1'),
(103, 49, '_wp_page_template', 'page-templates/template-archive-job_listing.php'),
(104, 49, 'enable_tertiary_navigation', '0'),
(105, 49, 'hero_style', 'none'),
(106, 51, '_edit_last', '1'),
(107, 51, '_edit_lock', '1446214425:1'),
(108, 51, '_wp_page_template', 'page-templates/template-single-column.php'),
(109, 51, 'enable_tertiary_navigation', '0'),
(110, 51, 'hero_style', 'image'),
(111, 53, '_menu_item_type', 'post_type'),
(112, 53, '_menu_item_menu_item_parent', '0'),
(113, 53, '_menu_item_object_id', '37'),
(114, 53, '_menu_item_object', 'page'),
(115, 53, '_menu_item_target', ''),
(116, 53, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(117, 53, '_menu_item_xfn', ''),
(118, 53, '_menu_item_url', ''),
(120, 54, '_menu_item_type', 'post_type'),
(121, 54, '_menu_item_menu_item_parent', '0'),
(122, 54, '_menu_item_object_id', '44'),
(123, 54, '_menu_item_object', 'page'),
(124, 54, '_menu_item_target', ''),
(125, 54, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(126, 54, '_menu_item_xfn', ''),
(127, 54, '_menu_item_url', ''),
(129, 55, '_menu_item_type', 'custom'),
(130, 55, '_menu_item_menu_item_parent', '0'),
(131, 55, '_menu_item_object_id', '55'),
(132, 55, '_menu_item_object', 'custom'),
(133, 55, '_menu_item_target', ''),
(134, 55, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(135, 55, '_menu_item_xfn', ''),
(136, 55, '_menu_item_url', 'http://account'),
(137, 55, '_menu_item_orphaned', '1446215068'),
(138, 56, '_menu_item_type', 'post_type'),
(139, 56, '_menu_item_menu_item_parent', '0'),
(140, 56, '_menu_item_object_id', '37'),
(141, 56, '_menu_item_object', 'page'),
(142, 56, '_menu_item_target', ''),
(143, 56, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(144, 56, '_menu_item_xfn', ''),
(145, 56, '_menu_item_url', ''),
(147, 57, '_menu_item_type', 'custom'),
(148, 57, '_menu_item_menu_item_parent', '56'),
(149, 57, '_menu_item_object_id', '57'),
(150, 57, '_menu_item_object', 'custom'),
(151, 57, '_menu_item_target', '') ;
INSERT INTO `wp_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(152, 57, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(153, 57, '_menu_item_xfn', ''),
(154, 57, '_menu_item_url', '/?page_id=25'),
(156, 58, '_menu_item_type', 'post_type'),
(157, 58, '_menu_item_menu_item_parent', '56'),
(158, 58, '_menu_item_object_id', '41'),
(159, 58, '_menu_item_object', 'page'),
(160, 58, '_menu_item_target', ''),
(161, 58, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(162, 58, '_menu_item_xfn', ''),
(163, 58, '_menu_item_url', ''),
(165, 59, '_menu_item_type', 'custom'),
(166, 59, '_menu_item_menu_item_parent', '56'),
(167, 59, '_menu_item_object_id', '59'),
(168, 59, '_menu_item_object', 'custom'),
(169, 59, '_menu_item_target', ''),
(170, 59, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(171, 59, '_menu_item_xfn', ''),
(172, 59, '_menu_item_url', '/?customer-logout=true'),
(174, 53, '_nav_menu_role', 'out'),
(175, 54, '_nav_menu_role', 'out'),
(176, 56, '_nav_menu_role', 'in'),
(177, 57, '_nav_menu_role', 'in'),
(178, 58, '_nav_menu_role', 'a:2:{i:0;s:13:"administrator";i:1;s:12:"shop_manager";}'),
(179, 59, '_nav_menu_role', 'in'),
(180, 60, '_wp_attached_file', '2015/10/wp-user-avatar.zip'),
(181, 60, '_wp_attachment_context', 'upgrader'),
(182, 61, '_menu_item_type', 'post_type'),
(183, 61, '_menu_item_menu_item_parent', '0'),
(184, 61, '_menu_item_object_id', '46'),
(185, 61, '_menu_item_object', 'page'),
(186, 61, '_menu_item_target', ''),
(187, 61, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(188, 61, '_menu_item_xfn', ''),
(189, 61, '_menu_item_url', ''),
(191, 62, '_menu_item_type', 'post_type'),
(192, 62, '_menu_item_menu_item_parent', '0'),
(193, 62, '_menu_item_object_id', '41'),
(194, 62, '_menu_item_object', 'page'),
(195, 62, '_menu_item_target', ''),
(196, 62, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(197, 62, '_menu_item_xfn', ''),
(198, 62, '_menu_item_url', ''),
(200, 63, '_menu_item_type', 'custom'),
(201, 63, '_menu_item_menu_item_parent', '0'),
(202, 63, '_menu_item_object_id', '63'),
(203, 63, '_menu_item_object', 'custom'),
(204, 63, '_menu_item_target', ''),
(205, 63, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(206, 63, '_menu_item_xfn', ''),
(207, 63, '_menu_item_url', '/events/community/add'),
(209, 62, '_nav_menu_role', 'a:2:{i:0;s:13:"administrator";i:1;s:12:"shop_manager";}'),
(210, 63, '_nav_menu_role', 'a:2:{i:0;s:13:"administrator";i:1;s:12:"shop_manager";}') ;

#
# End of data contents of table `wp_postmeta`
# --------------------------------------------------------



#
# Delete any existing table `wp_posts`
#

DROP TABLE IF EXISTS `wp_posts`;


#
# Table structure of table `wp_posts`
#

CREATE TABLE `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8_unicode_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `wp_posts`
#
INSERT INTO `wp_posts` ( `ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2015-10-30 13:27:36', '2015-10-30 13:27:36', 'Welcome to WordPress. This is your first post. Edit or delete it, then start writing!', 'Hello world!', '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2015-10-30 13:27:36', '2015-10-30 13:27:36', '', 0, 'http://localhost:8888/?p=1', 0, 'post', '', 1),
(2, 1, '2015-10-30 13:27:36', '2015-10-30 13:27:36', 'This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\n\n<blockquote>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my blog. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</blockquote>\n\n...or something like this:\n\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\n\nAs a new WordPress user, you should go to <a href="http://localhost:8888/wp-admin/">your dashboard</a> to delete this page and create new pages for your content. Have fun!', 'Sample Page', '', 'trash', 'closed', 'open', '', 'sample-page', '', '', '2015-10-30 14:07:53', '2015-10-30 14:07:53', '', 0, 'http://localhost:8888/?page_id=2', 0, 'page', '', 0),
(3, 1, '2015-10-30 13:27:49', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-10-30 13:27:49', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/?p=3', 0, 'post', '', 0),
(4, 1, '2015-10-30 13:51:34', '2015-10-30 13:51:34', 'http://localhost:8888/wp-content/uploads/2015/10/themeforest-9602611-wordpress-directory-theme-listify.zip', 'themeforest-9602611-wordpress-directory-theme-listify.zip', '', 'private', 'open', 'closed', '', 'themeforest-9602611-wordpress-directory-theme-listify-zip', '', '', '2015-10-30 13:51:34', '2015-10-30 13:51:34', '', 0, 'http://localhost:8888/wp-content/uploads/2015/10/themeforest-9602611-wordpress-directory-theme-listify.zip', 0, 'attachment', '', 0),
(5, 1, '2015-10-30 13:56:15', '2015-10-30 13:56:15', 'http://localhost:8888/wp-content/uploads/2015/10/themeforest-9602611-wordpress-directory-theme-listify-wordpress-theme.zip', 'themeforest-9602611-wordpress-directory-theme-listify-wordpress-theme.zip', '', 'private', 'open', 'closed', '', 'themeforest-9602611-wordpress-directory-theme-listify-wordpress-theme-zip', '', '', '2015-10-30 13:56:15', '2015-10-30 13:56:15', '', 0, 'http://localhost:8888/wp-content/uploads/2015/10/themeforest-9602611-wordpress-directory-theme-listify-wordpress-theme.zip', 0, 'attachment', '', 0),
(30, 1, '2015-10-30 14:05:07', '2015-10-30 14:05:07', '<p>Your Name (required)<br />\n    [text* your-name] </p>\n\n<p>Your Email (required)<br />\n    [email* your-email] </p>\n\n<p>Subject<br />\n    [text your-subject] </p>\n\n<p>Your Message<br />\n    [textarea your-message] </p>\n\n<p>[submit "Send"]</p>\n[your-subject]\n[your-name] <mr.nicholas.goodall@gmail.com>\nFrom: [your-name] <[your-email]>\nSubject: [your-subject]\n\nMessage Body:\n[your-message]\n\n--\nThis e-mail was sent from a contact form on babyhallo (http://localhost:8888)\nmr.nicholas.goodall@gmail.com\nReply-To: [your-email]\n\n0\n0\n\n[your-subject]\nbabyhallo <mr.nicholas.goodall@gmail.com>\nMessage Body:\n[your-message]\n\n--\nThis e-mail was sent from a contact form on babyhallo (http://localhost:8888)\n[your-email]\nReply-To: mr.nicholas.goodall@gmail.com\n\n0\n0\nYour message was sent successfully. Thanks.\nFailed to send your message. Please try later or contact the administrator by another method.\nValidation errors occurred. Please confirm the fields and submit it again.\nFailed to send your message. Please try later or contact the administrator by another method.\nPlease accept the terms to proceed.\nPlease fill in the required field.\nThis input is too long.\nThis input is too short.', 'Contact form 1', '', 'publish', 'closed', 'closed', '', 'contact-form-1', '', '', '2015-10-30 14:05:07', '2015-10-30 14:05:07', '', 0, 'http://localhost:8888/?post_type=wpcf7_contact_form&p=30', 0, 'wpcf7_contact_form', '', 0),
(31, 1, '2015-10-30 14:07:53', '2015-10-30 14:07:53', 'This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\n\n<blockquote>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my blog. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</blockquote>\n\n...or something like this:\n\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\n\nAs a new WordPress user, you should go to <a href="http://localhost:8888/wp-admin/">your dashboard</a> to delete this page and create new pages for your content. Have fun!', 'Sample Page', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2015-10-30 14:07:53', '2015-10-30 14:07:53', '', 2, 'http://localhost:8888/2015/10/30/2-revision-v1/', 0, 'revision', '', 0),
(32, 1, '2015-10-30 14:08:23', '2015-10-30 14:08:23', '[woocommerce_cart]', 'Cart', '', 'publish', 'closed', 'closed', '', 'cart', '', '', '2015-10-30 14:08:28', '2015-10-30 14:08:28', '', 0, 'http://localhost:8888/?page_id=32', 0, 'page', '', 0),
(33, 1, '2015-10-30 14:08:23', '2015-10-30 14:08:23', '[woocommerce_cart]', 'Cart[', '', 'inherit', 'closed', 'closed', '', '32-revision-v1', '', '', '2015-10-30 14:08:23', '2015-10-30 14:08:23', '', 32, 'http://localhost:8888/2015/10/30/32-revision-v1/', 0, 'revision', '', 0),
(34, 1, '2015-10-30 14:08:28', '2015-10-30 14:08:28', '[woocommerce_cart]', 'Cart', '', 'inherit', 'closed', 'closed', '', '32-revision-v1', '', '', '2015-10-30 14:08:28', '2015-10-30 14:08:28', '', 32, 'http://localhost:8888/2015/10/30/32-revision-v1/', 0, 'revision', '', 0),
(35, 1, '2015-10-30 14:08:59', '2015-10-30 14:08:59', '[woocommerce_checkout]', 'Confirm Booking', '', 'publish', 'closed', 'closed', '', 'confirm-booking', '', '', '2015-10-30 14:08:59', '2015-10-30 14:08:59', '', 0, 'http://localhost:8888/?page_id=35', 0, 'page', '', 0),
(36, 1, '2015-10-30 14:08:59', '2015-10-30 14:08:59', '[woocommerce_checkout]', 'Confirm Booking', '', 'inherit', 'closed', 'closed', '', '35-revision-v1', '', '', '2015-10-30 14:08:59', '2015-10-30 14:08:59', '', 35, 'http://localhost:8888/2015/10/30/35-revision-v1/', 0, 'revision', '', 0),
(37, 1, '2015-10-30 14:09:32', '2015-10-30 14:09:32', '[woocommerce_my_account]\r\n[avatar_upload]', 'My Account', '', 'publish', 'closed', 'closed', '', 'my-account', '', '', '2015-10-30 14:09:32', '2015-10-30 14:09:32', '', 0, 'http://localhost:8888/?page_id=37', 0, 'page', '', 0),
(38, 1, '2015-10-30 14:09:32', '2015-10-30 14:09:32', '[woocommerce_my_account]\r\n[avatar_upload]', 'My Account', '', 'inherit', 'closed', 'closed', '', '37-revision-v1', '', '', '2015-10-30 14:09:32', '2015-10-30 14:09:32', '', 37, 'http://localhost:8888/2015/10/30/37-revision-v1/', 0, 'revision', '', 0),
(39, 1, '2015-10-30 14:10:25', '2015-10-30 14:10:25', '[job_dashboard]', 'Listings', '', 'publish', 'closed', 'closed', '', 'listings', '', '', '2015-10-30 14:10:25', '2015-10-30 14:10:25', '', 37, 'http://localhost:8888/?page_id=39', 0, 'page', '', 0),
(40, 1, '2015-10-30 14:10:25', '2015-10-30 14:10:25', '[job_dashboard]', 'Listings', '', 'inherit', 'closed', 'closed', '', '39-revision-v1', '', '', '2015-10-30 14:10:25', '2015-10-30 14:10:25', '', 39, 'http://localhost:8888/2015/10/30/39-revision-v1/', 0, 'revision', '', 0),
(41, 1, '2015-10-30 14:10:50', '2015-10-30 14:10:50', '', 'Profile', '', 'publish', 'closed', 'closed', '', 'profile', '', '', '2015-10-30 14:10:50', '2015-10-30 14:10:50', '', 0, 'http://localhost:8888/?page_id=41', 0, 'page', '', 0),
(42, 1, '2015-10-30 14:10:50', '2015-10-30 14:10:50', '', 'Profile', '', 'inherit', 'closed', 'closed', '', '41-revision-v1', '', '', '2015-10-30 14:10:50', '2015-10-30 14:10:50', '', 41, 'http://localhost:8888/2015/10/30/41-revision-v1/', 0, 'revision', '', 0),
(43, 1, '2015-10-30 14:10:54', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2015-10-30 14:10:54', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/?page_id=43', 0, 'page', '', 0),
(44, 1, '2015-10-30 14:11:10', '2015-10-30 14:11:10', '[woocommerce_simple_registration]', 'Register', '', 'publish', 'closed', 'closed', '', 'register', '', '', '2015-10-30 14:11:10', '2015-10-30 14:11:10', '', 0, 'http://localhost:8888/?page_id=44', 0, 'page', '', 0),
(45, 1, '2015-10-30 14:11:10', '2015-10-30 14:11:10', '[woocommerce_simple_registration]', 'Register', '', 'inherit', 'closed', 'closed', '', '44-revision-v1', '', '', '2015-10-30 14:11:10', '2015-10-30 14:11:10', '', 44, 'http://localhost:8888/2015/10/30/44-revision-v1/', 0, 'revision', '', 0),
(46, 1, '2015-10-30 14:14:46', '2015-10-30 14:14:46', 'Find a Midwife near you', 'Search for a Midwife', '', 'publish', 'closed', 'closed', '', 'search-for-a-midwife', '', '', '2015-10-30 14:14:46', '2015-10-30 14:14:46', '', 0, 'http://localhost:8888/?page_id=46', 0, 'page', '', 0),
(47, 1, '2015-10-30 14:13:27', '2015-10-30 14:13:27', '', 'family-commons-clipped', '', 'inherit', 'open', 'closed', '', 'family-commons-clipped', '', '', '2015-10-30 14:13:27', '2015-10-30 14:13:27', '', 46, 'http://localhost:8888/wp-content/uploads/2015/10/family-commons-clipped.jpg', 0, 'attachment', 'image/jpeg', 0),
(48, 1, '2015-10-30 14:14:46', '2015-10-30 14:14:46', 'Find a Midwife near you', 'Search for a Midwife', '', 'inherit', 'closed', 'closed', '', '46-revision-v1', '', '', '2015-10-30 14:14:46', '2015-10-30 14:14:46', '', 46, 'http://localhost:8888/2015/10/30/46-revision-v1/', 0, 'revision', '', 0),
(49, 1, '2015-10-30 14:15:17', '2015-10-30 14:15:17', '[jobs]', 'Search Results', '', 'publish', 'closed', 'closed', '', 'search-results', '', '', '2015-10-30 14:15:17', '2015-10-30 14:15:17', '', 0, 'http://localhost:8888/?page_id=49', 0, 'page', '', 0),
(50, 1, '2015-10-30 14:15:17', '2015-10-30 14:15:17', '[jobs]', 'Search Results', '', 'inherit', 'closed', 'closed', '', '49-revision-v1', '', '', '2015-10-30 14:15:17', '2015-10-30 14:15:17', '', 49, 'http://localhost:8888/2015/10/30/49-revision-v1/', 0, 'revision', '', 0),
(51, 1, '2015-10-30 14:15:57', '2015-10-30 14:15:57', '[submit_job_form]', 'Submit Profile', '', 'publish', 'closed', 'closed', '', 'submit-profile', '', '', '2015-10-30 14:15:57', '2015-10-30 14:15:57', '', 0, 'http://localhost:8888/?page_id=51', 0, 'page', '', 0),
(52, 1, '2015-10-30 14:15:57', '2015-10-30 14:15:57', '[submit_job_form]', 'Submit Profile', '', 'inherit', 'closed', 'closed', '', '51-revision-v1', '', '', '2015-10-30 14:15:57', '2015-10-30 14:15:57', '', 51, 'http://localhost:8888/2015/10/30/51-revision-v1/', 0, 'revision', '', 0),
(53, 1, '2015-10-30 14:26:27', '2015-10-30 14:26:27', '', 'Sign In', '', 'publish', 'closed', 'closed', '', 'sign-in', '', '', '2015-10-30 14:37:36', '2015-10-30 14:37:36', '', 0, 'http://localhost:8888/?p=53', 1, 'nav_menu_item', '', 0),
(54, 1, '2015-10-30 14:26:27', '2015-10-30 14:26:27', ' ', '', '', 'publish', 'closed', 'closed', '', '54', '', '', '2015-10-30 14:37:36', '2015-10-30 14:37:36', '', 0, 'http://localhost:8888/?p=54', 2, 'nav_menu_item', '', 0),
(55, 1, '2015-10-30 14:24:28', '0000-00-00 00:00:00', '', 'Menu Item', '', 'draft', 'closed', 'closed', '', '', '', '', '2015-10-30 14:24:28', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/?p=55', 1, 'nav_menu_item', '', 0),
(56, 1, '2015-10-30 14:26:27', '2015-10-30 14:26:27', '', '{{account}}', '', 'publish', 'closed', 'closed', '', 'account', '', '', '2015-10-30 14:37:36', '2015-10-30 14:37:36', '', 0, 'http://localhost:8888/?p=56', 3, 'nav_menu_item', '', 0),
(57, 1, '2015-10-30 14:26:27', '2015-10-30 14:26:27', '', 'Edit Account', '', 'publish', 'closed', 'closed', '', 'edit-account', '', '', '2015-10-30 14:37:36', '2015-10-30 14:37:36', '', 0, 'http://localhost:8888/?p=57', 4, 'nav_menu_item', '', 0),
(58, 1, '2015-10-30 14:26:27', '2015-10-30 14:26:27', '', 'My Profile', '', 'publish', 'closed', 'closed', '', 'my-profile', '', '', '2015-10-30 14:37:36', '2015-10-30 14:37:36', '', 0, 'http://localhost:8888/?p=58', 5, 'nav_menu_item', '', 0),
(59, 1, '2015-10-30 14:26:27', '2015-10-30 14:26:27', '', 'Sign Out', '', 'publish', 'closed', 'closed', '', 'sign-out', '', '', '2015-10-30 14:37:36', '2015-10-30 14:37:36', '', 0, 'http://localhost:8888/?p=59', 6, 'nav_menu_item', '', 0),
(60, 1, '2015-10-30 14:32:19', '2015-10-30 14:32:19', 'http://localhost:8888/wp-content/uploads/2015/10/wp-user-avatar.zip', 'wp-user-avatar.zip', '', 'private', 'open', 'closed', '', 'wp-user-avatar-zip', '', '', '2015-10-30 14:32:19', '2015-10-30 14:32:19', '', 0, 'http://localhost:8888/wp-content/uploads/2015/10/wp-user-avatar.zip', 0, 'attachment', '', 0),
(61, 1, '2015-10-30 14:40:10', '2015-10-30 14:40:10', ' ', '', '', 'publish', 'closed', 'closed', '', '61', '', '', '2015-10-30 14:40:10', '2015-10-30 14:40:10', '', 0, 'http://localhost:8888/?p=61', 1, 'nav_menu_item', '', 0),
(62, 1, '2015-10-30 14:40:10', '2015-10-30 14:40:10', ' ', '', '', 'publish', 'closed', 'closed', '', '62', '', '', '2015-10-30 14:40:10', '2015-10-30 14:40:10', '', 0, 'http://localhost:8888/?p=62', 2, 'nav_menu_item', '', 0),
(63, 1, '2015-10-30 14:40:10', '2015-10-30 14:40:10', '', 'Create Event', '', 'publish', 'closed', 'closed', '', 'create-event', '', '', '2015-10-30 14:40:10', '2015-10-30 14:40:10', '', 0, 'http://localhost:8888/?p=63', 3, 'nav_menu_item', '', 0) ;

#
# End of data contents of table `wp_posts`
# --------------------------------------------------------



#
# Delete any existing table `wp_term_relationships`
#

DROP TABLE IF EXISTS `wp_term_relationships`;


#
# Table structure of table `wp_term_relationships`
#

CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `wp_term_relationships`
#
INSERT INTO `wp_term_relationships` ( `object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(53, 12, 0),
(54, 12, 0),
(56, 12, 0),
(57, 12, 0),
(58, 12, 0),
(59, 12, 0),
(61, 13, 0),
(62, 13, 0),
(63, 13, 0) ;

#
# End of data contents of table `wp_term_relationships`
# --------------------------------------------------------



#
# Delete any existing table `wp_term_taxonomy`
#

DROP TABLE IF EXISTS `wp_term_taxonomy`;


#
# Table structure of table `wp_term_taxonomy`
#

CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `wp_term_taxonomy`
#
INSERT INTO `wp_term_taxonomy` ( `term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1),
(2, 2, 'product_type', '', 0, 0),
(3, 3, 'product_type', '', 0, 0),
(4, 4, 'product_type', '', 0, 0),
(5, 5, 'product_type', '', 0, 0),
(6, 6, 'job_listing_type', '', 0, 0),
(7, 7, 'job_listing_type', '', 0, 0),
(8, 8, 'job_listing_type', '', 0, 0),
(9, 9, 'job_listing_type', '', 0, 0),
(10, 10, 'job_listing_type', '', 0, 0),
(11, 11, 'product_type', '', 0, 0),
(12, 12, 'nav_menu', '', 0, 6),
(13, 13, 'nav_menu', '', 0, 3) ;

#
# End of data contents of table `wp_term_taxonomy`
# --------------------------------------------------------



#
# Delete any existing table `wp_terms`
#

DROP TABLE IF EXISTS `wp_terms`;


#
# Table structure of table `wp_terms`
#

CREATE TABLE `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `wp_terms`
#
INSERT INTO `wp_terms` ( `term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorised', 'uncategorised', 0),
(2, 'simple', 'simple', 0),
(3, 'grouped', 'grouped', 0),
(4, 'variable', 'variable', 0),
(5, 'external', 'external', 0),
(6, 'Full Time', 'full-time', 0),
(7, 'Part Time', 'part-time', 0),
(8, 'Temporary', 'temporary', 0),
(9, 'Freelance', 'freelance', 0),
(10, 'Internship', 'internship', 0),
(11, 'booking', 'booking', 0),
(12, 'Menu', 'menu', 0),
(13, 'Navigation', 'navigation', 0) ;

#
# End of data contents of table `wp_terms`
# --------------------------------------------------------



#
# Delete any existing table `wp_usermeta`
#

DROP TABLE IF EXISTS `wp_usermeta`;


#
# Table structure of table `wp_usermeta`
#

CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `wp_usermeta`
#
INSERT INTO `wp_usermeta` ( `umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'admin'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'comment_shortcuts', 'false'),
(7, 1, 'admin_color', 'fresh'),
(8, 1, 'use_ssl', '0'),
(9, 1, 'show_admin_bar_front', 'true'),
(10, 1, 'wp_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(11, 1, 'wp_user_level', '10'),
(12, 1, 'dismissed_wp_pointers', ''),
(13, 1, 'show_welcome_panel', '1'),
(14, 1, 'session_tokens', 'a:1:{s:64:"1f1e1195650d489d8a174ee9de7df774515eae7d10b6881e4ef902deb8ba7f16";a:4:{s:10:"expiration";i:1446384467;s:2:"ip";s:3:"::1";s:2:"ua";s:120:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36";s:5:"login";i:1446211667;}}'),
(15, 1, 'wp_dashboard_quick_press_last_post_id', '3'),
(16, 1, 'managejob_listing_page_edit_job_fieldscolumnshidden', 'a:5:{i:0;s:6:"output";i:1;s:9:"output_as";i:2;s:17:"output_show_label";i:3;s:6:"origin";i:4;s:7:"post_id";}'),
(17, 1, 'managejob_listing_page_edit_company_fieldscolumnshidden', 'a:5:{i:0;s:6:"output";i:1;s:9:"output_as";i:2;s:17:"output_show_label";i:3;s:6:"origin";i:4;s:7:"post_id";}'),
(18, 1, 'wp_user-settings', 'libraryContent=browse'),
(19, 1, 'wp_user-settings-time', '1446214482'),
(20, 1, 'managenav-menuscolumnshidden', 'a:5:{i:0;s:11:"link-target";i:1;s:11:"css-classes";i:2;s:3:"xfn";i:3;s:11:"description";i:4;s:15:"title-attribute";}'),
(21, 1, 'metaboxhidden_nav-menus', 'a:10:{i:0;s:30:"woocommerce_endpoints_nav_link";i:1;s:11:"add-product";i:5;s:19:"add-shop_commission";i:6;s:12:"add-post_tag";i:7;s:22:"add-job_listing_region";i:8;s:24:"add-job_listing_category";i:9;s:20:"add-job_listing_type";i:10;s:15:"add-product_cat";i:11;s:15:"add-product_tag";i:13;s:15:"add-shop_vendor";}'),
(22, 1, 'tribe_setDefaultNavMenuBoxes', '1'),
(23, 1, 'nav_menu_recently_edited', '13') ;

#
# End of data contents of table `wp_usermeta`
# --------------------------------------------------------



#
# Delete any existing table `wp_users`
#

DROP TABLE IF EXISTS `wp_users`;


#
# Table structure of table `wp_users`
#

CREATE TABLE `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `wp_users`
#
INSERT INTO `wp_users` ( `ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'admin', '$P$BAAZr86yT9TvGY0GBSRcSS66BpNyZH0', 'admin', 'mr.nicholas.goodall@gmail.com', '', '2015-10-30 13:27:36', '', 0, 'admin') ;

#
# End of data contents of table `wp_users`
# --------------------------------------------------------



#
# Delete any existing table `wp_wc_booking_relationships`
#

DROP TABLE IF EXISTS `wp_wc_booking_relationships`;


#
# Table structure of table `wp_wc_booking_relationships`
#

CREATE TABLE `wp_wc_booking_relationships` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `resource_id` bigint(20) unsigned NOT NULL,
  `sort_order` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `product_id` (`product_id`),
  KEY `resource_id` (`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `wp_wc_booking_relationships`
#

#
# End of data contents of table `wp_wc_booking_relationships`
# --------------------------------------------------------



#
# Delete any existing table `wp_woocommerce_api_keys`
#

DROP TABLE IF EXISTS `wp_woocommerce_api_keys`;


#
# Table structure of table `wp_woocommerce_api_keys`
#

CREATE TABLE `wp_woocommerce_api_keys` (
  `key_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `permissions` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `consumer_key` char(64) COLLATE utf8_unicode_ci NOT NULL,
  `consumer_secret` char(43) COLLATE utf8_unicode_ci NOT NULL,
  `nonces` longtext COLLATE utf8_unicode_ci,
  `truncated_key` char(7) COLLATE utf8_unicode_ci NOT NULL,
  `last_access` datetime DEFAULT NULL,
  PRIMARY KEY (`key_id`),
  KEY `consumer_key` (`consumer_key`),
  KEY `consumer_secret` (`consumer_secret`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `wp_woocommerce_api_keys`
#

#
# End of data contents of table `wp_woocommerce_api_keys`
# --------------------------------------------------------



#
# Delete any existing table `wp_woocommerce_attribute_taxonomies`
#

DROP TABLE IF EXISTS `wp_woocommerce_attribute_taxonomies`;


#
# Table structure of table `wp_woocommerce_attribute_taxonomies`
#

CREATE TABLE `wp_woocommerce_attribute_taxonomies` (
  `attribute_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `attribute_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `attribute_label` longtext COLLATE utf8_unicode_ci,
  `attribute_type` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `attribute_orderby` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `attribute_public` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`attribute_id`),
  KEY `attribute_name` (`attribute_name`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `wp_woocommerce_attribute_taxonomies`
#

#
# End of data contents of table `wp_woocommerce_attribute_taxonomies`
# --------------------------------------------------------



#
# Delete any existing table `wp_woocommerce_downloadable_product_permissions`
#

DROP TABLE IF EXISTS `wp_woocommerce_downloadable_product_permissions`;


#
# Table structure of table `wp_woocommerce_downloadable_product_permissions`
#

CREATE TABLE `wp_woocommerce_downloadable_product_permissions` (
  `permission_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `download_id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL DEFAULT '0',
  `order_key` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `user_email` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `downloads_remaining` varchar(9) COLLATE utf8_unicode_ci DEFAULT NULL,
  `access_granted` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access_expires` datetime DEFAULT NULL,
  `download_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`permission_id`),
  KEY `download_order_key_product` (`product_id`,`order_id`,`order_key`(191),`download_id`),
  KEY `download_order_product` (`download_id`,`order_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `wp_woocommerce_downloadable_product_permissions`
#

#
# End of data contents of table `wp_woocommerce_downloadable_product_permissions`
# --------------------------------------------------------



#
# Delete any existing table `wp_woocommerce_order_itemmeta`
#

DROP TABLE IF EXISTS `wp_woocommerce_order_itemmeta`;


#
# Table structure of table `wp_woocommerce_order_itemmeta`
#

CREATE TABLE `wp_woocommerce_order_itemmeta` (
  `meta_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_item_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `order_item_id` (`order_item_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `wp_woocommerce_order_itemmeta`
#

#
# End of data contents of table `wp_woocommerce_order_itemmeta`
# --------------------------------------------------------



#
# Delete any existing table `wp_woocommerce_order_items`
#

DROP TABLE IF EXISTS `wp_woocommerce_order_items`;


#
# Table structure of table `wp_woocommerce_order_items`
#

CREATE TABLE `wp_woocommerce_order_items` (
  `order_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_item_name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `order_item_type` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `order_id` bigint(20) NOT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `wp_woocommerce_order_items`
#

#
# End of data contents of table `wp_woocommerce_order_items`
# --------------------------------------------------------



#
# Delete any existing table `wp_woocommerce_tax_rate_locations`
#

DROP TABLE IF EXISTS `wp_woocommerce_tax_rate_locations`;


#
# Table structure of table `wp_woocommerce_tax_rate_locations`
#

CREATE TABLE `wp_woocommerce_tax_rate_locations` (
  `location_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `location_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tax_rate_id` bigint(20) NOT NULL,
  `location_type` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `tax_rate_id` (`tax_rate_id`),
  KEY `location_type` (`location_type`),
  KEY `location_type_code` (`location_type`,`location_code`(90))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `wp_woocommerce_tax_rate_locations`
#

#
# End of data contents of table `wp_woocommerce_tax_rate_locations`
# --------------------------------------------------------



#
# Delete any existing table `wp_woocommerce_tax_rates`
#

DROP TABLE IF EXISTS `wp_woocommerce_tax_rates`;


#
# Table structure of table `wp_woocommerce_tax_rates`
#

CREATE TABLE `wp_woocommerce_tax_rates` (
  `tax_rate_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tax_rate_country` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tax_rate_state` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tax_rate` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tax_rate_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tax_rate_priority` bigint(20) NOT NULL,
  `tax_rate_compound` int(1) NOT NULL DEFAULT '0',
  `tax_rate_shipping` int(1) NOT NULL DEFAULT '1',
  `tax_rate_order` bigint(20) NOT NULL,
  `tax_rate_class` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`tax_rate_id`),
  KEY `tax_rate_country` (`tax_rate_country`(191)),
  KEY `tax_rate_state` (`tax_rate_state`(191)),
  KEY `tax_rate_class` (`tax_rate_class`(191)),
  KEY `tax_rate_priority` (`tax_rate_priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `wp_woocommerce_tax_rates`
#

#
# End of data contents of table `wp_woocommerce_tax_rates`
# --------------------------------------------------------



#
# Delete any existing table `wp_woocommerce_termmeta`
#

DROP TABLE IF EXISTS `wp_woocommerce_termmeta`;


#
# Table structure of table `wp_woocommerce_termmeta`
#

CREATE TABLE `wp_woocommerce_termmeta` (
  `meta_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `woocommerce_term_id` bigint(20) NOT NULL,
  `meta_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `woocommerce_term_id` (`woocommerce_term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `wp_woocommerce_termmeta`
#

#
# End of data contents of table `wp_woocommerce_termmeta`
# --------------------------------------------------------

#
# Add constraints back in and apply any alter data queries.
#

