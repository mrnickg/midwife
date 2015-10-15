# WordPress MySQL database migration
#
# Generated: Thursday 15. October 2015 10:41 UTC
# Hostname: localhost
# Database: `wpdatabase`
# --------------------------------------------------------

/*!40101 SET NAMES utf8 */;

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
(1, 1, 'Mr WordPress', '', 'https://wordpress.org/', '', '2015-10-13 08:56:52', '2015-10-13 08:56:52', 'Hi, this is a comment.\nTo delete a comment, just log in and view the post&#039;s comments. There you will have the option to edit or delete them.', 0, '1', '', '', 0, 0) ;

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
) ENGINE=InnoDB AUTO_INCREMENT=571 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `wp_options`
#
INSERT INTO `wp_options` ( `option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost', 'yes'),
(2, 'home', 'http://localhost', 'yes'),
(3, 'blogname', 'babyhallo', 'yes'),
(4, 'blogdescription', 'Just another WordPress site', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'nick.j.goodall@gmail.com', 'yes'),
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
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'F j, Y', 'yes'),
(24, 'time_format', 'g:i a', 'yes'),
(25, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '', 'yes'),
(29, 'gzipcompression', '0', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:13:{i:0;s:36:"contact-form-7/wp-contact-form-7.php";i:1;s:77:"enhanced-admin-bar-with-codex-search/enhanced-admin-bar-with-codex-search.php";i:2;s:34:"envato-wordpress-toolkit/index.php";i:3;s:17:"facetwp/index.php";i:4;s:33:"nav-menu-roles/nav-menu-roles.php";i:5;s:53:"widget-importer-exporter/widget-importer-exporter.php";i:6;s:27:"woocommerce/woocommerce.php";i:7;s:41:"wordpress-importer/wordpress-importer.php";i:8;s:65:"wp-job-manager-contact-listing/wp-job-manager-contact-listing.php";i:9;s:59:"wp-job-manager-field-editor/wp-job-manager-field-editor.php";i:10;s:53:"wp-job-manager-locations/wp-job-manager-locations.php";i:11;s:33:"wp-job-manager/wp-job-manager.php";i:12;s:31:"wp-migrate-db/wp-migrate-db.php";}', 'yes'),
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
(83, 'timezone_string', '', 'yes'),
(84, 'page_for_posts', '15', 'yes'),
(85, 'page_on_front', '11', 'yes'),
(86, 'default_post_format', '0', 'yes'),
(87, 'link_manager_enabled', '0', 'yes'),
(88, 'finished_splitting_shared_terms', '1', 'yes'),
(89, 'initial_db_version', '33055', 'yes'),
(90, 'wp_user_roles', 'a:8:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:152:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:9:"add_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;s:18:"manage_woocommerce";b:1;s:24:"view_woocommerce_reports";b:1;s:12:"edit_product";b:1;s:12:"read_product";b:1;s:14:"delete_product";b:1;s:13:"edit_products";b:1;s:20:"edit_others_products";b:1;s:16:"publish_products";b:1;s:21:"read_private_products";b:1;s:15:"delete_products";b:1;s:23:"delete_private_products";b:1;s:25:"delete_published_products";b:1;s:22:"delete_others_products";b:1;s:21:"edit_private_products";b:1;s:23:"edit_published_products";b:1;s:20:"manage_product_terms";b:1;s:18:"edit_product_terms";b:1;s:20:"delete_product_terms";b:1;s:20:"assign_product_terms";b:1;s:15:"edit_shop_order";b:1;s:15:"read_shop_order";b:1;s:17:"delete_shop_order";b:1;s:16:"edit_shop_orders";b:1;s:23:"edit_others_shop_orders";b:1;s:19:"publish_shop_orders";b:1;s:24:"read_private_shop_orders";b:1;s:18:"delete_shop_orders";b:1;s:26:"delete_private_shop_orders";b:1;s:28:"delete_published_shop_orders";b:1;s:25:"delete_others_shop_orders";b:1;s:24:"edit_private_shop_orders";b:1;s:26:"edit_published_shop_orders";b:1;s:23:"manage_shop_order_terms";b:1;s:21:"edit_shop_order_terms";b:1;s:23:"delete_shop_order_terms";b:1;s:23:"assign_shop_order_terms";b:1;s:16:"edit_shop_coupon";b:1;s:16:"read_shop_coupon";b:1;s:18:"delete_shop_coupon";b:1;s:17:"edit_shop_coupons";b:1;s:24:"edit_others_shop_coupons";b:1;s:20:"publish_shop_coupons";b:1;s:25:"read_private_shop_coupons";b:1;s:19:"delete_shop_coupons";b:1;s:27:"delete_private_shop_coupons";b:1;s:29:"delete_published_shop_coupons";b:1;s:26:"delete_others_shop_coupons";b:1;s:25:"edit_private_shop_coupons";b:1;s:27:"edit_published_shop_coupons";b:1;s:24:"manage_shop_coupon_terms";b:1;s:22:"edit_shop_coupon_terms";b:1;s:24:"delete_shop_coupon_terms";b:1;s:24:"assign_shop_coupon_terms";b:1;s:17:"edit_shop_webhook";b:1;s:17:"read_shop_webhook";b:1;s:19:"delete_shop_webhook";b:1;s:18:"edit_shop_webhooks";b:1;s:25:"edit_others_shop_webhooks";b:1;s:21:"publish_shop_webhooks";b:1;s:26:"read_private_shop_webhooks";b:1;s:20:"delete_shop_webhooks";b:1;s:28:"delete_private_shop_webhooks";b:1;s:30:"delete_published_shop_webhooks";b:1;s:27:"delete_others_shop_webhooks";b:1;s:26:"edit_private_shop_webhooks";b:1;s:28:"edit_published_shop_webhooks";b:1;s:25:"manage_shop_webhook_terms";b:1;s:23:"edit_shop_webhook_terms";b:1;s:25:"delete_shop_webhook_terms";b:1;s:25:"assign_shop_webhook_terms";b:1;s:19:"manage_job_listings";b:1;s:16:"edit_job_listing";b:1;s:16:"read_job_listing";b:1;s:18:"delete_job_listing";b:1;s:17:"edit_job_listings";b:1;s:24:"edit_others_job_listings";b:1;s:20:"publish_job_listings";b:1;s:25:"read_private_job_listings";b:1;s:19:"delete_job_listings";b:1;s:27:"delete_private_job_listings";b:1;s:29:"delete_published_job_listings";b:1;s:26:"delete_others_job_listings";b:1;s:25:"edit_private_job_listings";b:1;s:27:"edit_published_job_listings";b:1;s:24:"manage_job_listing_terms";b:1;s:22:"edit_job_listing_terms";b:1;s:24:"delete_job_listing_terms";b:1;s:24:"assign_job_listing_terms";b:1;s:17:"manage_job_fields";b:1;s:20:"manage_resume_fields";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}s:8:"customer";a:2:{s:4:"name";s:8:"Customer";s:12:"capabilities";a:3:{s:4:"read";b:1;s:10:"edit_posts";b:0;s:12:"delete_posts";b:0;}}s:12:"shop_manager";a:2:{s:4:"name";s:12:"Shop Manager";s:12:"capabilities";a:110:{s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:4:"read";b:1;s:18:"read_private_pages";b:1;s:18:"read_private_posts";b:1;s:10:"edit_users";b:1;s:10:"edit_posts";b:1;s:10:"edit_pages";b:1;s:20:"edit_published_posts";b:1;s:20:"edit_published_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"edit_private_posts";b:1;s:17:"edit_others_posts";b:1;s:17:"edit_others_pages";b:1;s:13:"publish_posts";b:1;s:13:"publish_pages";b:1;s:12:"delete_posts";b:1;s:12:"delete_pages";b:1;s:20:"delete_private_pages";b:1;s:20:"delete_private_posts";b:1;s:22:"delete_published_pages";b:1;s:22:"delete_published_posts";b:1;s:19:"delete_others_posts";b:1;s:19:"delete_others_pages";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:17:"moderate_comments";b:1;s:15:"unfiltered_html";b:1;s:12:"upload_files";b:1;s:6:"export";b:1;s:6:"import";b:1;s:10:"list_users";b:1;s:18:"manage_woocommerce";b:1;s:24:"view_woocommerce_reports";b:1;s:12:"edit_product";b:1;s:12:"read_product";b:1;s:14:"delete_product";b:1;s:13:"edit_products";b:1;s:20:"edit_others_products";b:1;s:16:"publish_products";b:1;s:21:"read_private_products";b:1;s:15:"delete_products";b:1;s:23:"delete_private_products";b:1;s:25:"delete_published_products";b:1;s:22:"delete_others_products";b:1;s:21:"edit_private_products";b:1;s:23:"edit_published_products";b:1;s:20:"manage_product_terms";b:1;s:18:"edit_product_terms";b:1;s:20:"delete_product_terms";b:1;s:20:"assign_product_terms";b:1;s:15:"edit_shop_order";b:1;s:15:"read_shop_order";b:1;s:17:"delete_shop_order";b:1;s:16:"edit_shop_orders";b:1;s:23:"edit_others_shop_orders";b:1;s:19:"publish_shop_orders";b:1;s:24:"read_private_shop_orders";b:1;s:18:"delete_shop_orders";b:1;s:26:"delete_private_shop_orders";b:1;s:28:"delete_published_shop_orders";b:1;s:25:"delete_others_shop_orders";b:1;s:24:"edit_private_shop_orders";b:1;s:26:"edit_published_shop_orders";b:1;s:23:"manage_shop_order_terms";b:1;s:21:"edit_shop_order_terms";b:1;s:23:"delete_shop_order_terms";b:1;s:23:"assign_shop_order_terms";b:1;s:16:"edit_shop_coupon";b:1;s:16:"read_shop_coupon";b:1;s:18:"delete_shop_coupon";b:1;s:17:"edit_shop_coupons";b:1;s:24:"edit_others_shop_coupons";b:1;s:20:"publish_shop_coupons";b:1;s:25:"read_private_shop_coupons";b:1;s:19:"delete_shop_coupons";b:1;s:27:"delete_private_shop_coupons";b:1;s:29:"delete_published_shop_coupons";b:1;s:26:"delete_others_shop_coupons";b:1;s:25:"edit_private_shop_coupons";b:1;s:27:"edit_published_shop_coupons";b:1;s:24:"manage_shop_coupon_terms";b:1;s:22:"edit_shop_coupon_terms";b:1;s:24:"delete_shop_coupon_terms";b:1;s:24:"assign_shop_coupon_terms";b:1;s:17:"edit_shop_webhook";b:1;s:17:"read_shop_webhook";b:1;s:19:"delete_shop_webhook";b:1;s:18:"edit_shop_webhooks";b:1;s:25:"edit_others_shop_webhooks";b:1;s:21:"publish_shop_webhooks";b:1;s:26:"read_private_shop_webhooks";b:1;s:20:"delete_shop_webhooks";b:1;s:28:"delete_private_shop_webhooks";b:1;s:30:"delete_published_shop_webhooks";b:1;s:27:"delete_others_shop_webhooks";b:1;s:26:"edit_private_shop_webhooks";b:1;s:28:"edit_published_shop_webhooks";b:1;s:25:"manage_shop_webhook_terms";b:1;s:23:"edit_shop_webhook_terms";b:1;s:25:"delete_shop_webhook_terms";b:1;s:25:"assign_shop_webhook_terms";b:1;}}s:8:"employer";a:2:{s:4:"name";s:8:"Employer";s:12:"capabilities";a:3:{s:4:"read";b:1;s:10:"edit_posts";b:0;s:12:"delete_posts";b:0;}}}', 'yes'),
(91, 'widget_search', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(92, 'widget_recent-posts', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(93, 'widget_recent-comments', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(94, 'widget_archives', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(95, 'widget_meta', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(96, 'sidebars_widgets', 'a:12:{s:19:"wp_inactive_widgets";a:0:{}s:21:"widget-area-sidebar-1";a:0:{}s:16:"widget-area-home";a:0:{}s:20:"widget-area-footer-1";a:0:{}s:20:"widget-area-footer-2";a:0:{}s:20:"widget-area-footer-3";a:0:{}s:27:"widget-area-sidebar-product";a:0:{}s:24:"widget-area-sidebar-shop";a:0:{}s:19:"archive-job_listing";a:0:{}s:30:"single-job_listing-widget-area";a:0:{}s:18:"single-job_listing";a:0:{}s:13:"array_version";i:3;}', 'yes'),
(99, 'cron', 'a:15:{i:1444908237;a:1:{s:34:"job_manager_check_for_expired_jobs";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:6:"hourly";s:4:"args";a:0:{}s:8:"interval";i:3600;}}}i:1444908320;a:1:{s:32:"woocommerce_cancel_unpaid_orders";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:2:{s:8:"schedule";b:0;s:4:"args";a:0:{}}}}i:1444908330;a:1:{s:26:"upgrader_scheduled_cleanup";a:1:{s:32:"c99854f646ecd5f6f92b19b9d0a80e03";a:2:{s:8:"schedule";b:0;s:4:"args";a:1:{i:0;i:873;}}}}i:1444935660;a:1:{s:20:"wp_maybe_auto_update";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1444942631;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1444947836;a:1:{s:28:"woocommerce_cleanup_sessions";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1444947837;a:1:{s:36:"job_manager_clear_expired_transients";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1444953600;a:1:{s:27:"woocommerce_scheduled_sales";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1444987313;a:1:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1444987691;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1444991036;a:1:{s:30:"woocommerce_tracker_send_event";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1444991037;a:1:{s:31:"job_manager_delete_old_previews";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1445503299;a:1:{s:28:"job_manager_verify_no_errors";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:6:"weekly";s:4:"args";a:0:{}s:8:"interval";i:604800;}}}i:1446508800;a:1:{s:25:"woocommerce_geoip_updater";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:7:"monthly";s:4:"args";a:0:{}s:8:"interval";i:2635200;}}}s:7:"version";i:2;}', 'yes'),
(109, 'db_upgraded', '', 'yes'),
(112, 'auto_core_update_notified', 'a:4:{s:4:"type";s:7:"success";s:5:"email";s:24:"nick.j.goodall@gmail.com";s:7:"version";s:5:"4.3.1";s:9:"timestamp";i:1444727575;}', 'yes'),
(114, 'auth_key', '2IU<M^5l+PB?9ye3{Gc6X*)xK3hrXWi|ARvFRO7G&m0B,zx+9]^]m,SFQN=?+{eh', 'yes') ;
INSERT INTO `wp_options` ( `option_id`, `option_name`, `option_value`, `autoload`) VALUES
(115, 'auth_salt', 'R=vZH#&khMA0g}iS0VDq=>n>T~X(r*D5u3H8SHBQsvbj@6(wYwvNK)Ovh7%>-+0h', 'yes'),
(116, 'logged_in_key', '$%^-q`^GN8y@a;CrA!m&ge{C#_1:F*%Wer^%poC%hz<GRBdd0@Vj,AKnyw:LakTw', 'yes'),
(117, 'logged_in_salt', '}}D1#EU8K`X+ $~`^XW^[Z97c_dcXlpspiEqh|Y<w$RV36Q}^+EYI,D9X*_ _1(m', 'yes'),
(118, 'nonce_key', 'ix!ED<+AQp6e.kaVV-P5`Wpm3i.4]w<qByyK#Q!s@R?Er/mJcJJiwxD4i(@a*lk&', 'yes'),
(119, 'nonce_salt', 'ln+WFh;TN)OG,^=V2%?8;vEkO*Nm`fFzH/~Dq$7%o=-qB@2TEeWBMGtdG`;%agVG', 'yes'),
(123, 'can_compress_scripts', '0', 'yes'),
(144, 'current_theme', 'Listify - Child Theme', 'yes'),
(145, 'theme_mods_twentyfourteen', 'a:2:{i:0;b:0;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1444728464;s:4:"data";a:4:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:9:"sidebar-2";N;s:9:"sidebar-3";N;}}}', 'yes'),
(146, 'theme_switched', '', 'yes'),
(153, 'recently_activated', 'a:0:{}', 'yes'),
(157, 'eab-codex-search-submenu', 'yes', 'yes'),
(158, 'eab-admin-searches', 'yes', 'yes'),
(159, 'widget_calendar', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(160, 'widget_nav_menu', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(161, 'widget_pages', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(163, 'widget_tag_cloud', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(170, 'theme_mods_twentyfifteen', 'a:1:{s:16:"sidebars_widgets";a:2:{s:4:"time";i:1444735522;s:4:"data";a:4:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:0:{}s:9:"sidebar-2";N;s:9:"sidebar-3";N;}}}', 'yes'),
(171, 'theme_mods_customizr', 'a:2:{i:0;b:0;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1444730060;s:4:"data";a:6:{s:19:"wp_inactive_widgets";a:0:{}s:4:"left";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:5:"right";N;s:10:"footer_one";N;s:10:"footer_two";N;s:12:"footer_three";N;}}}', 'yes'),
(172, 'tc_theme_options', 'a:170:{s:14:"tc_logo_upload";N;s:14:"tc_logo_resize";b:1;s:21:"tc_sticky_logo_upload";N;s:13:"tc_fav_upload";N;s:7:"tc_skin";s:9:"blue3.css";s:14:"tc_skin_random";b:0;s:8:"tc_fonts";s:19:"_g_fjalla_cantarell";s:17:"tc_body_font_size";i:15;s:6:"tc_rss";s:26:"http://localhost/?feed=rss";s:8:"tc_email";N;s:10:"tc_twitter";N;s:11:"tc_facebook";N;s:9:"tc_google";N;s:12:"tc_instagram";N;s:9:"tc_tumblr";N;s:9:"tc_flickr";N;s:12:"tc_wordpress";N;s:10:"tc_youtube";N;s:12:"tc_pinterest";N;s:9:"tc_github";N;s:11:"tc_dribbble";N;s:11:"tc_linkedin";N;s:18:"tc_show_title_icon";b:1;s:23:"tc_show_page_title_icon";b:0;s:23:"tc_show_post_title_icon";b:0;s:26:"tc_show_archive_title_icon";b:1;s:28:"tc_show_post_list_title_icon";b:0;s:27:"tc_show_sidebar_widget_icon";b:1;s:26:"tc_show_footer_widget_icon";b:1;s:14:"tc_link_scroll";b:0;s:20:"tc_link_hover_effect";b:1;s:17:"tc_ext_link_style";b:0;s:18:"tc_ext_link_target";b:0;s:11:"tc_fancybox";b:1;s:21:"tc_fancybox_autoscale";b:1;s:17:"tc_retina_support";b:0;s:23:"tc_display_slide_loader";b:0;s:20:"tc_center_slider_img";b:1;s:13:"tc_center_img";b:1;s:16:"tc_block_reorder";b:1;s:19:"tc_show_author_info";b:1;s:15:"tc_smoothscroll";b:1;s:16:"tc_header_layout";s:4:"left";s:13:"tc_top_border";b:1;s:15:"tc_show_tagline";b:1;s:19:"tc_social_in_header";b:1;s:23:"tc_display_boxed_navbar";b:0;s:16:"tc_sticky_header";b:1;s:22:"tc_sticky_show_tagline";b:0;s:25:"tc_sticky_show_title_logo";b:1;s:27:"tc_sticky_shrink_title_logo";b:1;s:19:"tc_sticky_show_menu";b:1;s:31:"tc_sticky_transparent_on_scroll";b:1;s:17:"tc_sticky_z_index";i:100;s:22:"tc_display_second_menu";b:0;s:13:"tc_menu_style";s:5:"aside";s:39:"tc_menu_resp_dropdown_limit_to_viewport";b:0;s:21:"tc_display_menu_label";b:0;s:16:"tc_menu_position";s:15:"pull-menu-right";s:23:"tc_second_menu_position";s:14:"pull-menu-left";s:12:"tc_menu_type";s:5:"hover";s:27:"tc_menu_submenu_fade_effect";b:1;s:32:"tc_menu_submenu_item_move_effect";b:1;s:27:"tc_second_menu_resp_setting";s:12:"in-sn-before";s:17:"tc_hide_all_menus";b:0;s:23:"tc_blog_restrict_by_cat";a:0:{}s:15:"tc_front_layout";s:1:"f";s:15:"tc_front_slider";i:0;s:22:"tc_posts_slider_number";i:1;s:20:"tc_posts_slider_type";s:3:"all";s:21:"tc_posts_slider_title";b:1;s:20:"tc_posts_slider_text";b:1;s:20:"tc_posts_slider_link";s:3:"cta";s:27:"tc_posts_slider_button_text";s:17:"Read more &raquo;";s:15:"tc_slider_width";b:1;s:15:"tc_slider_delay";i:5000;s:24:"tc_slider_default_height";i:500;s:34:"tc_slider_default_height_apply_all";b:1;s:33:"tc_slider_change_default_img_size";b:0;s:22:"tc_show_featured_pages";i:0;s:26:"tc_show_featured_pages_img";b:1;s:28:"tc_featured_page_button_text";s:17:"Read more &raquo;";s:20:"tc_featured_page_one";N;s:20:"tc_featured_page_two";N;s:22:"tc_featured_page_three";N;s:20:"tc_featured_text_one";N;s:20:"tc_featured_text_two";N;s:22:"tc_featured_text_three";N;s:24:"tc_sidebar_global_layout";s:1:"l";s:23:"tc_sidebar_force_layout";b:0;s:22:"tc_sidebar_post_layout";s:1:"l";s:19:"tc_post_list_length";s:7:"excerpt";s:22:"tc_sidebar_page_layout";s:1:"l";s:22:"tc_comment_show_bubble";b:1;s:23:"tc_comment_bubble_shape";s:7:"default";s:28:"tc_comment_bubble_color_type";s:4:"skin";s:23:"tc_comment_bubble_color";s:7:"#27CDA5";s:16:"tc_page_comments";b:0;s:16:"tc_post_comments";b:1;s:20:"tc_show_comment_list";b:1;s:13:"tc_breadcrumb";b:1;s:23:"tc_show_breadcrumb_home";b:0;s:27:"tc_show_breadcrumb_in_pages";b:1;s:34:"tc_show_breadcrumb_in_single_posts";b:1;s:32:"tc_show_breadcrumb_in_post_lists";b:1;s:18:"tc_show_post_metas";b:1;s:20:"tc_post_metas_design";s:10:"no-buttons";s:23:"tc_show_post_metas_home";b:0;s:30:"tc_show_post_metas_single_post";b:1;s:29:"tc_show_post_metas_post_lists";b:1;s:29:"tc_show_post_metas_categories";b:1;s:23:"tc_show_post_metas_tags";b:1;s:35:"tc_show_post_metas_publication_date";b:1;s:25:"tc_show_post_metas_author";b:1;s:30:"tc_show_post_metas_update_date";b:0;s:32:"tc_post_metas_update_date_format";s:4:"days";s:36:"tc_post_metas_update_notice_in_title";b:0;s:36:"tc_post_metas_update_notice_interval";i:10;s:32:"tc_post_metas_update_notice_text";s:18:"Recently updated !";s:34:"tc_post_metas_update_notice_format";s:13:"label-default";s:27:"tc_post_list_excerpt_length";i:50;s:23:"tc_post_list_show_thumb";b:1;s:36:"tc_post_list_use_attachment_as_thumb";b:1;s:26:"tc_post_list_default_thumb";N;s:24:"tc_post_list_thumb_shape";s:7:"rounded";s:25:"tc_post_list_thumb_height";i:250;s:27:"tc_post_list_thumb_position";s:5:"right";s:28:"tc_post_list_thumb_alternate";b:1;s:12:"tc_cat_title";s:0:"";s:12:"tc_tag_title";s:0:"";s:15:"tc_author_title";s:0:"";s:15:"tc_search_title";s:20:"Search Results for :";s:17:"tc_post_list_grid";s:4:"grid";s:15:"tc_grid_columns";s:1:"3";s:23:"tc_grid_expand_featured";b:1;s:15:"tc_grid_in_blog";b:1;s:18:"tc_grid_in_archive";b:1;s:17:"tc_grid_in_search";b:1;s:14:"tc_grid_shadow";b:1;s:21:"tc_grid_bottom_border";b:1;s:13:"tc_grid_icons";b:1;s:17:"tc_grid_num_words";i:10;s:20:"tc_grid_thumb_height";i:350;s:29:"tc_single_post_thumb_location";s:4:"hide";s:27:"tc_single_post_thumb_height";i:250;s:17:"tc_enable_gallery";b:1;s:19:"tc_gallery_fancybox";b:1;s:16:"tc_gallery_style";b:1;s:17:"tc_enable_dropcap";b:0;s:19:"tc_dropcap_minwords";i:50;s:17:"tc_dropcap_design";s:11:"skin-shadow";s:15:"tc_post_dropcap";b:0;s:15:"tc_page_dropcap";b:0;s:23:"tc_show_post_navigation";b:1;s:28:"tc_show_post_navigation_page";b:0;s:30:"tc_show_post_navigation_single";b:1;s:31:"tc_show_post_navigation_archive";b:1;s:25:"tc_social_in_left-sidebar";b:0;s:26:"tc_social_in_right-sidebar";b:0;s:26:"tc_social_in_sidebar_title";s:12:"Social links";s:19:"tc_social_in_footer";b:1;s:16:"tc_sticky_footer";b:1;s:19:"tc_show_back_to_top";b:1;s:13:"tc_custom_css";N;s:16:"tc_minified_skin";b:1;s:17:"tc_img_smart_load";b:0;s:21:"tc_display_front_help";b:1;s:3:"ver";s:6:"3.4.11";s:18:"last_update_notice";a:2:{s:7:"version";s:6:"3.4.11";s:13:"display_count";i:0;}s:8:"defaults";a:168:{s:14:"tc_logo_upload";N;s:14:"tc_logo_resize";b:1;s:21:"tc_sticky_logo_upload";N;s:13:"tc_fav_upload";N;s:7:"tc_skin";s:9:"blue3.css";s:14:"tc_skin_random";b:0;s:8:"tc_fonts";s:19:"_g_fjalla_cantarell";s:17:"tc_body_font_size";i:15;s:6:"tc_rss";s:26:"http://localhost/?feed=rss";s:8:"tc_email";N;s:10:"tc_twitter";N;s:11:"tc_facebook";N;s:9:"tc_google";N;s:12:"tc_instagram";N;s:9:"tc_tumblr";N;s:9:"tc_flickr";N;s:12:"tc_wordpress";N;s:10:"tc_youtube";N;s:12:"tc_pinterest";N;s:9:"tc_github";N;s:11:"tc_dribbble";N;s:11:"tc_linkedin";N;s:18:"tc_show_title_icon";b:1;s:23:"tc_show_page_title_icon";b:0;s:23:"tc_show_post_title_icon";b:0;s:26:"tc_show_archive_title_icon";b:1;s:28:"tc_show_post_list_title_icon";b:0;s:27:"tc_show_sidebar_widget_icon";b:1;s:26:"tc_show_footer_widget_icon";b:1;s:14:"tc_link_scroll";b:0;s:20:"tc_link_hover_effect";b:1;s:17:"tc_ext_link_style";b:0;s:18:"tc_ext_link_target";b:0;s:11:"tc_fancybox";b:1;s:21:"tc_fancybox_autoscale";b:1;s:17:"tc_retina_support";b:0;s:23:"tc_display_slide_loader";b:0;s:20:"tc_center_slider_img";b:1;s:13:"tc_center_img";b:1;s:16:"tc_block_reorder";b:1;s:19:"tc_show_author_info";b:1;s:15:"tc_smoothscroll";b:1;s:16:"tc_header_layout";s:4:"left";s:13:"tc_top_border";b:1;s:15:"tc_show_tagline";b:1;s:19:"tc_social_in_header";b:1;s:23:"tc_display_boxed_navbar";b:0;s:16:"tc_sticky_header";b:1;s:22:"tc_sticky_show_tagline";b:0;s:25:"tc_sticky_show_title_logo";b:1;s:27:"tc_sticky_shrink_title_logo";b:1;s:19:"tc_sticky_show_menu";b:1;s:31:"tc_sticky_transparent_on_scroll";b:1;s:17:"tc_sticky_z_index";i:100;s:22:"tc_display_second_menu";b:0;s:13:"tc_menu_style";s:5:"aside";s:39:"tc_menu_resp_dropdown_limit_to_viewport";b:0;s:21:"tc_display_menu_label";b:0;s:16:"tc_menu_position";s:15:"pull-menu-right";s:23:"tc_second_menu_position";s:14:"pull-menu-left";s:12:"tc_menu_type";s:5:"hover";s:27:"tc_menu_submenu_fade_effect";b:1;s:32:"tc_menu_submenu_item_move_effect";b:1;s:27:"tc_second_menu_resp_setting";s:12:"in-sn-before";s:17:"tc_hide_all_menus";b:0;s:23:"tc_blog_restrict_by_cat";a:0:{}s:15:"tc_front_layout";s:1:"f";s:15:"tc_front_slider";s:4:"demo";s:22:"tc_posts_slider_number";i:1;s:20:"tc_posts_slider_type";s:3:"all";s:21:"tc_posts_slider_title";b:1;s:20:"tc_posts_slider_text";b:1;s:20:"tc_posts_slider_link";s:3:"cta";s:27:"tc_posts_slider_button_text";s:17:"Read more &raquo;";s:15:"tc_slider_width";b:1;s:15:"tc_slider_delay";i:5000;s:24:"tc_slider_default_height";i:500;s:34:"tc_slider_default_height_apply_all";b:1;s:33:"tc_slider_change_default_img_size";b:0;s:22:"tc_show_featured_pages";i:1;s:26:"tc_show_featured_pages_img";b:1;s:28:"tc_featured_page_button_text";s:17:"Read more &raquo;";s:20:"tc_featured_page_one";N;s:20:"tc_featured_page_two";N;s:22:"tc_featured_page_three";N;s:20:"tc_featured_text_one";N;s:20:"tc_featured_text_two";N;s:22:"tc_featured_text_three";N;s:24:"tc_sidebar_global_layout";s:1:"l";s:23:"tc_sidebar_force_layout";b:0;s:22:"tc_sidebar_post_layout";s:1:"l";s:19:"tc_post_list_length";s:7:"excerpt";s:22:"tc_sidebar_page_layout";s:1:"l";s:22:"tc_comment_show_bubble";b:1;s:23:"tc_comment_bubble_shape";s:7:"default";s:28:"tc_comment_bubble_color_type";s:4:"skin";s:23:"tc_comment_bubble_color";s:7:"#27CDA5";s:16:"tc_page_comments";b:0;s:16:"tc_post_comments";b:1;s:20:"tc_show_comment_list";b:1;s:13:"tc_breadcrumb";b:1;s:23:"tc_show_breadcrumb_home";b:0;s:27:"tc_show_breadcrumb_in_pages";b:1;s:34:"tc_show_breadcrumb_in_single_posts";b:1;s:32:"tc_show_breadcrumb_in_post_lists";b:1;s:18:"tc_show_post_metas";b:1;s:20:"tc_post_metas_design";s:10:"no-buttons";s:23:"tc_show_post_metas_home";b:0;s:30:"tc_show_post_metas_single_post";b:1;s:29:"tc_show_post_metas_post_lists";b:1;s:29:"tc_show_post_metas_categories";b:1;s:23:"tc_show_post_metas_tags";b:1;s:35:"tc_show_post_metas_publication_date";b:1;s:25:"tc_show_post_metas_author";b:1;s:30:"tc_show_post_metas_update_date";b:0;s:32:"tc_post_metas_update_date_format";s:4:"days";s:36:"tc_post_metas_update_notice_in_title";b:0;s:36:"tc_post_metas_update_notice_interval";i:10;s:32:"tc_post_metas_update_notice_text";s:18:"Recently updated !";s:34:"tc_post_metas_update_notice_format";s:13:"label-default";s:27:"tc_post_list_excerpt_length";i:50;s:23:"tc_post_list_show_thumb";b:1;s:36:"tc_post_list_use_attachment_as_thumb";b:1;s:26:"tc_post_list_default_thumb";N;s:24:"tc_post_list_thumb_shape";s:7:"rounded";s:25:"tc_post_list_thumb_height";i:250;s:27:"tc_post_list_thumb_position";s:5:"right";s:28:"tc_post_list_thumb_alternate";b:1;s:12:"tc_cat_title";s:0:"";s:12:"tc_tag_title";s:0:"";s:15:"tc_author_title";s:0:"";s:15:"tc_search_title";s:20:"Search Results for :";s:17:"tc_post_list_grid";s:4:"grid";s:15:"tc_grid_columns";s:1:"3";s:23:"tc_grid_expand_featured";b:1;s:15:"tc_grid_in_blog";b:1;s:18:"tc_grid_in_archive";b:1;s:17:"tc_grid_in_search";b:1;s:14:"tc_grid_shadow";b:1;s:21:"tc_grid_bottom_border";b:1;s:13:"tc_grid_icons";b:1;s:17:"tc_grid_num_words";i:10;s:20:"tc_grid_thumb_height";i:350;s:29:"tc_single_post_thumb_location";s:4:"hide";s:27:"tc_single_post_thumb_height";i:250;s:17:"tc_enable_gallery";b:1;s:19:"tc_gallery_fancybox";b:1;s:16:"tc_gallery_style";b:1;s:17:"tc_enable_dropcap";b:0;s:19:"tc_dropcap_minwords";i:50;s:17:"tc_dropcap_design";s:11:"skin-shadow";s:15:"tc_post_dropcap";b:0;s:15:"tc_page_dropcap";b:0;s:23:"tc_show_post_navigation";b:1;s:28:"tc_show_post_navigation_page";b:0;s:30:"tc_show_post_navigation_single";b:1;s:31:"tc_show_post_navigation_archive";b:1;s:25:"tc_social_in_left-sidebar";b:0;s:26:"tc_social_in_right-sidebar";b:0;s:26:"tc_social_in_sidebar_title";s:12:"Social links";s:19:"tc_social_in_footer";b:1;s:16:"tc_sticky_footer";b:1;s:19:"tc_show_back_to_top";b:1;s:13:"tc_custom_css";N;s:16:"tc_minified_skin";b:1;s:17:"tc_img_smart_load";b:0;s:21:"tc_display_front_help";b:1;s:3:"ver";s:6:"3.4.11";}}', 'yes'),
(175, 'theme_mods_zerif-lite', 'a:2:{i:0;b:0;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1444731782;s:4:"data";a:6:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:0:{}s:16:"sidebar-ourfocus";a:0:{}s:20:"sidebar-testimonials";a:0:{}s:15:"sidebar-aboutus";a:0:{}s:15:"sidebar-ourteam";a:0:{}}}}', 'yes'),
(177, 'widget_zerif_clients-widget', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(178, 'widget_ctup-ads-widget', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(179, 'widget_zerif_team-widget', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(180, 'widget_zerif_testim-widget', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(182, 'theme_mods_minimalzerif', 'a:2:{i:0;b:0;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1444732388;s:4:"data";a:6:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:0:{}s:16:"sidebar-ourfocus";a:0:{}s:20:"sidebar-testimonials";a:0:{}s:15:"sidebar-aboutus";a:0:{}s:15:"sidebar-ourteam";a:0:{}}}}', 'yes'),
(185, 'theme_mods_omega', 'a:2:{i:0;b:0;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1444734252;s:4:"data";a:2:{s:19:"wp_inactive_widgets";a:0:{}s:7:"primary";a:0:{}}}}', 'yes'),
(190, 'theme_mods_twentythirteen', 'a:2:{i:0;b:0;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1444735414;s:4:"data";a:3:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:0:{}s:9:"sidebar-2";N;}}}', 'yes'),
(192, 'theme_mods_twentytwelve', 'a:2:{i:0;b:0;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1444735885;s:4:"data";a:4:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:0:{}s:9:"sidebar-2";N;s:9:"sidebar-3";N;}}}', 'yes'),
(194, 'theme_mods_twentysixteen', 'a:2:{i:0;b:0;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1444735490;s:4:"data";a:4:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:0:{}s:9:"sidebar-2";N;s:9:"sidebar-3";N;}}}', 'yes'),
(195, 'theme_mods_make', 'a:2:{i:0;b:0;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1444815548;s:4:"data";a:7:{s:19:"wp_inactive_widgets";a:0:{}s:12:"sidebar-left";a:0:{}s:13:"sidebar-right";N;s:8:"footer-1";N;s:8:"footer-2";N;s:8:"footer-3";N;s:8:"footer-4";N;}}}', 'yes'),
(216, 'theme_mods_listify', 'a:18:{i:0;b:0;s:16:"header_textcolor";s:5:"blank";s:12:"header_image";s:68:"http://localhost/wp-content/uploads/2015/10/babyhallo-text-white.png";s:23:"color-header-background";s:7:"#3396d1";s:8:"nav-cart";b:0;s:10:"nav-search";b:0;s:16:"background_color";s:6:"ffffff";s:12:"color-scheme";s:7:"Default";s:21:"color-navigation-text";s:7:"#ffffff";s:10:"color-link";s:7:"#3396d1";s:13:"color-primary";s:7:"#77c04b";s:12:"color-accent";s:7:"#3396d1";s:23:"color-footer-background";s:7:"#22262c";s:17:"header_image_data";O:8:"stdClass":5:{s:13:"attachment_id";i:867;s:3:"url";s:68:"http://localhost/wp-content/uploads/2015/10/babyhallo-text-white.png";s:13:"thumbnail_url";s:68:"http://localhost/wp-content/uploads/2015/10/babyhallo-text-white.png";s:6:"height";i:20;s:5:"width";i:101;}s:18:"nav_menu_locations";a:2:{s:7:"primary";i:5;s:9:"secondary";i:0;}s:22:"call-to-action-display";b:1;s:12:"footer-style";s:4:"dark";s:16:"sidebars_widgets";a:2:{s:4:"time";i:1444901137;s:4:"data";a:11:{s:19:"wp_inactive_widgets";a:0:{}s:21:"widget-area-sidebar-1";a:0:{}s:16:"widget-area-home";a:0:{}s:20:"widget-area-footer-1";a:0:{}s:20:"widget-area-footer-2";a:0:{}s:20:"widget-area-footer-3";a:0:{}s:27:"widget-area-sidebar-product";a:0:{}s:24:"widget-area-sidebar-shop";a:0:{}s:19:"archive-job_listing";a:0:{}s:30:"single-job_listing-widget-area";a:0:{}s:18:"single-job_listing";a:0:{}}}}', 'yes'),
(217, 'listify_version', '1.0.0', 'yes'),
(220, 'widget_listify_widget_feature_callout', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(221, 'widget_listify_widget_features', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(222, 'widget_listify_widget_ad', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(257, 'category_children', 'a:0:{}', 'yes'),
(264, 'wpcf7', 'a:1:{s:7:"version";s:3:"4.3";}', 'yes'),
(265, 'jetpack_options', 'a:2:{s:7:"version";s:16:"3.7.2:1444818235";s:11:"old_version";s:16:"3.7.2:1444818235";}', 'yes'),
(266, 'jetpack_activated', '1', 'yes'),
(267, 'jetpack_file_data', 'a:1:{s:5:"3.7.2";a:48:{s:32:"897a2742e7839607c0023b456ed14758";a:13:{s:4:"name";s:20:"Spelling and Grammar";s:11:"description";s:89:"Check your spelling, style, and grammar with the After the Deadline proofreading service.";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:1:"6";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:3:"1.1";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:3:"Yes";s:13:"auto_activate";s:3:"Yes";s:11:"module_tags";s:7:"Writing";s:7:"feature";s:0:"";}s:32:"c870c79f222cdc3114d210d3a3502a79";a:13:{s:4:"name";s:8:"Carousel";s:11:"description";s:63:"Transform standard image galleries into full-screen slideshows.";s:14:"jumpstart_desc";s:79:"Brings your photos and images to life as full-size, easily navigable galleries.";s:4:"sort";s:2:"22";s:20:"recommendation_order";s:2:"12";s:10:"introduced";s:3:"1.5";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:2:"No";s:13:"auto_activate";s:2:"No";s:11:"module_tags";s:17:"Photos and Videos";s:7:"feature";s:9:"Jumpstart";}s:32:"5626c5d4355e483f5d4356630646d742";a:13:{s:4:"name";s:8:"Comments";s:11:"description";s:79:"Let readers comment with WordPress.com, Twitter, Facebook, or Google+ accounts.";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:2:"20";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:3:"1.4";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:3:"Yes";s:13:"auto_activate";s:2:"No";s:11:"module_tags";s:6:"Social";s:7:"feature";s:0:"";}s:32:"24c526e6c78dd2c097eee51c33d627ee";a:13:{s:4:"name";s:12:"Contact Form";s:11:"description";s:44:"Insert a contact form anywhere on your site.";s:14:"jumpstart_desc";s:111:"Adds a button to your post and page editors, allowing you to build simple forms to help visitors stay in touch.";s:4:"sort";s:2:"15";s:20:"recommendation_order";s:2:"14";s:10:"introduced";s:3:"1.3";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:2:"No";s:13:"auto_activate";s:3:"Yes";s:11:"module_tags";s:5:"Other";s:7:"feature";s:9:"Jumpstart";}s:32:"be64897c0a578ee6cadb1a459021fbbe";a:13:{s:4:"name";s:20:"Custom Content Types";s:11:"description";s:92:"Organize and display different types of content on your site, separate from posts and pages.";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:2:"34";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:3:"3.1";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:2:"No";s:13:"auto_activate";s:3:"Yes";s:11:"module_tags";s:7:"Writing";s:7:"feature";s:0:"";}s:32:"6735e720fe2e3f6f2c48fcaf0fe0a157";a:13:{s:4:"name";s:10:"Custom CSS";s:11:"description";s:57:"Customize your site’s CSS without modifying your theme.";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:1:"2";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:3:"1.7";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:2:"No";s:13:"auto_activate";s:3:"Yes";s:11:"module_tags";s:10:"Appearance";s:7:"feature";s:0:"";}s:32:"3abad4b5ddebf37a03f03331b17c1e1b";a:13:{s:4:"name";s:0:"";s:11:"description";s:0:"";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:0:"";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:0:"";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:0:"";s:13:"auto_activate";s:0:"";s:11:"module_tags";s:0:"";s:7:"feature";s:0:"";}s:32:"e30ae0161f5ef7955a2e22021602969b";a:13:{s:4:"name";s:21:"Enhanced Distribution";s:11:"description";s:27:"Increase reach and traffic.";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:1:"5";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:3:"1.2";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:3:"Yes";s:13:"auto_activate";s:6:"Public";s:11:"module_tags";s:7:"Writing";s:7:"feature";s:7:"Traffic";}s:32:"e4e461477edd64344126af366b33ae7c";a:13:{s:4:"name";s:0:"";s:11:"description";s:0:"";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:0:"";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:0:"";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:0:"";s:13:"auto_activate";s:0:"";s:11:"module_tags";s:0:"";s:7:"feature";s:0:"";}s:32:"1e285572509707836075afa0b7a0d17a";a:13:{s:4:"name";s:19:"Gravatar Hovercards";s:11:"description";s:58:"Enable pop-up business cards over commenters’ Gravatars.";s:14:"jumpstart_desc";s:131:"Let commenters link their profiles to their Gravatar accounts, making it easy for your visitors to learn more about your community.";s:4:"sort";s:2:"11";s:20:"recommendation_order";s:2:"13";s:10:"introduced";s:3:"1.1";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:2:"No";s:13:"auto_activate";s:3:"Yes";s:11:"module_tags";s:18:"Social, Appearance";s:7:"feature";s:9:"Jumpstart";}s:32:"2a62f28abd5ac11bea3ce7a8e9c4d893";a:13:{s:4:"name";s:0:"";s:11:"description";s:0:"";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:0:"";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:8:"2.0.3 ??";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:2:"No";s:13:"auto_activate";s:3:"Yes";s:11:"module_tags";s:0:"";s:7:"feature";s:0:"";}s:32:"fd2cbe6ae10ff814cc269d51b32baad9";a:13:{s:4:"name";s:15:"Infinite Scroll";s:11:"description";s:46:"Add support for infinite scroll to your theme.";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:2:"26";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:3:"2.0";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:2:"No";s:13:"auto_activate";s:2:"No";s:11:"module_tags";s:10:"Appearance";s:7:"feature";s:0:"";}s:32:"931a7a94c663547c5cb6cc430e98dd30";a:13:{s:4:"name";s:8:"JSON API";s:11:"description";s:69:"Allow applications to securely access your content through the cloud.";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:2:"19";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:3:"1.9";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:3:"Yes";s:13:"auto_activate";s:6:"Public";s:11:"module_tags";s:19:"Writing, Developers";s:7:"feature";s:0:"";}s:32:"dd442dc05f950526d584e15e54628bfb";a:13:{s:4:"name";s:14:"Beautiful Math";s:11:"description";s:85:"Use LaTeX markup language in posts and pages for complex equations and other geekery.";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:2:"12";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:3:"1.1";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:2:"No";s:13:"auto_activate";s:3:"Yes";s:11:"module_tags";s:7:"Writing";s:7:"feature";s:0:"";}s:32:"96f2d1988c22688e9e3d8a8cc5ee1b5b";a:13:{s:4:"name";s:5:"Likes";s:11:"description";s:70:"Give visitors an easy way to show their appreciation for your content.";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:2:"23";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:3:"2.2";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:3:"Yes";s:13:"auto_activate";s:2:"No";s:11:"module_tags";s:6:"Social";s:7:"feature";s:0:"";}s:32:"f79ea51a248d9f624e0936ef023cffe1";a:13:{s:4:"name";s:6:"Manage";s:11:"description";s:76:"Manage all your sites from a centralized place, https://wordpress.com/sites.";s:14:"jumpstart_desc";s:151:"Helps you remotely manage plugins, turn on automated updates, and more from <a href="https://wordpress.com/plugins/" target="_blank">wordpress.com</a>.";s:4:"sort";s:1:"1";s:20:"recommendation_order";s:1:"3";s:10:"introduced";s:3:"3.4";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:3:"Yes";s:13:"auto_activate";s:2:"No";s:11:"module_tags";s:35:"Centralized Management, Recommended";s:7:"feature";s:22:"Recommended, Jumpstart";}s:32:"46da83c7358c834dcb193789272f7858";a:13:{s:4:"name";s:8:"Markdown";s:11:"description";s:51:"Write posts or pages in plain-text Markdown syntax.";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:2:"31";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:3:"2.8";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:2:"No";s:13:"auto_activate";s:2:"No";s:11:"module_tags";s:7:"Writing";s:7:"feature";s:0:"";}s:32:"c189740a3e69c5f42f12a191a15c3dbf";a:13:{s:4:"name";s:12:"Mobile Theme";s:11:"description";s:64:"Optimize your site with a mobile-friendly theme for smartphones.";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:2:"21";s:20:"recommendation_order";s:2:"11";s:10:"introduced";s:3:"1.8";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:2:"No";s:13:"auto_activate";s:2:"No";s:11:"module_tags";s:31:"Appearance, Mobile, Recommended";s:7:"feature";s:11:"Recommended";}s:32:"0f9fdc374b00a8d5ca816aac44e6d3f6";a:13:{s:4:"name";s:0:"";s:11:"description";s:0:"";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:0:"";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:0:"";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:0:"";s:13:"auto_activate";s:0:"";s:11:"module_tags";s:0:"";s:7:"feature";s:0:"";}s:32:"6f1872535dd77713441708214388213c";a:13:{s:4:"name";s:0:"";s:11:"description";s:0:"";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:0:"";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:0:"";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:0:"";s:13:"auto_activate";s:0:"";s:11:"module_tags";s:0:"";s:7:"feature";s:0:"";}s:32:"65f2f0936d11bffe8cd447696054f38e";a:13:{s:4:"name";s:0:"";s:11:"description";s:0:"";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:0:"";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:0:"";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:0:"";s:13:"auto_activate";s:0:"";s:11:"module_tags";s:0:"";s:7:"feature";s:0:"";}s:32:"a8ff13dae8129c451116dea8803b23da";a:13:{s:4:"name";s:0:"";s:11:"description";s:0:"";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:0:"";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:0:"";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:0:"";s:13:"auto_activate";s:0:"";s:11:"module_tags";s:0:"";s:7:"feature";s:0:"";}s:32:"0a38341a9df2d2cb6f90e4faf65b4d64";a:13:{s:4:"name";s:7:"Monitor";s:11:"description";s:25:"Reports on site downtime.";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:2:"28";s:20:"recommendation_order";s:2:"10";s:10:"introduced";s:3:"2.6";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:3:"Yes";s:13:"auto_activate";s:2:"No";s:11:"module_tags";s:11:"Recommended";s:7:"feature";s:33:"Recommended, Performance-Security";}s:32:"1c8f61fb80e0f6dd697e6d995431161a";a:13:{s:4:"name";s:13:"Notifications";s:11:"description";s:84:"Receive notification of site activity via the admin toolbar and your Mobile devices.";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:2:"13";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:3:"1.9";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:3:"Yes";s:13:"auto_activate";s:3:"Yes";s:11:"module_tags";s:5:"Other";s:7:"feature";s:0:"";}s:32:"4ca0a2f31843f3b2a4522fa8b9fb18d3";a:13:{s:4:"name";s:10:"Omnisearch";s:11:"description";s:66:"Search your entire database from a single field in your Dashboard.";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:2:"16";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:3:"2.3";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:2:"No";s:13:"auto_activate";s:3:"Yes";s:11:"module_tags";s:10:"Developers";s:7:"feature";s:0:"";}s:32:"1f1289f469fe089a9ea32024df083f74";a:13:{s:4:"name";s:6:"Photon";s:11:"description";s:27:"Speed up images and photos.";s:14:"jumpstart_desc";s:141:"Mirrors and serves your images from our free and fast image CDN, improving your site’s performance with no additional load on your servers.";s:4:"sort";s:2:"25";s:20:"recommendation_order";s:1:"1";s:10:"introduced";s:3:"2.0";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:3:"Yes";s:13:"auto_activate";s:2:"No";s:11:"module_tags";s:42:"Photos and Videos, Appearance, Recommended";s:7:"feature";s:44:"Recommended, Jumpstart, Performance-Security";}s:32:"53eb2f9dfe4e9d9b7203d47ab3a0c58e";a:13:{s:4:"name";s:13:"Post by Email";s:11:"description";s:58:"Publish posts by email, using any device and email client.";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:2:"14";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:3:"2.0";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:3:"Yes";s:13:"auto_activate";s:3:"Yes";s:11:"module_tags";s:7:"Writing";s:7:"feature";s:0:"";}s:32:"df74d4db35fc795c9bf4b7b2e769116d";a:13:{s:4:"name";s:7:"Protect";s:11:"description";s:28:"Prevent brute force attacks.";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:1:"1";s:20:"recommendation_order";s:1:"4";s:10:"introduced";s:3:"3.4";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:3:"Yes";s:13:"auto_activate";s:3:"Yes";s:11:"module_tags";s:11:"Recommended";s:7:"feature";s:33:"Recommended, Performance-Security";}s:32:"e8b7c9d9b0be70888c41e139c34eb448";a:13:{s:4:"name";s:9:"Publicize";s:11:"description";s:30:"Automatically promote content.";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:2:"10";s:20:"recommendation_order";s:1:"7";s:10:"introduced";s:3:"2.0";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:3:"Yes";s:13:"auto_activate";s:3:"Yes";s:11:"module_tags";s:19:"Social, Recommended";s:7:"feature";s:20:"Recommended, Traffic";}s:32:"04c7eedf95290d03db05e2fc8682a8da";a:13:{s:4:"name";s:0:"";s:11:"description";s:0:"";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:0:"";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:0:"";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:0:"";s:13:"auto_activate";s:0:"";s:11:"module_tags";s:0:"";s:7:"feature";s:0:"";}s:32:"f36c13c725ee67f8fbb85d85b4fa8bdb";a:13:{s:4:"name";s:13:"Related Posts";s:11:"description";s:24:"Display similar content.";s:14:"jumpstart_desc";s:113:"Keep visitors engaged on your blog by highlighting relevant and new content at the bottom of each published post.";s:4:"sort";s:2:"29";s:20:"recommendation_order";s:1:"9";s:10:"introduced";s:3:"2.9";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:3:"Yes";s:13:"auto_activate";s:2:"No";s:11:"module_tags";s:11:"Recommended";s:7:"feature";s:31:"Recommended, Jumpstart, Traffic";}s:32:"4034d694a22b9864b7d9dbcc291a01f5";a:13:{s:4:"name";s:7:"Sharing";s:11:"description";s:32:"Visitors can share your content.";s:14:"jumpstart_desc";s:116:"Twitter, Facebook and Google+ buttons at the bottom of each post, making it easy for visitors to share your content.";s:4:"sort";s:1:"7";s:20:"recommendation_order";s:1:"6";s:10:"introduced";s:3:"1.1";s:7:"changed";s:3:"1.2";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:2:"No";s:13:"auto_activate";s:3:"Yes";s:11:"module_tags";s:19:"Social, Recommended";s:7:"feature";s:31:"Recommended, Jumpstart, Traffic";}s:32:"a260ebaa113e875bbbe59b54cd2475b1";a:13:{s:4:"name";s:16:"Shortcode Embeds";s:11:"description";s:77:"Embed content from YouTube, Vimeo, SlideShare, and more, no coding necessary.";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:1:"3";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:3:"1.1";s:7:"changed";s:3:"1.2";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:2:"No";s:13:"auto_activate";s:3:"Yes";s:11:"module_tags";s:46:"Photos and Videos, Social, Writing, Appearance";s:7:"feature";s:0:"";}s:32:"48e6f4cc58711b5d627931f72a4f55a2";a:13:{s:4:"name";s:16:"WP.me Shortlinks";s:11:"description";s:56:"Enable WP.me-powered shortlinks for all posts and pages.";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:1:"8";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:3:"1.1";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:3:"Yes";s:13:"auto_activate";s:3:"Yes";s:11:"module_tags";s:6:"Social";s:7:"feature";s:0:"";}s:32:"0361b51d6b8957ba15a90c8893085e51";a:13:{s:4:"name";s:9:"Site Icon";s:11:"description";s:29:"Add a site icon to your site.";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:2:"22";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:3:"3.2";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:2:"No";s:13:"auto_activate";s:2:"No";s:11:"module_tags";s:5:"Other";s:7:"feature";s:0:"";}s:32:"03045ecc30a51f072431bd2f6ccffc37";a:13:{s:4:"name";s:0:"";s:11:"description";s:0:"";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:0:"";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:0:"";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:0:"";s:13:"auto_activate";s:0:"";s:11:"module_tags";s:0:"";s:7:"feature";s:0:"";}s:32:"2e89d8cf494aa4cc028023de2662b571";a:13:{s:4:"name";s:14:"Single Sign On";s:11:"description";s:27:"Secure user authentication.";s:14:"jumpstart_desc";s:98:"Lets you log in to all your Jetpack-enabled sites with one click using your WordPress.com account.";s:4:"sort";s:2:"30";s:20:"recommendation_order";s:1:"5";s:10:"introduced";s:3:"2.6";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:3:"Yes";s:13:"auto_activate";s:2:"No";s:11:"module_tags";s:10:"Developers";s:7:"feature";s:31:"Jumpstart, Performance-Security";}s:32:"caf240bf1da3b6f8ec449d7477ac383e";a:13:{s:4:"name";s:10:"Site Stats";s:11:"description";s:35:"Collect traffic stats and insights.";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:1:"1";s:20:"recommendation_order";s:1:"2";s:10:"introduced";s:3:"1.1";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:3:"Yes";s:13:"auto_activate";s:3:"Yes";s:11:"module_tags";s:23:"Site Stats, Recommended";s:7:"feature";s:20:"Recommended, Traffic";}s:32:"b6ef488128505d6cf819d8a6508a081f";a:13:{s:4:"name";s:13:"Subscriptions";s:11:"description";s:88:"Allow users to subscribe to your posts and comments and receive notifications via email.";s:14:"jumpstart_desc";s:126:"Give visitors two easy subscription options — while commenting, or via a separate email subscription widget you can display.";s:4:"sort";s:1:"9";s:20:"recommendation_order";s:1:"8";s:10:"introduced";s:3:"1.2";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:3:"Yes";s:13:"auto_activate";s:3:"Yes";s:11:"module_tags";s:6:"Social";s:7:"feature";s:9:"Jumpstart";}s:32:"6c0c9cebc91c7aee0de35562fcb8d0b0";a:13:{s:4:"name";s:0:"";s:11:"description";s:0:"";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:0:"";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:0:"";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:0:"";s:13:"auto_activate";s:0:"";s:11:"module_tags";s:0:"";s:7:"feature";s:0:"";}s:32:"f354e2a9f6f0823a628e741e7aa88906";a:13:{s:4:"name";s:15:"Tiled Galleries";s:11:"description";s:73:"Display your image galleries in a variety of sleek, graphic arrangements.";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:2:"24";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:3:"2.1";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:2:"No";s:13:"auto_activate";s:2:"No";s:11:"module_tags";s:17:"Photos and Videos";s:7:"feature";s:0:"";}s:32:"fb806f9c3f633a466076615f99329d22";a:13:{s:4:"name";s:0:"";s:11:"description";s:0:"";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:0:"";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:0:"";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:0:"";s:13:"auto_activate";s:0:"";s:11:"module_tags";s:0:"";s:7:"feature";s:0:"";}s:32:"c6908213746b1364a541c3fde961936f";a:13:{s:4:"name";s:10:"VaultPress";s:11:"description";s:27:"Backups and security scans.";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:2:"32";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:5:"0:1.2";s:7:"changed";s:0:"";s:10:"deactivate";s:5:"false";s:4:"free";s:5:"false";s:19:"requires_connection";s:3:"Yes";s:13:"auto_activate";s:3:"Yes";s:11:"module_tags";s:0:"";s:7:"feature";s:20:"Performance-Security";}s:32:"df97f3fe6750f6490164e710152d5946";a:13:{s:4:"name";s:17:"Site Verification";s:11:"description";s:78:"Verify your site or domain with Google Webmaster Tools, Pinterest, and others.";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:2:"33";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:3:"3.0";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:2:"No";s:13:"auto_activate";s:3:"Yes";s:11:"module_tags";s:0:"";s:7:"feature";s:0:"";}s:32:"5e000fbc427cecaed6e1b8dbf2732462";a:13:{s:4:"name";s:10:"VideoPress";s:11:"description";s:68:"Upload and embed videos right on your site. (Subscription required.)";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:2:"27";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:3:"2.5";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:5:"false";s:19:"requires_connection";s:3:"Yes";s:13:"auto_activate";s:0:"";s:11:"module_tags";s:17:"Photos and Videos";s:7:"feature";s:0:"";}s:32:"86f746acdf5d11f8fe753092aec6f619";a:13:{s:4:"name";s:17:"Widget Visibility";s:11:"description";s:57:"Specify which widgets appear on which pages of your site.";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:2:"17";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:3:"2.4";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:2:"No";s:13:"auto_activate";s:3:"Yes";s:11:"module_tags";s:10:"Appearance";s:7:"feature";s:0:"";}s:32:"b91d486b68701c78e5f2776144c546f4";a:13:{s:4:"name";s:21:"Extra Sidebar Widgets";s:11:"description";s:79:"Add images, Twitter streams, your site’s RSS links, and more to your sidebar.";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:1:"4";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:3:"1.2";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:2:"No";s:13:"auto_activate";s:3:"Yes";s:11:"module_tags";s:18:"Social, Appearance";s:7:"feature";s:0:"";}s:32:"98a767d5a9377cc7b8d08fda01d960c0";a:13:{s:4:"name";s:0:"";s:11:"description";s:0:"";s:14:"jumpstart_desc";s:0:"";s:4:"sort";s:0:"";s:20:"recommendation_order";s:0:"";s:10:"introduced";s:0:"";s:7:"changed";s:0:"";s:10:"deactivate";s:0:"";s:4:"free";s:0:"";s:19:"requires_connection";s:0:"";s:13:"auto_activate";s:0:"";s:11:"module_tags";s:0:"";s:7:"feature";s:0:"";}}}', 'yes'),
(268, 'jetpack_available_modules', 'a:1:{s:5:"3.7.2";a:36:{s:18:"after-the-deadline";s:3:"1.1";s:8:"carousel";s:3:"1.5";s:8:"comments";s:3:"1.4";s:12:"contact-form";s:3:"1.3";s:20:"custom-content-types";s:3:"3.1";s:10:"custom-css";s:3:"1.7";s:21:"enhanced-distribution";s:3:"1.2";s:19:"gravatar-hovercards";s:3:"1.1";s:15:"infinite-scroll";s:3:"2.0";s:8:"json-api";s:3:"1.9";s:5:"latex";s:3:"1.1";s:5:"likes";s:3:"2.2";s:6:"manage";s:3:"3.4";s:8:"markdown";s:3:"2.8";s:9:"minileven";s:3:"1.8";s:7:"monitor";s:3:"2.6";s:5:"notes";s:3:"1.9";s:10:"omnisearch";s:3:"2.3";s:6:"photon";s:3:"2.0";s:13:"post-by-email";s:3:"2.0";s:7:"protect";s:3:"3.4";s:9:"publicize";s:3:"2.0";s:13:"related-posts";s:3:"2.9";s:10:"sharedaddy";s:3:"1.1";s:10:"shortcodes";s:3:"1.1";s:10:"shortlinks";s:3:"1.1";s:9:"site-icon";s:3:"3.2";s:3:"sso";s:3:"2.6";s:5:"stats";s:3:"1.1";s:13:"subscriptions";s:3:"1.2";s:13:"tiled-gallery";s:3:"2.1";s:10:"vaultpress";s:5:"0:1.2";s:18:"verification-tools";s:3:"3.0";s:10:"videopress";s:3:"2.5";s:17:"widget-visibility";s:3:"2.4";s:7:"widgets";s:3:"1.2";}}', 'yes'),
(269, 'woocommerce_default_country', 'GB', 'yes'),
(270, 'woocommerce_allowed_countries', 'all', 'yes'),
(271, 'woocommerce_specific_allowed_countries', '', 'yes'),
(272, 'woocommerce_default_customer_address', 'geolocation', 'yes'),
(273, 'woocommerce_demo_store', 'no', 'yes'),
(274, 'woocommerce_demo_store_notice', 'This is a demo store for testing purposes &mdash; no orders shall be fulfilled.', 'no'),
(275, 'woocommerce_currency', 'GBP', 'yes'),
(276, 'woocommerce_currency_pos', 'left', 'yes'),
(277, 'woocommerce_price_thousand_sep', ',', 'yes'),
(278, 'woocommerce_price_decimal_sep', '.', 'yes'),
(279, 'woocommerce_price_num_decimals', '2', 'yes'),
(280, 'woocommerce_weight_unit', 'kg', 'yes'),
(281, 'woocommerce_dimension_unit', 'cm', 'yes'),
(282, 'woocommerce_enable_review_rating', 'yes', 'no'),
(283, 'woocommerce_review_rating_required', 'yes', 'no'),
(284, 'woocommerce_review_rating_verification_label', 'yes', 'no'),
(285, 'woocommerce_review_rating_verification_required', 'no', 'no'),
(286, 'woocommerce_shop_page_id', '', 'yes'),
(287, 'woocommerce_shop_page_display', '', 'yes'),
(288, 'woocommerce_category_archive_display', '', 'yes'),
(289, 'woocommerce_default_catalog_orderby', 'menu_order', 'yes'),
(290, 'woocommerce_cart_redirect_after_add', 'no', 'yes'),
(291, 'woocommerce_enable_ajax_add_to_cart', 'yes', 'yes'),
(292, 'shop_catalog_image_size', 'a:3:{s:5:"width";s:3:"300";s:6:"height";s:3:"300";s:4:"crop";i:1;}', 'yes'),
(293, 'shop_single_image_size', 'a:3:{s:5:"width";s:3:"600";s:6:"height";s:3:"600";s:4:"crop";i:1;}', 'yes'),
(294, 'shop_thumbnail_image_size', 'a:3:{s:5:"width";s:3:"180";s:6:"height";s:3:"180";s:4:"crop";i:1;}', 'yes'),
(295, 'woocommerce_enable_lightbox', 'yes', 'yes'),
(296, 'woocommerce_manage_stock', 'yes', 'yes'),
(297, 'woocommerce_hold_stock_minutes', '60', 'no'),
(298, 'woocommerce_notify_low_stock', 'yes', 'no'),
(299, 'woocommerce_notify_no_stock', 'yes', 'no'),
(300, 'woocommerce_stock_email_recipient', 'nick.j.goodall@gmail.com', 'no'),
(301, 'woocommerce_notify_low_stock_amount', '2', 'no'),
(302, 'woocommerce_notify_no_stock_amount', '0', 'no'),
(303, 'woocommerce_hide_out_of_stock_items', 'no', 'yes'),
(304, 'woocommerce_stock_format', '', 'yes'),
(305, 'woocommerce_file_download_method', 'force', 'no'),
(306, 'woocommerce_downloads_require_login', 'no', 'no'),
(307, 'woocommerce_downloads_grant_access_after_payment', 'yes', 'no'),
(308, 'woocommerce_calc_taxes', 'no', 'yes'),
(309, 'woocommerce_prices_include_tax', 'no', 'yes'),
(310, 'woocommerce_tax_based_on', 'shipping', 'yes'),
(311, 'woocommerce_shipping_tax_class', 'title', 'yes'),
(312, 'woocommerce_tax_round_at_subtotal', 'no', 'yes'),
(313, 'woocommerce_tax_classes', 'Reduced Rate\nZero Rate', 'yes'),
(314, 'woocommerce_tax_display_shop', 'excl', 'yes'),
(315, 'woocommerce_tax_display_cart', 'excl', 'no'),
(316, 'woocommerce_price_display_suffix', '', 'yes'),
(317, 'woocommerce_tax_total_display', 'itemized', 'no'),
(318, 'woocommerce_enable_coupons', 'yes', 'no'),
(319, 'woocommerce_calc_discounts_sequentially', 'no', 'no'),
(320, 'woocommerce_enable_guest_checkout', 'yes', 'no'),
(321, 'woocommerce_force_ssl_checkout', 'no', 'yes'),
(322, 'woocommerce_unforce_ssl_checkout', 'no', 'yes'),
(323, 'woocommerce_cart_page_id', '', 'yes'),
(324, 'woocommerce_checkout_page_id', '', 'yes'),
(325, 'woocommerce_terms_page_id', '', 'no'),
(326, 'woocommerce_checkout_pay_endpoint', 'order-pay', 'yes'),
(327, 'woocommerce_checkout_order_received_endpoint', 'order-received', 'yes') ;
INSERT INTO `wp_options` ( `option_id`, `option_name`, `option_value`, `autoload`) VALUES
(328, 'woocommerce_myaccount_add_payment_method_endpoint', 'add-payment-method', 'yes'),
(329, 'woocommerce_calc_shipping', 'no', 'yes'),
(330, 'woocommerce_enable_shipping_calc', 'yes', 'no'),
(331, 'woocommerce_shipping_cost_requires_address', 'no', 'no'),
(332, 'woocommerce_shipping_method_format', '', 'no'),
(333, 'woocommerce_ship_to_destination', 'billing', 'no'),
(334, 'woocommerce_ship_to_countries', '', 'yes'),
(335, 'woocommerce_specific_ship_to_countries', '', 'yes'),
(336, 'woocommerce_myaccount_page_id', '', 'yes'),
(337, 'woocommerce_myaccount_view_order_endpoint', 'view-order', 'yes'),
(338, 'woocommerce_myaccount_edit_account_endpoint', 'edit-account', 'yes'),
(339, 'woocommerce_myaccount_edit_address_endpoint', 'edit-address', 'yes'),
(340, 'woocommerce_myaccount_lost_password_endpoint', 'lost-password', 'yes'),
(341, 'woocommerce_logout_endpoint', 'customer-logout', 'yes'),
(342, 'woocommerce_enable_signup_and_login_from_checkout', 'yes', 'no'),
(343, 'woocommerce_enable_myaccount_registration', 'no', 'no'),
(344, 'woocommerce_enable_checkout_login_reminder', 'yes', 'no'),
(345, 'woocommerce_registration_generate_username', 'yes', 'no'),
(346, 'woocommerce_registration_generate_password', 'no', 'no'),
(347, 'woocommerce_email_from_name', 'babyhallo', 'no'),
(348, 'woocommerce_email_from_address', 'nick.j.goodall@gmail.com', 'no'),
(349, 'woocommerce_email_header_image', '', 'no'),
(350, 'woocommerce_email_footer_text', 'babyhallo - Powered by WooCommerce', 'no'),
(351, 'woocommerce_email_base_color', '#557da1', 'no'),
(352, 'woocommerce_email_background_color', '#f5f5f5', 'no'),
(353, 'woocommerce_email_body_background_color', '#fdfdfd', 'no'),
(354, 'woocommerce_email_text_color', '#505050', 'no'),
(355, 'woocommerce_api_enabled', 'yes', 'yes'),
(357, 'woocommerce_admin_notices', 'a:1:{i:0;s:7:"install";}', 'yes'),
(360, 'woocommerce_db_version', '2.4.7', 'yes'),
(361, 'woocommerce_version', '2.4.7', 'yes'),
(362, 'woocommerce_language_pack_version', 'a:2:{i:0;s:5:"2.4.7";i:1;s:0:"";}', 'yes'),
(368, 'job_listing_type_children', 'a:0:{}', 'yes'),
(369, 'job_manager_installed_terms', '1', 'yes'),
(370, 'job_manager_enable_categories', '1', 'yes'),
(373, 'wp_job_manager_version', '1.23.9', 'yes'),
(380, 'jetpack_security_report', 'a:0:{}', 'yes'),
(387, 'job_manager_per_page', '10', 'yes'),
(388, 'job_manager_hide_filled_positions', '0', 'yes'),
(389, 'job_manager_hide_expired_content', '1', 'yes'),
(390, 'job_manager_enable_default_category_multiselect', '0', 'yes'),
(391, 'job_manager_category_filter_type', 'any', 'yes'),
(392, 'job_manager_regions_filter', '0', 'yes'),
(393, 'job_manager_user_requires_account', '1', 'yes'),
(394, 'job_manager_enable_registration', '1', 'yes'),
(395, 'job_manager_generate_username_from_email', '1', 'yes'),
(396, 'job_manager_registration_role', 'employer', 'yes'),
(397, 'job_manager_submission_requires_approval', '1', 'yes'),
(398, 'job_manager_user_can_edit_pending_submissions', '0', 'yes'),
(399, 'job_manager_submission_duration', '30', 'yes'),
(400, 'job_manager_allowed_application_method', '', 'yes'),
(401, 'job_manager_submit_job_form_page_id', '', 'yes'),
(402, 'job_manager_job_dashboard_page_id', '', 'yes'),
(403, 'job_manager_jobs_page_id', '', 'yes'),
(404, 'woocommerce_meta_box_errors', 'a:0:{}', 'yes'),
(405, 'jetpack_unique_connection', 'a:1:{s:12:"disconnected";i:1;}', 'yes'),
(408, 'widget_listify_widget_panel_listing_auhtor', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(409, 'widget_listify_widget_panel_listing_business_hours', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(410, 'widget_listify_widget_panel_listing_content', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(411, 'widget_listify_widget_panel_listing_map', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(412, 'widget_listify_widget_panel_listing_gallery', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(413, 'widget_listify_widget_panel_listing_gallery_slider', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(414, 'widget_listify_widget_panel_listing_comments', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(415, 'widget_listify_widget_panel_listing_social_profiles', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(416, 'widget_listify_widget_panel_listing_tags', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(417, 'widget_listify_widget_panel_listing_video', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(418, 'widget_listify_widget_taxonomy_image_grid', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(419, 'widget_listify_widget_map_listings', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(420, 'widget_listify_widget_recent_listings', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(421, 'widget_listify_widget_search_listings', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(422, 'widget_listify_widget_tabbed_listings', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(423, 'widget_listify_widget_taxonomy_term_lists', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(424, 'widget_woocommerce_widget_cart', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(425, 'widget_woocommerce_layered_nav', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(426, 'widget_woocommerce_layered_nav_filters', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(427, 'widget_woocommerce_price_filter', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(428, 'widget_woocommerce_product_categories', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(429, 'widget_woocommerce_products', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(430, 'widget_woocommerce_product_search', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(431, 'widget_woocommerce_product_tag_cloud', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(432, 'widget_woocommerce_recently_viewed_products', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(433, 'widget_woocommerce_recent_reviews', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(434, 'widget_woocommerce_top_rated_products', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(499, 'facetwp_settings', '{"facets":[{"label":"Categories","name":"categories","type":"checkboxes","source":"tax\\/category","parent_term":"","orderby":"count","operator":"and","hierarchical":"no","ghosts":"no","preserve_ghosts":"no","count":"10"}],"templates":[{"label":"Default","name":"default","query":"<?php\\nreturn array(\\n    \'post_type\' => \'any\',\\n    \'posts_per_page\' => 15,\\n);","template":"<?php while ( have_posts() ) : the_post(); ?>\\n    <div><a href=\\"<?php the_permalink(); ?>\\"><?php the_title(); ?><\\/a><\\/div>\\n<?php endwhile; ?>"}],"settings":{"permalink_type":"get","thousands_separator":",","decimal_separator":"."}}', 'yes'),
(500, 'facetwp_version', '2.2.6', 'yes'),
(504, 'facetwp_activation', '{"status":"error","message":"The license does not exist"}', 'yes'),
(507, 'jmfe_output_wpautop', 's:45:"a:2:{i:0;s:9:"wp-editor";i:1;s:8:"textarea";}";', 'yes'),
(508, 'wp_job_manager_field_editor_version', '1.3.8', 'yes'),
(509, 'jmfe_update_origin', '1.3.8', 'yes'),
(510, 'jmfe_set_core_company_auto_output', '1.3.8', 'yes'),
(511, 'jmfe_enable_required_label', '0', 'yes'),
(512, 'jmfe_enable_optional_label', '0', 'yes'),
(513, 'jmfe_enable_job_submit_button', '0', 'yes'),
(514, 'jmfe_recaptcha_label', 'Are you human?', 'yes'),
(515, 'jmfe_recaptcha_enable_job', '0', 'yes'),
(516, 'jmfe_fields_dp_custom', '', 'yes'),
(517, 'jmfe_fields_dp_i18n', '0', 'yes'),
(518, 'jmfe_enable_bug_reporter', '0', 'yes'),
(519, 'jmfe_disable_license_deactivate', '0', 'yes'),
(520, 'jmfe_field_dump', '0', 'yes') ;
INSERT INTO `wp_options` ( `option_id`, `option_name`, `option_value`, `autoload`) VALUES
(521, 'wp-job-manager-field-editor_instance', 'B1aV5lLMgQDS', 'yes'),
(551, 'theme_mods_listify-child', 'a:1:{i:0;b:0;}', 'yes') ;

#
# End of data contents of table `wp_options`
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
) ENGINE=InnoDB AUTO_INCREMENT=613 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `wp_postmeta`
#
INSERT INTO `wp_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 4, '_edit_last', '1'),
(3, 4, '_edit_lock', '1444728393:1'),
(6, 2, '_edit_lock', '1444735699:1'),
(7, 4, 'tc-thumb-fld', 'a:2:{s:9:"_thumb_id";b:0;s:11:"_thumb_type";s:10:"attachment";}'),
(8, 1, 'tc-thumb-fld', 'a:2:{s:9:"_thumb_id";b:0;s:11:"_thumb_type";s:10:"attachment";}'),
(11, 7, '_wp_attached_file', '2015/10/babyhallo_new_logo2-e1444732440561.png'),
(12, 7, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:600;s:6:"height";i:91;s:4:"file";s:46:"2015/10/babyhallo_new_logo2-e1444732440561.png";s:5:"sizes";a:8:{s:9:"thumbnail";a:4:{s:4:"file";s:31:"babyhallo_new_logo2-150x146.png";s:5:"width";i:150;s:6:"height";i:146;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:30:"babyhallo_new_logo2-300x46.png";s:5:"width";i:300;s:6:"height";i:46;s:9:"mime-type";s:9:"image/png";}s:14:"post-thumbnail";a:4:{s:4:"file";s:31:"babyhallo_new_logo2-250x146.png";s:5:"width";i:250;s:6:"height";i:146;s:9:"mime-type";s:9:"image/png";}s:20:"post-thumbnail-large";a:4:{s:4:"file";s:31:"babyhallo_new_logo2-750x146.png";s:5:"width";i:750;s:6:"height";i:146;s:9:"mime-type";s:9:"image/png";}s:26:"post-thumbnail-large-table";a:4:{s:4:"file";s:31:"babyhallo_new_logo2-600x146.png";s:5:"width";i:600;s:6:"height";i:146;s:9:"mime-type";s:9:"image/png";}s:27:"post-thumbnail-large-mobile";a:4:{s:4:"file";s:31:"babyhallo_new_logo2-400x146.png";s:5:"width";i:400;s:6:"height";i:146;s:9:"mime-type";s:9:"image/png";}s:19:"zerif_project_photo";a:4:{s:4:"file";s:31:"babyhallo_new_logo2-285x146.png";s:5:"width";i:285;s:6:"height";i:146;s:9:"mime-type";s:9:"image/png";}s:20:"zerif_our_team_photo";a:4:{s:4:"file";s:31:"babyhallo_new_logo2-174x146.png";s:5:"width";i:174;s:6:"height";i:146;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(13, 7, '_edit_lock', '1444732315:1'),
(14, 7, '_wp_attachment_backup_sizes', 'a:1:{s:9:"full-orig";a:3:{s:5:"width";i:960;s:6:"height";i:146;s:4:"file";s:23:"babyhallo_new_logo2.png";}}'),
(15, 7, '_edit_last', '1'),
(16, 7, '_wp_attachment_custom_header_last_used_twentytwelve', '1444735609'),
(17, 7, '_wp_attachment_is_custom_header', 'listify'),
(18, 7, '_wp_attachment_custom_header_last_used_listify', '1444815623'),
(19, 9, '_wp_attached_file', '2015/10/babyhallo-100x35.png'),
(20, 9, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:100;s:6:"height";i:16;s:4:"file";s:28:"2015/10/babyhallo-100x35.png";s:5:"sizes";a:1:{s:14:"post-thumbnail";a:4:{s:4:"file";s:27:"babyhallo-100x35-100x16.png";s:5:"width";i:100;s:6:"height";i:16;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(21, 9, '_wp_attachment_custom_header_last_used_listify', '1444816280'),
(22, 9, '_wp_attachment_is_custom_header', 'listify'),
(23, 11, '_edit_last', '1'),
(24, 11, '_edit_lock', '1444831700:1'),
(25, 11, '_wp_page_template', 'page-templates/template-home.php'),
(26, 11, 'enable_tertiary_navigation', '0'),
(27, 11, 'hero_style', 'image'),
(30, 147, '_wp_attached_file', '2014/10/iphone-home-page.jpg'),
(31, 147, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:2978;s:6:"height";i:1076;s:4:"file";s:28:"2014/10/iphone-home-page.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:28:"iphone-home-page-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:28:"iphone-home-page-300x108.jpg";s:5:"width";i:300;s:6:"height";i:108;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:29:"iphone-home-page-1024x370.jpg";s:5:"width";i:1024;s:6:"height";i:370;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:28:"iphone-home-page-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(32, 692, '_wp_attached_file', '2014/10/how-it-works.jpg'),
(33, 692, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1800;s:6:"height";i:737;s:4:"file";s:24:"2014/10/how-it-works.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:24:"how-it-works-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:24:"how-it-works-300x123.jpg";s:5:"width";i:300;s:6:"height";i:123;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:25:"how-it-works-1024x419.jpg";s:5:"width";i:1024;s:6:"height";i:419;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:24:"how-it-works-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(34, 698, '_wp_attached_file', '2014/10/Vo7YbYQQ8iyOo4J9bOoj_ggb24.jpg'),
(35, 698, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:2580;s:6:"height";i:1716;s:4:"file";s:38:"2014/10/Vo7YbYQQ8iyOo4J9bOoj_ggb24.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:38:"Vo7YbYQQ8iyOo4J9bOoj_ggb24-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:38:"Vo7YbYQQ8iyOo4J9bOoj_ggb24-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:39:"Vo7YbYQQ8iyOo4J9bOoj_ggb24-1024x681.jpg";s:5:"width";i:1024;s:6:"height";i:681;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:38:"Vo7YbYQQ8iyOo4J9bOoj_ggb24-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(36, 700, '_wp_attached_file', '2014/11/ZLSw0SXxThSrkXRIiCdT_DSC_0345.jpg'),
(37, 700, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1400;s:6:"height";i:930;s:4:"file";s:41:"2014/11/ZLSw0SXxThSrkXRIiCdT_DSC_0345.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:41:"ZLSw0SXxThSrkXRIiCdT_DSC_0345-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:41:"ZLSw0SXxThSrkXRIiCdT_DSC_0345-300x199.jpg";s:5:"width";i:300;s:6:"height";i:199;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:42:"ZLSw0SXxThSrkXRIiCdT_DSC_0345-1024x680.jpg";s:5:"width";i:1024;s:6:"height";i:680;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:41:"ZLSw0SXxThSrkXRIiCdT_DSC_0345-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(38, 715, '_wp_attached_file', '2014/10/listing.png'),
(39, 715, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1467;s:6:"height";i:1100;s:4:"file";s:19:"2014/10/listing.png";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:19:"listing-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:19:"listing-300x225.png";s:5:"width";i:300;s:6:"height";i:225;s:9:"mime-type";s:9:"image/png";}s:5:"large";a:4:{s:4:"file";s:20:"listing-1024x768.png";s:5:"width";i:1024;s:6:"height";i:768;s:9:"mime-type";s:9:"image/png";}s:14:"post-thumbnail";a:4:{s:4:"file";s:19:"listing-100x100.png";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(40, 716, '_wp_attached_file', '2014/10/account.png'),
(41, 716, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1467;s:6:"height";i:1100;s:4:"file";s:19:"2014/10/account.png";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:19:"account-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:19:"account-300x225.png";s:5:"width";i:300;s:6:"height";i:225;s:9:"mime-type";s:9:"image/png";}s:5:"large";a:4:{s:4:"file";s:20:"account-1024x768.png";s:5:"width";i:1024;s:6:"height";i:768;s:9:"mime-type";s:9:"image/png";}s:14:"post-thumbnail";a:4:{s:4:"file";s:19:"account-100x100.png";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(42, 804, '_wp_attached_file', '2014/11/IMG_9840.jpg'),
(43, 804, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1550;s:6:"height";i:1033;s:4:"file";s:20:"2014/11/IMG_9840.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:20:"IMG_9840-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:20:"IMG_9840-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:21:"IMG_9840-1024x682.jpg";s:5:"width";i:1024;s:6:"height";i:682;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:20:"IMG_9840-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(44, 805, '_wp_attached_file', '2014/11/foodiesfeed.com_mobile_small-burger-beer.jpg'),
(45, 805, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1500;s:6:"height";i:999;s:4:"file";s:52:"2014/11/foodiesfeed.com_mobile_small-burger-beer.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:52:"foodiesfeed.com_mobile_small-burger-beer-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:52:"foodiesfeed.com_mobile_small-burger-beer-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:53:"foodiesfeed.com_mobile_small-burger-beer-1024x682.jpg";s:5:"width";i:1024;s:6:"height";i:682;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:52:"foodiesfeed.com_mobile_small-burger-beer-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(46, 806, '_wp_attached_file', '2014/11/foodiesfeed.com_half-of-a-chicken.jpg'),
(47, 806, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1500;s:6:"height";i:1110;s:4:"file";s:45:"2014/11/foodiesfeed.com_half-of-a-chicken.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:45:"foodiesfeed.com_half-of-a-chicken-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:45:"foodiesfeed.com_half-of-a-chicken-300x222.jpg";s:5:"width";i:300;s:6:"height";i:222;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:46:"foodiesfeed.com_half-of-a-chicken-1024x758.jpg";s:5:"width";i:1024;s:6:"height";i:758;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:45:"foodiesfeed.com_half-of-a-chicken-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:51:"Attribution-ShareAlike 3.0 Unported. @motivo. 2014.";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(48, 807, '_wp_attached_file', '2014/11/15757079382_a61f5c8e62_o.jpg'),
(49, 807, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1550;s:6:"height";i:1163;s:4:"file";s:36:"2014/11/15757079382_a61f5c8e62_o.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:36:"15757079382_a61f5c8e62_o-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:36:"15757079382_a61f5c8e62_o-300x225.jpg";s:5:"width";i:300;s:6:"height";i:225;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:37:"15757079382_a61f5c8e62_o-1024x768.jpg";s:5:"width";i:1024;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:36:"15757079382_a61f5c8e62_o-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(50, 808, '_wp_attached_file', '2014/11/foodiesfeed.com_mobile-coffee8.jpg'),
(51, 808, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1500;s:6:"height";i:1001;s:4:"file";s:42:"2014/11/foodiesfeed.com_mobile-coffee8.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:42:"foodiesfeed.com_mobile-coffee8-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:42:"foodiesfeed.com_mobile-coffee8-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:43:"foodiesfeed.com_mobile-coffee8-1024x683.jpg";s:5:"width";i:1024;s:6:"height";i:683;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:42:"foodiesfeed.com_mobile-coffee8-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(52, 809, '_wp_attached_file', '2014/11/20140215-DSC_0362.jpg'),
(53, 809, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1500;s:6:"height";i:1000;s:4:"file";s:29:"2014/11/20140215-DSC_0362.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:29:"20140215-DSC_0362-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:29:"20140215-DSC_0362-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:30:"20140215-DSC_0362-1024x683.jpg";s:5:"width";i:1024;s:6:"height";i:683;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:29:"20140215-DSC_0362-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(54, 810, '_wp_attached_file', '2014/11/DeathtoStock_NYC19.jpg'),
(55, 810, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1550;s:6:"height";i:1033;s:4:"file";s:30:"2014/11/DeathtoStock_NYC19.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:30:"DeathtoStock_NYC19-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:30:"DeathtoStock_NYC19-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:31:"DeathtoStock_NYC19-1024x682.jpg";s:5:"width";i:1024;s:6:"height";i:682;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:30:"DeathtoStock_NYC19-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(56, 811, '_wp_attached_file', '2014/11/IMG_0027_retouched.jpg'),
(57, 811, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1550;s:6:"height";i:1033;s:4:"file";s:30:"2014/11/IMG_0027_retouched.jpg";s:5:"sizes";a:4:{s:9:"thumbnail";a:4:{s:4:"file";s:30:"IMG_0027_retouched-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:30:"IMG_0027_retouched-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:31:"IMG_0027_retouched-1024x682.jpg";s:5:"width";i:1024;s:6:"height";i:682;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:30:"IMG_0027_retouched-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(58, 812, '_menu_item_type', 'custom'),
(59, 812, '_menu_item_menu_item_parent', '0'),
(60, 812, '_menu_item_object_id', '812'),
(61, 812, '_menu_item_object', 'custom'),
(62, 812, '_menu_item_target', ''),
(63, 812, '_menu_item_classes', 'a:1:{i:0;s:10:"ion-gear-a";}'),
(64, 812, '_menu_item_xfn', ''),
(65, 812, '_menu_item_url', '/my-account/edit-account/'),
(66, 813, '_menu_item_type', 'custom'),
(67, 813, '_menu_item_menu_item_parent', '833'),
(68, 813, '_menu_item_object_id', '813'),
(69, 813, '_menu_item_object', 'custom'),
(70, 813, '_menu_item_target', ''),
(71, 813, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(72, 813, '_menu_item_xfn', ''),
(73, 813, '_menu_item_url', '/my-account/edit-account/'),
(74, 814, '_menu_item_type', 'custom'),
(75, 814, '_menu_item_menu_item_parent', '0'),
(76, 814, '_menu_item_object_id', '814'),
(77, 814, '_menu_item_object', 'custom'),
(78, 814, '_menu_item_target', ''),
(79, 814, '_menu_item_classes', 'a:1:{i:0;s:8:"ion-card";}'),
(80, 814, '_menu_item_xfn', ''),
(81, 814, '_menu_item_url', '/my-account/edit-address/billing/'),
(82, 815, '_menu_item_type', 'custom'),
(83, 815, '_menu_item_menu_item_parent', '0'),
(84, 815, '_menu_item_object_id', '815'),
(85, 815, '_menu_item_object', 'custom'),
(86, 815, '_menu_item_target', ''),
(87, 815, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(88, 815, '_menu_item_xfn', ''),
(89, 815, '_menu_item_url', 'http://facebook.com/astoundify'),
(90, 816, '_menu_item_type', 'custom'),
(91, 816, '_menu_item_menu_item_parent', '0'),
(92, 816, '_menu_item_object_id', '816'),
(93, 816, '_menu_item_object', 'custom'),
(94, 816, '_menu_item_target', ''),
(95, 816, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(96, 816, '_menu_item_xfn', ''),
(97, 816, '_menu_item_url', 'http://twitter.com/astoundify'),
(98, 817, '_menu_item_type', 'custom'),
(99, 817, '_menu_item_menu_item_parent', '0'),
(100, 817, '_menu_item_object_id', '817'),
(101, 817, '_menu_item_object', 'custom'),
(102, 817, '_menu_item_target', ''),
(103, 817, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(104, 817, '_menu_item_xfn', ''),
(105, 817, '_menu_item_url', 'https://plus.google.com/'),
(106, 818, '_menu_item_type', 'custom') ;
INSERT INTO `wp_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(107, 818, '_menu_item_menu_item_parent', '0'),
(108, 818, '_menu_item_object_id', '818'),
(109, 818, '_menu_item_object', 'custom'),
(110, 818, '_menu_item_target', ''),
(111, 818, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(112, 818, '_menu_item_xfn', ''),
(113, 818, '_menu_item_url', 'http://instagram.com/'),
(114, 819, '_menu_item_type', 'custom'),
(115, 819, '_menu_item_menu_item_parent', '0'),
(116, 819, '_menu_item_object_id', '819'),
(117, 819, '_menu_item_object', 'custom'),
(118, 819, '_menu_item_target', ''),
(119, 819, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(120, 819, '_menu_item_xfn', ''),
(121, 819, '_menu_item_url', 'https://vimeo.com/astoundify'),
(122, 820, '_menu_item_type', 'custom'),
(123, 820, '_menu_item_menu_item_parent', '0'),
(124, 820, '_menu_item_object_id', '820'),
(125, 820, '_menu_item_object', 'custom'),
(126, 820, '_menu_item_target', ''),
(127, 820, '_menu_item_classes', 'a:1:{i:0;s:13:"ion-help-buoy";}'),
(128, 820, '_menu_item_xfn', ''),
(129, 820, '_menu_item_url', '#'),
(130, 821, '_menu_item_type', 'custom'),
(131, 821, '_menu_item_menu_item_parent', '0'),
(132, 821, '_menu_item_object_id', '821'),
(133, 821, '_menu_item_object', 'custom'),
(134, 821, '_menu_item_target', ''),
(135, 821, '_menu_item_classes', 'a:1:{i:0;s:13:"ion-clipboard";}'),
(136, 821, '_menu_item_xfn', ''),
(137, 821, '_menu_item_url', 'https://demo.astoundify.com/listify/terms-of-service/'),
(138, 822, '_menu_item_type', 'custom'),
(139, 822, '_menu_item_menu_item_parent', '0'),
(140, 822, '_menu_item_object_id', '822'),
(141, 822, '_menu_item_object', 'custom'),
(142, 822, '_menu_item_target', ''),
(143, 822, '_menu_item_classes', 'a:1:{i:0;s:16:"ion-help-circled";}'),
(144, 822, '_menu_item_xfn', ''),
(145, 822, '_menu_item_url', 'https://demo.astoundify.com/listify/about-listify/'),
(146, 823, '_menu_item_type', 'custom'),
(147, 823, '_menu_item_menu_item_parent', '0'),
(148, 823, '_menu_item_object_id', '823'),
(149, 823, '_menu_item_object', 'custom'),
(150, 823, '_menu_item_target', ''),
(151, 823, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(152, 823, '_menu_item_xfn', ''),
(153, 823, '_menu_item_url', 'https://demo.astoundify.com/listify/blog/'),
(154, 824, '_menu_item_type', 'custom'),
(155, 824, '_menu_item_menu_item_parent', '0'),
(156, 824, '_menu_item_object_id', '824'),
(157, 824, '_menu_item_object', 'custom'),
(158, 824, '_menu_item_target', ''),
(159, 824, '_menu_item_classes', 'a:1:{i:0;s:10:"ion-person";}'),
(160, 824, '_menu_item_xfn', ''),
(161, 824, '_menu_item_url', '#'),
(162, 825, '_menu_item_type', 'custom'),
(163, 825, '_menu_item_menu_item_parent', '833'),
(164, 825, '_menu_item_object_id', '825'),
(165, 825, '_menu_item_object', 'custom'),
(166, 825, '_menu_item_target', ''),
(167, 825, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(168, 825, '_menu_item_xfn', ''),
(169, 825, '_menu_item_url', '/my-account/customer-logout/'),
(170, 826, '_menu_item_type', 'custom'),
(171, 826, '_menu_item_menu_item_parent', '0'),
(172, 826, '_menu_item_object_id', '826'),
(173, 826, '_menu_item_object', 'custom'),
(174, 826, '_menu_item_target', ''),
(175, 826, '_menu_item_classes', 'a:1:{i:0;s:18:"ion-social-twitter";}'),
(176, 826, '_menu_item_xfn', ''),
(177, 826, '_menu_item_url', 'http://twitter.com/astoundify'),
(178, 827, '_menu_item_type', 'custom'),
(179, 827, '_menu_item_menu_item_parent', '0'),
(180, 827, '_menu_item_object_id', '827'),
(181, 827, '_menu_item_object', 'custom'),
(182, 827, '_menu_item_target', ''),
(183, 827, '_menu_item_classes', 'a:1:{i:0;s:19:"ion-social-facebook";}'),
(184, 827, '_menu_item_xfn', ''),
(185, 827, '_menu_item_url', 'http://facebook.com/astoundify'),
(186, 828, '_menu_item_type', 'custom'),
(187, 828, '_menu_item_menu_item_parent', '0'),
(188, 828, '_menu_item_object_id', '828'),
(189, 828, '_menu_item_object', 'custom'),
(190, 828, '_menu_item_target', ''),
(191, 828, '_menu_item_classes', 'a:1:{i:0;s:21:"ion-social-googleplus";}'),
(192, 828, '_menu_item_xfn', ''),
(193, 828, '_menu_item_url', 'http://google.com'),
(194, 829, '_menu_item_type', 'custom'),
(195, 829, '_menu_item_menu_item_parent', '0'),
(196, 829, '_menu_item_object_id', '829'),
(197, 829, '_menu_item_object', 'custom'),
(198, 829, '_menu_item_target', ''),
(199, 829, '_menu_item_classes', 'a:1:{i:0;s:28:"ion-social-instagram-outline";}'),
(200, 829, '_menu_item_xfn', ''),
(201, 829, '_menu_item_url', 'http://instagram.com'),
(202, 830, '_menu_item_type', 'custom'),
(203, 830, '_menu_item_menu_item_parent', '0'),
(204, 830, '_menu_item_object_id', '830'),
(205, 830, '_menu_item_object', 'custom'),
(206, 830, '_menu_item_target', '') ;
INSERT INTO `wp_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(207, 830, '_menu_item_classes', 'a:1:{i:0;s:16:"ion-social-vimeo";}'),
(208, 830, '_menu_item_xfn', ''),
(209, 830, '_menu_item_url', 'http://vimeo.com/astoundify'),
(210, 6, '_wp_page_template', 'page-templates/template-home.php'),
(211, 6, 'ninja_forms_form', '0'),
(212, 6, 'enable_tertiary_navigation', '0'),
(213, 6, 'hero_style', 'video'),
(214, 6, '_thumbnail_id', '698'),
(215, 15, '_wp_page_template', 'default'),
(216, 15, 'ninja_forms_form', '0'),
(217, 15, 'enable_tertiary_navigation', '0'),
(218, 15, 'hero_style', 'image'),
(219, 15, '_thumbnail_id', '692'),
(220, 22, '_wp_page_template', 'default'),
(221, 22, 'enable_tertiary_navigation', '0'),
(222, 22, 'hero_style', 'image'),
(223, 23, '_wp_page_template', 'page-templates/template-full-width.php'),
(224, 23, 'enable_tertiary_navigation', '0'),
(225, 23, 'hero_style', 'image'),
(226, 24, '_wp_page_template', 'page-templates/template-single-column.php'),
(227, 24, 'enable_tertiary_navigation', '0'),
(228, 24, 'hero_style', 'image'),
(229, 25, '_wp_page_template', 'page-templates/template-full-width.php'),
(230, 25, 'ninja_forms_form', '0'),
(231, 25, 'enable_tertiary_navigation', '1'),
(232, 25, 'hero_style', 'image'),
(233, 25, '_thumbnail_id', '698'),
(234, 32, '_wp_page_template', 'page-templates/template-single-column.php'),
(235, 32, 'ninja_forms_form', '0'),
(236, 32, 'enable_tertiary_navigation', '0'),
(237, 32, 'hero_style', 'image'),
(238, 32, '_thumbnail_id', '700'),
(239, 37, '_wp_page_template', 'page-templates/template-full-width.php'),
(240, 37, 'ninja_forms_form', '0'),
(241, 37, 'enable_tertiary_navigation', '1'),
(242, 37, 'hero_style', 'image'),
(243, 37, '_thumbnail_id', '692'),
(244, 55, '_wp_page_template', 'page-templates/template-plans-pricing.php'),
(245, 55, 'ninja_forms_form', '0'),
(246, 55, 'enable_tertiary_navigation', '0'),
(247, 55, 'hero_style', 'image'),
(248, 61, '_wp_page_template', 'page-templates/template-single-column.php'),
(249, 61, 'ninja_forms_form', '0'),
(250, 61, 'enable_tertiary_navigation', '0'),
(251, 61, 'hero_style', 'image'),
(252, 61, '_thumbnail_id', '692'),
(253, 67, 'ninja_forms_form', '0'),
(254, 67, 'ninja_forms_form', '0'),
(255, 67, '_thumbnail_id', '692'),
(256, 71, 'ninja_forms_form', '0'),
(257, 71, 'ninja_forms_form', '0'),
(258, 71, '_thumbnail_id', '698'),
(259, 74, 'ninja_forms_form', '0'),
(260, 74, 'ninja_forms_form', '0'),
(261, 74, '_thumbnail_id', '700'),
(262, 374, '_wp_page_template', 'page-templates/template-full-width-blank.php'),
(263, 374, 'enable_tertiary_navigation', '0'),
(264, 374, 'hero_style', 'video'),
(265, 435, '_wp_page_template', 'page-templates/template-single-column.php'),
(266, 435, 'enable_tertiary_navigation', '0'),
(267, 435, 'hero_style', 'image'),
(268, 831, '_menu_item_type', 'post_type'),
(269, 831, '_menu_item_menu_item_parent', '0'),
(270, 831, '_menu_item_object_id', '37'),
(271, 831, '_menu_item_object', 'page'),
(272, 831, '_menu_item_target', ''),
(273, 831, '_menu_item_classes', 'a:1:{i:0;s:11:"ion-compose";}'),
(274, 831, '_menu_item_xfn', ''),
(275, 831, '_menu_item_url', ''),
(276, 832, '_menu_item_type', 'post_type'),
(277, 832, '_menu_item_menu_item_parent', '0'),
(278, 832, '_menu_item_object_id', '25'),
(279, 832, '_menu_item_object', 'page'),
(280, 832, '_menu_item_target', ''),
(281, 832, '_menu_item_classes', 'a:2:{i:0;s:5:"popup";i:1;s:10:"popup-wide";}'),
(282, 832, '_menu_item_xfn', ''),
(283, 832, '_menu_item_url', ''),
(284, 833, '_menu_item_type', 'post_type'),
(285, 833, '_menu_item_menu_item_parent', '0'),
(286, 833, '_menu_item_object_id', '25'),
(287, 833, '_menu_item_object', 'page'),
(288, 833, '_menu_item_target', ''),
(289, 833, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(290, 833, '_menu_item_xfn', ''),
(291, 833, '_menu_item_url', ''),
(292, 834, '_menu_item_type', 'post_type'),
(293, 834, '_menu_item_menu_item_parent', '833'),
(294, 834, '_menu_item_object_id', '37'),
(295, 834, '_menu_item_object', 'page'),
(296, 834, '_menu_item_target', ''),
(297, 834, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(298, 834, '_menu_item_xfn', ''),
(299, 834, '_menu_item_url', ''),
(300, 835, '_menu_item_type', 'post_type'),
(301, 835, '_menu_item_menu_item_parent', '0'),
(302, 835, '_menu_item_object_id', '25'),
(303, 835, '_menu_item_object', 'page'),
(304, 835, '_menu_item_target', ''),
(305, 835, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(306, 835, '_menu_item_xfn', '') ;
INSERT INTO `wp_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(307, 835, '_menu_item_url', ''),
(308, 836, '_menu_item_type', 'post_type'),
(309, 836, '_menu_item_menu_item_parent', '835'),
(310, 836, '_menu_item_object_id', '37'),
(311, 836, '_menu_item_object', 'page'),
(312, 836, '_menu_item_target', ''),
(313, 836, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(314, 836, '_menu_item_xfn', ''),
(315, 836, '_menu_item_url', ''),
(318, 838, '_menu_item_type', 'custom'),
(319, 838, '_menu_item_menu_item_parent', '0'),
(320, 838, '_menu_item_object_id', '838'),
(321, 838, '_menu_item_object', 'custom'),
(322, 838, '_menu_item_target', ''),
(323, 838, '_menu_item_classes', 'a:1:{i:0;s:10:"ion-gear-a";}'),
(324, 838, '_menu_item_xfn', ''),
(325, 838, '_menu_item_url', '/my-account/edit-account/'),
(326, 839, '_menu_item_type', 'custom'),
(327, 839, '_menu_item_menu_item_parent', '859'),
(328, 839, '_menu_item_object_id', '839'),
(329, 839, '_menu_item_object', 'custom'),
(330, 839, '_menu_item_target', ''),
(331, 839, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(332, 839, '_menu_item_xfn', ''),
(333, 839, '_menu_item_url', '/my-account/edit-account/'),
(334, 840, '_menu_item_type', 'custom'),
(335, 840, '_menu_item_menu_item_parent', '0'),
(336, 840, '_menu_item_object_id', '840'),
(337, 840, '_menu_item_object', 'custom'),
(338, 840, '_menu_item_target', ''),
(339, 840, '_menu_item_classes', 'a:1:{i:0;s:8:"ion-card";}'),
(340, 840, '_menu_item_xfn', ''),
(341, 840, '_menu_item_url', '/my-account/edit-address/billing/'),
(342, 841, '_menu_item_type', 'custom'),
(343, 841, '_menu_item_menu_item_parent', '0'),
(344, 841, '_menu_item_object_id', '841'),
(345, 841, '_menu_item_object', 'custom'),
(346, 841, '_menu_item_target', ''),
(347, 841, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(348, 841, '_menu_item_xfn', ''),
(349, 841, '_menu_item_url', 'http://facebook.com/astoundify'),
(350, 842, '_menu_item_type', 'custom'),
(351, 842, '_menu_item_menu_item_parent', '0'),
(352, 842, '_menu_item_object_id', '842'),
(353, 842, '_menu_item_object', 'custom'),
(354, 842, '_menu_item_target', ''),
(355, 842, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(356, 842, '_menu_item_xfn', ''),
(357, 842, '_menu_item_url', 'http://twitter.com/astoundify'),
(358, 843, '_menu_item_type', 'custom'),
(359, 843, '_menu_item_menu_item_parent', '0'),
(360, 843, '_menu_item_object_id', '843'),
(361, 843, '_menu_item_object', 'custom'),
(362, 843, '_menu_item_target', ''),
(363, 843, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(364, 843, '_menu_item_xfn', ''),
(365, 843, '_menu_item_url', 'https://plus.google.com/'),
(366, 844, '_menu_item_type', 'custom'),
(367, 844, '_menu_item_menu_item_parent', '0'),
(368, 844, '_menu_item_object_id', '844'),
(369, 844, '_menu_item_object', 'custom'),
(370, 844, '_menu_item_target', ''),
(371, 844, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(372, 844, '_menu_item_xfn', ''),
(373, 844, '_menu_item_url', 'http://instagram.com/'),
(374, 845, '_menu_item_type', 'custom'),
(375, 845, '_menu_item_menu_item_parent', '0'),
(376, 845, '_menu_item_object_id', '845'),
(377, 845, '_menu_item_object', 'custom'),
(378, 845, '_menu_item_target', ''),
(379, 845, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(380, 845, '_menu_item_xfn', ''),
(381, 845, '_menu_item_url', 'https://vimeo.com/astoundify'),
(382, 846, '_menu_item_type', 'custom'),
(383, 846, '_menu_item_menu_item_parent', '0'),
(384, 846, '_menu_item_object_id', '846'),
(385, 846, '_menu_item_object', 'custom'),
(386, 846, '_menu_item_target', ''),
(387, 846, '_menu_item_classes', 'a:1:{i:0;s:13:"ion-help-buoy";}'),
(388, 846, '_menu_item_xfn', ''),
(389, 846, '_menu_item_url', '#'),
(390, 847, '_menu_item_type', 'custom'),
(391, 847, '_menu_item_menu_item_parent', '0'),
(392, 847, '_menu_item_object_id', '847'),
(393, 847, '_menu_item_object', 'custom'),
(394, 847, '_menu_item_target', ''),
(395, 847, '_menu_item_classes', 'a:1:{i:0;s:13:"ion-clipboard";}'),
(396, 847, '_menu_item_xfn', ''),
(397, 847, '_menu_item_url', 'https://demo.astoundify.com/listify/terms-of-service/'),
(398, 848, '_menu_item_type', 'custom'),
(399, 848, '_menu_item_menu_item_parent', '0'),
(400, 848, '_menu_item_object_id', '848'),
(401, 848, '_menu_item_object', 'custom'),
(402, 848, '_menu_item_target', ''),
(403, 848, '_menu_item_classes', 'a:1:{i:0;s:16:"ion-help-circled";}'),
(404, 848, '_menu_item_xfn', ''),
(405, 848, '_menu_item_url', 'https://demo.astoundify.com/listify/about-listify/'),
(406, 849, '_menu_item_type', 'custom'),
(407, 849, '_menu_item_menu_item_parent', '0'),
(408, 849, '_menu_item_object_id', '849') ;
INSERT INTO `wp_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(409, 849, '_menu_item_object', 'custom'),
(410, 849, '_menu_item_target', ''),
(411, 849, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(412, 849, '_menu_item_xfn', ''),
(413, 849, '_menu_item_url', 'https://demo.astoundify.com/listify/blog/'),
(414, 850, '_menu_item_type', 'custom'),
(415, 850, '_menu_item_menu_item_parent', '0'),
(416, 850, '_menu_item_object_id', '850'),
(417, 850, '_menu_item_object', 'custom'),
(418, 850, '_menu_item_target', ''),
(419, 850, '_menu_item_classes', 'a:1:{i:0;s:10:"ion-person";}'),
(420, 850, '_menu_item_xfn', ''),
(421, 850, '_menu_item_url', '#'),
(422, 851, '_menu_item_type', 'custom'),
(423, 851, '_menu_item_menu_item_parent', '859'),
(424, 851, '_menu_item_object_id', '851'),
(425, 851, '_menu_item_object', 'custom'),
(426, 851, '_menu_item_target', ''),
(427, 851, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(428, 851, '_menu_item_xfn', ''),
(429, 851, '_menu_item_url', '/my-account/customer-logout/'),
(430, 852, '_menu_item_type', 'custom'),
(431, 852, '_menu_item_menu_item_parent', '0'),
(432, 852, '_menu_item_object_id', '852'),
(433, 852, '_menu_item_object', 'custom'),
(434, 852, '_menu_item_target', ''),
(435, 852, '_menu_item_classes', 'a:1:{i:0;s:18:"ion-social-twitter";}'),
(436, 852, '_menu_item_xfn', ''),
(437, 852, '_menu_item_url', 'http://twitter.com/astoundify'),
(438, 853, '_menu_item_type', 'custom'),
(439, 853, '_menu_item_menu_item_parent', '0'),
(440, 853, '_menu_item_object_id', '853'),
(441, 853, '_menu_item_object', 'custom'),
(442, 853, '_menu_item_target', ''),
(443, 853, '_menu_item_classes', 'a:1:{i:0;s:19:"ion-social-facebook";}'),
(444, 853, '_menu_item_xfn', ''),
(445, 853, '_menu_item_url', 'http://facebook.com/astoundify'),
(446, 854, '_menu_item_type', 'custom'),
(447, 854, '_menu_item_menu_item_parent', '0'),
(448, 854, '_menu_item_object_id', '854'),
(449, 854, '_menu_item_object', 'custom'),
(450, 854, '_menu_item_target', ''),
(451, 854, '_menu_item_classes', 'a:1:{i:0;s:21:"ion-social-googleplus";}'),
(452, 854, '_menu_item_xfn', ''),
(453, 854, '_menu_item_url', 'http://google.com'),
(454, 855, '_menu_item_type', 'custom'),
(455, 855, '_menu_item_menu_item_parent', '0'),
(456, 855, '_menu_item_object_id', '855'),
(457, 855, '_menu_item_object', 'custom'),
(458, 855, '_menu_item_target', ''),
(459, 855, '_menu_item_classes', 'a:1:{i:0;s:28:"ion-social-instagram-outline";}'),
(460, 855, '_menu_item_xfn', ''),
(461, 855, '_menu_item_url', 'http://instagram.com'),
(462, 856, '_menu_item_type', 'custom'),
(463, 856, '_menu_item_menu_item_parent', '0'),
(464, 856, '_menu_item_object_id', '856'),
(465, 856, '_menu_item_object', 'custom'),
(466, 856, '_menu_item_target', ''),
(467, 856, '_menu_item_classes', 'a:1:{i:0;s:16:"ion-social-vimeo";}'),
(468, 856, '_menu_item_xfn', ''),
(469, 856, '_menu_item_url', 'http://vimeo.com/astoundify'),
(470, 6, '_wp_page_template', 'page-templates/template-home.php'),
(471, 6, 'ninja_forms_form', '0'),
(472, 6, 'enable_tertiary_navigation', '0'),
(473, 6, 'hero_style', 'video'),
(474, 6, '_thumbnail_id', '698'),
(475, 15, '_wp_page_template', 'default'),
(476, 15, 'ninja_forms_form', '0'),
(477, 15, 'enable_tertiary_navigation', '0'),
(478, 15, 'hero_style', 'image'),
(479, 15, '_thumbnail_id', '692'),
(480, 22, '_wp_page_template', 'default'),
(481, 22, 'enable_tertiary_navigation', '0'),
(482, 22, 'hero_style', 'image'),
(483, 23, '_wp_page_template', 'page-templates/template-full-width.php'),
(484, 23, 'enable_tertiary_navigation', '0'),
(485, 23, 'hero_style', 'image'),
(486, 24, '_wp_page_template', 'page-templates/template-single-column.php'),
(487, 24, 'enable_tertiary_navigation', '0'),
(488, 24, 'hero_style', 'image'),
(489, 25, '_wp_page_template', 'page-templates/template-full-width.php'),
(490, 25, 'ninja_forms_form', '0'),
(491, 25, 'enable_tertiary_navigation', '1'),
(492, 25, 'hero_style', 'image'),
(493, 25, '_thumbnail_id', '698'),
(494, 32, '_wp_page_template', 'page-templates/template-single-column.php'),
(495, 32, 'ninja_forms_form', '0'),
(496, 32, 'enable_tertiary_navigation', '0'),
(497, 32, 'hero_style', 'image'),
(498, 32, '_thumbnail_id', '700'),
(499, 37, '_wp_page_template', 'page-templates/template-full-width.php'),
(500, 37, 'ninja_forms_form', '0'),
(501, 37, 'enable_tertiary_navigation', '1'),
(502, 37, 'hero_style', 'image'),
(503, 37, '_thumbnail_id', '692'),
(504, 55, '_wp_page_template', 'page-templates/template-plans-pricing.php'),
(505, 55, 'ninja_forms_form', '0'),
(506, 55, 'enable_tertiary_navigation', '0'),
(507, 55, 'hero_style', 'image'),
(508, 61, '_wp_page_template', 'page-templates/template-single-column.php') ;
INSERT INTO `wp_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(509, 61, 'ninja_forms_form', '0'),
(510, 61, 'enable_tertiary_navigation', '0'),
(511, 61, 'hero_style', 'image'),
(512, 61, '_thumbnail_id', '692'),
(513, 67, 'ninja_forms_form', '0'),
(514, 67, 'ninja_forms_form', '0'),
(515, 67, '_thumbnail_id', '692'),
(516, 71, 'ninja_forms_form', '0'),
(517, 71, 'ninja_forms_form', '0'),
(518, 71, '_thumbnail_id', '698'),
(519, 74, 'ninja_forms_form', '0'),
(520, 74, 'ninja_forms_form', '0'),
(521, 74, '_thumbnail_id', '700'),
(522, 374, '_wp_page_template', 'page-templates/template-full-width-blank.php'),
(523, 374, 'enable_tertiary_navigation', '0'),
(524, 374, 'hero_style', 'video'),
(525, 435, '_wp_page_template', 'page-templates/template-single-column.php'),
(526, 435, 'enable_tertiary_navigation', '0'),
(527, 435, 'hero_style', 'image'),
(528, 857, '_menu_item_type', 'post_type'),
(529, 857, '_menu_item_menu_item_parent', '0'),
(530, 857, '_menu_item_object_id', '37'),
(531, 857, '_menu_item_object', 'page'),
(532, 857, '_menu_item_target', ''),
(533, 857, '_menu_item_classes', 'a:1:{i:0;s:11:"ion-compose";}'),
(534, 857, '_menu_item_xfn', ''),
(535, 857, '_menu_item_url', ''),
(536, 858, '_menu_item_type', 'post_type'),
(537, 858, '_menu_item_menu_item_parent', '0'),
(538, 858, '_menu_item_object_id', '25'),
(539, 858, '_menu_item_object', 'page'),
(540, 858, '_menu_item_target', ''),
(541, 858, '_menu_item_classes', 'a:2:{i:0;s:5:"popup";i:1;s:10:"popup-wide";}'),
(542, 858, '_menu_item_xfn', ''),
(543, 858, '_menu_item_url', ''),
(544, 859, '_menu_item_type', 'post_type'),
(545, 859, '_menu_item_menu_item_parent', '0'),
(546, 859, '_menu_item_object_id', '25'),
(547, 859, '_menu_item_object', 'page'),
(548, 859, '_menu_item_target', ''),
(549, 859, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(550, 859, '_menu_item_xfn', ''),
(551, 859, '_menu_item_url', ''),
(552, 860, '_menu_item_type', 'post_type'),
(553, 860, '_menu_item_menu_item_parent', '859'),
(554, 860, '_menu_item_object_id', '37'),
(555, 860, '_menu_item_object', 'page'),
(556, 860, '_menu_item_target', ''),
(557, 860, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(558, 860, '_menu_item_xfn', ''),
(559, 860, '_menu_item_url', ''),
(560, 861, '_menu_item_type', 'post_type'),
(561, 861, '_menu_item_menu_item_parent', '0'),
(562, 861, '_menu_item_object_id', '25'),
(563, 861, '_menu_item_object', 'page'),
(564, 861, '_menu_item_target', ''),
(565, 861, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(566, 861, '_menu_item_xfn', ''),
(567, 861, '_menu_item_url', ''),
(568, 862, '_menu_item_type', 'post_type'),
(569, 862, '_menu_item_menu_item_parent', '861'),
(570, 862, '_menu_item_object_id', '37'),
(571, 862, '_menu_item_object', 'page'),
(572, 862, '_menu_item_target', ''),
(573, 862, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(574, 862, '_menu_item_xfn', ''),
(575, 862, '_menu_item_url', ''),
(576, 6, '_edit_lock', '1444820683:1'),
(581, 865, '_form', '<p>Your Name (required)<br />\n    [text* your-name] </p>\n\n<p>Your Email (required)<br />\n    [email* your-email] </p>\n\n<p>Subject<br />\n    [text your-subject] </p>\n\n<p>Your Message<br />\n    [textarea your-message] </p>\n\n<p>[submit "Send"]</p>'),
(582, 865, '_mail', 'a:8:{s:7:"subject";s:14:"[your-subject]";s:6:"sender";s:38:"[your-name] <wordpress@104.155.17.199>";s:4:"body";s:163:"From: [your-name] <[your-email]>\nSubject: [your-subject]\n\nMessage Body:\n[your-message]\n\n--\nThis e-mail was sent from a contact form on babyhallo (http://localhost)";s:9:"recipient";s:24:"nick.j.goodall@gmail.com";s:18:"additional_headers";s:22:"Reply-To: [your-email]";s:11:"attachments";s:0:"";s:8:"use_html";i:0;s:13:"exclude_blank";i:0;}'),
(583, 865, '_mail_2', 'a:9:{s:6:"active";b:0;s:7:"subject";s:14:"[your-subject]";s:6:"sender";s:36:"babyhallo <wordpress@104.155.17.199>";s:4:"body";s:105:"Message Body:\n[your-message]\n\n--\nThis e-mail was sent from a contact form on babyhallo (http://localhost)";s:9:"recipient";s:12:"[your-email]";s:18:"additional_headers";s:34:"Reply-To: nick.j.goodall@gmail.com";s:11:"attachments";s:0:"";s:8:"use_html";i:0;s:13:"exclude_blank";i:0;}'),
(584, 865, '_messages', 'a:8:{s:12:"mail_sent_ok";s:43:"Your message was sent successfully. Thanks.";s:12:"mail_sent_ng";s:93:"Failed to send your message. Please try later or contact the administrator by another method.";s:16:"validation_error";s:74:"Validation errors occurred. Please confirm the fields and submit it again.";s:4:"spam";s:93:"Failed to send your message. Please try later or contact the administrator by another method.";s:12:"accept_terms";s:35:"Please accept the terms to proceed.";s:16:"invalid_required";s:34:"Please fill in the required field.";s:16:"invalid_too_long";s:23:"This input is too long.";s:17:"invalid_too_short";s:24:"This input is too short.";}'),
(585, 865, '_additional_settings', ''),
(586, 865, '_locale', 'en_US'),
(587, 866, '_wp_attached_file', '2015/10/babyhallo-text-100x35.png'),
(588, 866, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:101;s:6:"height";i:20;s:4:"file";s:33:"2015/10/babyhallo-text-100x35.png";s:5:"sizes";a:1:{s:14:"post-thumbnail";a:4:{s:4:"file";s:32:"babyhallo-text-100x35-100x20.png";s:5:"width";i:100;s:6:"height";i:20;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(589, 866, '_wp_attachment_custom_header_last_used_listify', '1444818985'),
(590, 866, '_wp_attachment_is_custom_header', 'listify'),
(591, 867, '_wp_attached_file', '2015/10/babyhallo-text-white.png'),
(592, 867, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:101;s:6:"height";i:20;s:4:"file";s:32:"2015/10/babyhallo-text-white.png";s:5:"sizes";a:1:{s:14:"post-thumbnail";a:4:{s:4:"file";s:31:"babyhallo-text-white-100x20.png";s:5:"width";i:100;s:6:"height";i:20;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(593, 867, '_wp_attachment_custom_header_last_used_listify', '1444826575'),
(594, 867, '_wp_attachment_is_custom_header', 'listify'),
(595, 374, '_edit_lock', '1444821709:1'),
(596, 55, '_edit_lock', '1444821724:1'),
(597, 868, '_wp_trash_meta_status', 'auto-draft'),
(598, 868, '_wp_trash_meta_time', '1444823053'),
(599, 868, 'enable_tertiary_navigation', '0'),
(600, 868, 'hero_style', ''),
(602, 870, '_wp_attached_file', '2015/10/family-commons-clipped.jpg'),
(603, 870, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:4267;s:6:"height";i:2839;s:4:"file";s:34:"2015/10/family-commons-clipped.jpg";s:5:"sizes";a:7:{s:9:"thumbnail";a:4:{s:4:"file";s:34:"family-commons-clipped-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:34:"family-commons-clipped-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:35:"family-commons-clipped-1024x681.jpg";s:5:"width";i:1024;s:6:"height";i:681;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:34:"family-commons-clipped-180x180.jpg";s:5:"width";i:180;s:6:"height";i:180;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:34:"family-commons-clipped-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:34:"family-commons-clipped-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:34:"family-commons-clipped-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(604, 11, '_thumbnail_id', '870'),
(605, 32, '_edit_lock', '1444827597:1'),
(606, 37, '_edit_lock', '1444828429:1') ;

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
) ENGINE=InnoDB AUTO_INCREMENT=874 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `wp_posts`
#
INSERT INTO `wp_posts` ( `ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2015-10-13 08:56:52', '2015-10-13 08:56:52', 'Welcome to WordPress. This is your first post. Edit or delete it, then start writing!', 'Hello world!', '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2015-10-13 08:56:52', '2015-10-13 08:56:52', '', 0, 'http://localhost/?p=1', 0, 'post', '', 1),
(2, 1, '2015-10-13 08:56:52', '2015-10-13 08:56:52', 'This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\n\n<blockquote>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</blockquote>\n\n...or something like this:\n\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\n\nAs a new WordPress user, you should go to <a href="http://localhost/wp-admin/">your dashboard</a> to delete this page and create new pages for your content. Have fun!', 'Sample Page', '', 'publish', 'open', 'open', '', 'sample-page', '', '', '2015-10-13 08:56:52', '2015-10-13 08:56:52', '', 0, 'http://localhost/?page_id=2', 0, 'page', '', 0),
(3, 1, '2015-10-13 09:21:53', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-10-13 09:21:53', '0000-00-00 00:00:00', '', 0, 'http://localhost/?p=3', 0, 'post', '', 0),
(4, 1, '2015-10-13 09:28:46', '2015-10-13 09:28:46', 'test', 'test post', '', 'publish', 'open', 'open', '', 'test-post', '', '', '2015-10-13 09:28:46', '2015-10-13 09:28:46', '', 0, 'http://localhost/?p=4', 0, 'post', '', 0),
(5, 1, '2015-10-13 09:28:46', '2015-10-13 09:28:46', 'test', 'test post', '', 'inherit', 'closed', 'closed', '', '4-revision-v1', '', '', '2015-10-13 09:28:46', '2015-10-13 09:28:46', '', 4, 'http://localhost/?p=5', 0, 'revision', '', 0),
(6, 1, '2014-10-23 12:16:02', '2014-10-23 12:16:02', '[video width="1280" height="720" loop="true" autoplay="true" preload="auto" mp4="https://f6ca679df901af69ace6-d3d26a34307edc4f7eeb40d85a64c4a7.ssl.cf5.rackcdn.com/listify-loops.mp4" webm="https://f6ca679df901af69ace6-d3d26a34307edc4f7eeb40d85a64c4a7.ssl.cf5.rackcdn.com/listify-loops.webm"][/video]\n\nListify helps you find out whats happening in your city, Let\'s explore.', 'Search Your City', '', 'publish', 'closed', 'closed', '', 'search-your-city', '', '', '2014-10-23 12:16:02', '2014-10-23 12:16:02', '', 0, 'http://demo.astoundify.com/listify/?page_id=6', 0, 'page', '', 0),
(7, 1, '2015-10-13 10:04:21', '2015-10-13 10:04:21', '', 'babyhallo_new_logo2', '', 'inherit', 'open', 'closed', '', 'babyhallo_new_logo2', '', '', '2015-10-13 12:20:30', '2015-10-13 12:20:30', '', 8, 'http://localhost/wp-content/uploads/2015/10/babyhallo_new_logo2.png', 0, 'attachment', 'image/png', 0),
(8, 1, '2015-10-13 11:31:32', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2015-10-13 11:31:32', '0000-00-00 00:00:00', '', 0, 'http://localhost/?page_id=8', 0, 'page', '', 0),
(9, 1, '2015-10-14 09:50:30', '2015-10-14 09:50:30', '', 'babyhallo-100x35', '', 'inherit', 'open', 'closed', '', 'babyhallo-100x35', '', '', '2015-10-14 09:50:30', '2015-10-14 09:50:30', '', 0, 'http://localhost/wp-content/uploads/2015/10/babyhallo-100x35.png', 0, 'attachment', 'image/png', 0),
(10, 1, '2015-10-14 09:52:59', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2015-10-14 09:52:59', '0000-00-00 00:00:00', '', 0, 'http://localhost/?page_id=10', 0, 'page', '', 0),
(11, 1, '2015-10-14 10:07:49', '2015-10-14 10:07:49', 'Find a Midwife near you', 'Search for a Midwife', '', 'publish', 'closed', 'closed', '', 'search-for-a-midwife', '', '', '2015-10-14 10:07:49', '2015-10-14 10:07:49', '', 0, 'http://localhost/?page_id=11', 0, 'page', '', 0),
(12, 1, '2015-10-14 10:07:49', '2015-10-14 10:07:49', 'Find a Midwife near you', 'Search for a Midwife', '', 'inherit', 'closed', 'closed', '', '11-revision-v1', '', '', '2015-10-14 10:07:49', '2015-10-14 10:07:49', '', 11, 'http://localhost/?p=12', 0, 'revision', '', 0),
(15, 1, '2014-10-23 13:23:26', '2014-10-23 13:23:26', '', 'Blog', '', 'publish', 'closed', 'closed', '', 'blog', '', '', '2014-10-23 13:23:26', '2014-10-23 13:23:26', '', 0, 'http://demo.astoundify.com/listify/?page_id=15', 0, 'page', '', 0),
(22, 1, '2014-10-23 17:35:54', '2014-10-23 17:35:54', '', 'Shop', '', 'publish', 'closed', 'open', '', 'shop', '', '', '2014-10-23 17:35:54', '2014-10-23 17:35:54', '', 0, 'http://demo.astoundify.com/listify/shop/', 0, 'page', '', 0),
(23, 1, '2014-10-23 17:35:54', '2014-10-23 17:35:54', '[woocommerce_cart]', 'Cart', '', 'publish', 'closed', 'open', '', 'cart', '', '', '2014-10-23 17:35:54', '2014-10-23 17:35:54', '', 0, 'http://demo.astoundify.com/listify/cart/', 0, 'page', '', 0),
(24, 1, '2014-10-23 17:35:54', '2014-10-23 17:35:54', '[woocommerce_checkout]', 'Checkout', '', 'publish', 'closed', 'open', '', 'checkout', '', '', '2014-10-23 17:35:54', '2014-10-23 17:35:54', '', 0, 'http://demo.astoundify.com/listify/checkout/', 0, 'page', '', 0),
(25, 1, '2014-10-23 17:35:54', '2014-10-23 17:35:54', '[woocommerce_my_account]', 'My Account', '', 'publish', 'closed', 'open', '', 'my-account', '', '', '2014-10-23 17:35:54', '2014-10-23 17:35:54', '', 0, 'http://demo.astoundify.com/listify/my-account/', 0, 'page', '', 0),
(32, 1, '2014-10-23 18:08:41', '2014-10-23 18:08:41', '[submit_job_form]', 'Submit Listing', '', 'publish', 'closed', 'closed', '', 'submit-listing', '', '', '2014-10-23 18:08:41', '2014-10-23 18:08:41', '', 0, 'http://demo.astoundify.com/listify/?page_id=32', 0, 'page', '', 0),
(37, 1, '2014-10-23 18:11:03', '2014-10-23 18:11:03', '[job_dashboard]', 'Listings', '', 'publish', 'closed', 'closed', '', 'listings', '', '', '2014-10-23 18:11:03', '2014-10-23 18:11:03', '', 25, 'http://demo.astoundify.com/listify/?page_id=37', 0, 'page', '', 0),
(55, 1, '2014-10-23 18:26:26', '2014-10-23 18:26:26', '', 'Plans and Pricing', '', 'publish', 'closed', 'closed', '', 'plans-and-pricing', '', '', '2014-10-23 18:26:26', '2014-10-23 18:26:26', '', 0, 'http://demo.astoundify.com/listify/?page_id=55', 0, 'page', '', 0),
(61, 1, '2014-10-23 18:42:08', '2014-10-23 18:42:08', '<h3 class="ion-person-add">1. Create An Account</h3>\n<img class="alignright wp-image-694 size-full" src="http://localhost/wp-content/uploads/2014/10/account.png" alt="feature_sessionPlayback" width="490" />\n\nCreating an account with Listify is easy, with the social login feature it allows your visitors to login easily, so that they won\'t have the “login/register” friction. They\'ll be creating, rating and favouriting listings in no time!\n\nWe’ve even integrated with WooCommerce so that the <a href="http://www.woothemes.com/products/woocommerce-social-login/">Social Login by WooCommerce plugin</a> (Plugin sold separately) and the standard WooCommerce sign up process is fully supported.\n\n<a class="button" href="http://themeforest.net/item/jobify-job-board-wordpress-theme/5247604?ref=Astoundify">How It Works</a>\n<br /></br>\n<h3 class="ion-compose">2. Submit Your Listing</h3>\n<img class="alignleft wp-image-694 size-full" src="http://localhost/wp-content/uploads/2014/10/listing.png" alt="feature_sessionPlayback" width="490" />\nSubmitting a listing using Listify is super simple, we\'ve made entering the address of your place easy, when using our Google Places API plugin (Plugin sold separately) it will auto complete the listing address.\n\nYou can even fully customize your submission form either using PHP code using this <a href="https://wpjobmanager.com/document/editing-job-submission-fields/">tutorial</a> or by installing the <a href="https://plugins.smyl.es/wp-job-manager-field-editor/">Form Editor plugin</a> (Plugin sold separately) this gives you full control over the display of the fields that are shown on your submission form.\n\n<a class="button" href="http://themeforest.net/item/jobify-job-board-wordpress-theme/5247604?ref=Astoundify">Submit Your Listing</a>\n<br /></br>\n<h3 class="ion-bag">3. Get More Interest In Your Place</h3>\nThis won’t be the first time you look for a listing directory theme, but it may be the last time. Because with Listify you have more than you could ever want or need.\n\nWhen using Listify your site will be a thing of beauty. Let’s be honest. The problem with most listing directories, while highly functional, is that many of them aren’t very pretty. It’s why the beautiful ones are so popular, because they match great photography with fantastic functionality.\n\nThat’s what we’ve done with Listify.', 'How It Works', '', 'publish', 'closed', 'closed', '', 'how-it-works', '', '', '2014-10-23 18:42:08', '2014-10-23 18:42:08', '', 0, 'http://demo.astoundify.com/listify/?page_id=61', 0, 'page', '', 0),
(67, 1, '2014-10-23 18:51:02', '2014-10-23 18:51:02', 'A Business directory or business directory is a website or printed listing of information which lists all businesses within some category. Businesses can be categorized by business, location, activity, or size. Business may be compiled either manually or through an automated online search software. Online yellow pages are a type of business directory, as is the traditional phone book.\n\nThe details provided in a business directory varies from business to business. They may include the business name, addresses, telephone numbers, location, type of service or products the business provides, number of employees, the service region and any professional associations. Some directories include a section for user reviews, comments, and feedback. Business directories in the past would take a printed format but have recently been upgraded to websites due to the advent of the internet.\n<h2>Arts</h2>\nThe arts are a vast subdivision of culture, composed of many creative endeavors and disciplines. It is a broader term than "art", which as a description of a field usually means only the visual arts. The arts encompass the visual arts, the literary arts and the performing arts – music, theatre, dance and film, among others. This list is by no means comprehensive, but only meant to introduce the concept of the arts. For all intents and purposes, the history of the arts begins with the history of art. The arts might have origins in early human evolutionary prehistory. According to a recent suggestion, several forms of audio and visual arts (rhythmic singing and drumming on external objects, dancing, body and face painting) were developed very early in hominid evolution by the forces of natural selection in order to reach an altered state of consciousness.', 'Increasing Daily Foot Traffic', '', 'publish', 'open', 'open', '', 'increasing-daily-foot-traffic', '', '', '2014-10-23 18:51:02', '2014-10-23 18:51:02', '', 0, 'http://demo.astoundify.com/listify/?p=67', 0, 'post', '', 0),
(71, 1, '2014-10-23 18:53:15', '2014-10-23 18:53:15', 'Online advertising, also called online marketing or Internet advertising, is a form of marketing and advertising which uses the Internet to deliver promotional marketing messages to consumers. It includes email marketing, search engine marketing (SEM), social media marketing, many types of display advertising (including web banner advertising), and mobile advertising. Like other advertising media, online advertising frequently involves both a publisher, who integrates advertisements into its online content, and an advertiser, who provides the advertisements to be displayed on the publisher\'s content. Other potential participants include advertising agencies who help generate and place the ad copy, an ad server who technologically delivers the ad and tracks statistics, and advertising affiliates who do independent promotional work for the advertiser.\n<blockquote>Online advertising is a large business and is growing rapidly.</blockquote>\nIn 2011, Internet advertising revenues in the United States surpassed those of cable television and nearly exceeded those of broadcast television.:19 In 2012, Internet advertising revenues in the United States totaled $36.57 billion, a 15.2% increase over the $31.74 billion in revenues in 2011. U.S. internet ad revenue hit a historic high of $20.1 billion for the first half of 2013, up 18% over the same period in 2012. Online advertising is widely used across virtually all industry sectors.\n\nMany common online advertising practices are controversial and increasingly subject to regulation. Online ad revenues may not adequately replace other publishers\' revenue streams. Declining ad revenue has led some publishers to hide their content behind paywalls.', 'Converting Online Visits to Offline Sales', '', 'publish', 'open', 'open', '', 'converting-online-visits-to-offline-sales', '', '', '2014-10-23 18:53:15', '2014-10-23 18:53:15', '', 0, 'http://demo.astoundify.com/listify/?p=71', 0, 'post', '', 0),
(74, 1, '2014-10-23 18:59:59', '2014-10-23 18:59:59', 'OpenTable is an American public company, slated to be a wholly owned subsidiary of Priceline.com, that offers online real-time restaurant-reservation service. The firm provides online reservations at about 31,000 upscale restaurants around the world seating some 15 million diners a month.\n\nThe company was founded by Chuck Templeton in San Francisco, California, in 1998. Reservations are free to end users; the company charges restaurants monthly and per-reservation fees for their use of the system.\n\nIn 1999, the website began operations serving a limited selection of restaurants in San Francisco.[4] It has since expanded to cover more than 30,000[5] restaurants in most U.S. states as well as in several major international cities. Reservations can be made online through its website.\n\nOn June 13, 2014 the company announced it had agreed to terms with Priceline.com for that company to acquire OpenTable in a full cash deal worth $2.6 billion.', 'Book a Table Directly in Your Listing', '', 'publish', 'open', 'open', '', 'book-a-table-directly-in-your-listing', '', '', '2014-10-23 18:59:59', '2014-10-23 18:59:59', '', 0, 'http://demo.astoundify.com/listify/?p=74', 0, 'post', '', 0),
(147, 1, '2014-10-31 15:18:23', '2014-10-31 15:18:23', '', 'iphone-home-page', '', 'inherit', 'open', 'open', '', 'iphone-home-page', '', '', '2014-10-31 15:18:23', '2014-10-31 15:18:23', '', 0, 'http://localhost/wp-content/uploads/2014/10/iphone-home-page.jpg', 0, 'attachment', 'image/jpeg', 0),
(374, 1, '2014-11-11 22:51:29', '2014-11-11 22:51:29', 'Credibly innovate granular internal or "organic" sources whereas high standards in web-readiness. Energistically scale future-proof core competencies vis-a-vis impactful experiences. Dramatically synthesize integrated schemas with optimal networks.Interactively procrastinate high-payoff content without backward-compatible data. Quickly cultivate optimal processes and tactical architectures. Completely iterate covalent strategic theme areas via accurate e-markets. Globally incubate standards compliant channels before scalable benefits. Quickly disseminate superior deliverables whereas web-enabled applications.\n<h3>Our Mission Is Simple: Make Finding Business Easier.</h3>\nAn online marketplace (or online e-commerce marketplace) is a type of e-commerce site where product and inventory information is provided by multiple third parties, whereas transactions are processed by the marketplace operator. Online marketplaces are the primary type of multichannel ecommerce.In an online marketplace, consumer transactions are processed by the marketplace operator and then delivered and fulfilled by the participating retailers or wholesalers (often called drop shipping).\n<h3>Serving Your Community</h3>\nEfficiently unleash cross-media information without cross-media value. Quickly maximize timely deliverables for real-time schemas. Dramatically maintain clicks-and-mortar solutions without functional solutions. Completely synergize resource sucking relationships via premier niche markets. Professionally cultivate one-to-one customer service with robust ideas. Dynamically innovate resource-leveling customer service for state of the art customer service. Objectively innovate empowered manufactured products whereas parallel platforms. Holisticly predominate extensible testing procedures for reliable supply chains. Dramatically engage top-line web services vis-a-vis cutting-edge deliverables.\n<h2 style="text-align: center;"></h2>\n<h2 style="text-align: center;">Grow Your Business with Listify</h2>\n<p style="text-align: center;">Get started in just minutes</p>\n<p style="text-align: center;"><a class="button" href="https://demo.astoundify.com/listify/submit-listing/">Create Your Business Listing Today</a></p>\n&nbsp;', 'Driven By Our Mission', '', 'publish', 'closed', 'closed', '', 'about-listify', '', '', '2014-11-11 22:51:29', '2014-11-11 22:51:29', '', 0, 'https://demo.astoundify.com/listify/?page_id=374', 0, 'page', '', 0),
(435, 1, '2014-11-12 16:17:25', '2014-11-12 16:17:25', 'Please read these Terms of Service ("Terms", "Terms of Service") carefully before using the demo.astoundify.com/listify website (the "Service") operated by Listify ("us", "we", or "our").\n\nYour access to and use of the Service is conditioned on your acceptance of and compliance with these Terms. These Terms apply to all visitors, users and others who access or use the Service.\n\nBy accessing or using the Service you agree to be bound by these Terms. If you disagree with any part of the terms then you may not access the Service.\n<h2>Accounts</h2>\nWhen you create an account with us, you must provide us information that is accurate, complete, and current at all times. Failure to do so constitutes a breach of the Terms, which may result in immediate termination of your account on our Service.\n\nYou are responsible for safeguarding the password that you use to access the Service and for any activities or actions under your password, whether your password is with our Service or a third-party service.\n\nYou agree not to disclose your password to any third party. You must notify us immediately upon becoming aware of any breach of security or unauthorized use of your account.\n<h2>Links To Other Web Sites</h2>\nOur Service may contain links to third-party web sites or services that are not owned or controlled by Listify.\n\nListify has no control over, and assumes no responsibility for, the content, privacy policies, or practices of any third party web sites or services. You further acknowledge and agree that Listify shall not be responsible or liable, directly or indirectly, for any damage or loss caused or alleged to be caused by or in connection with use of or reliance on any such content, goods or services available on or through any such web sites or services.\n\nWe strongly advise you to read the terms and conditions and privacy policies of any third-party web sites or services that you visit.\n<h2>Governing Law</h2>\nThese Terms shall be governed and construed in accordance with the laws of Ontario, Canada, without regard to its conflict of law provisions.\n\nOur failure to enforce any right or provision of these Terms will not be considered a waiver of those rights. If any provision of these Terms is held to be invalid or unenforceable by a court, the remaining provisions of these Terms will remain in effect. These Terms constitute the entire agreement between us regarding our Service, and supersede and replace any prior agreements we might have between us regarding the Service.\n<h2>Changes</h2>\nWe reserve the right, at our sole discretion, to modify or replace these Terms at any time. If a revision is material we will try to provide at least 30 days notice prior to any new terms taking effect. What constitutes a material change will be determined at our sole discretion.\n\nBy continuing to access or use our Service after those revisions become effective, you agree to be bound by the revised terms. If you do not agree to the new terms, please stop using the Service.\n<h2>Contact Us</h2>\nIf you have any questions about these Terms, please contact us.', 'Terms of Service', '', 'publish', 'closed', 'closed', '', 'terms-of-service', '', '', '2014-11-12 16:17:25', '2014-11-12 16:17:25', '', 0, 'https://demo.astoundify.com/listify/?page_id=435', 0, 'page', '', 0),
(692, 1, '2014-11-20 20:02:49', '2014-11-20 20:02:49', '', 'how-it-works', '', 'inherit', 'open', 'open', '', 'how-it-works-2', '', '', '2014-11-20 20:02:49', '2014-11-20 20:02:49', '', 61, 'http://localhost/wp-content/uploads/2014/10/how-it-works.jpg', 0, 'attachment', 'image/jpeg', 0),
(698, 1, '2014-11-21 18:54:28', '2014-11-21 18:54:28', '', 'Vo7YbYQQ8iyOo4J9bOoj_ggb24', '', 'inherit', 'open', 'open', '', 'vo7ybyqq8iyoo4j9booj_ggb24', '', '', '2014-11-21 18:54:28', '2014-11-21 18:54:28', '', 0, 'http://localhost/wp-content/uploads/2014/10/Vo7YbYQQ8iyOo4J9bOoj_ggb24.jpg', 0, 'attachment', 'image/jpeg', 0),
(700, 1, '2014-11-21 18:55:49', '2014-11-21 18:55:49', '', 'ZLSw0SXxThSrkXRIiCdT_DSC_0345', '', 'inherit', 'open', 'open', '', 'zlsw0sxxthsrkxriicdt_dsc_0345', '', '', '2014-11-21 18:55:49', '2014-11-21 18:55:49', '', 0, 'http://localhost/wp-content/uploads/2014/11/ZLSw0SXxThSrkXRIiCdT_DSC_0345.jpg', 0, 'attachment', 'image/jpeg', 0),
(715, 1, '2014-11-20 21:21:26', '2014-11-20 21:21:26', '', 'listing', '', 'inherit', 'open', 'open', '', 'listing', '', '', '2014-11-20 21:21:26', '2014-11-20 21:21:26', '', 61, 'http://localhost/wp-content/uploads/2014/10/listing.png', 0, 'attachment', 'image/png', 0),
(716, 1, '2014-11-20 21:27:21', '2014-11-20 21:27:21', '', 'account', '', 'inherit', 'open', 'open', '', 'account-2', '', '', '2014-11-20 21:27:21', '2014-11-20 21:27:21', '', 61, 'http://localhost/wp-content/uploads/2014/10/account.png', 0, 'attachment', 'image/png', 0),
(804, 1, '2014-11-25 03:40:56', '2014-11-25 03:40:56', '', 'Astoundify Barbershop', '', 'inherit', 'open', 'open', '', 'astoundify-barbershop', '', '', '2014-11-25 03:40:56', '2014-11-25 03:40:56', '', 0, 'http://localhost/wp-content/uploads/2014/11/IMG_9840.jpg', 0, 'attachment', 'image/jpeg', 0),
(805, 1, '2014-11-25 03:42:08', '2014-11-25 03:42:08', '', 'SanTan Brewing Company', '', 'inherit', 'open', 'open', '', 'santan-brewing-company', '', '', '2014-11-25 03:42:08', '2014-11-25 03:42:08', '', 0, 'http://localhost/wp-content/uploads/2014/11/foodiesfeed.com_mobile_small-burger-beer.jpg', 0, 'attachment', 'image/jpeg', 0),
(806, 1, '2014-11-25 03:42:46', '2014-11-25 03:42:46', '', 'Oliver & Bonacini Café Grill', '', 'inherit', 'open', 'open', '', 'oliver-bonacini-cafe-grill', '', '', '2014-11-25 03:42:46', '2014-11-25 03:42:46', '', 0, 'http://localhost/wp-content/uploads/2014/11/foodiesfeed.com_half-of-a-chicken.jpg', 0, 'attachment', 'image/jpeg', 0),
(807, 1, '2014-11-25 03:43:18', '2014-11-25 03:43:18', '', 'Noodlecat', '', 'inherit', 'open', 'open', '', 'noodlecat', '', '', '2014-11-25 03:43:18', '2014-11-25 03:43:18', '', 0, 'http://localhost/wp-content/uploads/2014/11/15757079382_a61f5c8e62_o.jpg', 0, 'attachment', 'image/jpeg', 0),
(808, 1, '2014-11-25 03:43:45', '2014-11-25 03:43:45', '', 'Glory Hole Doughnuts', '', 'inherit', 'open', 'open', '', 'glory-hole-doughnuts', '', '', '2014-11-25 03:43:45', '2014-11-25 03:43:45', '', 0, 'http://localhost/wp-content/uploads/2014/11/foodiesfeed.com_mobile-coffee8.jpg', 0, 'attachment', 'image/jpeg', 0),
(809, 1, '2014-11-25 03:44:17', '2014-11-25 03:44:17', '', 'Four Barrel Coffee', '', 'inherit', 'open', 'open', '', 'four-barrel-coffee', '', '', '2014-11-25 03:44:17', '2014-11-25 03:44:17', '', 0, 'http://localhost/wp-content/uploads/2014/11/20140215-DSC_0362.jpg', 0, 'attachment', 'image/jpeg', 0),
(810, 1, '2014-11-25 03:45:03', '2014-11-25 03:45:03', '', 'Wine Bar Rocky River', '', 'inherit', 'open', 'open', '', 'wine-bar-rocky-river', '', '', '2014-11-25 03:45:03', '2014-11-25 03:45:03', '', 0, 'http://localhost/wp-content/uploads/2014/11/DeathtoStock_NYC19.jpg', 0, 'attachment', 'image/jpeg', 0),
(811, 1, '2014-11-25 03:45:41', '2014-11-25 03:45:41', '', 'Detour Cafe', '', 'inherit', 'open', 'open', '', 'detour-cafe', '', '', '2014-11-25 03:45:41', '2014-11-25 03:45:41', '', 0, 'http://localhost/wp-content/uploads/2014/11/IMG_0027_retouched.jpg', 0, 'attachment', 'image/jpeg', 0),
(812, 1, '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 'Update Settings', '', 'publish', 'closed', 'closed', '', 'update-settings', '', '', '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 0, 'http://localhost/?p=812', 2, 'nav_menu_item', '', 0),
(813, 1, '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 'Edit Account', '', 'publish', 'closed', 'closed', '', 'edit-account', '', '', '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 0, 'http://localhost/?p=813', 5, 'nav_menu_item', '', 0),
(814, 1, '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 'Billing Details', '', 'publish', 'closed', 'closed', '', 'billing-details', '', '', '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 0, 'http://localhost/?p=814', 3, 'nav_menu_item', '', 0),
(815, 1, '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 'facebook', '', 'publish', 'closed', 'closed', '', 'facebook', '', '', '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 0, 'http://localhost/?p=815', 1, 'nav_menu_item', '', 0),
(816, 1, '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 'twitter', '', 'publish', 'closed', 'closed', '', 'twitter', '', '', '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 0, 'http://localhost/?p=816', 2, 'nav_menu_item', '', 0),
(817, 1, '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 'google', '', 'publish', 'closed', 'closed', '', 'google', '', '', '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 0, 'http://localhost/?p=817', 3, 'nav_menu_item', '', 0),
(818, 1, '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 'instagram', '', 'publish', 'closed', 'closed', '', 'instagram', '', '', '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 0, 'http://localhost/?p=818', 4, 'nav_menu_item', '', 0),
(819, 1, '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 'vimeo', '', 'publish', 'closed', 'closed', '', 'vimeo', '', '', '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 0, 'http://localhost/?p=819', 5, 'nav_menu_item', '', 0),
(820, 1, '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 'Help Center', '', 'publish', 'closed', 'closed', '', 'help-center', '', '', '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 0, 'http://localhost/?p=820', 1, 'nav_menu_item', '', 0),
(821, 1, '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 'Terms of Use', '', 'publish', 'closed', 'closed', '', 'terms-of-use', '', '', '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 0, 'http://localhost/?p=821', 2, 'nav_menu_item', '', 0),
(822, 1, '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 'About Listify', '', 'publish', 'closed', 'closed', '', 'about-listify', '', '', '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 0, 'http://localhost/?p=822', 3, 'nav_menu_item', '', 0),
(823, 1, '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 'Listify Blog', '', 'publish', 'closed', 'closed', '', 'listify-blog', '', '', '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 0, 'http://localhost/?p=823', 4, 'nav_menu_item', '', 0),
(824, 1, '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 'Careers', '', 'publish', 'closed', 'closed', '', 'careers', '', '', '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 0, 'http://localhost/?p=824', 5, 'nav_menu_item', '', 0),
(825, 1, '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 'Sign Out', '', 'publish', 'closed', 'closed', '', 'sign-out', '', '', '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 0, 'http://localhost/?p=825', 6, 'nav_menu_item', '', 0),
(826, 1, '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 'Twitter', '', 'publish', 'closed', 'closed', '', 'twitter-2', '', '', '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 0, 'http://localhost/?p=826', 1, 'nav_menu_item', '', 0),
(827, 1, '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 'Facebook', '', 'publish', 'closed', 'closed', '', 'facebook-2', '', '', '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 0, 'http://localhost/?p=827', 2, 'nav_menu_item', '', 0),
(828, 1, '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 'Google+', '', 'publish', 'closed', 'closed', '', 'google-2', '', '', '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 0, 'http://localhost/?p=828', 3, 'nav_menu_item', '', 0),
(829, 1, '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 'Instagram', '', 'publish', 'closed', 'closed', '', 'instagram-2', '', '', '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 0, 'http://localhost/?p=829', 4, 'nav_menu_item', '', 0),
(830, 1, '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 'Vimeo', '', 'publish', 'closed', 'closed', '', 'vimeo-2', '', '', '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 0, 'http://localhost/?p=830', 5, 'nav_menu_item', '', 0),
(831, 1, '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 'Edit Listings', '', 'publish', 'closed', 'closed', '', 'edit-listings', '', '', '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 25, 'http://localhost/?p=831', 1, 'nav_menu_item', '', 0),
(832, 1, '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 'Sign In', '', 'publish', 'closed', 'closed', '', 'sign-in', '', '', '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 0, 'http://localhost/?p=832', 2, 'nav_menu_item', '', 0),
(833, 1, '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', '{{account}}', '', 'publish', 'closed', 'closed', '', 'account', '', '', '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 0, 'http://localhost/?p=833', 3, 'nav_menu_item', '', 0),
(834, 1, '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 'Edit Listings', '', 'publish', 'closed', 'closed', '', 'edit-listings-2', '', '', '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 25, 'http://localhost/?p=834', 4, 'nav_menu_item', '', 0),
(835, 1, '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 'Dashboard', '', 'publish', 'closed', 'closed', '', 'dashboard', '', '', '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 0, 'http://localhost/?p=835', 2, 'nav_menu_item', '', 0),
(836, 1, '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 'Edit Listings', '', 'publish', 'closed', 'closed', '', 'edit-listings-3', '', '', '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 25, 'http://localhost/?p=836', 3, 'nav_menu_item', '', 0),
(838, 1, '2015-10-14 10:11:55', '2015-10-14 10:11:55', '', 'Update Settings', '', 'publish', 'closed', 'closed', '', 'update-settings-2', '', '', '2015-10-14 10:11:55', '2015-10-14 10:11:55', '', 0, 'http://localhost/?p=838', 2, 'nav_menu_item', '', 0),
(839, 1, '2015-10-14 10:11:55', '2015-10-14 10:11:55', '', 'Edit Account', '', 'publish', 'closed', 'closed', '', 'edit-account-2', '', '', '2015-10-14 10:11:55', '2015-10-14 10:11:55', '', 0, 'http://localhost/?p=839', 5, 'nav_menu_item', '', 0),
(840, 1, '2015-10-14 10:11:55', '2015-10-14 10:11:55', '', 'Billing Details', '', 'publish', 'closed', 'closed', '', 'billing-details-2', '', '', '2015-10-14 10:11:55', '2015-10-14 10:11:55', '', 0, 'http://localhost/?p=840', 3, 'nav_menu_item', '', 0),
(841, 1, '2015-10-14 10:11:55', '2015-10-14 10:11:55', '', 'facebook', '', 'publish', 'closed', 'closed', '', 'facebook-3', '', '', '2015-10-14 10:11:55', '2015-10-14 10:11:55', '', 0, 'http://localhost/?p=841', 1, 'nav_menu_item', '', 0),
(842, 1, '2015-10-14 10:11:55', '2015-10-14 10:11:55', '', 'twitter', '', 'publish', 'closed', 'closed', '', 'twitter-3', '', '', '2015-10-14 10:11:55', '2015-10-14 10:11:55', '', 0, 'http://localhost/?p=842', 2, 'nav_menu_item', '', 0),
(843, 1, '2015-10-14 10:11:55', '2015-10-14 10:11:55', '', 'google', '', 'publish', 'closed', 'closed', '', 'google-3', '', '', '2015-10-14 10:11:55', '2015-10-14 10:11:55', '', 0, 'http://localhost/?p=843', 3, 'nav_menu_item', '', 0),
(844, 1, '2015-10-14 10:11:55', '2015-10-14 10:11:55', '', 'instagram', '', 'publish', 'closed', 'closed', '', 'instagram-3', '', '', '2015-10-14 10:11:55', '2015-10-14 10:11:55', '', 0, 'http://localhost/?p=844', 4, 'nav_menu_item', '', 0),
(845, 1, '2015-10-14 10:11:56', '2015-10-14 10:11:56', '', 'vimeo', '', 'publish', 'closed', 'closed', '', 'vimeo-3', '', '', '2015-10-14 10:11:56', '2015-10-14 10:11:56', '', 0, 'http://localhost/?p=845', 5, 'nav_menu_item', '', 0),
(846, 1, '2015-10-14 10:11:56', '2015-10-14 10:11:56', '', 'Help Center', '', 'publish', 'closed', 'closed', '', 'help-center-2', '', '', '2015-10-14 10:11:56', '2015-10-14 10:11:56', '', 0, 'http://localhost/?p=846', 1, 'nav_menu_item', '', 0),
(847, 1, '2015-10-14 10:11:56', '2015-10-14 10:11:56', '', 'Terms of Use', '', 'publish', 'closed', 'closed', '', 'terms-of-use-2', '', '', '2015-10-14 10:11:56', '2015-10-14 10:11:56', '', 0, 'http://localhost/?p=847', 2, 'nav_menu_item', '', 0),
(848, 1, '2015-10-14 10:11:56', '2015-10-14 10:11:56', '', 'About Listify', '', 'publish', 'closed', 'closed', '', 'about-listify-2', '', '', '2015-10-14 10:11:56', '2015-10-14 10:11:56', '', 0, 'http://localhost/?p=848', 3, 'nav_menu_item', '', 0),
(849, 1, '2015-10-14 10:11:56', '2015-10-14 10:11:56', '', 'Listify Blog', '', 'publish', 'closed', 'closed', '', 'listify-blog-2', '', '', '2015-10-14 10:11:56', '2015-10-14 10:11:56', '', 0, 'http://localhost/?p=849', 4, 'nav_menu_item', '', 0),
(850, 1, '2015-10-14 10:11:56', '2015-10-14 10:11:56', '', 'Careers', '', 'publish', 'closed', 'closed', '', 'careers-2', '', '', '2015-10-14 10:11:56', '2015-10-14 10:11:56', '', 0, 'http://localhost/?p=850', 5, 'nav_menu_item', '', 0),
(851, 1, '2015-10-14 10:11:56', '2015-10-14 10:11:56', '', 'Sign Out', '', 'publish', 'closed', 'closed', '', 'sign-out-2', '', '', '2015-10-14 10:11:56', '2015-10-14 10:11:56', '', 0, 'http://localhost/?p=851', 6, 'nav_menu_item', '', 0),
(852, 1, '2015-10-14 10:11:56', '2015-10-14 10:11:56', '', 'Twitter', '', 'publish', 'closed', 'closed', '', 'twitter-4', '', '', '2015-10-14 10:11:56', '2015-10-14 10:11:56', '', 0, 'http://localhost/?p=852', 1, 'nav_menu_item', '', 0),
(853, 1, '2015-10-14 10:11:56', '2015-10-14 10:11:56', '', 'Facebook', '', 'publish', 'closed', 'closed', '', 'facebook-4', '', '', '2015-10-14 10:11:56', '2015-10-14 10:11:56', '', 0, 'http://localhost/?p=853', 2, 'nav_menu_item', '', 0),
(854, 1, '2015-10-14 10:11:56', '2015-10-14 10:11:56', '', 'Google+', '', 'publish', 'closed', 'closed', '', 'google-4', '', '', '2015-10-14 10:11:56', '2015-10-14 10:11:56', '', 0, 'http://localhost/?p=854', 3, 'nav_menu_item', '', 0),
(855, 1, '2015-10-14 10:11:56', '2015-10-14 10:11:56', '', 'Instagram', '', 'publish', 'closed', 'closed', '', 'instagram-4', '', '', '2015-10-14 10:11:56', '2015-10-14 10:11:56', '', 0, 'http://localhost/?p=855', 4, 'nav_menu_item', '', 0),
(856, 1, '2015-10-14 10:11:56', '2015-10-14 10:11:56', '', 'Vimeo', '', 'publish', 'closed', 'closed', '', 'vimeo-4', '', '', '2015-10-14 10:11:56', '2015-10-14 10:11:56', '', 0, 'http://localhost/?p=856', 5, 'nav_menu_item', '', 0),
(857, 1, '2015-10-14 10:11:56', '2015-10-14 10:11:56', '', 'Edit Listings', '', 'publish', 'closed', 'closed', '', 'edit-listings-4', '', '', '2015-10-14 10:11:56', '2015-10-14 10:11:56', '', 25, 'http://localhost/?p=857', 1, 'nav_menu_item', '', 0),
(858, 1, '2015-10-14 10:11:56', '2015-10-14 10:11:56', '', 'Sign In', '', 'publish', 'closed', 'closed', '', 'sign-in-2', '', '', '2015-10-14 10:11:56', '2015-10-14 10:11:56', '', 0, 'http://localhost/?p=858', 2, 'nav_menu_item', '', 0),
(859, 1, '2015-10-14 10:11:56', '2015-10-14 10:11:56', '', '{{account}}', '', 'publish', 'closed', 'closed', '', 'account-2', '', '', '2015-10-14 10:11:56', '2015-10-14 10:11:56', '', 0, 'http://localhost/?p=859', 3, 'nav_menu_item', '', 0),
(860, 1, '2015-10-14 10:11:56', '2015-10-14 10:11:56', '', 'Edit Listings', '', 'publish', 'closed', 'closed', '', 'edit-listings-5', '', '', '2015-10-14 10:11:56', '2015-10-14 10:11:56', '', 25, 'http://localhost/?p=860', 4, 'nav_menu_item', '', 0),
(861, 1, '2015-10-14 10:11:56', '2015-10-14 10:11:56', '', 'Dashboard', '', 'publish', 'closed', 'closed', '', 'dashboard-2', '', '', '2015-10-14 10:11:56', '2015-10-14 10:11:56', '', 0, 'http://localhost/?p=861', 2, 'nav_menu_item', '', 0),
(862, 1, '2015-10-14 10:11:56', '2015-10-14 10:11:56', '', 'Edit Listings', '', 'publish', 'closed', 'closed', '', 'edit-listings-6', '', '', '2015-10-14 10:11:56', '2015-10-14 10:11:56', '', 25, 'http://localhost/?p=862', 3, 'nav_menu_item', '', 0),
(865, 1, '2015-10-14 10:23:55', '2015-10-14 10:23:55', '<p>Your Name (required)<br />\n    [text* your-name] </p>\n\n<p>Your Email (required)<br />\n    [email* your-email] </p>\n\n<p>Subject<br />\n    [text your-subject] </p>\n\n<p>Your Message<br />\n    [textarea your-message] </p>\n\n<p>[submit "Send"]</p>\n[your-subject]\n[your-name] <wordpress@104.155.17.199>\nFrom: [your-name] <[your-email]>\nSubject: [your-subject]\n\nMessage Body:\n[your-message]\n\n--\nThis e-mail was sent from a contact form on babyhallo (http://localhost)\nnick.j.goodall@gmail.com\nReply-To: [your-email]\n\n0\n0\n\n[your-subject]\nbabyhallo <wordpress@104.155.17.199>\nMessage Body:\n[your-message]\n\n--\nThis e-mail was sent from a contact form on babyhallo (http://localhost)\n[your-email]\nReply-To: nick.j.goodall@gmail.com\n\n0\n0\nYour message was sent successfully. Thanks.\nFailed to send your message. Please try later or contact the administrator by another method.\nValidation errors occurred. Please confirm the fields and submit it again.\nFailed to send your message. Please try later or contact the administrator by another method.\nPlease accept the terms to proceed.\nPlease fill in the required field.\nThis input is too long.\nThis input is too short.', 'Contact form 1', '', 'publish', 'closed', 'closed', '', 'contact-form-1', '', '', '2015-10-14 10:23:55', '2015-10-14 10:23:55', '', 0, 'http://localhost/?post_type=wpcf7_contact_form&p=865', 0, 'wpcf7_contact_form', '', 0),
(866, 1, '2015-10-14 10:36:21', '2015-10-14 10:36:21', '', 'babyhallo-text-100x35', '', 'inherit', 'open', 'closed', '', 'babyhallo-text-100x35', '', '', '2015-10-14 10:36:21', '2015-10-14 10:36:21', '', 0, 'http://localhost/wp-content/uploads/2015/10/babyhallo-text-100x35.png', 0, 'attachment', 'image/png', 0),
(867, 1, '2015-10-14 10:39:18', '2015-10-14 10:39:18', '', 'babyhallo-text-white', '', 'inherit', 'open', 'closed', '', 'babyhallo-text-white', '', '', '2015-10-14 10:39:18', '2015-10-14 10:39:18', '', 0, 'http://localhost/wp-content/uploads/2015/10/babyhallo-text-white.png', 0, 'attachment', 'image/png', 0),
(868, 1, '2015-10-14 11:43:25', '2015-10-14 11:43:25', '', 'Auto Draft', '', 'trash', 'closed', 'closed', '', 'auto-draft', '', '', '2015-10-14 11:44:13', '2015-10-14 11:44:13', '', 0, 'http://localhost/?page_id=868', 0, 'page', '', 0),
(869, 1, '2015-10-14 11:44:13', '2015-10-14 11:44:13', '', 'Auto Draft', '', 'inherit', 'closed', 'closed', '', '868-revision-v1', '', '', '2015-10-14 11:44:13', '2015-10-14 11:44:13', '', 868, 'http://localhost/?p=869', 0, 'revision', '', 0),
(870, 1, '2015-10-14 12:17:01', '2015-10-14 12:17:01', '', 'family-commons-clipped', '', 'inherit', 'open', 'closed', '', 'family-commons-clipped', '', '', '2015-10-14 12:17:01', '2015-10-14 12:17:01', '', 11, 'http://localhost/wp-content/uploads/2015/10/family-commons-clipped.jpg', 0, 'attachment', 'image/jpeg', 0) ;

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
(4, 1, 0),
(67, 2, 0),
(67, 3, 0),
(71, 2, 0),
(71, 4, 0),
(71, 11, 0),
(74, 2, 0),
(74, 4, 0),
(812, 7, 0),
(813, 5, 0),
(814, 7, 0),
(815, 8, 0),
(816, 8, 0),
(817, 8, 0),
(818, 8, 0),
(819, 8, 0),
(820, 9, 0),
(821, 9, 0),
(822, 9, 0),
(823, 9, 0),
(824, 9, 0),
(825, 5, 0),
(826, 10, 0),
(827, 10, 0),
(828, 10, 0),
(829, 10, 0),
(830, 10, 0),
(831, 7, 0),
(832, 5, 0),
(833, 5, 0),
(834, 5, 0),
(835, 6, 0),
(836, 6, 0),
(838, 7, 0),
(839, 5, 0),
(840, 7, 0),
(841, 8, 0),
(842, 8, 0),
(843, 8, 0),
(844, 8, 0),
(845, 8, 0),
(846, 9, 0),
(847, 9, 0),
(848, 9, 0),
(849, 9, 0),
(850, 9, 0),
(851, 5, 0),
(852, 10, 0),
(853, 10, 0),
(854, 10, 0),
(855, 10, 0),
(856, 10, 0),
(857, 7, 0),
(858, 5, 0),
(859, 5, 0),
(860, 5, 0),
(861, 6, 0),
(862, 6, 0) ;

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `wp_term_taxonomy`
#
INSERT INTO `wp_term_taxonomy` ( `term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 2),
(2, 2, 'category', '', 0, 3),
(3, 3, 'category', '', 0, 1),
(4, 4, 'category', '', 0, 2),
(5, 5, 'nav_menu', '', 0, 10),
(6, 6, 'nav_menu', '', 0, 4),
(7, 7, 'nav_menu', '', 0, 6),
(8, 8, 'nav_menu', '', 0, 10),
(9, 9, 'nav_menu', '', 0, 10),
(10, 10, 'nav_menu', '', 0, 10),
(11, 11, 'post_tag', '', 0, 1),
(12, 12, 'product_type', '', 0, 0),
(13, 13, 'product_type', '', 0, 0),
(14, 14, 'product_type', '', 0, 0),
(15, 15, 'product_type', '', 0, 0),
(16, 16, 'job_listing_type', '', 0, 0),
(17, 17, 'job_listing_type', '', 0, 0),
(18, 18, 'job_listing_type', '', 0, 0),
(19, 19, 'job_listing_type', '', 0, 0),
(20, 20, 'job_listing_type', '', 0, 0) ;

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `wp_terms`
#
INSERT INTO `wp_terms` ( `term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0),
(2, 'Growth', 'growth', 0),
(3, 'Local', 'local', 0),
(4, 'Sales', 'sales', 0),
(5, 'Primary', 'primary', 0),
(6, 'Secondary', 'secondary', 0),
(7, 'Tertiary', 'tertiary', 0),
(8, 'Social', 'social', 0),
(9, 'Need Help Menu', 'need-help-menu', 0),
(10, 'Social Widget Menu', 'social-widget-menu', 0),
(11, 'advertising', 'advertising', 0),
(12, 'simple', 'simple', 0),
(13, 'grouped', 'grouped', 0),
(14, 'variable', 'variable', 0),
(15, 'external', 'external', 0),
(16, 'Full Time', 'full-time', 0),
(17, 'Part Time', 'part-time', 0),
(18, 'Temporary', 'temporary', 0),
(19, 'Freelance', 'freelance', 0),
(20, 'Internship', 'internship', 0) ;

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


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
(14, 1, 'session_tokens', 'a:1:{s:64:"65d10c5fdb31d5296dc281a9ade0a36c5c6c9407173c19958cda90ef1a76fc02";a:4:{s:10:"expiration";i:1445937713;s:2:"ip";s:13:"87.112.197.92";s:2:"ua";s:121:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36";s:5:"login";i:1444728113;}}'),
(15, 1, 'wp_dashboard_quick_press_last_post_id', '3'),
(16, 1, 'wp_user-settings', 'editor=tinymce&libraryContent=browse'),
(17, 1, 'wp_user-settings-time', '1444813094'),
(18, 1, 'managejob_listing_page_edit_job_fieldscolumnshidden', 'a:5:{i:0;s:6:"output";i:1;s:9:"output_as";i:2;s:17:"output_show_label";i:3;s:6:"origin";i:4;s:7:"post_id";}'),
(19, 1, 'managejob_listing_page_edit_company_fieldscolumnshidden', 'a:5:{i:0;s:6:"output";i:1;s:9:"output_as";i:2;s:17:"output_show_label";i:3;s:6:"origin";i:4;s:7:"post_id";}') ;

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
(1, 'admin', '$P$BG3/3ltpbXnFsPEnu5bpqdhXwoAE2y.', 'admin', 'nick.j.goodall@gmail.com', '', '2015-10-13 08:56:52', '', 0, 'admin') ;

#
# End of data contents of table `wp_users`
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

