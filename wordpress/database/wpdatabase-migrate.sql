# WordPress MySQL database migration
#
# Generated: Thursday 22. October 2015 09:01 UTC
# Hostname: localhost
# Database: `wpdatabase`
# --------------------------------------------------------

/*!40101 SET NAMES utf8 */;

SET sql_mode='NO_AUTO_VALUE_ON_ZERO';



#
# Delete any existing table `wp_ab_appointments`
#

DROP TABLE IF EXISTS `wp_ab_appointments`;


#
# Table structure of table `wp_ab_appointments`
#

CREATE TABLE `wp_ab_appointments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` int(10) unsigned NOT NULL,
  `service_id` int(10) unsigned DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `google_event_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_id`),
  KEY `service_id` (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


#
# Data contents of table `wp_ab_appointments`
#

#
# End of data contents of table `wp_ab_appointments`
# --------------------------------------------------------



#
# Delete any existing table `wp_ab_categories`
#

DROP TABLE IF EXISTS `wp_ab_categories`;


#
# Table structure of table `wp_ab_categories`
#

CREATE TABLE `wp_ab_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `position` int(11) NOT NULL DEFAULT '9999',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


#
# Data contents of table `wp_ab_categories`
#

#
# End of data contents of table `wp_ab_categories`
# --------------------------------------------------------



#
# Delete any existing table `wp_ab_coupons`
#

DROP TABLE IF EXISTS `wp_ab_coupons`;


#
# Table structure of table `wp_ab_coupons`
#

CREATE TABLE `wp_ab_coupons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL DEFAULT '',
  `discount` decimal(3,0) NOT NULL DEFAULT '0',
  `deduction` decimal(10,2) NOT NULL DEFAULT '0.00',
  `usage_limit` int(10) unsigned NOT NULL DEFAULT '1',
  `used` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


#
# Data contents of table `wp_ab_coupons`
#

#
# End of data contents of table `wp_ab_coupons`
# --------------------------------------------------------



#
# Delete any existing table `wp_ab_customer_appointments`
#

DROP TABLE IF EXISTS `wp_ab_customer_appointments`;


#
# Table structure of table `wp_ab_customer_appointments`
#

CREATE TABLE `wp_ab_customer_appointments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `appointment_id` int(10) unsigned NOT NULL,
  `number_of_persons` int(10) unsigned NOT NULL DEFAULT '1',
  `custom_fields` text,
  `coupon_code` varchar(255) DEFAULT NULL,
  `coupon_discount` decimal(10,2) DEFAULT NULL,
  `coupon_deduction` decimal(10,2) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `time_zone_offset` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `appointment_id` (`appointment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


#
# Data contents of table `wp_ab_customer_appointments`
#

#
# End of data contents of table `wp_ab_customer_appointments`
# --------------------------------------------------------



#
# Delete any existing table `wp_ab_customers`
#

DROP TABLE IF EXISTS `wp_ab_customers`;


#
# Table structure of table `wp_ab_customers`
#

CREATE TABLE `wp_ab_customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wp_user_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `phone` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `notes` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


#
# Data contents of table `wp_ab_customers`
#

#
# End of data contents of table `wp_ab_customers`
# --------------------------------------------------------



#
# Delete any existing table `wp_ab_holidays`
#

DROP TABLE IF EXISTS `wp_ab_holidays`;


#
# Table structure of table `wp_ab_holidays`
#

CREATE TABLE `wp_ab_holidays` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` int(10) unsigned DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `date` date NOT NULL,
  `repeat_event` tinyint(1) NOT NULL DEFAULT '0',
  `title` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `staff_id` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


#
# Data contents of table `wp_ab_holidays`
#

#
# End of data contents of table `wp_ab_holidays`
# --------------------------------------------------------



#
# Delete any existing table `wp_ab_notifications`
#

DROP TABLE IF EXISTS `wp_ab_notifications`;


#
# Table structure of table `wp_ab_notifications`
#

CREATE TABLE `wp_ab_notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gateway` enum('email','sms') NOT NULL DEFAULT 'email',
  `type` varchar(255) NOT NULL DEFAULT '',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `copy` tinyint(1) NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;


#
# Data contents of table `wp_ab_notifications`
#
INSERT INTO `wp_ab_notifications` ( `id`, `gateway`, `type`, `active`, `copy`, `subject`, `message`) VALUES
(1, 'email', 'client_new_appointment', 0, 0, 'Your appointment information', '<p>Dear [[CLIENT_NAME]].</p>\n<p>This is confirmation that you have booked [[SERVICE_NAME]].</p>\n<p>We are waiting you at [[COMPANY_ADDRESS]] on [[APPOINTMENT_DATE]] at [[APPOINTMENT_TIME]].</p>\n<p>Thank you for choosing our company.</p>\n<p>[[COMPANY_NAME]]<br />\n[[COMPANY_PHONE]]<br />\n[[COMPANY_WEBSITE]]</p>\n'),
(2, 'email', 'staff_new_appointment', 0, 0, 'New booking information', '<p>Hello.</p>\n<p>You have new booking.</p>\n<p>Service: [[SERVICE_NAME]]<br />\nDate: [[APPOINTMENT_DATE]]<br />\nTime: [[APPOINTMENT_TIME]]<br />\nClient name: [[CLIENT_NAME]]<br />\nClient phone: [[CLIENT_PHONE]]<br />\nClient email: [[CLIENT_EMAIL]]</p>\n'),
(3, 'email', 'client_reminder', 0, 0, 'Your appointment at [[COMPANY_NAME]]', '<p>Dear [[CLIENT_NAME]].</p>\n<p>We would like to remind you that you have booked [[SERVICE_NAME]] tomorrow on [[APPOINTMENT_TIME]]. We are waiting you at [[COMPANY_ADDRESS]].</p>\n<p>Thank you for choosing our company.</p>\n<p>[[COMPANY_NAME]]<br />\n[[COMPANY_PHONE]]<br />\n[[COMPANY_WEBSITE]]</p>\n'),
(4, 'email', 'client_follow_up', 0, 0, 'Your visit to [[COMPANY_NAME]]', '<p>Dear [[CLIENT_NAME]].</p>\n<p>Thank you for choosing [[COMPANY_NAME]]. We hope you were satisfied with your [[SERVICE_NAME]].</p>\n<p>Thank you and we look forward to seeing you again soon.</p>\n<p>[[COMPANY_NAME]]<br />\n[[COMPANY_PHONE]]<br />\n[[COMPANY_WEBSITE]]</p>\n'),
(5, 'email', 'staff_agenda', 0, 0, 'Your agenda for [[TOMORROW_DATE]]', '<p>Hello.</p>\n<p>Your agenda for tomorrow is:</p>\n<p>[[NEXT_DAY_AGENDA]]</p>\n'),
(6, 'email', 'staff_cancelled_appointment', 0, 0, 'Booking cancellation', '<p>Hello.</p>\n<p>The following booking has been cancelled.</p>\n<p>Service: [[SERVICE_NAME]]<br />\nDate: [[APPOINTMENT_DATE]]<br />\nTime: [[APPOINTMENT_TIME]]<br />\nClient name: [[CLIENT_NAME]]<br />\nClient phone: [[CLIENT_PHONE]]<br />\nClient email: [[CLIENT_EMAIL]]</p>\n'),
(7, 'email', 'client_new_wp_user', 0, 0, 'New customer', '<p>Hello.</p>\n<p>An account was created for you at [[SITE_ADDRESS]]</p>\n<p>Your user details:<br />\nuser: [[NEW_USERNAME]]<br />\npassword: [[NEW_PASSWORD]]</p>\n<p>Thanks.</p>\n'),
(8, 'sms', 'client_new_appointment', 1, 0, '', 'Dear [[CLIENT_NAME]].\nThis is confirmation that you have booked [[SERVICE_NAME]].\nWe are waiting you at [[COMPANY_ADDRESS]] on [[APPOINTMENT_DATE]] at [[APPOINTMENT_TIME]].\nThank you for choosing our company.\n[[COMPANY_NAME]]\n[[COMPANY_PHONE]]\n[[COMPANY_WEBSITE]]'),
(9, 'sms', 'staff_new_appointment', 0, 0, '', 'Hello.\nYou have new booking.\nService: [[SERVICE_NAME]]\nDate: [[APPOINTMENT_DATE]]\nTime: [[APPOINTMENT_TIME]]\nClient name: [[CLIENT_NAME]]\nClient phone: [[CLIENT_PHONE]]\nClient email: [[CLIENT_EMAIL]]'),
(10, 'sms', 'client_reminder', 0, 0, '', 'Dear [[CLIENT_NAME]].\nWe would like to remind you that you have booked [[SERVICE_NAME]] tomorrow on [[APPOINTMENT_TIME]]. We are waiting you at [[COMPANY_ADDRESS]].\nThank you for choosing our company.\n[[COMPANY_NAME]]\n[[COMPANY_PHONE]]\n[[COMPANY_WEBSITE]]'),
(11, 'sms', 'client_follow_up', 0, 0, '', 'Dear [[CLIENT_NAME]].\nThank you for choosing [[COMPANY_NAME]]. We hope you were satisfied with your [[SERVICE_NAME]].\nThank you and we look forward to seeing you again soon.\n[[COMPANY_NAME]]\n[[COMPANY_PHONE]]\n[[COMPANY_WEBSITE]]'),
(12, 'sms', 'staff_agenda', 0, 0, '', 'Hello.\nYour agenda for tomorrow is:\n[[NEXT_DAY_AGENDA]]'),
(13, 'sms', 'staff_cancelled_appointment', 0, 0, '', 'Hello.\nThe following booking has been cancelled.\nService: [[SERVICE_NAME]]\nDate: [[APPOINTMENT_DATE]]\nTime: [[APPOINTMENT_TIME]]\nClient name: [[CLIENT_NAME]]\nClient phone: [[CLIENT_PHONE]]\nClient email: [[CLIENT_EMAIL]]'),
(14, 'sms', 'client_new_wp_user', 1, 0, '', 'Hello.\nAn account was created for you at [[SITE_ADDRESS]]\nYour user details:\nuser: [[NEW_USERNAME]]\npassword: [[NEW_PASSWORD]]\n\nThanks.') ;

#
# End of data contents of table `wp_ab_notifications`
# --------------------------------------------------------



#
# Delete any existing table `wp_ab_payments`
#

DROP TABLE IF EXISTS `wp_ab_payments`;


#
# Table structure of table `wp_ab_payments`
#

CREATE TABLE `wp_ab_payments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `type` enum('local','coupon','paypal','authorizeNet','stripe') NOT NULL DEFAULT 'local',
  `customer_appointment_id` int(10) unsigned NOT NULL,
  `token` varchar(255) NOT NULL,
  `transaction` varchar(255) NOT NULL,
  `total` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `customer_appointment_id` (`customer_appointment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


#
# Data contents of table `wp_ab_payments`
#

#
# End of data contents of table `wp_ab_payments`
# --------------------------------------------------------



#
# Delete any existing table `wp_ab_schedule_item_breaks`
#

DROP TABLE IF EXISTS `wp_ab_schedule_item_breaks`;


#
# Table structure of table `wp_ab_schedule_item_breaks`
#

CREATE TABLE `wp_ab_schedule_item_breaks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `staff_schedule_item_id` int(10) unsigned NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `staff_schedule_item_id` (`staff_schedule_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


#
# Data contents of table `wp_ab_schedule_item_breaks`
#

#
# End of data contents of table `wp_ab_schedule_item_breaks`
# --------------------------------------------------------



#
# Delete any existing table `wp_ab_sent_notifications`
#

DROP TABLE IF EXISTS `wp_ab_sent_notifications`;


#
# Table structure of table `wp_ab_sent_notifications`
#

CREATE TABLE `wp_ab_sent_notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_appointment_id` int(10) unsigned DEFAULT NULL,
  `staff_id` int(10) unsigned DEFAULT NULL,
  `gateway` enum('email','sms') NOT NULL DEFAULT 'email',
  `type` varchar(60) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_appointment_id` (`customer_appointment_id`),
  KEY `staff_id` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


#
# Data contents of table `wp_ab_sent_notifications`
#

#
# End of data contents of table `wp_ab_sent_notifications`
# --------------------------------------------------------



#
# Delete any existing table `wp_ab_services`
#

DROP TABLE IF EXISTS `wp_ab_services`;


#
# Table structure of table `wp_ab_services`
#

CREATE TABLE `wp_ab_services` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT '',
  `duration` int(11) NOT NULL DEFAULT '900',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `color` varchar(255) NOT NULL DEFAULT '#FFFFFF',
  `category_id` int(10) unsigned DEFAULT NULL,
  `capacity` int(11) NOT NULL DEFAULT '1',
  `position` int(11) NOT NULL DEFAULT '9999',
  `padding_left` int(11) NOT NULL DEFAULT '0',
  `padding_right` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


#
# Data contents of table `wp_ab_services`
#
INSERT INTO `wp_ab_services` ( `id`, `title`, `duration`, `price`, `color`, `category_id`, `capacity`, `position`, `padding_left`, `padding_right`) VALUES
(1, NULL, 900, '0.00', '#21B87C', NULL, 1, 9999, 0, 0) ;

#
# End of data contents of table `wp_ab_services`
# --------------------------------------------------------



#
# Delete any existing table `wp_ab_staff`
#

DROP TABLE IF EXISTS `wp_ab_staff`;


#
# Table structure of table `wp_ab_staff`
#

CREATE TABLE `wp_ab_staff` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wp_user_id` bigint(20) unsigned DEFAULT NULL,
  `avatar_url` varchar(255) DEFAULT '',
  `avatar_path` varchar(255) DEFAULT '',
  `full_name` varchar(128) DEFAULT '',
  `email` varchar(128) DEFAULT '',
  `phone` varchar(128) DEFAULT '',
  `google_data` varchar(255) DEFAULT '',
  `google_calendar_id` varchar(255) DEFAULT '',
  `position` int(11) NOT NULL DEFAULT '9999',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


#
# Data contents of table `wp_ab_staff`
#
INSERT INTO `wp_ab_staff` ( `id`, `wp_user_id`, `avatar_url`, `avatar_path`, `full_name`, `email`, `phone`, `google_data`, `google_calendar_id`, `position`) VALUES
(1, NULL, '', '', 'Enter name', '', '', '', '', 9999) ;

#
# End of data contents of table `wp_ab_staff`
# --------------------------------------------------------



#
# Delete any existing table `wp_ab_staff_schedule_items`
#

DROP TABLE IF EXISTS `wp_ab_staff_schedule_items`;


#
# Table structure of table `wp_ab_staff_schedule_items`
#

CREATE TABLE `wp_ab_staff_schedule_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` int(10) unsigned NOT NULL,
  `day_index` int(10) unsigned NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_ids_idx` (`staff_id`,`day_index`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;


#
# Data contents of table `wp_ab_staff_schedule_items`
#
INSERT INTO `wp_ab_staff_schedule_items` ( `id`, `staff_id`, `day_index`, `start_time`, `end_time`) VALUES
(1, 1, 1, '08:00:00', '18:00:00'),
(2, 1, 2, '08:00:00', '18:00:00'),
(3, 1, 3, '08:00:00', '18:00:00'),
(4, 1, 4, '08:00:00', '18:00:00'),
(5, 1, 5, '08:00:00', '18:00:00'),
(6, 1, 6, '08:00:00', '18:00:00'),
(7, 1, 7, '08:00:00', '18:00:00') ;

#
# End of data contents of table `wp_ab_staff_schedule_items`
# --------------------------------------------------------



#
# Delete any existing table `wp_ab_staff_services`
#

DROP TABLE IF EXISTS `wp_ab_staff_services`;


#
# Table structure of table `wp_ab_staff_services`
#

CREATE TABLE `wp_ab_staff_services` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` int(10) unsigned NOT NULL,
  `service_id` int(10) unsigned NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `capacity` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_ids_idx` (`staff_id`,`service_id`),
  KEY `service_id` (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


#
# Data contents of table `wp_ab_staff_services`
#

#
# End of data contents of table `wp_ab_staff_services`
# --------------------------------------------------------



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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `wp_comments`
#
INSERT INTO `wp_comments` ( `comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'Mr WordPress', '', 'https://wordpress.org/', '', '2015-10-13 08:56:52', '2015-10-13 08:56:52', 'Hi, this is a comment.\nTo delete a comment, just log in and view the post&#039;s comments. There you will have the option to edit or delete them.', 0, 'post-trashed', '', '', 0, 0),
(2, 941, 'WooCommerce', 'woocommerce@104.155.17.199', '', '', '2015-10-20 12:14:56', '2015-10-20 12:14:56', 'Booking #940 status changed from "in-cart" to "pending-confirmation', 0, '1', 'WooCommerce', 'order_note', 0, 0),
(3, 941, 'WooCommerce', 'woocommerce@104.155.17.199', '', '', '2015-10-20 12:14:56', '2015-10-20 12:14:56', 'This order is awaiting confirmation from the shop manager', 0, '1', 'WooCommerce', 'order_note', 0, 0),
(4, 941, 'WooCommerce', 'woocommerce@104.155.17.199', '', '', '2015-10-20 12:15:16', '2015-10-20 12:15:16', 'Booking #940 status changed from "pending-confirmation" to "confirmed', 0, '1', 'WooCommerce', 'order_note', 0, 0) ;

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;


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
) ENGINE=InnoDB AUTO_INCREMENT=1823 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `wp_options`
#
INSERT INTO `wp_options` ( `option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http:localhost', 'yes'),
(2, 'home', 'http:localhost', 'yes'),
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
(33, 'active_plugins', 'a:20:{i:0;s:36:"contact-form-7/wp-contact-form-7.php";i:1;s:23:"debug-bar/debug-bar.php";i:2;s:77:"enhanced-admin-bar-with-codex-search/enhanced-admin-bar-with-codex-search.php";i:3;s:34:"envato-wordpress-toolkit/index.php";i:4;s:33:"nav-menu-roles/nav-menu-roles.php";i:5;s:43:"post-meta-inspector/post-meta-inspector.php";i:6;s:53:"widget-importer-exporter/widget-importer-exporter.php";i:7;s:46:"woocommerce-bookings/woocommmerce-bookings.php";i:8;s:59:"woocommerce-product-vendors/woocommerce-product-vendors.php";i:9;s:67:"woocommerce-simple-registration/woocommerce-simple-registration.php";i:10;s:27:"woocommerce/woocommerce.php";i:11;s:41:"wordpress-importer/wordpress-importer.php";i:12;s:65:"wp-job-manager-contact-listing/wp-job-manager-contact-listing.php";i:13;s:69:"wp-job-manager-extended-location/wp-job-manager-extended-location.php";i:14;s:59:"wp-job-manager-field-editor/wp-job-manager-field-editor.php";i:15;s:53:"wp-job-manager-locations/wp-job-manager-locations.php";i:16;s:51:"wp-job-manager-products/wp-job-manager-products.php";i:17;s:33:"wp-job-manager/wp-job-manager.php";i:18;s:31:"wp-migrate-db/wp-migrate-db.php";i:19;s:33:"wp-user-avatar/wp-user-avatar.php";}', 'yes'),
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
(82, 'uninstall_plugins', 'a:1:{s:51:"bookly-responsive-appointment-booking-tool/main.php";a:2:{i:0;s:11:"AB_Instance";i:1;s:9:"uninstall";}}', 'no'),
(83, 'timezone_string', '', 'yes'),
(85, 'page_on_front', '11', 'yes'),
(86, 'default_post_format', '0', 'yes'),
(87, 'link_manager_enabled', '0', 'yes'),
(88, 'finished_splitting_shared_terms', '1', 'yes'),
(89, 'initial_db_version', '33055', 'yes'),
(90, 'wp_user_roles', 'a:8:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:153:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:9:"add_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;s:18:"manage_woocommerce";b:1;s:24:"view_woocommerce_reports";b:1;s:12:"edit_product";b:1;s:12:"read_product";b:1;s:14:"delete_product";b:1;s:13:"edit_products";b:1;s:20:"edit_others_products";b:1;s:16:"publish_products";b:1;s:21:"read_private_products";b:1;s:15:"delete_products";b:1;s:23:"delete_private_products";b:1;s:25:"delete_published_products";b:1;s:22:"delete_others_products";b:1;s:21:"edit_private_products";b:1;s:23:"edit_published_products";b:1;s:20:"manage_product_terms";b:1;s:18:"edit_product_terms";b:1;s:20:"delete_product_terms";b:1;s:20:"assign_product_terms";b:1;s:15:"edit_shop_order";b:1;s:15:"read_shop_order";b:1;s:17:"delete_shop_order";b:1;s:16:"edit_shop_orders";b:1;s:23:"edit_others_shop_orders";b:1;s:19:"publish_shop_orders";b:1;s:24:"read_private_shop_orders";b:1;s:18:"delete_shop_orders";b:1;s:26:"delete_private_shop_orders";b:1;s:28:"delete_published_shop_orders";b:1;s:25:"delete_others_shop_orders";b:1;s:24:"edit_private_shop_orders";b:1;s:26:"edit_published_shop_orders";b:1;s:23:"manage_shop_order_terms";b:1;s:21:"edit_shop_order_terms";b:1;s:23:"delete_shop_order_terms";b:1;s:23:"assign_shop_order_terms";b:1;s:16:"edit_shop_coupon";b:1;s:16:"read_shop_coupon";b:1;s:18:"delete_shop_coupon";b:1;s:17:"edit_shop_coupons";b:1;s:24:"edit_others_shop_coupons";b:1;s:20:"publish_shop_coupons";b:1;s:25:"read_private_shop_coupons";b:1;s:19:"delete_shop_coupons";b:1;s:27:"delete_private_shop_coupons";b:1;s:29:"delete_published_shop_coupons";b:1;s:26:"delete_others_shop_coupons";b:1;s:25:"edit_private_shop_coupons";b:1;s:27:"edit_published_shop_coupons";b:1;s:24:"manage_shop_coupon_terms";b:1;s:22:"edit_shop_coupon_terms";b:1;s:24:"delete_shop_coupon_terms";b:1;s:24:"assign_shop_coupon_terms";b:1;s:17:"edit_shop_webhook";b:1;s:17:"read_shop_webhook";b:1;s:19:"delete_shop_webhook";b:1;s:18:"edit_shop_webhooks";b:1;s:25:"edit_others_shop_webhooks";b:1;s:21:"publish_shop_webhooks";b:1;s:26:"read_private_shop_webhooks";b:1;s:20:"delete_shop_webhooks";b:1;s:28:"delete_private_shop_webhooks";b:1;s:30:"delete_published_shop_webhooks";b:1;s:27:"delete_others_shop_webhooks";b:1;s:26:"edit_private_shop_webhooks";b:1;s:28:"edit_published_shop_webhooks";b:1;s:25:"manage_shop_webhook_terms";b:1;s:23:"edit_shop_webhook_terms";b:1;s:25:"delete_shop_webhook_terms";b:1;s:25:"assign_shop_webhook_terms";b:1;s:19:"manage_job_listings";b:1;s:16:"edit_job_listing";b:1;s:16:"read_job_listing";b:1;s:18:"delete_job_listing";b:1;s:17:"edit_job_listings";b:1;s:24:"edit_others_job_listings";b:1;s:20:"publish_job_listings";b:1;s:25:"read_private_job_listings";b:1;s:19:"delete_job_listings";b:1;s:27:"delete_private_job_listings";b:1;s:29:"delete_published_job_listings";b:1;s:26:"delete_others_job_listings";b:1;s:25:"edit_private_job_listings";b:1;s:27:"edit_published_job_listings";b:1;s:24:"manage_job_listing_terms";b:1;s:22:"edit_job_listing_terms";b:1;s:24:"delete_job_listing_terms";b:1;s:24:"assign_job_listing_terms";b:1;s:17:"manage_job_fields";b:1;s:20:"manage_resume_fields";b:1;s:15:"manage_bookings";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:3:{s:4:"read";b:1;s:7:"level_0";b:1;s:10:"edit_posts";b:1;}}s:8:"customer";a:2:{s:4:"name";s:8:"Customer";s:12:"capabilities";a:3:{s:4:"read";b:1;s:10:"edit_posts";b:0;s:12:"delete_posts";b:0;}}s:12:"shop_manager";a:2:{s:4:"name";s:12:"Shop Manager";s:12:"capabilities";a:111:{s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:4:"read";b:1;s:18:"read_private_pages";b:1;s:18:"read_private_posts";b:1;s:10:"edit_users";b:1;s:10:"edit_posts";b:1;s:10:"edit_pages";b:1;s:20:"edit_published_posts";b:1;s:20:"edit_published_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"edit_private_posts";b:1;s:17:"edit_others_posts";b:1;s:17:"edit_others_pages";b:1;s:13:"publish_posts";b:1;s:13:"publish_pages";b:1;s:12:"delete_posts";b:1;s:12:"delete_pages";b:1;s:20:"delete_private_pages";b:1;s:20:"delete_private_posts";b:1;s:22:"delete_published_pages";b:1;s:22:"delete_published_posts";b:1;s:19:"delete_others_posts";b:1;s:19:"delete_others_pages";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:17:"moderate_comments";b:1;s:15:"unfiltered_html";b:1;s:12:"upload_files";b:1;s:6:"export";b:1;s:6:"import";b:1;s:10:"list_users";b:1;s:18:"manage_woocommerce";b:1;s:24:"view_woocommerce_reports";b:1;s:12:"edit_product";b:1;s:12:"read_product";b:1;s:14:"delete_product";b:1;s:13:"edit_products";b:1;s:20:"edit_others_products";b:1;s:16:"publish_products";b:1;s:21:"read_private_products";b:1;s:15:"delete_products";b:1;s:23:"delete_private_products";b:1;s:25:"delete_published_products";b:1;s:22:"delete_others_products";b:1;s:21:"edit_private_products";b:1;s:23:"edit_published_products";b:1;s:20:"manage_product_terms";b:1;s:18:"edit_product_terms";b:1;s:20:"delete_product_terms";b:1;s:20:"assign_product_terms";b:1;s:15:"edit_shop_order";b:1;s:15:"read_shop_order";b:1;s:17:"delete_shop_order";b:1;s:16:"edit_shop_orders";b:1;s:23:"edit_others_shop_orders";b:1;s:19:"publish_shop_orders";b:1;s:24:"read_private_shop_orders";b:1;s:18:"delete_shop_orders";b:1;s:26:"delete_private_shop_orders";b:1;s:28:"delete_published_shop_orders";b:1;s:25:"delete_others_shop_orders";b:1;s:24:"edit_private_shop_orders";b:1;s:26:"edit_published_shop_orders";b:1;s:23:"manage_shop_order_terms";b:1;s:21:"edit_shop_order_terms";b:1;s:23:"delete_shop_order_terms";b:1;s:23:"assign_shop_order_terms";b:1;s:16:"edit_shop_coupon";b:1;s:16:"read_shop_coupon";b:1;s:18:"delete_shop_coupon";b:1;s:17:"edit_shop_coupons";b:1;s:24:"edit_others_shop_coupons";b:1;s:20:"publish_shop_coupons";b:1;s:25:"read_private_shop_coupons";b:1;s:19:"delete_shop_coupons";b:1;s:27:"delete_private_shop_coupons";b:1;s:29:"delete_published_shop_coupons";b:1;s:26:"delete_others_shop_coupons";b:1;s:25:"edit_private_shop_coupons";b:1;s:27:"edit_published_shop_coupons";b:1;s:24:"manage_shop_coupon_terms";b:1;s:22:"edit_shop_coupon_terms";b:1;s:24:"delete_shop_coupon_terms";b:1;s:24:"assign_shop_coupon_terms";b:1;s:17:"edit_shop_webhook";b:1;s:17:"read_shop_webhook";b:1;s:19:"delete_shop_webhook";b:1;s:18:"edit_shop_webhooks";b:1;s:25:"edit_others_shop_webhooks";b:1;s:21:"publish_shop_webhooks";b:1;s:26:"read_private_shop_webhooks";b:1;s:20:"delete_shop_webhooks";b:1;s:28:"delete_private_shop_webhooks";b:1;s:30:"delete_published_shop_webhooks";b:1;s:27:"delete_others_shop_webhooks";b:1;s:26:"edit_private_shop_webhooks";b:1;s:28:"edit_published_shop_webhooks";b:1;s:25:"manage_shop_webhook_terms";b:1;s:23:"edit_shop_webhook_terms";b:1;s:25:"delete_shop_webhook_terms";b:1;s:25:"assign_shop_webhook_terms";b:1;s:15:"manage_bookings";b:1;}}s:8:"employer";a:2:{s:4:"name";s:8:"Employer";s:12:"capabilities";a:3:{s:4:"read";b:1;s:10:"edit_posts";b:0;s:12:"delete_posts";b:0;}}}', 'yes'),
(91, 'widget_search', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(92, 'widget_recent-posts', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(93, 'widget_recent-comments', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(94, 'widget_archives', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(95, 'widget_meta', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(96, 'sidebars_widgets', 'a:12:{s:19:"wp_inactive_widgets";a:0:{}s:21:"widget-area-sidebar-1";a:0:{}s:16:"widget-area-home";a:0:{}s:20:"widget-area-footer-1";a:0:{}s:20:"widget-area-footer-2";a:0:{}s:20:"widget-area-footer-3";a:0:{}s:27:"widget-area-sidebar-product";a:0:{}s:24:"widget-area-sidebar-shop";a:0:{}s:19:"archive-job_listing";a:0:{}s:30:"single-job_listing-widget-area";a:4:{i:0;s:13:"jmfe_widget-2";i:1;s:13:"jmfe_widget-3";i:2;s:13:"jmfe_widget-4";i:3;s:13:"jmfe_widget-5";}s:18:"single-job_listing";a:2:{i:0;s:37:"listify_widget_panel_listing_auhtor-2";i:1;s:39:"listify_widget_panel_listing_bookings-2";}s:13:"array_version";i:3;}', 'yes'),
(99, 'cron', 'a:12:{i:1445504983;a:1:{s:32:"woocommerce_cancel_unpaid_orders";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:2:{s:8:"schedule";b:0;s:4:"args";a:0:{}}}}i:1445505713;a:1:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1445505837;a:1:{s:34:"job_manager_check_for_expired_jobs";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:6:"hourly";s:4:"args";a:0:{}s:8:"interval";i:3600;}}}i:1445506091;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1445509436;a:2:{s:30:"woocommerce_tracker_send_event";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}s:28:"woocommerce_cleanup_sessions";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1445509437;a:2:{s:31:"job_manager_delete_old_previews";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}s:36:"job_manager_clear_expired_transients";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1445540460;a:1:{s:20:"wp_maybe_auto_update";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1445547431;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1445558400;a:1:{s:27:"woocommerce_scheduled_sales";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1446108099;a:1:{s:28:"job_manager_verify_no_errors";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:6:"weekly";s:4:"args";a:0:{}s:8:"interval";i:604800;}}}i:1446508800;a:1:{s:25:"woocommerce_geoip_updater";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:7:"monthly";s:4:"args";a:0:{}s:8:"interval";i:2635200;}}}s:7:"version";i:2;}', 'yes'),
(109, 'db_upgraded', '', 'yes'),
(112, 'auto_core_update_notified', 'a:4:{s:4:"type";s:7:"success";s:5:"email";s:24:"nick.j.goodall@gmail.com";s:7:"version";s:5:"4.3.1";s:9:"timestamp";i:1444727575;}', 'yes'),
(114, 'auth_key', '2IU<M^5l+PB?9ye3{Gc6X*)xK3hrXWi|ARvFRO7G&m0B,zx+9]^]m,SFQN=?+{eh', 'yes'),
(115, 'auth_salt', 'R=vZH#&khMA0g}iS0VDq=>n>T~X(r*D5u3H8SHBQsvbj@6(wYwvNK)Ovh7%>-+0h', 'yes') ;
INSERT INTO `wp_options` ( `option_id`, `option_name`, `option_value`, `autoload`) VALUES
(116, 'logged_in_key', '$%^-q`^GN8y@a;CrA!m&ge{C#_1:F*%Wer^%poC%hz<GRBdd0@Vj,AKnyw:LakTw', 'yes'),
(117, 'logged_in_salt', '}}D1#EU8K`X+ $~`^XW^[Z97c_dcXlpspiEqh|Y<w$RV36Q}^+EYI,D9X*_ _1(m', 'yes'),
(118, 'nonce_key', 'ix!ED<+AQp6e.kaVV-P5`Wpm3i.4]w<qByyK#Q!s@R?Er/mJcJJiwxD4i(@a*lk&', 'yes'),
(119, 'nonce_salt', 'ln+WFh;TN)OG,^=V2%?8;vEkO*Nm`fFzH/~Dq$7%o=-qB@2TEeWBMGtdG`;%agVG', 'yes'),
(123, 'can_compress_scripts', '0', 'yes'),
(144, 'current_theme', 'Listify - Child Theme', 'yes'),
(145, 'theme_mods_twentyfourteen', 'a:2:{i:0;b:0;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1444728464;s:4:"data";a:4:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:9:"sidebar-2";N;s:9:"sidebar-3";N;}}}', 'yes'),
(146, 'theme_switched', '', 'yes'),
(153, 'recently_activated', 'a:2:{s:51:"bookly-responsive-appointment-booking-tool/main.php";i:1445339370;s:17:"facetwp/index.php";i:1445253167;}', 'yes'),
(157, 'eab-codex-search-submenu', 'yes', 'yes'),
(158, 'eab-admin-searches', 'yes', 'yes'),
(159, 'widget_calendar', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(160, 'widget_nav_menu', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(161, 'widget_pages', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(163, 'widget_tag_cloud', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(170, 'theme_mods_twentyfifteen', 'a:1:{s:16:"sidebars_widgets";a:2:{s:4:"time";i:1444735522;s:4:"data";a:4:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:0:{}s:9:"sidebar-2";N;s:9:"sidebar-3";N;}}}', 'yes'),
(171, 'theme_mods_customizr', 'a:2:{i:0;b:0;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1444730060;s:4:"data";a:6:{s:19:"wp_inactive_widgets";a:0:{}s:4:"left";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:5:"right";N;s:10:"footer_one";N;s:10:"footer_two";N;s:12:"footer_three";N;}}}', 'yes'),
(172, 'tc_theme_options', 'a:170:{s:14:"tc_logo_upload";N;s:14:"tc_logo_resize";b:1;s:21:"tc_sticky_logo_upload";N;s:13:"tc_fav_upload";N;s:7:"tc_skin";s:9:"blue3.css";s:14:"tc_skin_random";b:0;s:8:"tc_fonts";s:19:"_g_fjalla_cantarell";s:17:"tc_body_font_size";i:15;s:6:"tc_rss";s:24:"http:localhost/?feed=rss";s:8:"tc_email";N;s:10:"tc_twitter";N;s:11:"tc_facebook";N;s:9:"tc_google";N;s:12:"tc_instagram";N;s:9:"tc_tumblr";N;s:9:"tc_flickr";N;s:12:"tc_wordpress";N;s:10:"tc_youtube";N;s:12:"tc_pinterest";N;s:9:"tc_github";N;s:11:"tc_dribbble";N;s:11:"tc_linkedin";N;s:18:"tc_show_title_icon";b:1;s:23:"tc_show_page_title_icon";b:0;s:23:"tc_show_post_title_icon";b:0;s:26:"tc_show_archive_title_icon";b:1;s:28:"tc_show_post_list_title_icon";b:0;s:27:"tc_show_sidebar_widget_icon";b:1;s:26:"tc_show_footer_widget_icon";b:1;s:14:"tc_link_scroll";b:0;s:20:"tc_link_hover_effect";b:1;s:17:"tc_ext_link_style";b:0;s:18:"tc_ext_link_target";b:0;s:11:"tc_fancybox";b:1;s:21:"tc_fancybox_autoscale";b:1;s:17:"tc_retina_support";b:0;s:23:"tc_display_slide_loader";b:0;s:20:"tc_center_slider_img";b:1;s:13:"tc_center_img";b:1;s:16:"tc_block_reorder";b:1;s:19:"tc_show_author_info";b:1;s:15:"tc_smoothscroll";b:1;s:16:"tc_header_layout";s:4:"left";s:13:"tc_top_border";b:1;s:15:"tc_show_tagline";b:1;s:19:"tc_social_in_header";b:1;s:23:"tc_display_boxed_navbar";b:0;s:16:"tc_sticky_header";b:1;s:22:"tc_sticky_show_tagline";b:0;s:25:"tc_sticky_show_title_logo";b:1;s:27:"tc_sticky_shrink_title_logo";b:1;s:19:"tc_sticky_show_menu";b:1;s:31:"tc_sticky_transparent_on_scroll";b:1;s:17:"tc_sticky_z_index";i:100;s:22:"tc_display_second_menu";b:0;s:13:"tc_menu_style";s:5:"aside";s:39:"tc_menu_resp_dropdown_limit_to_viewport";b:0;s:21:"tc_display_menu_label";b:0;s:16:"tc_menu_position";s:15:"pull-menu-right";s:23:"tc_second_menu_position";s:14:"pull-menu-left";s:12:"tc_menu_type";s:5:"hover";s:27:"tc_menu_submenu_fade_effect";b:1;s:32:"tc_menu_submenu_item_move_effect";b:1;s:27:"tc_second_menu_resp_setting";s:12:"in-sn-before";s:17:"tc_hide_all_menus";b:0;s:23:"tc_blog_restrict_by_cat";a:0:{}s:15:"tc_front_layout";s:1:"f";s:15:"tc_front_slider";i:0;s:22:"tc_posts_slider_number";i:1;s:20:"tc_posts_slider_type";s:3:"all";s:21:"tc_posts_slider_title";b:1;s:20:"tc_posts_slider_text";b:1;s:20:"tc_posts_slider_link";s:3:"cta";s:27:"tc_posts_slider_button_text";s:17:"Read more &raquo;";s:15:"tc_slider_width";b:1;s:15:"tc_slider_delay";i:5000;s:24:"tc_slider_default_height";i:500;s:34:"tc_slider_default_height_apply_all";b:1;s:33:"tc_slider_change_default_img_size";b:0;s:22:"tc_show_featured_pages";i:0;s:26:"tc_show_featured_pages_img";b:1;s:28:"tc_featured_page_button_text";s:17:"Read more &raquo;";s:20:"tc_featured_page_one";N;s:20:"tc_featured_page_two";N;s:22:"tc_featured_page_three";N;s:20:"tc_featured_text_one";N;s:20:"tc_featured_text_two";N;s:22:"tc_featured_text_three";N;s:24:"tc_sidebar_global_layout";s:1:"l";s:23:"tc_sidebar_force_layout";b:0;s:22:"tc_sidebar_post_layout";s:1:"l";s:19:"tc_post_list_length";s:7:"excerpt";s:22:"tc_sidebar_page_layout";s:1:"l";s:22:"tc_comment_show_bubble";b:1;s:23:"tc_comment_bubble_shape";s:7:"default";s:28:"tc_comment_bubble_color_type";s:4:"skin";s:23:"tc_comment_bubble_color";s:7:"#27CDA5";s:16:"tc_page_comments";b:0;s:16:"tc_post_comments";b:1;s:20:"tc_show_comment_list";b:1;s:13:"tc_breadcrumb";b:1;s:23:"tc_show_breadcrumb_home";b:0;s:27:"tc_show_breadcrumb_in_pages";b:1;s:34:"tc_show_breadcrumb_in_single_posts";b:1;s:32:"tc_show_breadcrumb_in_post_lists";b:1;s:18:"tc_show_post_metas";b:1;s:20:"tc_post_metas_design";s:10:"no-buttons";s:23:"tc_show_post_metas_home";b:0;s:30:"tc_show_post_metas_single_post";b:1;s:29:"tc_show_post_metas_post_lists";b:1;s:29:"tc_show_post_metas_categories";b:1;s:23:"tc_show_post_metas_tags";b:1;s:35:"tc_show_post_metas_publication_date";b:1;s:25:"tc_show_post_metas_author";b:1;s:30:"tc_show_post_metas_update_date";b:0;s:32:"tc_post_metas_update_date_format";s:4:"days";s:36:"tc_post_metas_update_notice_in_title";b:0;s:36:"tc_post_metas_update_notice_interval";i:10;s:32:"tc_post_metas_update_notice_text";s:18:"Recently updated !";s:34:"tc_post_metas_update_notice_format";s:13:"label-default";s:27:"tc_post_list_excerpt_length";i:50;s:23:"tc_post_list_show_thumb";b:1;s:36:"tc_post_list_use_attachment_as_thumb";b:1;s:26:"tc_post_list_default_thumb";N;s:24:"tc_post_list_thumb_shape";s:7:"rounded";s:25:"tc_post_list_thumb_height";i:250;s:27:"tc_post_list_thumb_position";s:5:"right";s:28:"tc_post_list_thumb_alternate";b:1;s:12:"tc_cat_title";s:0:"";s:12:"tc_tag_title";s:0:"";s:15:"tc_author_title";s:0:"";s:15:"tc_search_title";s:20:"Search Results for :";s:17:"tc_post_list_grid";s:4:"grid";s:15:"tc_grid_columns";s:1:"3";s:23:"tc_grid_expand_featured";b:1;s:15:"tc_grid_in_blog";b:1;s:18:"tc_grid_in_archive";b:1;s:17:"tc_grid_in_search";b:1;s:14:"tc_grid_shadow";b:1;s:21:"tc_grid_bottom_border";b:1;s:13:"tc_grid_icons";b:1;s:17:"tc_grid_num_words";i:10;s:20:"tc_grid_thumb_height";i:350;s:29:"tc_single_post_thumb_location";s:4:"hide";s:27:"tc_single_post_thumb_height";i:250;s:17:"tc_enable_gallery";b:1;s:19:"tc_gallery_fancybox";b:1;s:16:"tc_gallery_style";b:1;s:17:"tc_enable_dropcap";b:0;s:19:"tc_dropcap_minwords";i:50;s:17:"tc_dropcap_design";s:11:"skin-shadow";s:15:"tc_post_dropcap";b:0;s:15:"tc_page_dropcap";b:0;s:23:"tc_show_post_navigation";b:1;s:28:"tc_show_post_navigation_page";b:0;s:30:"tc_show_post_navigation_single";b:1;s:31:"tc_show_post_navigation_archive";b:1;s:25:"tc_social_in_left-sidebar";b:0;s:26:"tc_social_in_right-sidebar";b:0;s:26:"tc_social_in_sidebar_title";s:12:"Social links";s:19:"tc_social_in_footer";b:1;s:16:"tc_sticky_footer";b:1;s:19:"tc_show_back_to_top";b:1;s:13:"tc_custom_css";N;s:16:"tc_minified_skin";b:1;s:17:"tc_img_smart_load";b:0;s:21:"tc_display_front_help";b:1;s:3:"ver";s:6:"3.4.11";s:18:"last_update_notice";a:2:{s:7:"version";s:6:"3.4.11";s:13:"display_count";i:0;}s:8:"defaults";a:168:{s:14:"tc_logo_upload";N;s:14:"tc_logo_resize";b:1;s:21:"tc_sticky_logo_upload";N;s:13:"tc_fav_upload";N;s:7:"tc_skin";s:9:"blue3.css";s:14:"tc_skin_random";b:0;s:8:"tc_fonts";s:19:"_g_fjalla_cantarell";s:17:"tc_body_font_size";i:15;s:6:"tc_rss";s:24:"http:localhost/?feed=rss";s:8:"tc_email";N;s:10:"tc_twitter";N;s:11:"tc_facebook";N;s:9:"tc_google";N;s:12:"tc_instagram";N;s:9:"tc_tumblr";N;s:9:"tc_flickr";N;s:12:"tc_wordpress";N;s:10:"tc_youtube";N;s:12:"tc_pinterest";N;s:9:"tc_github";N;s:11:"tc_dribbble";N;s:11:"tc_linkedin";N;s:18:"tc_show_title_icon";b:1;s:23:"tc_show_page_title_icon";b:0;s:23:"tc_show_post_title_icon";b:0;s:26:"tc_show_archive_title_icon";b:1;s:28:"tc_show_post_list_title_icon";b:0;s:27:"tc_show_sidebar_widget_icon";b:1;s:26:"tc_show_footer_widget_icon";b:1;s:14:"tc_link_scroll";b:0;s:20:"tc_link_hover_effect";b:1;s:17:"tc_ext_link_style";b:0;s:18:"tc_ext_link_target";b:0;s:11:"tc_fancybox";b:1;s:21:"tc_fancybox_autoscale";b:1;s:17:"tc_retina_support";b:0;s:23:"tc_display_slide_loader";b:0;s:20:"tc_center_slider_img";b:1;s:13:"tc_center_img";b:1;s:16:"tc_block_reorder";b:1;s:19:"tc_show_author_info";b:1;s:15:"tc_smoothscroll";b:1;s:16:"tc_header_layout";s:4:"left";s:13:"tc_top_border";b:1;s:15:"tc_show_tagline";b:1;s:19:"tc_social_in_header";b:1;s:23:"tc_display_boxed_navbar";b:0;s:16:"tc_sticky_header";b:1;s:22:"tc_sticky_show_tagline";b:0;s:25:"tc_sticky_show_title_logo";b:1;s:27:"tc_sticky_shrink_title_logo";b:1;s:19:"tc_sticky_show_menu";b:1;s:31:"tc_sticky_transparent_on_scroll";b:1;s:17:"tc_sticky_z_index";i:100;s:22:"tc_display_second_menu";b:0;s:13:"tc_menu_style";s:5:"aside";s:39:"tc_menu_resp_dropdown_limit_to_viewport";b:0;s:21:"tc_display_menu_label";b:0;s:16:"tc_menu_position";s:15:"pull-menu-right";s:23:"tc_second_menu_position";s:14:"pull-menu-left";s:12:"tc_menu_type";s:5:"hover";s:27:"tc_menu_submenu_fade_effect";b:1;s:32:"tc_menu_submenu_item_move_effect";b:1;s:27:"tc_second_menu_resp_setting";s:12:"in-sn-before";s:17:"tc_hide_all_menus";b:0;s:23:"tc_blog_restrict_by_cat";a:0:{}s:15:"tc_front_layout";s:1:"f";s:15:"tc_front_slider";s:4:"demo";s:22:"tc_posts_slider_number";i:1;s:20:"tc_posts_slider_type";s:3:"all";s:21:"tc_posts_slider_title";b:1;s:20:"tc_posts_slider_text";b:1;s:20:"tc_posts_slider_link";s:3:"cta";s:27:"tc_posts_slider_button_text";s:17:"Read more &raquo;";s:15:"tc_slider_width";b:1;s:15:"tc_slider_delay";i:5000;s:24:"tc_slider_default_height";i:500;s:34:"tc_slider_default_height_apply_all";b:1;s:33:"tc_slider_change_default_img_size";b:0;s:22:"tc_show_featured_pages";i:1;s:26:"tc_show_featured_pages_img";b:1;s:28:"tc_featured_page_button_text";s:17:"Read more &raquo;";s:20:"tc_featured_page_one";N;s:20:"tc_featured_page_two";N;s:22:"tc_featured_page_three";N;s:20:"tc_featured_text_one";N;s:20:"tc_featured_text_two";N;s:22:"tc_featured_text_three";N;s:24:"tc_sidebar_global_layout";s:1:"l";s:23:"tc_sidebar_force_layout";b:0;s:22:"tc_sidebar_post_layout";s:1:"l";s:19:"tc_post_list_length";s:7:"excerpt";s:22:"tc_sidebar_page_layout";s:1:"l";s:22:"tc_comment_show_bubble";b:1;s:23:"tc_comment_bubble_shape";s:7:"default";s:28:"tc_comment_bubble_color_type";s:4:"skin";s:23:"tc_comment_bubble_color";s:7:"#27CDA5";s:16:"tc_page_comments";b:0;s:16:"tc_post_comments";b:1;s:20:"tc_show_comment_list";b:1;s:13:"tc_breadcrumb";b:1;s:23:"tc_show_breadcrumb_home";b:0;s:27:"tc_show_breadcrumb_in_pages";b:1;s:34:"tc_show_breadcrumb_in_single_posts";b:1;s:32:"tc_show_breadcrumb_in_post_lists";b:1;s:18:"tc_show_post_metas";b:1;s:20:"tc_post_metas_design";s:10:"no-buttons";s:23:"tc_show_post_metas_home";b:0;s:30:"tc_show_post_metas_single_post";b:1;s:29:"tc_show_post_metas_post_lists";b:1;s:29:"tc_show_post_metas_categories";b:1;s:23:"tc_show_post_metas_tags";b:1;s:35:"tc_show_post_metas_publication_date";b:1;s:25:"tc_show_post_metas_author";b:1;s:30:"tc_show_post_metas_update_date";b:0;s:32:"tc_post_metas_update_date_format";s:4:"days";s:36:"tc_post_metas_update_notice_in_title";b:0;s:36:"tc_post_metas_update_notice_interval";i:10;s:32:"tc_post_metas_update_notice_text";s:18:"Recently updated !";s:34:"tc_post_metas_update_notice_format";s:13:"label-default";s:27:"tc_post_list_excerpt_length";i:50;s:23:"tc_post_list_show_thumb";b:1;s:36:"tc_post_list_use_attachment_as_thumb";b:1;s:26:"tc_post_list_default_thumb";N;s:24:"tc_post_list_thumb_shape";s:7:"rounded";s:25:"tc_post_list_thumb_height";i:250;s:27:"tc_post_list_thumb_position";s:5:"right";s:28:"tc_post_list_thumb_alternate";b:1;s:12:"tc_cat_title";s:0:"";s:12:"tc_tag_title";s:0:"";s:15:"tc_author_title";s:0:"";s:15:"tc_search_title";s:20:"Search Results for :";s:17:"tc_post_list_grid";s:4:"grid";s:15:"tc_grid_columns";s:1:"3";s:23:"tc_grid_expand_featured";b:1;s:15:"tc_grid_in_blog";b:1;s:18:"tc_grid_in_archive";b:1;s:17:"tc_grid_in_search";b:1;s:14:"tc_grid_shadow";b:1;s:21:"tc_grid_bottom_border";b:1;s:13:"tc_grid_icons";b:1;s:17:"tc_grid_num_words";i:10;s:20:"tc_grid_thumb_height";i:350;s:29:"tc_single_post_thumb_location";s:4:"hide";s:27:"tc_single_post_thumb_height";i:250;s:17:"tc_enable_gallery";b:1;s:19:"tc_gallery_fancybox";b:1;s:16:"tc_gallery_style";b:1;s:17:"tc_enable_dropcap";b:0;s:19:"tc_dropcap_minwords";i:50;s:17:"tc_dropcap_design";s:11:"skin-shadow";s:15:"tc_post_dropcap";b:0;s:15:"tc_page_dropcap";b:0;s:23:"tc_show_post_navigation";b:1;s:28:"tc_show_post_navigation_page";b:0;s:30:"tc_show_post_navigation_single";b:1;s:31:"tc_show_post_navigation_archive";b:1;s:25:"tc_social_in_left-sidebar";b:0;s:26:"tc_social_in_right-sidebar";b:0;s:26:"tc_social_in_sidebar_title";s:12:"Social links";s:19:"tc_social_in_footer";b:1;s:16:"tc_sticky_footer";b:1;s:19:"tc_show_back_to_top";b:1;s:13:"tc_custom_css";N;s:16:"tc_minified_skin";b:1;s:17:"tc_img_smart_load";b:0;s:21:"tc_display_front_help";b:1;s:3:"ver";s:6:"3.4.11";}}', 'yes'),
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
(216, 'theme_mods_listify', 'a:18:{i:0;b:0;s:16:"header_textcolor";s:5:"blank";s:12:"header_image";s:66:"http:localhost/wp-content/uploads/2015/10/babyhallo-text-white.png";s:23:"color-header-background";s:7:"#3396d1";s:8:"nav-cart";b:0;s:10:"nav-search";b:0;s:16:"background_color";s:6:"ffffff";s:12:"color-scheme";s:7:"Default";s:21:"color-navigation-text";s:7:"#ffffff";s:10:"color-link";s:7:"#3396d1";s:13:"color-primary";s:7:"#77c04b";s:12:"color-accent";s:7:"#3396d1";s:23:"color-footer-background";s:7:"#22262c";s:17:"header_image_data";O:8:"stdClass":5:{s:13:"attachment_id";i:867;s:3:"url";s:66:"http:localhost/wp-content/uploads/2015/10/babyhallo-text-white.png";s:13:"thumbnail_url";s:66:"http:localhost/wp-content/uploads/2015/10/babyhallo-text-white.png";s:6:"height";i:20;s:5:"width";i:101;}s:18:"nav_menu_locations";a:2:{s:7:"primary";i:5;s:9:"secondary";i:0;}s:22:"call-to-action-display";b:1;s:12:"footer-style";s:4:"dark";s:16:"sidebars_widgets";a:2:{s:4:"time";i:1444901137;s:4:"data";a:11:{s:19:"wp_inactive_widgets";a:0:{}s:21:"widget-area-sidebar-1";a:0:{}s:16:"widget-area-home";a:0:{}s:20:"widget-area-footer-1";a:0:{}s:20:"widget-area-footer-2";a:0:{}s:20:"widget-area-footer-3";a:0:{}s:27:"widget-area-sidebar-product";a:0:{}s:24:"widget-area-sidebar-shop";a:0:{}s:19:"archive-job_listing";a:0:{}s:30:"single-job_listing-widget-area";a:0:{}s:18:"single-job_listing";a:0:{}}}}', 'yes'),
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
(271, 'woocommerce_specific_allowed_countries', 'a:0:{}', 'yes'),
(272, 'woocommerce_default_customer_address', '', 'yes'),
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
(318, 'woocommerce_enable_coupons', 'no', 'no'),
(319, 'woocommerce_calc_discounts_sequentially', 'no', 'no'),
(320, 'woocommerce_enable_guest_checkout', 'yes', 'no'),
(321, 'woocommerce_force_ssl_checkout', 'no', 'yes'),
(322, 'woocommerce_unforce_ssl_checkout', 'no', 'yes'),
(323, 'woocommerce_cart_page_id', '24', 'yes'),
(324, 'woocommerce_checkout_page_id', '24', 'yes'),
(325, 'woocommerce_terms_page_id', '', 'no'),
(326, 'woocommerce_checkout_pay_endpoint', 'order-pay', 'yes'),
(327, 'woocommerce_checkout_order_received_endpoint', 'order-received', 'yes'),
(328, 'woocommerce_myaccount_add_payment_method_endpoint', 'add-payment-method', 'yes') ;
INSERT INTO `wp_options` ( `option_id`, `option_name`, `option_value`, `autoload`) VALUES
(329, 'woocommerce_calc_shipping', 'no', 'yes'),
(330, 'woocommerce_enable_shipping_calc', 'yes', 'no'),
(331, 'woocommerce_shipping_cost_requires_address', 'no', 'no'),
(332, 'woocommerce_shipping_method_format', '', 'no'),
(333, 'woocommerce_ship_to_destination', 'billing', 'no'),
(334, 'woocommerce_ship_to_countries', '', 'yes'),
(335, 'woocommerce_specific_ship_to_countries', '', 'yes'),
(336, 'woocommerce_myaccount_page_id', '25', 'yes'),
(337, 'woocommerce_myaccount_view_order_endpoint', 'view-order', 'yes'),
(338, 'woocommerce_myaccount_edit_account_endpoint', 'edit-account', 'yes'),
(339, 'woocommerce_myaccount_edit_address_endpoint', 'edit-address', 'yes'),
(340, 'woocommerce_myaccount_lost_password_endpoint', 'lost-password', 'yes'),
(341, 'woocommerce_logout_endpoint', 'customer-logout', 'yes'),
(342, 'woocommerce_enable_signup_and_login_from_checkout', 'yes', 'no'),
(343, 'woocommerce_enable_myaccount_registration', 'no', 'no'),
(344, 'woocommerce_enable_checkout_login_reminder', 'yes', 'no'),
(345, 'woocommerce_registration_generate_username', 'no', 'no'),
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
(388, 'job_manager_hide_filled_positions', '', 'yes'),
(389, 'job_manager_hide_expired_content', '1', 'yes'),
(390, 'job_manager_enable_default_category_multiselect', '', 'yes'),
(391, 'job_manager_category_filter_type', 'any', 'yes'),
(392, 'job_manager_regions_filter', '', 'yes'),
(393, 'job_manager_user_requires_account', '1', 'yes'),
(394, 'job_manager_enable_registration', '1', 'yes'),
(395, 'job_manager_generate_username_from_email', '', 'yes'),
(396, 'job_manager_registration_role', 'author', 'yes'),
(397, 'job_manager_submission_requires_approval', '1', 'yes'),
(398, 'job_manager_user_can_edit_pending_submissions', '', 'yes'),
(399, 'job_manager_submission_duration', '', 'yes'),
(400, 'job_manager_allowed_application_method', 'email', 'yes'),
(401, 'job_manager_submit_job_form_page_id', '32', 'yes'),
(402, 'job_manager_job_dashboard_page_id', '37', 'yes'),
(403, 'job_manager_jobs_page_id', '', 'yes'),
(404, 'woocommerce_meta_box_errors', 'a:0:{}', 'yes'),
(405, 'jetpack_unique_connection', 'a:1:{s:12:"disconnected";i:1;}', 'yes'),
(408, 'widget_listify_widget_panel_listing_auhtor', 'a:3:{i:1;a:0:{}i:2;a:2:{s:10:"descriptor";s:13:"Listing Owner";s:9:"biography";s:1:"1";}s:12:"_multiwidget";i:1;}', 'yes'),
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
(499, 'facetwp_settings', '{"facets":[{"label":"Categories","name":"categories","type":"checkboxes","source":"tax\\/category","parent_term":"","orderby":"count","operator":"and","hierarchical":"no","ghosts":"no","preserve_ghosts":"no","count":"10"},{"label":"location","name":"location","type":"search","search_engine":"","placeholder":""}],"templates":[{"label":"Default","name":"default","query":"<?php\\nreturn array(\\n    \'post_type\' => \'any\',\\n    \'posts_per_page\' => 15,\\n);","template":"<?php while ( have_posts() ) : the_post(); ?>\\n    <div><a href=\\"<?php the_permalink(); ?>\\"><?php the_title(); ?><\\/a><\\/div>\\n<?php endwhile; ?>"},{"label":"default_hidden","name":"default_hidden","query":"<?php\\nreturn array(\\n\'post_type\' => \'post\',\\n\'post_status\' => \'publish\',\\n\'posts_per_page\' => 5,\\n);","template":""},{"label":"listings","name":"listings","query":"<?php\\nreturn array(\\n\'post_type\' => \'post\',\\n\'post_status\' => \'publish\',\\n\'posts_per_page\' => 5,\\n);","template":""}],"settings":{"permalink_type":"get","thousands_separator":",","decimal_separator":"."}}', 'yes'),
(500, 'facetwp_version', '2.2.6', 'yes'),
(504, 'facetwp_activation', '{"status":"success","message":"All done, thanks for activating!","expiration":"2016-10-15 08:16:41"}', 'yes'),
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
(520, 'jmfe_field_dump', '0', 'yes'),
(521, 'wp-job-manager-field-editor_instance', 'B1aV5lLMgQDS', 'yes') ;
INSERT INTO `wp_options` ( `option_id`, `option_name`, `option_value`, `autoload`) VALUES
(551, 'theme_mods_listify-child', 'a:12:{i:0;b:0;s:32:"listing-archive-facetwp-defaults";s:25:"keyword,location,category";s:11:"region-bias";s:2:"GB";s:8:"nav-cart";b:0;s:10:"nav-search";b:0;s:12:"nav-megamenu";s:4:"none";s:14:"label-singular";s:7:"Midwife";s:12:"label-plural";s:8:"Midwives";s:22:"listing-archive-output";s:7:"results";s:29:"listing-archive-display-style";s:4:"list";s:18:"nav_menu_locations";a:3:{s:7:"primary";i:5;s:9:"secondary";i:29;s:8:"tertiary";i:30;}s:26:"call-to-action-button-href";s:9:"/register";}', 'yes'),
(571, 'wp-job-manager-field-editor_licence_key', '561F-6559-380B-E', 'yes'),
(572, 'wp-job-manager-field-editor_email', 'nick.j.goodall@gmail.com', 'yes'),
(604, 'job_manager_form_contact', '865', 'yes'),
(605, 'job_manager_form_claim', '0', 'yes'),
(610, 'widget_jmfe_widget', 'a:6:{i:1;a:0:{}i:2;a:16:{s:5:"title";s:9:"Biography";s:17:"output_show_label";s:1:"0";s:13:"widget_styles";s:1:"1";s:8:"meta_key";s:6:"bh_bio";s:9:"output_as";s:4:"text";s:13:"extra_classes";s:0:"";s:7:"caption";s:0:"";s:20:"output_oembed_height";s:0:"";s:19:"output_oembed_width";s:0:"";s:17:"output_check_true";s:0:"";s:18:"output_check_false";s:0:"";s:20:"output_video_allowdl";s:1:"1";s:10:"image_link";s:1:"1";s:19:"output_video_poster";s:0:"";s:18:"output_video_width";s:0:"";s:19:"output_video_height";s:0:"";}i:3;a:16:{s:5:"title";s:9:"Insurance";s:17:"output_show_label";s:1:"0";s:13:"widget_styles";s:1:"1";s:8:"meta_key";s:12:"bh_insurance";s:9:"output_as";s:4:"text";s:13:"extra_classes";s:0:"";s:7:"caption";s:0:"";s:20:"output_oembed_height";s:0:"";s:19:"output_oembed_width";s:0:"";s:17:"output_check_true";s:0:"";s:18:"output_check_false";s:0:"";s:20:"output_video_allowdl";s:1:"1";s:10:"image_link";s:1:"1";s:19:"output_video_poster";s:0:"";s:18:"output_video_width";s:0:"";s:19:"output_video_height";s:0:"";}i:4;a:16:{s:5:"title";s:8:"Services";s:17:"output_show_label";s:1:"0";s:13:"widget_styles";s:1:"1";s:8:"meta_key";s:11:"bh_services";s:9:"output_as";s:4:"text";s:13:"extra_classes";s:0:"";s:7:"caption";s:0:"";s:20:"output_oembed_height";s:0:"";s:19:"output_oembed_width";s:0:"";s:17:"output_check_true";s:0:"";s:18:"output_check_false";s:0:"";s:20:"output_video_allowdl";s:1:"1";s:10:"image_link";s:1:"1";s:19:"output_video_poster";s:0:"";s:18:"output_video_width";s:0:"";s:19:"output_video_height";s:0:"";}i:5;a:16:{s:5:"title";s:27:"Qualifications / Experience";s:17:"output_show_label";s:1:"0";s:13:"widget_styles";s:1:"1";s:8:"meta_key";s:13:"bh_experience";s:9:"output_as";s:4:"text";s:13:"extra_classes";s:0:"";s:7:"caption";s:0:"";s:20:"output_oembed_height";s:0:"";s:19:"output_oembed_width";s:0:"";s:17:"output_check_true";s:0:"";s:18:"output_check_false";s:0:"";s:20:"output_video_allowdl";s:1:"1";s:10:"image_link";s:1:"1";s:19:"output_video_poster";s:0:"";s:18:"output_video_width";s:0:"";s:19:"output_video_height";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(624, 'wpjmel_enable_city_suggest', '1', 'yes'),
(625, 'wpjmel_enable_map', '1', 'yes'),
(626, 'wpjmel_map_start_location', '', 'yes'),
(627, 'wp-job-manager-extended-location', '', 'yes'),
(638, 'facetwp_license', 'a71c5ef20388e01b7a40863fbe6dae4c', 'yes'),
(661, 'facetwp_transients', '', 'yes'),
(694, 'job_listing_region_children', 'a:0:{}', 'yes'),
(707, 'wpjmel_start_geo_lat', '40.712784', 'yes'),
(708, 'wpjmel_start_geo_long', '-74.005941', 'yes'),
(840, 'job_listing_category_children', 'a:0:{}', 'yes'),
(883, 'avatar_default_wp_user_avatar', '', 'yes'),
(884, 'wp_user_avatar_allow_upload', '1', 'yes'),
(885, 'wp_user_avatar_disable_gravatar', '0', 'yes'),
(886, 'wp_user_avatar_edit_avatar', '1', 'yes'),
(887, 'wp_user_avatar_resize_crop', '0', 'yes'),
(888, 'wp_user_avatar_resize_h', '96', 'yes'),
(889, 'wp_user_avatar_resize_upload', '0', 'yes'),
(890, 'wp_user_avatar_resize_w', '96', 'yes'),
(891, 'wp_user_avatar_tinymce', '1', 'yes'),
(892, 'wp_user_avatar_upload_size_limit', '2097152', 'yes'),
(893, 'wp_user_avatar_default_avatar_updated', '1', 'yes'),
(894, 'wp_user_avatar_users_updated', '1', 'yes'),
(895, 'wp_user_avatar_media_updated', '1', 'yes'),
(898, 'widget_wp_user_avatar_profile', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(910, 'nav_menu_options', 'a:1:{s:8:"auto_add";a:0:{}}', 'yes'),
(963, 'wc_bookings_version', '1.7.13', 'yes'),
(968, 'wpjmp_select_products_text', 'Select Your Services & Products', 'yes'),
(969, 'wpjmp_listing_products_text', 'Listing products', 'yes'),
(970, 'wp-job-manager-products', '6477c40a5b3ad8a669f635a079365d01', 'yes'),
(971, 'widget_listify_widget_panel_listing_bookings', 'a:2:{i:2;a:2:{s:5:"title";s:19:"Book an Appointment";s:4:"icon";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(990, 'account_page_options', '', 'yes'),
(991, 'account_endpoint_options', '', 'yes'),
(992, 'account_registration_options', '', 'yes'),
(1003, 'wpjmp_products_limit', 'own', 'yes'),
(1006, 'widget_listify_widget_panel_listing_products_main', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(1007, 'widget_listify_widget_panel_listing_products', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(1008, 'widget_product_vendors', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(1040, 'general_options', '', 'yes'),
(1041, 'pricing_options', '', 'yes'),
(1042, 'product_vendors_options', '', 'yes'),
(1043, 'woocommerce_product_vendors_hide_vendor_products', 'yes', 'yes'),
(1044, 'woocommerce_product_vendors_skip_review', 'no', 'yes'),
(1045, 'woocommerce_product_vendors_base_commission', '50', 'yes'),
(1046, 'woocommerce_product_vendors_include_coupons', 'no', 'yes'),
(1085, 'shop_vendor_26', 'a:3:{s:6:"admins";a:1:{i:0;s:1:"4";}s:10:"commission";s:2:"50";s:12:"paypal_email";s:0:"";}', 'yes'),
(1133, 'ab_data_loaded', '1', 'yes'),
(1134, 'ab_db_version', '7.6.1', 'yes'),
(1135, 'ab_installation_time', '1445337889', 'yes'),
(1136, 'ab_settings_company_name', '', 'yes'),
(1137, 'ab_settings_company_logo', '', 'yes'),
(1138, 'ab_settings_company_logo_path', '', 'yes'),
(1139, 'ab_settings_company_logo_url', '', 'yes'),
(1140, 'ab_settings_company_address', '', 'yes'),
(1141, 'ab_settings_company_phone', '', 'yes'),
(1142, 'ab_settings_company_website', '', 'yes'),
(1143, 'ab_settings_pay_locally', '1', 'yes'),
(1144, 'ab_settings_sender_name', 'babyhallo', 'yes'),
(1145, 'ab_settings_sender_email', 'nick.j.goodall@gmail.com', 'yes'),
(1146, 'ab_settings_time_slot_length', '15', 'yes'),
(1147, 'ab_settings_minimum_time_prior_booking', '0', 'yes'),
(1148, 'ab_settings_maximum_available_days_for_booking', '365', 'yes'),
(1149, 'ab_settings_use_client_time_zone', '0', 'yes'),
(1150, 'ab_settings_create_account', '0', 'yes'),
(1151, 'ab_settings_coupons', '0', 'yes'),
(1152, 'ab_settings_google_client_id', '', 'yes'),
(1153, 'ab_settings_google_client_secret', '', 'yes'),
(1154, 'ab_settings_google_two_way_sync', '1', 'yes'),
(1155, 'ab_settings_google_limit_events', '50', 'yes'),
(1156, 'ab_settings_google_event_title', '[[SERVICE_NAME]]', 'yes'),
(1157, 'ab_settings_final_step_url', '', 'yes'),
(1158, 'ab_settings_allow_staff_members_edit_profile', '1', 'yes'),
(1159, 'ab_settings_link_assets_method', 'enqueue', 'yes'),
(1160, 'ab_settings_phone_default_country', 'auto', 'yes'),
(1161, 'ab_settings_monday_start', '08:00', 'yes'),
(1162, 'ab_settings_monday_end', '18:00', 'yes'),
(1163, 'ab_settings_tuesday_start', '08:00', 'yes'),
(1164, 'ab_settings_tuesday_end', '18:00', 'yes'),
(1165, 'ab_settings_wednesday_start', '08:00', 'yes'),
(1166, 'ab_settings_wednesday_end', '18:00', 'yes'),
(1167, 'ab_settings_thursday_start', '08:00', 'yes'),
(1168, 'ab_settings_thursday_end', '18:00', 'yes'),
(1169, 'ab_settings_friday_start', '08:00', 'yes'),
(1170, 'ab_settings_friday_end', '18:00', 'yes'),
(1171, 'ab_settings_saturday_start', '', 'yes'),
(1172, 'ab_settings_saturday_end', '', 'yes'),
(1173, 'ab_settings_sunday_start', '', 'yes'),
(1174, 'ab_settings_sunday_end', '', 'yes'),
(1175, 'ab_settings_cancel_page_url', 'http:localhost', 'yes'),
(1176, 'ab_appearance_text_info_first_step', 'Please select service: ', 'yes'),
(1177, 'ab_appearance_text_info_second_step', 'Below you can find a list of available time slots for [[SERVICE_NAME]] by [[STAFF_NAME]].\nClick on a time slot to proceed with booking.', 'yes'),
(1178, 'ab_appearance_text_info_third_step', 'You selected a booking for [[SERVICE_NAME]] by [[STAFF_NAME]] at [[SERVICE_TIME]] on [[SERVICE_DATE]]. The price for the service is [[SERVICE_PRICE]].\nPlease provide your details in the form below to proceed with booking.', 'yes'),
(1179, 'ab_appearance_text_info_third_step_guest', '', 'yes'),
(1180, 'ab_appearance_text_info_fourth_step', 'Please tell us how you would like to pay: ', 'yes'),
(1181, 'ab_appearance_text_info_fifth_step', 'Thank you! Your booking is complete. An email with details of your booking has been sent to you.', 'yes') ;
INSERT INTO `wp_options` ( `option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1182, 'ab_appearance_text_info_coupon', 'The price for the service is [[SERVICE_PRICE]].', 'yes'),
(1183, 'ab_appearance_color', '#f4662f', 'yes'),
(1184, 'ab_appearance_text_step_service', 'Service', 'yes'),
(1185, 'ab_appearance_text_step_time', 'Time', 'yes'),
(1186, 'ab_appearance_text_step_details', 'Details', 'yes'),
(1187, 'ab_appearance_text_step_payment', 'Payment', 'yes'),
(1188, 'ab_appearance_text_step_done', 'Done', 'yes'),
(1189, 'ab_appearance_text_label_category', 'Category', 'yes'),
(1190, 'ab_appearance_text_label_service', 'Service', 'yes'),
(1191, 'ab_appearance_text_label_employee', 'Employee', 'yes'),
(1192, 'ab_appearance_text_label_select_date', 'I\'m available on or after', 'yes'),
(1193, 'ab_appearance_text_label_start_from', 'Start from', 'yes'),
(1194, 'ab_appearance_text_label_finish_by', 'Finish by', 'yes'),
(1195, 'ab_appearance_text_label_name', 'Name', 'yes'),
(1196, 'ab_appearance_text_label_phone', 'Phone', 'yes'),
(1197, 'ab_appearance_text_label_email', 'Email', 'yes'),
(1198, 'ab_appearance_text_label_coupon', 'Coupon', 'yes'),
(1199, 'ab_appearance_text_label_pay_locally', 'I will pay locally', 'yes'),
(1200, 'ab_appearance_text_label_number_of_persons', 'Number of persons', 'yes'),
(1201, 'ab_appearance_text_option_service', 'Select service', 'yes'),
(1202, 'ab_appearance_text_option_category', 'Select category', 'yes'),
(1203, 'ab_appearance_text_option_employee', 'Any', 'yes'),
(1204, 'ab_appearance_show_progress_tracker', '1', 'yes'),
(1205, 'ab_appearance_show_blocked_timeslots', '0', 'yes'),
(1206, 'ab_appearance_show_day_one_column', '0', 'yes'),
(1207, 'ab_appearance_show_calendar', '0', 'yes'),
(1208, 'ab_envato_purchase_code', '', 'yes'),
(1209, 'ab_paypal_api_username', '', 'yes'),
(1210, 'ab_paypal_api_password', '', 'yes'),
(1211, 'ab_paypal_api_signature', '', 'yes'),
(1212, 'ab_paypal_ec_mode', '', 'yes'),
(1213, 'ab_paypal_type', 'disabled', 'yes'),
(1214, 'ab_paypal_id', '', 'yes'),
(1215, 'ab_paypal_currency', 'USD', 'yes'),
(1216, 'ab_authorizenet_api_login_id', '', 'yes'),
(1217, 'ab_authorizenet_transaction_key', '', 'yes'),
(1218, 'ab_authorizenet_sandbox', '0', 'yes'),
(1219, 'ab_authorizenet_type', 'disabled', 'yes'),
(1220, 'ab_stripe', '0', 'yes'),
(1221, 'ab_stripe_secret_key', '', 'yes'),
(1222, 'ab_custom_fields', '[{"type":"textarea","label":"Notes","required":false,"id":1}]', 'yes'),
(1223, 'ab_woocommerce', '0', 'yes'),
(1224, 'ab_woocommerce_product', '', 'yes'),
(1225, 'ab_woocommerce_cart_info_name', 'Appointment', 'yes'),
(1226, 'ab_woocommerce_cart_info_value', 'Date: [[APPOINTMENT_DATE]]\nTime: [[APPOINTMENT_TIME]]\nService: [[SERVICE_NAME]]', 'yes'),
(1227, 'ab_sms_token', '', 'yes'),
(1228, 'ab_sms_username', '', 'yes'),
(1229, 'ab_sms_administrator_phone', '', 'yes'),
(1230, 'ab_sms_default_country_code', '', 'yes'),
(1231, 'ab_email_content_type', 'html', 'yes'),
(1232, 'ab_email_notification_reply_to_customers', '1', 'yes'),
(1235, 'external_updates-bookly-responsive-appointment-booking-tool', 'O:8:"stdClass":3:{s:9:"lastCheck";i:1445337890;s:14:"checkedVersion";s:5:"7.6.1";s:6:"update";N;}', 'yes'),
(1246, 'wp-job-manager-products_status', 'valid', 'yes'),
(1310, 'woocommerce_cheque_settings', 'a:4:{s:7:"enabled";s:2:"no";s:5:"title";s:14:"Cheque Payment";s:11:"description";s:102:"Please send your cheque to Store Name, Store Street, Store Town, Store State / County, Store Postcode.";s:12:"instructions";s:102:"Please send your cheque to Store Name, Store Street, Store Town, Store State / County, Store Postcode.";}', 'yes'),
(1312, 'woocommerce_paypal_settings', 'a:18:{s:7:"enabled";s:2:"no";s:5:"title";s:6:"PayPal";s:11:"description";s:85:"Pay via PayPal; you can pay with your credit card if you don\'t have a PayPal account.";s:5:"email";s:24:"nick.j.goodall@gmail.com";s:8:"testmode";s:2:"no";s:5:"debug";s:2:"no";s:8:"advanced";s:0:"";s:14:"receiver_email";s:24:"nick.j.goodall@gmail.com";s:14:"identity_token";s:0:"";s:14:"invoice_prefix";s:3:"WC-";s:13:"send_shipping";s:2:"no";s:16:"address_override";s:2:"no";s:13:"paymentaction";s:4:"sale";s:10:"page_style";s:0:"";s:11:"api_details";s:0:"";s:12:"api_username";s:0:"";s:12:"api_password";s:0:"";s:13:"api_signature";s:0:"";}', 'yes'),
(1358, 'checkout_process_options', '', 'yes'),
(1359, 'checkout_page_options', '', 'yes'),
(1360, 'checkout_endpoint_options', '', 'yes'),
(1361, 'payment_gateways_options', '', 'yes'),
(1362, 'woocommerce_default_gateway', '', 'yes'),
(1363, 'woocommerce_gateway_order', 'a:5:{s:4:"bacs";i:0;s:6:"cheque";i:1;s:3:"cod";i:2;s:6:"paypal";i:3;s:18:"wc-booking-gateway";i:4;}', 'yes'),
(1428, 'product_shipping_class_children', 'a:0:{}', 'yes'),
(1451, 'shop_vendor_27', 'a:3:{s:12:"paypal_email";s:11:"j@gmail.com";s:10:"commission";s:2:"50";s:6:"admins";a:1:{i:0;i:5;}}', 'yes'),
(1452, 'shop_vendor_28', 'a:3:{s:12:"paypal_email";s:8:"c@ga.com";s:10:"commission";s:2:"50";s:6:"admins";a:1:{i:0;i:6;}}', 'yes'),
(1463, 'shop_vendor_31', 'a:3:{s:12:"paypal_email";s:7:"d@g.com";s:10:"commission";s:2:"50";s:6:"admins";a:1:{i:0;i:7;}}', 'yes'),
(1464, 'shop_vendor_32', 'a:3:{s:12:"paypal_email";s:7:"l@g.com";s:10:"commission";s:2:"50";s:6:"admins";a:1:{i:0;i:8;}}', 'yes'),
(1470, 'shop_vendor_33', 'a:3:{s:12:"paypal_email";s:9:"sd@df.com";s:10:"commission";s:2:"50";s:6:"admins";a:1:{i:0;i:9;}}', 'yes'),
(1471, 'shop_vendor_34', 'a:3:{s:12:"paypal_email";s:11:"asd@asd.com";s:10:"commission";s:2:"50";s:6:"admins";a:1:{i:0;i:10;}}', 'yes'),
(1510, 'shop_vendor_35', 'a:3:{s:12:"paypal_email";s:10:"asd@ca.com";s:10:"commission";s:2:"50";s:6:"admins";a:1:{i:0;i:14;}}', 'yes'),
(1568, 'product_cat_children', 'a:0:{}', 'yes') ;

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
) ENGINE=InnoDB AUTO_INCREMENT=2346 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


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
(24, 11, '_edit_lock', '1444922772:1'),
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
(106, 818, '_menu_item_type', 'custom'),
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
(170, 826, '_menu_item_type', 'custom'),
(171, 826, '_menu_item_menu_item_parent', '0'),
(172, 826, '_menu_item_object_id', '826'),
(173, 826, '_menu_item_object', 'custom'),
(174, 826, '_menu_item_target', ''),
(175, 826, '_menu_item_classes', 'a:1:{i:0;s:18:"ion-social-twitter";}'),
(176, 826, '_menu_item_xfn', ''),
(177, 826, '_menu_item_url', 'http://twitter.com/astoundify'),
(178, 827, '_menu_item_type', 'custom') ;
INSERT INTO `wp_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
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
(206, 830, '_menu_item_target', ''),
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
(326, 839, '_menu_item_type', 'custom'),
(327, 839, '_menu_item_menu_item_parent', '859'),
(328, 839, '_menu_item_object_id', '839'),
(329, 839, '_menu_item_object', 'custom'),
(330, 839, '_menu_item_target', ''),
(331, 839, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(332, 839, '_menu_item_xfn', ''),
(333, 839, '_menu_item_url', '/?page_id=25'),
(342, 841, '_menu_item_type', 'custom'),
(343, 841, '_menu_item_menu_item_parent', '0'),
(344, 841, '_menu_item_object_id', '841') ;
INSERT INTO `wp_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
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
(422, 851, '_menu_item_type', 'custom'),
(423, 851, '_menu_item_menu_item_parent', '859'),
(424, 851, '_menu_item_object_id', '851'),
(425, 851, '_menu_item_object', 'custom'),
(426, 851, '_menu_item_target', ''),
(427, 851, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(428, 851, '_menu_item_xfn', ''),
(429, 851, '_menu_item_url', '/?customer-logout=true'),
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
(484, 23, 'enable_tertiary_navigation', '0') ;
INSERT INTO `wp_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
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
(508, 61, '_wp_page_template', 'page-templates/template-single-column.php'),
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
(576, 6, '_edit_lock', '1444820683:1'),
(581, 865, '_form', '<p>Your Name (required)<br />\n    [text* your-name] </p>\n\n<p>Your Email (required)<br />\n    [email* your-email] </p>\n\n<p>Subject<br />\n    [text your-subject] </p>\n\n<p>Your Message<br />\n    [textarea your-message] </p>\n\n<p>[submit "Send"]</p>'),
(582, 865, '_mail', 'a:8:{s:7:"subject";s:14:"[your-subject]";s:6:"sender";s:38:"[your-name] <wordpress@104.155.17.199>";s:4:"body";s:161:"From: [your-name] <[your-email]>\nSubject: [your-subject]\n\nMessage Body:\n[your-message]\n\n--\nThis e-mail was sent from a contact form on babyhallo (http:localhost)";s:9:"recipient";s:24:"nick.j.goodall@gmail.com";s:18:"additional_headers";s:22:"Reply-To: [your-email]";s:11:"attachments";s:0:"";s:8:"use_html";i:0;s:13:"exclude_blank";i:0;}'),
(583, 865, '_mail_2', 'a:9:{s:6:"active";b:0;s:7:"subject";s:14:"[your-subject]";s:6:"sender";s:36:"babyhallo <wordpress@104.155.17.199>";s:4:"body";s:103:"Message Body:\n[your-message]\n\n--\nThis e-mail was sent from a contact form on babyhallo (http:localhost)";s:9:"recipient";s:12:"[your-email]";s:18:"additional_headers";s:34:"Reply-To: nick.j.goodall@gmail.com";s:11:"attachments";s:0:"";s:8:"use_html";i:0;s:13:"exclude_blank";i:0;}'),
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
(605, 32, '_edit_lock', '1445352632:1'),
(606, 37, '_edit_lock', '1445256265:1'),
(613, 874, 'status', 'disabled'),
(614, 874, 'admin_only', '0'),
(615, 874, 'multiple', '0'),
(616, 874, 'ajax', '0'),
(617, 874, 'required', '1'),
(618, 874, 'output_show_label', '0'),
(619, 874, 'populate_enable', '0') ;
INSERT INTO `wp_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(620, 874, 'populate_save', '0'),
(621, 874, 'option_default', '0'),
(622, 874, 'option_disabled', '0'),
(623, 874, 'packages_require', '0'),
(624, 874, 'image_link', '0'),
(625, 874, 'meta_key', 'job_description'),
(626, 874, 'priority', '5'),
(627, 874, 'type', 'wp-editor'),
(628, 874, 'label', 'Description'),
(629, 874, 'field_group', 'job'),
(630, 874, 'field_group_parent', ''),
(631, 874, 'origin', 'default'),
(632, 875, 'status', 'disabled'),
(633, 875, 'admin_only', '0'),
(634, 875, 'multiple', '1'),
(635, 875, 'ajax', '1'),
(636, 875, 'required', '0'),
(637, 875, 'output_show_label', '0'),
(638, 875, 'populate_enable', '0'),
(639, 875, 'populate_save', '0'),
(640, 875, 'option_default', '0'),
(641, 875, 'option_disabled', '0'),
(642, 875, 'packages_require', '0'),
(643, 875, 'image_link', '0'),
(644, 875, 'meta_key', 'gallery_images'),
(645, 875, 'priority', '4.999'),
(646, 875, 'type', 'file'),
(647, 875, 'label', 'Gallery Images'),
(648, 875, 'field_group', 'job'),
(649, 875, 'field_group_parent', ''),
(650, 875, 'origin', 'default'),
(651, 876, 'status', 'disabled'),
(652, 876, 'admin_only', '0'),
(653, 876, 'multiple', '0'),
(654, 876, 'ajax', '1'),
(655, 876, 'required', '0'),
(656, 876, 'output_show_label', '0'),
(657, 876, 'populate_enable', '0'),
(658, 876, 'populate_save', '0'),
(659, 876, 'option_default', '0'),
(660, 876, 'option_disabled', '0'),
(661, 876, 'packages_require', '0'),
(662, 876, 'image_link', '0'),
(663, 876, 'meta_key', 'featured_image'),
(664, 876, 'priority', '4.99'),
(665, 876, 'type', 'file'),
(666, 876, 'label', 'Cover Image'),
(667, 876, 'field_group', 'job'),
(668, 876, 'field_group_parent', ''),
(669, 876, 'origin', 'default'),
(670, 877, 'status', 'enabled'),
(671, 877, 'admin_only', '0'),
(672, 877, 'multiple', '0'),
(673, 877, 'ajax', '0'),
(674, 877, 'required', '0'),
(675, 877, 'output_show_label', '0'),
(676, 877, 'populate_enable', '0'),
(677, 877, 'populate_save', '0'),
(678, 877, 'option_default', '0'),
(679, 877, 'option_disabled', '0'),
(680, 877, 'packages_require', '0'),
(681, 877, 'image_link', '0'),
(682, 877, 'meta_key', 'job_hours'),
(683, 877, 'priority', '4.9'),
(684, 877, 'type', 'business-hours'),
(685, 877, 'label', 'Working Hours'),
(686, 877, 'field_group', 'job'),
(687, 877, 'field_group_parent', ''),
(688, 877, 'origin', 'default'),
(689, 878, 'status', 'enabled'),
(690, 878, 'admin_only', '0'),
(691, 878, 'multiple', '0'),
(692, 878, 'ajax', '0'),
(693, 878, 'required', '1'),
(694, 878, 'output_show_label', '0'),
(695, 878, 'populate_enable', '1'),
(696, 878, 'populate_save', '1'),
(697, 878, 'option_default', '0'),
(698, 878, 'option_disabled', '0'),
(699, 878, 'packages_require', '0'),
(700, 878, 'image_link', '0'),
(701, 878, 'populate_meta_key', '_application'),
(702, 878, 'meta_key', 'application'),
(703, 878, 'priority', '2.5'),
(704, 878, 'placeholder', 'Enter an email address or website URL'),
(705, 878, 'type', 'text'),
(706, 878, 'label', 'Contact email/URL'),
(707, 878, 'field_group', 'job'),
(708, 878, 'field_group_parent', ''),
(709, 878, 'origin', 'default'),
(710, 879, 'status', 'disabled'),
(711, 879, 'admin_only', '0'),
(712, 879, 'multiple', '0'),
(713, 879, 'ajax', '0'),
(714, 879, 'required', '0'),
(715, 879, 'output_show_label', '0'),
(716, 879, 'populate_enable', '0'),
(717, 879, 'populate_save', '0'),
(718, 879, 'option_default', '0'),
(719, 879, 'option_disabled', '0') ;
INSERT INTO `wp_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(720, 879, 'packages_require', '0'),
(721, 879, 'image_link', '0'),
(722, 879, 'meta_key', 'job_region'),
(723, 879, 'default', '-1'),
(724, 879, 'priority', '2.5'),
(725, 879, 'taxonomy', 'job_listing_region'),
(726, 879, 'type', 'term-select'),
(727, 879, 'label', 'Listing Region'),
(728, 879, 'field_group', 'job'),
(729, 879, 'field_group_parent', ''),
(730, 879, 'origin', 'default'),
(731, 880, 'status', 'enabled'),
(732, 880, 'admin_only', '0'),
(733, 880, 'multiple', '0'),
(734, 880, 'ajax', '0'),
(735, 880, 'required', '0'),
(736, 880, 'output_show_label', '0'),
(737, 880, 'populate_enable', '0'),
(738, 880, 'populate_save', '0'),
(739, 880, 'option_default', '0'),
(740, 880, 'option_disabled', '0'),
(741, 880, 'packages_require', '0'),
(742, 880, 'image_link', '0'),
(743, 880, 'meta_key', 'job_location'),
(744, 880, 'priority', '2'),
(745, 880, 'placeholder', 'e.g. "Nordend"'),
(746, 880, 'type', 'text'),
(747, 880, 'description', ''),
(748, 880, 'label', 'Location'),
(749, 880, 'field_group', 'job'),
(750, 880, 'field_group_parent', ''),
(751, 880, 'origin', 'default'),
(752, 881, 'status', 'enabled'),
(753, 881, 'admin_only', '0'),
(754, 881, 'multiple', '0'),
(755, 881, 'ajax', '0'),
(756, 881, 'required', '1'),
(757, 881, 'output_show_label', '0'),
(758, 881, 'populate_enable', '0'),
(759, 881, 'populate_save', '0'),
(760, 881, 'option_default', '0'),
(761, 881, 'option_disabled', '0'),
(762, 881, 'packages_require', '0'),
(763, 881, 'image_link', '0'),
(764, 881, 'meta_key', 'job_title'),
(765, 881, 'type', 'text'),
(766, 881, 'default', ''),
(767, 881, 'taxonomy', ''),
(768, 881, 'label', 'Name'),
(769, 881, 'description', ''),
(770, 881, 'placeholder', 'Name'),
(771, 881, 'priority', '1'),
(772, 881, 'maxlength', ''),
(773, 881, 'output', 'none'),
(774, 881, 'output_as', 'text'),
(775, 881, 'output_oembed_width', ''),
(776, 881, 'output_oembed_height', ''),
(777, 881, 'output_video_poster', ''),
(778, 881, 'output_video_height', ''),
(779, 881, 'output_video_width', ''),
(780, 881, 'output_check_true', ''),
(781, 881, 'output_check_false', ''),
(782, 881, 'output_caption', ''),
(783, 881, 'output_classes', ''),
(784, 881, 'output_priority', ''),
(785, 881, 'populate_save_as', ''),
(786, 881, 'populate_default', ''),
(787, 881, 'populate_meta_key', ''),
(788, 881, 'field_group', 'job'),
(789, 881, 'field_group_parent', ''),
(790, 881, 'origin', 'default'),
(791, 881, 'options', 'a:0:{}'),
(792, 880, 'default', ''),
(793, 880, 'taxonomy', ''),
(794, 880, 'maxlength', ''),
(795, 880, 'output', 'none'),
(796, 880, 'output_as', 'text'),
(797, 880, 'output_oembed_width', ''),
(798, 880, 'output_oembed_height', ''),
(799, 880, 'output_video_poster', ''),
(800, 880, 'output_video_height', ''),
(801, 880, 'output_video_width', ''),
(802, 880, 'output_check_true', ''),
(803, 880, 'output_check_false', ''),
(804, 880, 'output_caption', ''),
(805, 880, 'output_classes', ''),
(806, 880, 'output_priority', ''),
(807, 880, 'populate_save_as', ''),
(808, 880, 'populate_default', ''),
(809, 880, 'populate_meta_key', ''),
(810, 880, 'options', 'a:0:{}'),
(811, 882, 'status', 'enabled'),
(812, 882, 'admin_only', '0'),
(813, 882, 'multiple', '0'),
(814, 882, 'ajax', '0'),
(815, 882, 'required', '0'),
(816, 882, 'output_show_label', '0'),
(817, 882, 'populate_enable', '0'),
(818, 882, 'populate_save', '0'),
(819, 882, 'option_default', '0') ;
INSERT INTO `wp_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(820, 882, 'option_disabled', '0'),
(821, 882, 'packages_require', '0'),
(822, 882, 'image_link', '0'),
(823, 882, 'meta_key', 'bh_bio'),
(824, 882, 'type', 'textarea'),
(825, 882, 'default', ''),
(827, 882, 'label', 'Biography'),
(828, 882, 'description', 'Please describe yourself for the parents'),
(829, 882, 'placeholder', ''),
(830, 882, 'priority', '4.1'),
(831, 882, 'maxlength', ''),
(832, 882, 'output', 'none'),
(833, 882, 'output_as', 'text'),
(834, 882, 'output_oembed_width', ''),
(835, 882, 'output_oembed_height', ''),
(836, 882, 'output_video_poster', ''),
(837, 882, 'output_video_height', ''),
(838, 882, 'output_video_width', ''),
(839, 882, 'output_check_true', ''),
(840, 882, 'output_check_false', ''),
(841, 882, 'output_caption', ''),
(842, 882, 'output_classes', ''),
(843, 882, 'output_priority', ''),
(844, 882, 'populate_save_as', ''),
(845, 882, 'populate_default', ''),
(846, 882, 'populate_meta_key', ''),
(847, 882, 'field_group', 'job'),
(848, 882, 'field_group_parent', ''),
(849, 882, 'origin', 'custom'),
(850, 882, 'options', 'a:0:{}'),
(851, 883, 'status', 'enabled'),
(852, 883, 'admin_only', '0'),
(853, 883, 'multiple', '0'),
(854, 883, 'ajax', '0'),
(855, 883, 'required', '0'),
(856, 883, 'output_show_label', '0'),
(857, 883, 'populate_enable', '0'),
(858, 883, 'populate_save', '0'),
(859, 883, 'option_default', '0'),
(860, 883, 'option_disabled', '0'),
(861, 883, 'packages_require', '0'),
(862, 883, 'image_link', '0'),
(863, 883, 'meta_key', 'bh_insurance'),
(864, 883, 'type', 'select'),
(865, 883, 'default', ''),
(867, 883, 'label', 'Insurance'),
(868, 883, 'description', ''),
(869, 883, 'placeholder', ''),
(870, 883, 'priority', '4.4'),
(871, 883, 'maxlength', ''),
(872, 883, 'output', 'none'),
(873, 883, 'output_as', 'text'),
(874, 883, 'output_oembed_width', ''),
(875, 883, 'output_oembed_height', ''),
(876, 883, 'output_video_poster', ''),
(877, 883, 'output_video_height', ''),
(878, 883, 'output_video_width', ''),
(879, 883, 'output_check_true', ''),
(880, 883, 'output_check_false', ''),
(881, 883, 'output_caption', ''),
(882, 883, 'output_classes', ''),
(883, 883, 'output_priority', ''),
(884, 883, 'populate_save_as', ''),
(885, 883, 'populate_default', ''),
(886, 883, 'populate_meta_key', ''),
(887, 883, 'field_group', 'job'),
(888, 883, 'field_group_parent', ''),
(889, 883, 'origin', 'custom'),
(890, 883, 'options', 'a:3:{s:6:"state*";s:5:"State";s:7:"private";s:7:"Private";s:12:"stateprivate";s:15:"State & Private";}'),
(891, 884, 'status', 'enabled'),
(892, 884, 'admin_only', '0'),
(893, 884, 'multiple', '0'),
(894, 884, 'ajax', '0'),
(895, 884, 'required', '1'),
(896, 884, 'output_show_label', '0'),
(897, 884, 'populate_enable', '0'),
(898, 884, 'populate_save', '0'),
(899, 884, 'option_default', '0'),
(900, 884, 'option_disabled', '0'),
(901, 884, 'packages_require', '0'),
(902, 884, 'image_link', '0'),
(903, 884, 'meta_key', 'bh_services'),
(904, 884, 'type', 'multiselect'),
(905, 884, 'default', ''),
(907, 884, 'label', 'Services'),
(908, 884, 'description', ''),
(909, 884, 'placeholder', ''),
(910, 884, 'priority', '4.3'),
(911, 884, 'maxlength', ''),
(912, 884, 'output', 'none'),
(913, 884, 'output_as', 'text'),
(914, 884, 'output_oembed_width', ''),
(915, 884, 'output_oembed_height', ''),
(916, 884, 'output_video_poster', ''),
(917, 884, 'output_video_height', ''),
(918, 884, 'output_video_width', ''),
(919, 884, 'output_check_true', ''),
(920, 884, 'output_check_false', ''),
(921, 884, 'output_caption', ''),
(922, 884, 'output_classes', '') ;
INSERT INTO `wp_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(923, 884, 'output_priority', ''),
(924, 884, 'populate_save_as', ''),
(925, 884, 'populate_default', ''),
(926, 884, 'populate_meta_key', '_bh_services'),
(927, 884, 'field_group', 'job'),
(928, 884, 'field_group_parent', ''),
(929, 884, 'origin', 'custom'),
(930, 884, 'options', 'a:1:{s:9:"attending";s:12:"Attend Birth";}'),
(931, 885, 'status', 'enabled'),
(932, 885, 'admin_only', '0'),
(933, 885, 'multiple', '0'),
(934, 885, 'ajax', '0'),
(935, 885, 'required', '0'),
(936, 885, 'output_show_label', '0'),
(937, 885, 'populate_enable', '0'),
(938, 885, 'populate_save', '0'),
(939, 885, 'option_default', '0'),
(940, 885, 'option_disabled', '0'),
(941, 885, 'packages_require', '0'),
(942, 885, 'image_link', '0'),
(943, 885, 'meta_key', 'bh_experience'),
(944, 885, 'type', 'textarea'),
(945, 885, 'default', ''),
(947, 885, 'label', 'Qualifications/Experience'),
(948, 885, 'description', 'Please let the parents know about your professional experience and qualifications'),
(949, 885, 'placeholder', ''),
(950, 885, 'priority', '4.2'),
(951, 885, 'maxlength', ''),
(952, 885, 'output', 'none'),
(953, 885, 'output_as', 'text'),
(954, 885, 'output_oembed_width', ''),
(955, 885, 'output_oembed_height', ''),
(956, 885, 'output_video_poster', ''),
(957, 885, 'output_video_height', ''),
(958, 885, 'output_video_width', ''),
(959, 885, 'output_check_true', ''),
(960, 885, 'output_check_false', ''),
(961, 885, 'output_caption', ''),
(962, 885, 'output_classes', ''),
(963, 885, 'output_priority', ''),
(964, 885, 'populate_save_as', ''),
(965, 885, 'populate_default', ''),
(966, 885, 'populate_meta_key', ''),
(967, 885, 'field_group', 'job'),
(968, 885, 'field_group_parent', ''),
(969, 885, 'origin', 'custom'),
(970, 885, 'options', 'a:0:{}'),
(1013, 435, '_edit_lock', '1444923229:1'),
(1014, 435, '_edit_last', '1'),
(1015, 879, 'description', ''),
(1016, 879, 'placeholder', ''),
(1017, 879, 'maxlength', ''),
(1018, 879, 'output', 'none'),
(1019, 879, 'output_as', 'text'),
(1020, 879, 'output_oembed_width', ''),
(1021, 879, 'output_oembed_height', ''),
(1022, 879, 'output_video_poster', ''),
(1023, 879, 'output_video_height', ''),
(1024, 879, 'output_video_width', ''),
(1025, 879, 'output_check_true', ''),
(1026, 879, 'output_check_false', ''),
(1027, 879, 'output_caption', ''),
(1028, 879, 'output_classes', ''),
(1029, 879, 'output_priority', ''),
(1030, 879, 'populate_save_as', ''),
(1031, 879, 'populate_default', ''),
(1032, 879, 'populate_meta_key', ''),
(1033, 879, 'options', 'a:0:{}'),
(1034, 896, '_filled', '0'),
(1035, 896, '_featured', '0'),
(1036, 896, '_submitting_key', '561fcd184f445'),
(1037, 896, '_job_title', 'nick'),
(1038, 896, 'geolocation_lat', '51.4178011'),
(1039, 896, 'geolocation_long', '-0.08189919999995254'),
(1040, 896, 'geolocation_formatted_address', 'London SE19 3RW, UK'),
(1041, 896, 'geolocation_city', 'London'),
(1042, 896, 'geolocation_state_short', 'Gt Lon'),
(1043, 896, 'geolocation_state_long', 'Greater London'),
(1044, 896, 'geolocation_postcode', 'SE19 3RW'),
(1045, 896, 'geolocation_country_short', 'GB'),
(1046, 896, 'geolocation_country_long', 'United Kingdom'),
(1047, 896, 'geolocated', '1'),
(1048, 896, '_job_location', 'London SE193RW, United Kingdom'),
(1049, 896, '_application', 'nick.j.goodall@gmail.com'),
(1050, 896, '_job_hours', 'a:7:{i:1;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:2;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:3;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:4;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:5;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:6;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:0;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}}'),
(1051, 896, '_bh_experience', 'all dem shits'),
(1052, 896, '_bh_services', 'a:1:{i:0;s:8:"prenatal";}'),
(1053, 896, '_bh_insurance', 'state'),
(1054, 896, '_bh_bio', 'this is me'),
(1055, 896, '_company_website', ''),
(1056, 896, '_company_video', ''),
(1057, 896, '_phone', ''),
(1098, 896, '_edit_lock', '1445253020:1'),
(1099, 15, '_wp_trash_meta_status', 'publish'),
(1100, 15, '_wp_trash_meta_time', '1445252967'),
(1101, 374, '_wp_trash_meta_status', 'publish'),
(1102, 374, '_wp_trash_meta_time', '1445252967'),
(1103, 61, '_wp_trash_meta_status', 'publish'),
(1104, 61, '_wp_trash_meta_time', '1445252967'),
(1105, 55, '_wp_trash_meta_status', 'publish') ;
INSERT INTO `wp_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1106, 55, '_wp_trash_meta_time', '1445252967'),
(1107, 2, '_wp_trash_meta_status', 'publish'),
(1108, 2, '_wp_trash_meta_time', '1445252968'),
(1109, 6, '_wp_trash_meta_status', 'publish'),
(1110, 6, '_wp_trash_meta_time', '1445252968'),
(1111, 435, '_wp_trash_meta_status', 'publish'),
(1112, 435, '_wp_trash_meta_time', '1445252968'),
(1113, 4, '_wp_trash_meta_status', 'publish'),
(1114, 4, '_wp_trash_meta_time', '1445252993'),
(1115, 1, '_wp_trash_meta_status', 'publish'),
(1116, 1, '_wp_trash_meta_time', '1445252993'),
(1117, 1, '_wp_trash_meta_comments_status', 'a:1:{i:1;s:1:"1";}'),
(1118, 74, '_wp_trash_meta_status', 'publish'),
(1119, 74, '_wp_trash_meta_time', '1445252993'),
(1120, 71, '_wp_trash_meta_status', 'publish'),
(1121, 71, '_wp_trash_meta_time', '1445252993'),
(1122, 67, '_wp_trash_meta_status', 'publish'),
(1123, 67, '_wp_trash_meta_time', '1445252993'),
(1124, 908, '_filled', '0'),
(1125, 908, '_featured', '0'),
(1126, 908, '_edit_last', '1'),
(1127, 908, '_edit_lock', '1445262740:1'),
(1128, 908, '_job_expires', '2015-11-18'),
(1129, 908, '_job_hours', 'a:7:{i:1;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:2;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:3;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:4;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:5;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:6;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:0;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}}'),
(1130, 908, '_location', ''),
(1131, 908, '_bh_services', 'a:4:{i:0;s:9:"attending";i:1;s:8:"prenatal";i:2;s:9:"postnatal";i:3;s:6:"breast";}'),
(1132, 908, '_bh_insurance', 'stateprivate'),
(1133, 908, '_bh_experience', 'Certification from German School of Midwifery\r\nBachelor Degree in Nursing\r\n10 years practical experience in Midwifery and Childbirth - over 30 deliveries'),
(1134, 908, '_claimed', '0'),
(1135, 908, '_bh_bio', 'I have been working as an attending for over 20 years in Frankfurt and have\r\nserved more than 200 families in this time.  I am passionate about taking the \r\nbest care of my Clients before, during and after birth.  I believe being part of \r\nthe birthing experience is essential to understanding each individual woman\r\nand providing her with the best care possible.  During my tgime as an attending\r\nmidwife, I have worked with Marien Hospital, Uniklinic, Burger Hospital, and \r\nSachsenhausen Hospital.  You can be sure that I will help you and your family\r\nevery step of the way to becoming new parents.'),
(1136, 908, 'geolocation_lat', '51.89242400000001'),
(1137, 908, 'geolocation_long', '0.8407839000000195'),
(1138, 908, 'geolocation_formatted_address', 'Stanway, Colchester, Essex CO3 0JR, UK'),
(1139, 908, 'geolocation_city', 'Colchester'),
(1140, 908, 'geolocation_state_short', 'Essex'),
(1141, 908, 'geolocation_state_long', 'Essex'),
(1142, 908, 'geolocation_postcode', 'CO3 0JR'),
(1143, 908, 'geolocation_country_short', 'GB'),
(1144, 908, 'geolocation_country_long', 'United Kingdom'),
(1145, 908, 'geolocated', '1'),
(1146, 908, '_job_location', 'Stanway CO30JR, United Kingdom'),
(1147, 908, '_application', 'nick.j.goodall@gmail.com'),
(1148, 908, '_company_website', ''),
(1149, 908, '_company_video', ''),
(1150, 908, '_phone', ''),
(1151, 908, '_gallery_images', 'a:1:{i:0;s:83:"http:localhost/wp-content/uploads/job-manager-uploads/0/2015/10/zoom-46715868-3.jpg";}'),
(1152, 908, '_gallery', 'a:1:{i:0;s:3:"910";}'),
(1153, 896, '_edit_last', '1'),
(1154, 896, '_job_expires', '2015-11-18'),
(1155, 896, '_location', ''),
(1156, 896, '_claimed', '0'),
(1157, 896, '_gallery_images', 'a:0:{}'),
(1158, 896, '_gallery', 'a:0:{}'),
(1159, 910, '_wp_attached_file', 'job-manager-uploads/0/2015/10/zoom-46715868-3.jpg'),
(1160, 910, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1235;s:6:"height";i:822;s:4:"file";s:49:"job-manager-uploads/0/2015/10/zoom-46715868-3.jpg";s:5:"sizes";a:7:{s:9:"thumbnail";a:4:{s:4:"file";s:27:"zoom-46715868-3-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:27:"zoom-46715868-3-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:28:"zoom-46715868-3-1024x682.jpg";s:5:"width";i:1024;s:6:"height";i:682;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:27:"zoom-46715868-3-180x180.jpg";s:5:"width";i:180;s:6:"height";i:180;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:27:"zoom-46715868-3-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:11:"shop_single";a:4:{s:4:"file";s:27:"zoom-46715868-3-600x600.jpg";s:5:"width";i:600;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:27:"zoom-46715868-3-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(1161, 25, '_edit_lock', '1445332379:1'),
(1162, 25, '_edit_last', '1'),
(1163, 912, '_wp_attached_file', '2015/10/stock-photo-asian-woman-smiling-happy-portrait-beautiful-mature-middle-aged-chinese-asian-woman-closeup-beauty-96418745.jpg'),
(1164, 912, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:450;s:6:"height";i:470;s:4:"file";s:131:"2015/10/stock-photo-asian-woman-smiling-happy-portrait-beautiful-mature-middle-aged-chinese-asian-woman-closeup-beauty-96418745.jpg";s:5:"sizes";a:5:{s:9:"thumbnail";a:4:{s:4:"file";s:131:"stock-photo-asian-woman-smiling-happy-portrait-beautiful-mature-middle-aged-chinese-asian-woman-closeup-beauty-96418745-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:131:"stock-photo-asian-woman-smiling-happy-portrait-beautiful-mature-middle-aged-chinese-asian-woman-closeup-beauty-96418745-287x300.jpg";s:5:"width";i:287;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:131:"stock-photo-asian-woman-smiling-happy-portrait-beautiful-mature-middle-aged-chinese-asian-woman-closeup-beauty-96418745-180x180.jpg";s:5:"width";i:180;s:6:"height";i:180;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:131:"stock-photo-asian-woman-smiling-happy-portrait-beautiful-mature-middle-aged-chinese-asian-woman-closeup-beauty-96418745-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:131:"stock-photo-asian-woman-smiling-happy-portrait-beautiful-mature-middle-aged-chinese-asian-woman-closeup-beauty-96418745-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(1172, 851, '_nav_menu_role', 'in'),
(1173, 859, '_nav_menu_role', 'in'),
(1174, 860, '_nav_menu_role', 'a:2:{i:0;s:13:"administrator";i:1;s:12:"shop_manager";}'),
(1175, 839, '_nav_menu_role', 'in'),
(1176, 858, '_nav_menu_role', 'out'),
(1179, 919, '_edit_last', '1'),
(1180, 919, '_edit_lock', '1445352792:1'),
(1181, 919, '_wp_page_template', 'default'),
(1182, 919, 'enable_tertiary_navigation', '0'),
(1183, 919, 'hero_style', 'none'),
(1184, 921, '_menu_item_type', 'post_type'),
(1185, 921, '_menu_item_menu_item_parent', '0'),
(1186, 921, '_menu_item_object_id', '919'),
(1187, 921, '_menu_item_object', 'page'),
(1188, 921, '_menu_item_target', ''),
(1189, 921, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(1190, 921, '_menu_item_xfn', ''),
(1191, 921, '_menu_item_url', ''),
(1193, 921, '_nav_menu_role', 'out'),
(1194, 925, '_filled', '0'),
(1195, 925, '_featured', '0'),
(1196, 925, '_submitting_key', '562612e9cc57a'),
(1197, 925, '_job_title', 'Maria Fowler'),
(1198, 925, 'geolocation_lat', '51.4178011'),
(1199, 925, 'geolocation_long', '-0.08189919999995254'),
(1200, 925, 'geolocation_formatted_address', 'London SE19 3RW, UK'),
(1201, 925, 'geolocation_city', 'London'),
(1202, 925, 'geolocation_state_short', 'Gt Lon'),
(1203, 925, 'geolocation_state_long', 'Greater London'),
(1204, 925, 'geolocation_postcode', 'SE19 3RW'),
(1205, 925, 'geolocation_country_short', 'GB'),
(1206, 925, 'geolocation_country_long', 'United Kingdom'),
(1207, 925, 'geolocated', '1'),
(1208, 925, '_job_location', 'London SE193RW'),
(1209, 925, '_application', 'test@gmail.com'),
(1210, 925, '_job_hours', 'a:7:{i:1;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:2;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:3;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:4;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:5;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:6;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:0;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}}'),
(1211, 925, '_location', ''),
(1212, 925, '_bh_experience', 'Certification from German School of Midwifery\r\nBachelor Degree in Nursing\r\n10 years practical experience in Midwifery and Childbirth - over 30 deliveries'),
(1213, 925, '_bh_services', 'a:6:{i:0;s:9:"attending";i:1;s:8:"prenatal";i:2;s:9:"postnatal";i:3;s:6:"breast";i:4;s:10:"gymnastics";i:5;s:8:"swimming";}'),
(1214, 925, '_bh_insurance', 'state'),
(1215, 925, '_bh_bio', 'I have been working as an attending for over 20 years in Frankfurt and have\r\nserved more than 200 families in this time. I am passionate about taking the\r\nbest care of my Clients before, during and after birth. I believe being part of\r\nthe birthing experience is essential to understanding each individual woman\r\nand providing her with the best care possible. During my tgime as an attending\r\nmidwife, I have worked with Marien Hospital, Uniklinic, Burger Hospital, and\r\nSachsenhausen Hospital. You can be sure that I will help you and your family\r\nevery step of the way to becoming new parents.') ;
INSERT INTO `wp_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1216, 925, '_company_website', ''),
(1217, 925, '_company_video', ''),
(1218, 925, '_phone', ''),
(1219, 925, '_products', ''),
(1220, 925, '_job_expires', ''),
(1221, 925, '_wp_trash_meta_status', 'publish'),
(1222, 925, '_wp_trash_meta_time', '1445336162'),
(1223, 896, '_wp_trash_meta_status', 'publish'),
(1224, 896, '_wp_trash_meta_time', '1445336162'),
(1225, 926, '_wp_attached_file', '2015/10/stock-photo-asian-woman-smiling-happy-portrait-beautiful-mature-middle-aged-chinese-asian-woman-closeup-beauty-964187451.jpg'),
(1226, 926, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:450;s:6:"height";i:470;s:4:"file";s:132:"2015/10/stock-photo-asian-woman-smiling-happy-portrait-beautiful-mature-middle-aged-chinese-asian-woman-closeup-beauty-964187451.jpg";s:5:"sizes";a:5:{s:9:"thumbnail";a:4:{s:4:"file";s:132:"stock-photo-asian-woman-smiling-happy-portrait-beautiful-mature-middle-aged-chinese-asian-woman-closeup-beauty-964187451-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:132:"stock-photo-asian-woman-smiling-happy-portrait-beautiful-mature-middle-aged-chinese-asian-woman-closeup-beauty-964187451-287x300.jpg";s:5:"width";i:287;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:14:"shop_thumbnail";a:4:{s:4:"file";s:132:"stock-photo-asian-woman-smiling-happy-portrait-beautiful-mature-middle-aged-chinese-asian-woman-closeup-beauty-964187451-180x180.jpg";s:5:"width";i:180;s:6:"height";i:180;s:9:"mime-type";s:10:"image/jpeg";}s:12:"shop_catalog";a:4:{s:4:"file";s:132:"stock-photo-asian-woman-smiling-happy-portrait-beautiful-mature-middle-aged-chinese-asian-woman-closeup-beauty-964187451-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:132:"stock-photo-asian-woman-smiling-happy-portrait-beautiful-mature-middle-aged-chinese-asian-woman-closeup-beauty-964187451-100x100.jpg";s:5:"width";i:100;s:6:"height";i:100;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(1227, 926, '_wp_attachment_wp_user_avatar', '4'),
(1228, 927, '_filled', '0'),
(1229, 927, '_featured', '0'),
(1230, 927, '_submitting_key', '562614d5d9bd1'),
(1231, 927, '_job_title', 'Maria Fowler'),
(1232, 927, 'geolocation_lat', '51.4178011'),
(1233, 927, 'geolocation_long', '-0.08189919999995254'),
(1234, 927, 'geolocation_formatted_address', 'London SE19 3RW, UK'),
(1235, 927, 'geolocation_city', 'London'),
(1236, 927, 'geolocation_state_short', 'Gt Lon'),
(1237, 927, 'geolocation_state_long', 'Greater London'),
(1238, 927, 'geolocation_postcode', 'SE19 3RW'),
(1239, 927, 'geolocation_country_short', 'GB'),
(1240, 927, 'geolocation_country_long', 'United Kingdom'),
(1241, 927, 'geolocated', '1'),
(1242, 927, '_job_location', 'London SE193RW'),
(1243, 927, '_application', 'mr.nicholas.goodall@gmail.com'),
(1244, 927, '_job_hours', 'a:7:{i:1;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:2;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:3;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:4;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:5;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:6;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:0;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}}'),
(1245, 927, '_location', ''),
(1246, 927, '_bh_experience', 'Certification from German School of Midwifery\r\nBachelor Degree in Nursing\r\n10 years practical experience in Midwifery and Childbirth - over 30 deliveries'),
(1247, 927, '_bh_services', 'a:6:{i:0;s:9:"attending";i:1;s:8:"prenatal";i:2;s:9:"postnatal";i:3;s:6:"breast";i:4;s:10:"gymnastics";i:5;s:8:"swimming";}'),
(1248, 927, '_bh_insurance', 'state'),
(1249, 927, '_bh_bio', 'I have been working as an attending for over 20 years in Frankfurt and have\r\nserved more than 200 families in this time. I am passionate about taking the\r\nbest care of my Clients before, during and after birth. I believe being part of\r\nthe birthing experience is essential to understanding each individual woman\r\nand providing her with the best care possible. During my tgime as an attending\r\nmidwife, I have worked with Marien Hospital, Uniklinic, Burger Hospital, and\r\nSachsenhausen Hospital. You can be sure that I will help you and your family\r\nevery step of the way to becoming new parents.'),
(1250, 927, '_company_website', ''),
(1251, 927, '_company_video', ''),
(1252, 927, '_phone', ''),
(1253, 927, '_products', ''),
(1254, 927, '_job_expires', ''),
(1255, 928, '_edit_lock', '1445341523:4'),
(1256, 928, '_edit_last', '1'),
(1257, 928, '_visibility', 'visible'),
(1258, 928, '_stock_status', 'instock'),
(1259, 928, '_product_vendors_commission', ''),
(1260, 928, 'total_sales', '0'),
(1261, 928, '_downloadable', 'no'),
(1262, 928, '_virtual', 'yes'),
(1263, 928, '_regular_price', ''),
(1264, 928, '_sale_price', ''),
(1265, 928, '_purchase_note', ''),
(1266, 928, '_featured', 'no'),
(1267, 928, '_weight', ''),
(1268, 928, '_length', ''),
(1269, 928, '_width', ''),
(1270, 928, '_height', ''),
(1271, 928, '_sku', ''),
(1272, 928, '_product_attributes', 'a:0:{}'),
(1273, 928, '_sale_price_dates_from', ''),
(1274, 928, '_sale_price_dates_to', ''),
(1275, 928, '_price', '0'),
(1276, 928, '_sold_individually', ''),
(1277, 928, '_manage_stock', 'no'),
(1278, 928, '_backorders', 'no'),
(1279, 928, '_stock', ''),
(1280, 928, '_upsell_ids', 'a:0:{}'),
(1281, 928, '_crosssell_ids', 'a:0:{}'),
(1282, 928, '_product_version', '2.4.7'),
(1283, 928, '_wc_booking_base_cost', ''),
(1284, 928, '_wc_booking_cost', ''),
(1285, 928, '_wc_display_cost', ''),
(1286, 928, '_wc_booking_min_duration', '1'),
(1287, 928, '_wc_booking_max_duration', '1'),
(1288, 928, '_wc_booking_enable_range_picker', 'no'),
(1289, 928, '_wc_booking_calendar_display_mode', ''),
(1290, 928, '_wc_booking_qty', '1'),
(1291, 928, '_wc_booking_has_persons', 'no'),
(1292, 928, '_wc_booking_person_qty_multiplier', 'no'),
(1293, 928, '_wc_booking_person_cost_multiplier', 'no'),
(1294, 928, '_wc_booking_min_persons_group', '1'),
(1295, 928, '_wc_booking_max_persons_group', ''),
(1296, 928, '_wc_booking_has_person_types', 'no'),
(1297, 928, '_wc_booking_has_resources', 'yes'),
(1298, 928, '_wc_booking_resources_assignment', 'customer'),
(1299, 928, '_wc_booking_duration_type', 'fixed'),
(1300, 928, '_wc_booking_duration', '1'),
(1301, 928, '_wc_booking_duration_unit', 'hour'),
(1302, 928, '_wc_booking_user_can_cancel', 'yes'),
(1303, 928, '_wc_booking_cancel_limit', '1'),
(1304, 928, '_wc_booking_cancel_limit_unit', 'day'),
(1305, 928, '_wc_booking_max_date', '12'),
(1306, 928, '_wc_booking_max_date_unit', 'month'),
(1307, 928, '_wc_booking_min_date', ''),
(1308, 928, '_wc_booking_min_date_unit', 'month'),
(1309, 928, '_wc_booking_first_block_time', ''),
(1310, 928, '_wc_booking_requires_confirmation', 'no'),
(1311, 928, '_wc_booking_default_date_availability', 'available'),
(1312, 928, '_wc_booking_check_availability_against', ''),
(1313, 928, '_wc_booking_resouce_label', ''),
(1314, 928, '_wc_booking_availability', 'a:0:{}'),
(1315, 928, '_wc_booking_pricing', 'a:0:{}') ;
INSERT INTO `wp_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1316, 928, '_has_additional_costs', 'no'),
(1317, 928, '_product_image_gallery', ''),
(1318, 931, '_edit_lock', '1445337186:1'),
(1321, 927, '_wp_trash_meta_status', 'publish'),
(1322, 927, '_wp_trash_meta_time', '1445339615'),
(1323, 933, '_filled', '0'),
(1324, 933, '_featured', '0'),
(1325, 933, '_submitting_key', '5626220dd4660'),
(1326, 933, '_job_title', 'Maria Fowler'),
(1327, 933, 'geolocation_lat', '51.4178011'),
(1328, 933, 'geolocation_long', '-0.08189919999995254'),
(1329, 933, 'geolocation_formatted_address', 'London SE19 3RW, UK'),
(1330, 933, 'geolocation_city', 'London'),
(1331, 933, 'geolocation_state_short', 'Gt Lon'),
(1332, 933, 'geolocation_state_long', 'Greater London'),
(1333, 933, 'geolocation_postcode', 'SE19 3RW'),
(1334, 933, 'geolocation_country_short', 'GB'),
(1335, 933, 'geolocation_country_long', 'United Kingdom'),
(1336, 933, 'geolocated', '1'),
(1337, 933, '_job_location', 'London SE193RW'),
(1338, 933, '_application', 'mr.nicholas.goodall@gmail.com'),
(1339, 933, '_job_hours', 'a:7:{i:1;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:2;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:3;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:4;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:5;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:6;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:0;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}}'),
(1340, 933, '_location', ''),
(1341, 933, '_bh_experience', 'Certification from German School of Midwifery\r\nBachelor Degree in Nursing\r\n10 years practical experience in Midwifery and Childbirth - over 30 deliveries'),
(1342, 933, '_bh_services', 'a:6:{i:0;s:9:"attending";i:1;s:8:"prenatal";i:2;s:9:"postnatal";i:3;s:6:"breast";i:4;s:10:"gymnastics";i:5;s:8:"swimming";}'),
(1343, 933, '_bh_insurance', 'state'),
(1344, 933, '_bh_bio', 'I have been working as an attending for over 20 years in Frankfurt and have\r\nserved more than 200 families in this time. I am passionate about taking the\r\nbest care of my Clients before, during and after birth. I believe being part of\r\nthe birthing experience is essential to understanding each individual woman\r\nand providing her with the best care possible. During my tgime as an attending\r\nmidwife, I have worked with Marien Hospital, Uniklinic, Burger Hospital, and\r\nSachsenhausen Hospital. You can be sure that I will help you and your family\r\nevery step of the way to becoming new parents.'),
(1345, 933, '_company_website', ''),
(1346, 933, '_company_video', ''),
(1347, 933, '_phone', ''),
(1348, 933, '_products', ''),
(1349, 933, '_job_expires', ''),
(1350, 934, '_edit_lock', '1445503138:1'),
(1351, 934, '_edit_last', '1'),
(1352, 934, '_visibility', 'visible'),
(1353, 934, '_stock_status', 'instock'),
(1354, 934, '_product_vendors_commission', '0'),
(1355, 934, 'total_sales', '0'),
(1356, 934, '_downloadable', 'no'),
(1357, 934, '_virtual', 'yes'),
(1358, 934, '_regular_price', ''),
(1359, 934, '_sale_price', ''),
(1360, 934, '_purchase_note', ''),
(1361, 934, '_featured', 'no'),
(1362, 934, '_weight', ''),
(1363, 934, '_length', ''),
(1364, 934, '_width', ''),
(1365, 934, '_height', ''),
(1366, 934, '_sku', ''),
(1367, 934, '_product_attributes', 'a:0:{}'),
(1368, 934, '_sale_price_dates_from', ''),
(1369, 934, '_sale_price_dates_to', ''),
(1370, 934, '_price', '0'),
(1371, 934, '_sold_individually', ''),
(1372, 934, '_manage_stock', 'no'),
(1373, 934, '_backorders', 'no'),
(1374, 934, '_stock', ''),
(1375, 934, '_upsell_ids', 'a:0:{}'),
(1376, 934, '_crosssell_ids', 'a:0:{}'),
(1377, 934, '_product_version', '2.4.7'),
(1378, 934, '_wc_booking_base_cost', ''),
(1379, 934, '_wc_booking_cost', ''),
(1380, 934, '_wc_display_cost', ''),
(1381, 934, '_wc_booking_min_duration', '1'),
(1382, 934, '_wc_booking_max_duration', '1'),
(1383, 934, '_wc_booking_enable_range_picker', 'no'),
(1384, 934, '_wc_booking_calendar_display_mode', 'always_visible'),
(1385, 934, '_wc_booking_qty', '1'),
(1386, 934, '_wc_booking_has_persons', 'no'),
(1387, 934, '_wc_booking_person_qty_multiplier', 'no'),
(1388, 934, '_wc_booking_person_cost_multiplier', 'no'),
(1389, 934, '_wc_booking_min_persons_group', '1'),
(1390, 934, '_wc_booking_max_persons_group', ''),
(1391, 934, '_wc_booking_has_person_types', 'no'),
(1392, 934, '_wc_booking_has_resources', 'no'),
(1393, 934, '_wc_booking_resources_assignment', 'customer'),
(1394, 934, '_wc_booking_duration_type', 'fixed'),
(1395, 934, '_wc_booking_duration', '1'),
(1396, 934, '_wc_booking_duration_unit', 'hour'),
(1397, 934, '_wc_booking_user_can_cancel', 'yes'),
(1398, 934, '_wc_booking_cancel_limit', '1'),
(1399, 934, '_wc_booking_cancel_limit_unit', 'day'),
(1400, 934, '_wc_booking_max_date', '12'),
(1401, 934, '_wc_booking_max_date_unit', 'month'),
(1402, 934, '_wc_booking_min_date', ''),
(1403, 934, '_wc_booking_min_date_unit', 'month'),
(1404, 934, '_wc_booking_first_block_time', ''),
(1405, 934, '_wc_booking_requires_confirmation', 'yes'),
(1406, 934, '_wc_booking_default_date_availability', 'available'),
(1407, 934, '_wc_booking_check_availability_against', ''),
(1408, 934, '_wc_booking_resouce_label', ''),
(1409, 934, '_wc_booking_availability', 'a:5:{i:0;a:4:{s:4:"type";s:6:"time:1";s:8:"bookable";s:3:"yes";s:4:"from";s:5:"09:00";s:2:"to";s:5:"18:00";}i:1;a:4:{s:4:"type";s:6:"time:2";s:8:"bookable";s:3:"yes";s:4:"from";s:5:"09:00";s:2:"to";s:5:"18:00";}i:2;a:4:{s:4:"type";s:6:"time:3";s:8:"bookable";s:3:"yes";s:4:"from";s:5:"09:00";s:2:"to";s:5:"18:00";}i:3;a:4:{s:4:"type";s:6:"time:4";s:8:"bookable";s:3:"yes";s:4:"from";s:5:"09:00";s:2:"to";s:5:"18:00";}i:4;a:4:{s:4:"type";s:6:"time:5";s:8:"bookable";s:3:"yes";s:4:"from";s:5:"09:00";s:2:"to";s:5:"18:00";}}'),
(1410, 934, '_wc_booking_pricing', 'a:0:{}'),
(1411, 934, '_has_additional_costs', 'no'),
(1412, 934, '_product_image_gallery', ''),
(1413, 933, '_wp_trash_meta_status', 'publish'),
(1414, 933, '_wp_trash_meta_time', '1445341785'),
(1415, 935, '_filled', '0'),
(1416, 935, '_featured', '0'),
(1417, 935, '_submitting_key', '56262a7912a12') ;
INSERT INTO `wp_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1418, 935, '_job_title', 'Maria Fowler'),
(1419, 935, 'geolocation_lat', '51.4178011'),
(1420, 935, 'geolocation_long', '-0.08189919999995254'),
(1421, 935, 'geolocation_formatted_address', 'London SE19 3RW, UK'),
(1422, 935, 'geolocation_city', 'London'),
(1423, 935, 'geolocation_state_short', 'Gt Lon'),
(1424, 935, 'geolocation_state_long', 'Greater London'),
(1425, 935, 'geolocation_postcode', 'SE19 3RW'),
(1426, 935, 'geolocation_country_short', 'GB'),
(1427, 935, 'geolocation_country_long', 'United Kingdom'),
(1428, 935, 'geolocated', '1'),
(1429, 935, '_job_location', 'London SE193RW'),
(1430, 935, '_application', 'mr.nicholas.goodall@gmail.com'),
(1431, 935, '_job_hours', 'a:7:{i:1;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:2;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:3;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:4;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:5;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:6;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:0;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}}'),
(1432, 935, '_location', ''),
(1433, 935, '_bh_experience', 'Certification from German School of Midwifery\r\nBachelor Degree in Nursing\r\n10 years practical experience in Midwifery and Childbirth - over 30 deliveries'),
(1434, 935, '_bh_services', 'a:1:{i:0;s:9:"attending";}'),
(1435, 935, '_bh_insurance', 'state'),
(1436, 935, '_bh_bio', 'I have been working as an attending for over 20 years in Frankfurt and have\r\nserved more than 200 families in this time. I am passionate about taking the\r\nbest care of my Clients before, during and after birth. I believe being part of\r\nthe birthing experience is essential to understanding each individual woman\r\nand providing her with the best care possible. During my tgime as an attending\r\nmidwife, I have worked with Marien Hospital, Uniklinic, Burger Hospital, and\r\nSachsenhausen Hospital. You can be sure that I will help you and your family\r\nevery step of the way to becoming new parents.'),
(1437, 935, '_company_website', ''),
(1438, 935, '_company_video', ''),
(1439, 935, '_products', 'a:1:{i:0;s:3:"934";}'),
(1440, 935, '_phone', ''),
(1441, 935, '_job_expires', ''),
(1442, 936, '_booking_order_item_id', ''),
(1443, 936, '_booking_product_id', '934'),
(1444, 936, '_booking_resource_id', ''),
(1445, 936, '_booking_persons', 'a:0:{}'),
(1446, 936, '_booking_cost', '0'),
(1447, 936, '_booking_start', '20151021100000'),
(1448, 936, '_booking_end', '20151021110000'),
(1449, 936, '_booking_all_day', '0'),
(1450, 936, '_booking_parent_id', '0'),
(1451, 936, '_booking_customer_id', '1'),
(1452, 936, '_booking_vendor', '26'),
(1453, 937, '_booking_order_item_id', ''),
(1454, 937, '_booking_product_id', '934'),
(1455, 937, '_booking_resource_id', ''),
(1456, 937, '_booking_persons', 'a:0:{}'),
(1457, 937, '_booking_cost', '0'),
(1458, 937, '_booking_start', '20151022040000'),
(1459, 937, '_booking_end', '20151022050000'),
(1460, 937, '_booking_all_day', '0'),
(1461, 937, '_booking_parent_id', '0'),
(1462, 937, '_booking_customer_id', '1'),
(1463, 937, '_booking_vendor', '26'),
(1464, 938, '_booking_order_item_id', ''),
(1465, 938, '_booking_product_id', '934'),
(1466, 938, '_booking_resource_id', ''),
(1467, 938, '_booking_persons', 'a:0:{}'),
(1468, 938, '_booking_cost', '0'),
(1469, 938, '_booking_start', '20151023100000'),
(1470, 938, '_booking_end', '20151023110000'),
(1471, 938, '_booking_all_day', '0'),
(1472, 938, '_booking_parent_id', '0'),
(1473, 938, '_booking_customer_id', '1'),
(1474, 938, '_booking_vendor', '26'),
(1475, 939, '_booking_order_item_id', ''),
(1476, 939, '_booking_product_id', '934'),
(1477, 939, '_booking_resource_id', ''),
(1478, 939, '_booking_persons', 'a:0:{}'),
(1479, 939, '_booking_cost', '0'),
(1480, 939, '_booking_start', '20151024100000'),
(1481, 939, '_booking_end', '20151024110000'),
(1482, 939, '_booking_all_day', '0'),
(1483, 939, '_booking_parent_id', '0'),
(1484, 939, '_booking_customer_id', '1'),
(1485, 939, '_booking_vendor', '26'),
(1486, 940, '_booking_order_item_id', '1'),
(1487, 940, '_booking_product_id', '934'),
(1488, 940, '_booking_resource_id', ''),
(1489, 940, '_booking_persons', 'a:0:{}'),
(1490, 940, '_booking_cost', '0'),
(1491, 940, '_booking_start', '20151022100000'),
(1492, 940, '_booking_end', '20151022110000'),
(1493, 940, '_booking_all_day', '0'),
(1494, 940, '_booking_parent_id', '0'),
(1495, 940, '_booking_customer_id', '1'),
(1496, 940, '_booking_vendor', '26'),
(1497, 941, '_order_key', 'wc_order_562630401c073'),
(1498, 941, '_order_currency', 'GBP'),
(1499, 941, '_prices_include_tax', 'no'),
(1500, 941, '_customer_ip_address', '84.51.154.153'),
(1501, 941, '_customer_user_agent', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36'),
(1502, 941, '_customer_user', '1'),
(1503, 941, '_created_via', 'checkout'),
(1504, 941, '_order_version', '2.4.7'),
(1505, 941, '_billing_first_name', 'Nick'),
(1506, 941, '_billing_last_name', 'Goodall'),
(1507, 941, '_billing_company', ''),
(1508, 941, '_billing_email', 'nick.j.goodall@gmail.com'),
(1509, 941, '_billing_phone', '07818491093'),
(1510, 941, '_billing_country', 'GB'),
(1511, 941, '_billing_address_1', 'Flat 5, 47 Westow Street'),
(1512, 941, '_billing_address_2', ''),
(1513, 941, '_billing_city', 'London'),
(1514, 941, '_billing_state', 'London'),
(1515, 941, '_billing_postcode', 'SE19 3RW'),
(1516, 941, '_shipping_first_name', 'Nick'),
(1517, 941, '_shipping_last_name', 'Goodall') ;
INSERT INTO `wp_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1518, 941, '_shipping_company', ''),
(1519, 941, '_shipping_country', 'GB'),
(1520, 941, '_shipping_address_1', 'Flat 5, 47 Westow Street'),
(1521, 941, '_shipping_address_2', ''),
(1522, 941, '_shipping_city', 'London'),
(1523, 941, '_shipping_state', 'London'),
(1524, 941, '_shipping_postcode', 'SE19 3RW'),
(1525, 941, '_payment_method', 'wc-booking-gateway'),
(1526, 941, '_payment_method_title', 'Check booking availability'),
(1527, 941, '_order_shipping', ''),
(1528, 941, '_cart_discount', '0'),
(1529, 941, '_cart_discount_tax', '0'),
(1530, 941, '_order_tax', '0'),
(1531, 941, '_order_shipping_tax', '0'),
(1532, 941, '_order_total', '0.00'),
(1533, 941, '_booking_order', '1'),
(1534, 884, 'taxonomy', ''),
(1535, 877, 'default', ''),
(1536, 877, 'taxonomy', ''),
(1537, 877, 'description', 'Please fill in your working hours when you will be available for appointments'),
(1538, 877, 'placeholder', ''),
(1539, 877, 'maxlength', ''),
(1540, 877, 'output', 'none'),
(1541, 877, 'output_as', 'text'),
(1542, 877, 'output_oembed_width', ''),
(1543, 877, 'output_oembed_height', ''),
(1544, 877, 'output_video_poster', ''),
(1545, 877, 'output_video_height', ''),
(1546, 877, 'output_video_width', ''),
(1547, 877, 'output_check_true', ''),
(1548, 877, 'output_check_false', ''),
(1549, 877, 'output_caption', ''),
(1550, 877, 'output_classes', ''),
(1551, 877, 'output_priority', ''),
(1552, 877, 'populate_save_as', ''),
(1553, 877, 'populate_default', ''),
(1554, 877, 'populate_meta_key', ''),
(1555, 877, 'options', 'a:0:{}'),
(1556, 23, '_edit_lock', '1445352757:1'),
(1557, 942, '_menu_item_type', 'post_type'),
(1558, 942, '_menu_item_menu_item_parent', '0'),
(1559, 942, '_menu_item_object_id', '11'),
(1560, 942, '_menu_item_object', 'page'),
(1561, 942, '_menu_item_target', ''),
(1562, 942, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(1563, 942, '_menu_item_xfn', ''),
(1564, 942, '_menu_item_url', ''),
(1566, 943, '_menu_item_type', 'post_type'),
(1567, 943, '_menu_item_menu_item_parent', '0'),
(1568, 943, '_menu_item_object_id', '32'),
(1569, 943, '_menu_item_object', 'page'),
(1570, 943, '_menu_item_target', ''),
(1571, 943, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(1572, 943, '_menu_item_xfn', ''),
(1573, 943, '_menu_item_url', ''),
(1575, 944, '_menu_item_type', 'post_type'),
(1576, 944, '_menu_item_menu_item_parent', '0'),
(1577, 944, '_menu_item_object_id', '25'),
(1578, 944, '_menu_item_object', 'page'),
(1579, 944, '_menu_item_target', ''),
(1580, 944, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(1581, 944, '_menu_item_xfn', ''),
(1582, 944, '_menu_item_url', ''),
(1583, 944, '_menu_item_orphaned', '1445353126'),
(1584, 943, '_nav_menu_role', 'a:2:{i:0;s:13:"administrator";i:1;s:12:"shop_manager";}'),
(1585, 912, '_wp_attachment_wp_user_avatar', '1'),
(1586, 945, '_filled', '0'),
(1587, 945, '_featured', '0'),
(1588, 945, '_submitting_key', '5627610fb70ec'),
(1589, 945, '_job_title', 'Laura Cohan'),
(1590, 945, 'geolocation_lat', '51.4178011'),
(1591, 945, 'geolocation_long', '-0.08189919999995254'),
(1592, 945, 'geolocation_formatted_address', 'London SE19 3RW, UK'),
(1593, 945, 'geolocation_city', 'London'),
(1594, 945, 'geolocation_state_short', 'Gt Lon'),
(1595, 945, 'geolocation_state_long', 'Greater London'),
(1596, 945, 'geolocation_postcode', 'SE19 3RW'),
(1597, 945, 'geolocation_country_short', 'GB'),
(1598, 945, 'geolocation_country_long', 'United Kingdom'),
(1599, 945, 'geolocated', '1'),
(1600, 945, '_job_location', 'SE193RW'),
(1601, 945, '_application', 'asd@ca.com'),
(1602, 945, '_job_hours', 'a:7:{i:1;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:2;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:3;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:4;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:5;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:6;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:0;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}}'),
(1603, 945, '_bh_experience', 'asdasd'),
(1604, 945, '_bh_services', 'a:1:{i:0;s:9:"attending";}'),
(1605, 945, '_bh_insurance', 'state'),
(1606, 945, '_bh_bio', 'asdsad'),
(1607, 945, '_company_website', ''),
(1608, 945, '_company_video', ''),
(1609, 945, '_products', ''),
(1610, 945, '_phone', ''),
(1611, 945, '_job_expires', ''),
(1612, 945, '_edit_lock', '1445421508:1'),
(1613, 945, '_wp_trash_meta_status', 'publish'),
(1614, 945, '_wp_trash_meta_time', '1445421662'),
(1615, 946, '_filled', '0'),
(1616, 946, '_featured', '0'),
(1617, 946, '_submitting_key', '5627628bbe7f7'),
(1618, 946, '_job_title', 'Laura Cohan'),
(1619, 946, 'geolocation_lat', '51.5059095') ;
INSERT INTO `wp_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1620, 946, 'geolocation_long', '-0.021714500000030057'),
(1621, 946, 'geolocation_formatted_address', 'London E14 4BB, UK'),
(1622, 946, 'geolocation_city', 'London'),
(1623, 946, 'geolocation_state_short', 'Gt Lon'),
(1624, 946, 'geolocation_state_long', 'Greater London'),
(1625, 946, 'geolocation_postcode', 'E14 4BB'),
(1626, 946, 'geolocation_country_short', 'GB'),
(1627, 946, 'geolocation_country_long', 'United Kingdom'),
(1628, 946, 'geolocated', '1'),
(1629, 946, '_job_location', 'E144BB'),
(1630, 946, '_application', 'asd@ca.com'),
(1631, 946, '_job_hours', 'a:7:{i:1;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:2;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:3;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:4;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:5;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:6;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:0;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}}'),
(1632, 946, '_bh_experience', 'asd'),
(1633, 946, '_bh_services', 'a:1:{i:0;s:9:"attending";}'),
(1634, 946, '_bh_insurance', 'state'),
(1635, 946, '_bh_bio', 'asd'),
(1636, 946, '_company_website', ''),
(1637, 946, '_company_video', ''),
(1638, 946, '_products', '947'),
(1639, 946, '_phone', ''),
(1640, 947, '_thumbnail_id', ''),
(1641, 947, '_visibility', 'visible'),
(1642, 947, '_stock_status', 'instock'),
(1643, 947, 'total_sales', '0'),
(1644, 947, '_downloadable', 'yes'),
(1645, 947, '_virtual', 'yes'),
(1646, 947, '_regular_price', '1'),
(1647, 947, '_sale_price', '1'),
(1648, 947, '_purchase_note', ''),
(1649, 947, '_featured', 'no'),
(1650, 947, '_weight', ''),
(1651, 947, '_length', ''),
(1652, 947, '_width', ''),
(1653, 947, '_height', ''),
(1654, 947, '_sku', ''),
(1655, 947, '_product_attributes', 'a:0:{}'),
(1656, 947, '_sale_price_dates_from', ''),
(1657, 947, '_sale_price_dates_to', ''),
(1658, 947, '_price', '1'),
(1659, 946, '_job_expires', ''),
(1660, 947, '_edit_lock', '1445421633:1'),
(1661, 935, '_edit_lock', '1445432337:1'),
(1662, 946, '_edit_lock', '1445429360:1'),
(1663, 946, '_wp_trash_meta_status', 'publish'),
(1664, 946, '_wp_trash_meta_time', '1445429888'),
(1665, 948, '_filled', '0'),
(1666, 948, '_featured', '0'),
(1667, 948, '_submitting_key', '5627829cb3db8'),
(1668, 948, '_job_title', 'Laura Coh'),
(1669, 948, 'geolocation_lat', '51.5059095'),
(1670, 948, 'geolocation_long', '-0.021714500000030057'),
(1671, 948, 'geolocation_formatted_address', 'London E14 4BB, UK'),
(1672, 948, 'geolocation_city', 'London'),
(1673, 948, 'geolocation_state_short', 'Gt Lon'),
(1674, 948, 'geolocation_state_long', 'Greater London'),
(1675, 948, 'geolocation_postcode', 'E14 4BB'),
(1676, 948, 'geolocation_country_short', 'GB'),
(1677, 948, 'geolocation_country_long', 'United Kingdom'),
(1678, 948, 'geolocated', '1'),
(1679, 948, '_job_location', 'E144BB'),
(1680, 948, '_application', 'asd@ca.com'),
(1681, 948, '_job_hours', 'a:7:{i:1;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:2;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:3;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:4;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:5;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:6;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:0;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}}'),
(1682, 948, '_bh_experience', 'asd'),
(1683, 948, '_bh_services', 'a:1:{i:0;s:9:"attending";}'),
(1684, 948, '_bh_insurance', 'state'),
(1685, 948, '_bh_bio', 'asd'),
(1686, 948, '_company_website', ''),
(1687, 948, '_company_video', ''),
(1688, 948, '_products', 'a:1:{i:0;i:949;}'),
(1689, 948, '_phone', ''),
(1690, 949, '_thumbnail_id', ''),
(1691, 949, '_visibility', 'visible'),
(1692, 949, '_stock_status', 'instock'),
(1693, 949, 'total_sales', '0'),
(1694, 949, '_downloadable', 'yes'),
(1695, 949, '_virtual', 'yes'),
(1696, 949, '_regular_price', '1'),
(1697, 949, '_sale_price', '1'),
(1698, 949, '_purchase_note', ''),
(1699, 949, '_featured', 'no'),
(1700, 949, '_weight', ''),
(1701, 949, '_length', ''),
(1702, 949, '_width', ''),
(1703, 949, '_height', ''),
(1704, 949, '_sku', ''),
(1705, 949, '_product_attributes', 'a:0:{}'),
(1706, 949, '_sale_price_dates_from', ''),
(1707, 949, '_sale_price_dates_to', ''),
(1708, 949, '_price', '1'),
(1709, 948, '_job_expires', ''),
(1710, 948, '_edit_lock', '1445430585:1'),
(1711, 949, '_wp_trash_meta_status', 'publish'),
(1712, 949, '_wp_trash_meta_time', '1445430824'),
(1713, 948, '_wp_trash_meta_status', 'publish'),
(1714, 948, '_wp_trash_meta_time', '1445430830'),
(1715, 950, '_filled', '0'),
(1716, 950, '_featured', '0'),
(1717, 950, '_submitting_key', '56278649e3fa0'),
(1718, 950, '_job_title', 'Laura C'),
(1719, 950, 'geolocation_lat', '51.5059095') ;
INSERT INTO `wp_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1720, 950, 'geolocation_long', '-0.021714500000030057'),
(1721, 950, 'geolocation_formatted_address', 'London E14 4BB, UK'),
(1722, 950, 'geolocation_city', 'London'),
(1723, 950, 'geolocation_state_short', 'Gt Lon'),
(1724, 950, 'geolocation_state_long', 'Greater London'),
(1725, 950, 'geolocation_postcode', 'E14 4BB'),
(1726, 950, 'geolocation_country_short', 'GB'),
(1727, 950, 'geolocation_country_long', 'United Kingdom'),
(1728, 950, 'geolocated', '1'),
(1729, 950, '_job_location', 'E144BB'),
(1730, 950, '_application', 'asd@ca.com'),
(1731, 950, '_job_hours', 'a:7:{i:1;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:2;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:3;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:4;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:5;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:6;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:0;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}}'),
(1732, 950, '_bh_experience', 'asd'),
(1733, 950, '_bh_services', 'a:1:{i:0;s:9:"attending";}'),
(1734, 950, '_bh_insurance', 'state'),
(1735, 950, '_bh_bio', 'asd'),
(1736, 950, '_company_website', ''),
(1737, 950, '_company_video', ''),
(1738, 950, '_products', 'a:1:{i:0;i:951;}'),
(1739, 950, '_phone', ''),
(1740, 951, '_thumbnail_id', ''),
(1741, 951, '_visibility', 'visible'),
(1742, 951, '_stock_status', 'instock'),
(1743, 951, 'total_sales', '0'),
(1744, 951, '_downloadable', 'no'),
(1745, 951, '_virtual', 'yes'),
(1746, 951, '_regular_price', ''),
(1747, 951, '_sale_price', ''),
(1748, 951, '_purchase_note', ''),
(1749, 951, '_featured', 'no'),
(1750, 951, '_weight', ''),
(1751, 951, '_length', ''),
(1752, 951, '_width', ''),
(1753, 951, '_height', ''),
(1754, 951, '_sku', ''),
(1755, 951, '_product_attributes', 'a:0:{}'),
(1756, 951, '_sale_price_dates_from', ''),
(1757, 951, '_sale_price_dates_to', ''),
(1758, 951, '_price', '0'),
(1759, 951, '_manage_stock', 'no'),
(1760, 951, '_backorders', 'no'),
(1761, 951, '_upsell_ids', 'a:0:{}'),
(1762, 951, '_crosssell_ids', 'a:0:{}'),
(1763, 951, '_wc_booking_min_duration', '1'),
(1764, 951, '_wc_booking_max_duration', '1'),
(1765, 951, '_wc_booking_enable_range_picker', 'no'),
(1766, 951, '_wc_booking_calendar_display_mode', 'always_visible'),
(1767, 951, '_wc_booking_qty', '1'),
(1768, 951, '_wc_booking_has_persons', 'no'),
(1769, 951, '_wc_booking_person_qty_multiplier', 'no'),
(1770, 951, '_wc_booking_person_cost_multiplier', 'no'),
(1771, 951, '_wc_booking_min_persons_group', '1'),
(1772, 951, '_wc_booking_max_persons_group', '1'),
(1773, 951, '_wc_booking_has_person_types', 'no'),
(1774, 951, '_wc_booking_has_resources', 'no'),
(1775, 951, '_wc_booking_resources_assignment', 'customer'),
(1776, 951, '_wc_booking_duration_type', 'fixed'),
(1777, 951, '_wc_booking_duration', '1'),
(1778, 951, '_wc_booking_duration_unit', 'hour'),
(1779, 951, '_wc_booking_user_can_cancel', 'yes'),
(1780, 951, '_wc_booking_cancel_limit', '1'),
(1781, 951, '_wc_booking_cancel_limit_unit', 'day'),
(1782, 951, '_wc_booking_max_date', '12'),
(1783, 951, '_wc_booking_max_date_unit', 'month'),
(1784, 951, '_wc_booking_min_date', ''),
(1785, 951, '_wc_booking_min_date_unit', 'month'),
(1786, 951, '_wc_booking_default_date_availability', 'a:0:{}'),
(1787, 951, '_wc_booking_check_availability_against', ''),
(1788, 951, '_wc_booking_resouce_label', ''),
(1789, 951, '_wc_booking_pricing', 'a:0:{}'),
(1790, 951, '_has_additional_costs', 'no'),
(1791, 951, '_product_image_gallery', ''),
(1792, 950, '_job_expires', ''),
(1793, 950, '_edit_lock', '1445432262:1'),
(1794, 951, '_edit_lock', '1445430807:1'),
(1795, 950, '_wp_trash_meta_status', 'publish'),
(1796, 950, '_wp_trash_meta_time', '1445432490'),
(1797, 951, '_wp_trash_meta_status', 'publish'),
(1798, 951, '_wp_trash_meta_time', '1445432497'),
(1799, 952, '_filled', '0'),
(1800, 952, '_featured', '0'),
(1801, 952, '_submitting_key', '56278ccc9a45d'),
(1802, 952, '_job_title', 'Laura Ch'),
(1803, 952, 'geolocation_lat', '51.5059095'),
(1804, 952, 'geolocation_long', '-0.021714500000030057'),
(1805, 952, 'geolocation_formatted_address', 'London E14 4BB, UK'),
(1806, 952, 'geolocation_city', 'London'),
(1807, 952, 'geolocation_state_short', 'Gt Lon'),
(1808, 952, 'geolocation_state_long', 'Greater London'),
(1809, 952, 'geolocation_postcode', 'E14 4BB'),
(1810, 952, 'geolocation_country_short', 'GB'),
(1811, 952, 'geolocation_country_long', 'United Kingdom'),
(1812, 952, 'geolocated', '1'),
(1813, 952, '_job_location', 'E144BB'),
(1814, 952, '_application', 'asd@ca.com'),
(1815, 952, '_job_hours', 'a:7:{i:1;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:2;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:3;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:4;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:5;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:6;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:0;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}}'),
(1816, 952, '_bh_experience', 'sd'),
(1817, 952, '_bh_services', 'a:1:{i:0;s:9:"attending";}'),
(1818, 952, '_bh_insurance', 'state'),
(1819, 952, '_bh_bio', 'sd') ;
INSERT INTO `wp_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1820, 952, '_company_website', ''),
(1821, 952, '_company_video', ''),
(1822, 952, '_products', 'a:1:{i:0;s:3:"953";}'),
(1823, 952, '_phone', ''),
(1824, 953, '_thumbnail_id', ''),
(1825, 953, '_visibility', 'visible'),
(1826, 953, '_stock_status', 'instock'),
(1827, 953, 'total_sales', '0'),
(1828, 953, '_downloadable', 'no'),
(1829, 953, '_virtual', 'yes'),
(1830, 953, '_regular_price', ''),
(1831, 953, '_sale_price', ''),
(1832, 953, '_purchase_note', ''),
(1833, 953, '_featured', 'no'),
(1834, 953, '_weight', ''),
(1835, 953, '_length', ''),
(1836, 953, '_width', ''),
(1837, 953, '_height', ''),
(1838, 953, '_sku', ''),
(1839, 953, '_product_attributes', 'a:0:{}'),
(1840, 953, '_sale_price_dates_from', ''),
(1841, 953, '_sale_price_dates_to', ''),
(1842, 953, '_price', '0'),
(1843, 953, '_manage_stock', 'no'),
(1844, 953, '_backorders', 'no'),
(1845, 953, '_upsell_ids', 'a:0:{}'),
(1846, 953, '_crosssell_ids', 'a:0:{}'),
(1847, 953, '_wc_booking_min_duration', '1'),
(1848, 953, '_wc_booking_max_duration', '1'),
(1849, 953, '_wc_booking_enable_range_picker', 'no'),
(1850, 953, '_wc_booking_calendar_display_mode', 'always_visible'),
(1851, 953, '_wc_booking_qty', '1'),
(1852, 953, '_wc_booking_has_persons', 'no'),
(1853, 953, '_wc_booking_person_qty_multiplier', 'no'),
(1854, 953, '_wc_booking_person_cost_multiplier', 'no'),
(1855, 953, '_wc_booking_min_persons_group', '1'),
(1856, 953, '_wc_booking_max_persons_group', '1'),
(1857, 953, '_wc_booking_has_person_types', 'no'),
(1858, 953, '_wc_booking_has_resources', 'no'),
(1859, 953, '_wc_booking_resources_assignment', 'customer'),
(1860, 953, '_wc_booking_duration_type', 'fixed'),
(1861, 953, '_wc_booking_duration', '1'),
(1862, 953, '_wc_booking_duration_unit', 'hour'),
(1863, 953, '_wc_booking_user_can_cancel', 'yes'),
(1864, 953, '_wc_booking_cancel_limit', '1'),
(1865, 953, '_wc_booking_cancel_limit_unit', 'day'),
(1866, 953, '_wc_booking_max_date', '12'),
(1867, 953, '_wc_booking_max_date_unit', 'month'),
(1868, 953, '_wc_booking_min_date', ''),
(1869, 953, '_wc_booking_min_date_unit', 'month'),
(1870, 953, '_wc_booking_default_date_availability', 'available'),
(1871, 953, '_wc_booking_check_availability_against', ''),
(1872, 953, '_wc_booking_resouce_label', ''),
(1873, 953, '_wc_booking_pricing', 'a:0:{}'),
(1874, 953, '_has_additional_costs', 'no'),
(1875, 953, '_product_image_gallery', ''),
(1876, 952, '_job_expires', ''),
(1877, 952, '_edit_lock', '1445432422:1'),
(1878, 953, '_edit_lock', '1445432669:1'),
(1879, 953, '_edit_last', '1'),
(1880, 953, '_product_vendors_commission', ''),
(1881, 953, '_sold_individually', ''),
(1882, 953, '_stock', ''),
(1883, 953, '_product_version', '2.4.7'),
(1884, 953, '_wc_booking_base_cost', ''),
(1885, 953, '_wc_booking_cost', ''),
(1886, 953, '_wc_display_cost', ''),
(1887, 953, '_wc_booking_first_block_time', ''),
(1888, 953, '_wc_booking_requires_confirmation', 'no'),
(1889, 953, '_wc_booking_availability', 'a:0:{}'),
(1890, 953, '_wp_trash_meta_status', 'publish'),
(1891, 953, '_wp_trash_meta_time', '1445432819'),
(1892, 952, '_wp_trash_meta_status', 'publish'),
(1893, 952, '_wp_trash_meta_time', '1445432823'),
(1894, 954, '_filled', '0'),
(1895, 954, '_featured', '0'),
(1896, 954, '_submitting_key', '56278e1638db7'),
(1897, 954, '_job_title', 'Laura C'),
(1898, 954, 'geolocation_lat', '51.5059095'),
(1899, 954, 'geolocation_long', '-0.021714500000030057'),
(1900, 954, 'geolocation_formatted_address', 'London E14 4BB, UK'),
(1901, 954, 'geolocation_city', 'London'),
(1902, 954, 'geolocation_state_short', 'Gt Lon'),
(1903, 954, 'geolocation_state_long', 'Greater London'),
(1904, 954, 'geolocation_postcode', 'E14 4BB'),
(1905, 954, 'geolocation_country_short', 'GB'),
(1906, 954, 'geolocation_country_long', 'United Kingdom'),
(1907, 954, 'geolocated', '1'),
(1908, 954, '_job_location', 'E144BB'),
(1909, 954, '_application', 'asd@ca.com'),
(1910, 954, '_job_hours', 'a:7:{i:1;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:2;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:3;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:4;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:5;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:6;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:0;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}}'),
(1911, 954, '_bh_experience', 'ASD'),
(1912, 954, '_bh_services', 'a:1:{i:0;s:9:"attending";}'),
(1913, 954, '_bh_insurance', 'state'),
(1914, 954, '_bh_bio', 'ASD'),
(1915, 954, '_company_website', ''),
(1916, 954, '_company_video', ''),
(1917, 954, '_products', 'a:1:{i:0;s:3:"955";}'),
(1918, 954, '_phone', ''),
(1919, 955, '_thumbnail_id', '') ;
INSERT INTO `wp_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1920, 955, '_visibility', 'visible'),
(1921, 955, '_stock_status', 'instock'),
(1922, 955, 'total_sales', '0'),
(1923, 955, '_downloadable', 'no'),
(1924, 955, '_virtual', 'yes'),
(1925, 955, '_regular_price', ''),
(1926, 955, '_sale_price', ''),
(1927, 955, '_purchase_note', ''),
(1928, 955, '_featured', 'no'),
(1929, 955, '_weight', ''),
(1930, 955, '_length', ''),
(1931, 955, '_width', ''),
(1932, 955, '_height', ''),
(1933, 955, '_sku', ''),
(1934, 955, '_product_attributes', 'a:0:{}'),
(1935, 955, '_sale_price_dates_from', ''),
(1936, 955, '_sale_price_dates_to', ''),
(1937, 955, '_price', '0'),
(1938, 955, '_manage_stock', 'no'),
(1939, 955, '_backorders', 'no'),
(1940, 955, '_upsell_ids', 'a:0:{}'),
(1941, 955, '_crosssell_ids', 'a:0:{}'),
(1942, 955, '_wc_booking_min_duration', '1'),
(1943, 955, '_wc_booking_max_duration', '1'),
(1944, 955, '_wc_booking_enable_range_picker', 'no'),
(1945, 955, '_wc_booking_calendar_display_mode', 'always_visible'),
(1946, 955, '_wc_booking_qty', '1'),
(1947, 955, '_wc_booking_has_persons', 'no'),
(1948, 955, '_wc_booking_person_qty_multiplier', 'no'),
(1949, 955, '_wc_booking_person_cost_multiplier', 'no'),
(1950, 955, '_wc_booking_min_persons_group', '1'),
(1951, 955, '_wc_booking_max_persons_group', '1'),
(1952, 955, '_wc_booking_has_person_types', 'no'),
(1953, 955, '_wc_booking_has_resources', 'no'),
(1954, 955, '_wc_booking_resources_assignment', 'customer'),
(1955, 955, '_wc_booking_duration_type', 'fixed'),
(1956, 955, '_wc_booking_duration', '1'),
(1957, 955, '_wc_booking_duration_unit', 'hour'),
(1958, 955, '_wc_booking_user_can_cancel', 'yes'),
(1959, 955, '_wc_booking_cancel_limit', '1'),
(1960, 955, '_wc_booking_cancel_limit_unit', 'day'),
(1961, 955, '_wc_booking_max_date', '12'),
(1962, 955, '_wc_booking_max_date_unit', 'month'),
(1963, 955, '_wc_booking_min_date', ''),
(1964, 955, '_wc_booking_min_date_unit', 'month'),
(1965, 955, '_wc_booking_default_date_availability', 'a:0:{}'),
(1966, 955, '_wc_booking_check_availability_against', ''),
(1967, 955, '_wc_booking_resouce_label', ''),
(1968, 955, '_wc_booking_pricing', 'a:0:{}'),
(1969, 955, '_has_additional_costs', 'no'),
(1970, 955, '_product_vendors_commission', ''),
(1971, 955, '_sold_individually', ''),
(1972, 955, '_stock', ''),
(1973, 955, '_wc_booking_base_cost', ''),
(1974, 955, '_wc_booking_cost', ''),
(1975, 955, '_wc_display_cost', ''),
(1976, 955, '_wc_booking_first_block_time', ''),
(1977, 955, '_wc_booking_requires_confirmation', 'no'),
(1978, 955, '_wc_booking_availability', 'a:0:{}'),
(1979, 954, '_job_expires', ''),
(1980, 955, '_edit_lock', '1445432835:1'),
(1981, 955, '_wp_trash_meta_status', 'publish'),
(1982, 955, '_wp_trash_meta_time', '1445432981'),
(1983, 954, '_wp_trash_meta_status', 'publish'),
(1984, 954, '_wp_trash_meta_time', '1445432986'),
(1985, 956, '_filled', '0'),
(1986, 956, '_featured', '0'),
(1987, 956, '_submitting_key', '56278eb3a098b'),
(1988, 956, '_job_title', 'Laur C'),
(1989, 956, 'geolocation_lat', '51.5059095'),
(1990, 956, 'geolocation_long', '-0.021714500000030057'),
(1991, 956, 'geolocation_formatted_address', 'London E14 4BB, UK'),
(1992, 956, 'geolocation_city', 'London'),
(1993, 956, 'geolocation_state_short', 'Gt Lon'),
(1994, 956, 'geolocation_state_long', 'Greater London'),
(1995, 956, 'geolocation_postcode', 'E14 4BB'),
(1996, 956, 'geolocation_country_short', 'GB'),
(1997, 956, 'geolocation_country_long', 'United Kingdom'),
(1998, 956, 'geolocated', '1'),
(1999, 956, '_job_location', 'E144BB'),
(2000, 956, '_application', 'asd@ca.com'),
(2001, 956, '_job_hours', 'a:7:{i:1;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:2;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:3;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:4;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:5;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:6;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:0;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}}'),
(2002, 956, '_bh_experience', 'ad'),
(2003, 956, '_bh_services', 'a:1:{i:0;s:9:"attending";}'),
(2004, 956, '_bh_insurance', 'state'),
(2005, 956, '_bh_bio', 'asd'),
(2006, 956, '_company_website', ''),
(2007, 956, '_company_video', ''),
(2008, 956, '_products', 'a:1:{i:0;s:3:"957";}'),
(2009, 956, '_phone', ''),
(2010, 957, '_thumbnail_id', ''),
(2011, 957, '_visibility', 'visible'),
(2012, 957, '_stock_status', 'instock'),
(2013, 957, 'total_sales', '0'),
(2014, 957, '_downloadable', 'no'),
(2015, 957, '_virtual', 'yes'),
(2016, 957, '_regular_price', ''),
(2017, 957, '_sale_price', ''),
(2018, 957, '_purchase_note', ''),
(2019, 957, '_featured', 'no') ;
INSERT INTO `wp_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(2020, 957, '_weight', ''),
(2021, 957, '_length', ''),
(2022, 957, '_width', ''),
(2023, 957, '_height', ''),
(2024, 957, '_sku', ''),
(2025, 957, '_product_attributes', 'a:0:{}'),
(2026, 957, '_sale_price_dates_from', ''),
(2027, 957, '_sale_price_dates_to', ''),
(2028, 957, '_price', '0'),
(2029, 957, '_manage_stock', 'no'),
(2030, 957, '_backorders', 'no'),
(2031, 957, '_upsell_ids', 'a:0:{}'),
(2032, 957, '_crosssell_ids', 'a:0:{}'),
(2033, 957, '_wc_booking_min_duration', '1'),
(2034, 957, '_wc_booking_max_duration', '1'),
(2035, 957, '_wc_booking_enable_range_picker', 'no'),
(2036, 957, '_wc_booking_calendar_display_mode', 'always_visible'),
(2037, 957, '_wc_booking_qty', '1'),
(2038, 957, '_wc_booking_has_persons', 'no'),
(2039, 957, '_wc_booking_person_qty_multiplier', 'no'),
(2040, 957, '_wc_booking_person_cost_multiplier', 'no'),
(2041, 957, '_wc_booking_min_persons_group', '1'),
(2042, 957, '_wc_booking_max_persons_group', '1'),
(2043, 957, '_wc_booking_has_person_types', 'no'),
(2044, 957, '_wc_booking_has_resources', 'no'),
(2045, 957, '_wc_booking_resources_assignment', 'customer'),
(2046, 957, '_wc_booking_duration_type', 'fixed'),
(2047, 957, '_wc_booking_duration', '1'),
(2048, 957, '_wc_booking_duration_unit', 'hour'),
(2049, 957, '_wc_booking_user_can_cancel', 'yes'),
(2050, 957, '_wc_booking_cancel_limit', '1'),
(2051, 957, '_wc_booking_cancel_limit_unit', 'day'),
(2052, 957, '_wc_booking_max_date', '12'),
(2053, 957, '_wc_booking_max_date_unit', 'month'),
(2054, 957, '_wc_booking_min_date', ''),
(2055, 957, '_wc_booking_min_date_unit', 'month'),
(2056, 957, '_wc_booking_default_date_availability', 'a:0:{}'),
(2057, 957, '_wc_booking_check_availability_against', ''),
(2058, 957, '_wc_booking_resouce_label', ''),
(2059, 957, '_wc_booking_pricing', 'a:0:{}'),
(2060, 957, '_has_additional_costs', 'no'),
(2061, 957, '_product_vendors_commission', ''),
(2062, 957, '_sold_individually', ''),
(2063, 957, '_stock', ''),
(2064, 957, '_wc_booking_base_cost', ''),
(2065, 957, '_wc_booking_cost', ''),
(2066, 957, '_wc_display_cost', ''),
(2067, 957, '_wc_booking_first_block_time', ''),
(2068, 957, '_wc_booking_requires_confirmation', 'no'),
(2069, 957, '_wc_booking_availability', 'a:0:{}'),
(2070, 956, '_job_expires', ''),
(2071, 956, '_wp_trash_meta_status', 'publish'),
(2072, 956, '_wp_trash_meta_time', '1445433825'),
(2073, 958, '_filled', '0'),
(2074, 958, '_featured', '0'),
(2075, 958, '_submitting_key', '562791fa035e6'),
(2076, 958, '_job_title', 'Laur'),
(2077, 958, 'geolocation_lat', '51.5059095'),
(2078, 958, 'geolocation_long', '-0.021714500000030057'),
(2079, 958, 'geolocation_formatted_address', 'London E14 4BB, UK'),
(2080, 958, 'geolocation_city', 'London'),
(2081, 958, 'geolocation_state_short', 'Gt Lon'),
(2082, 958, 'geolocation_state_long', 'Greater London'),
(2083, 958, 'geolocation_postcode', 'E14 4BB'),
(2084, 958, 'geolocation_country_short', 'GB'),
(2085, 958, 'geolocation_country_long', 'United Kingdom'),
(2086, 958, 'geolocated', '1'),
(2087, 958, '_job_location', 'E144BB'),
(2088, 958, '_application', 'asd@ca.com'),
(2089, 958, '_job_hours', 'a:7:{i:1;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:2;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:3;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:4;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:5;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:6;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:0;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}}'),
(2090, 958, '_bh_experience', 'ad'),
(2091, 958, '_bh_services', 'a:1:{i:0;s:9:"attending";}'),
(2092, 958, '_bh_insurance', 'state'),
(2093, 958, '_bh_bio', 'asd'),
(2094, 958, '_company_website', ''),
(2095, 958, '_company_video', ''),
(2096, 958, '_products', 'a:1:{i:0;s:3:"959";}'),
(2097, 958, '_phone', ''),
(2098, 959, '_thumbnail_id', ''),
(2099, 959, '_visibility', 'visible'),
(2100, 959, '_stock_status', 'instock'),
(2101, 959, 'total_sales', '0'),
(2102, 959, '_downloadable', 'no'),
(2103, 959, '_virtual', 'yes'),
(2104, 959, '_regular_price', ''),
(2105, 959, '_sale_price', ''),
(2106, 959, '_purchase_note', ''),
(2107, 959, '_featured', 'no'),
(2108, 959, '_weight', ''),
(2109, 959, '_length', ''),
(2110, 959, '_width', ''),
(2111, 959, '_height', ''),
(2112, 959, '_sku', ''),
(2113, 959, '_product_attributes', 'a:0:{}'),
(2114, 959, '_sale_price_dates_from', ''),
(2115, 959, '_sale_price_dates_to', ''),
(2116, 959, '_price', '0'),
(2117, 959, '_manage_stock', 'no'),
(2118, 959, '_backorders', 'no'),
(2119, 959, '_upsell_ids', 'a:0:{}') ;
INSERT INTO `wp_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(2120, 959, '_crosssell_ids', 'a:0:{}'),
(2121, 959, '_wc_booking_min_duration', '1'),
(2122, 959, '_wc_booking_max_duration', '1'),
(2123, 959, '_wc_booking_enable_range_picker', 'no'),
(2124, 959, '_wc_booking_calendar_display_mode', 'always_visible'),
(2125, 959, '_wc_booking_qty', '1'),
(2126, 959, '_wc_booking_has_persons', 'no'),
(2127, 959, '_wc_booking_person_qty_multiplier', 'no'),
(2128, 959, '_wc_booking_person_cost_multiplier', 'no'),
(2129, 959, '_wc_booking_min_persons_group', '1'),
(2130, 959, '_wc_booking_max_persons_group', '1'),
(2131, 959, '_wc_booking_has_person_types', 'no'),
(2132, 959, '_wc_booking_has_resources', 'no'),
(2133, 959, '_wc_booking_resources_assignment', 'customer'),
(2134, 959, '_wc_booking_duration_type', 'fixed'),
(2135, 959, '_wc_booking_duration', '1'),
(2136, 959, '_wc_booking_duration_unit', 'hour'),
(2137, 959, '_wc_booking_user_can_cancel', 'yes'),
(2138, 959, '_wc_booking_cancel_limit', '1'),
(2139, 959, '_wc_booking_cancel_limit_unit', 'day'),
(2140, 959, '_wc_booking_max_date', '12'),
(2141, 959, '_wc_booking_max_date_unit', 'month'),
(2142, 959, '_wc_booking_min_date', ''),
(2143, 959, '_wc_booking_min_date_unit', 'month'),
(2144, 959, '_wc_booking_default_date_availability', 'a:0:{}'),
(2145, 959, '_wc_booking_check_availability_against', ''),
(2146, 959, '_wc_booking_resouce_label', ''),
(2147, 959, '_wc_booking_pricing', 'a:0:{}'),
(2148, 959, '_has_additional_costs', 'no'),
(2149, 959, '_product_vendors_commission', ''),
(2150, 959, '_sold_individually', ''),
(2151, 959, '_stock', ''),
(2152, 959, '_wc_booking_base_cost', ''),
(2153, 959, '_wc_booking_cost', ''),
(2154, 959, '_wc_display_cost', ''),
(2155, 959, '_wc_booking_first_block_time', ''),
(2156, 959, '_wc_booking_requires_confirmation', 'no'),
(2157, 959, '_wc_booking_availability', 'a:0:{}'),
(2158, 959, '_edit_lock', '1445433735:14'),
(2159, 958, '_job_expires', ''),
(2160, 958, '_wp_trash_meta_status', 'publish'),
(2161, 958, '_wp_trash_meta_time', '1445502996'),
(2162, 961, '_filled', '0'),
(2163, 961, '_featured', '0'),
(2164, 961, '_submitting_key', '5628a0366fcd0'),
(2165, 961, '_job_title', 'Laura C'),
(2166, 961, 'geolocation_lat', '51.5059095'),
(2167, 961, 'geolocation_long', '-0.021714500000030057'),
(2168, 961, 'geolocation_formatted_address', 'London E14 4BB, UK'),
(2169, 961, 'geolocation_city', 'London'),
(2170, 961, 'geolocation_state_short', 'Gt Lon'),
(2171, 961, 'geolocation_state_long', 'Greater London'),
(2172, 961, 'geolocation_postcode', 'E14 4BB'),
(2173, 961, 'geolocation_country_short', 'GB'),
(2174, 961, 'geolocation_country_long', 'United Kingdom'),
(2175, 961, 'geolocated', '1'),
(2176, 961, '_job_location', 'E144BB'),
(2177, 961, '_application', 'asd@ca.com'),
(2178, 961, '_job_hours', 'a:7:{i:1;a:2:{s:5:"start";s:7:"4:00 am";s:3:"end";s:8:"10:30 pm";}i:2;a:2:{s:5:"start";s:7:"2:00 am";s:3:"end";s:7:"2:00 pm";}i:3;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:4;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:5;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:6;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:0;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}}'),
(2179, 961, '_bh_experience', 'ad'),
(2180, 961, '_bh_services', 'a:1:{i:0;s:9:"attending";}'),
(2181, 961, '_bh_insurance', 'state'),
(2182, 961, '_bh_bio', 'asd'),
(2183, 961, '_company_website', ''),
(2184, 961, '_company_video', ''),
(2185, 961, '_products', 'a:1:{i:0;s:3:"962";}'),
(2186, 961, '_phone', ''),
(2187, 962, '_thumbnail_id', ''),
(2188, 962, '_visibility', 'visible'),
(2189, 962, '_stock_status', 'instock'),
(2190, 962, 'total_sales', '0'),
(2191, 962, '_downloadable', 'no'),
(2192, 962, '_virtual', 'yes'),
(2193, 962, '_regular_price', ''),
(2194, 962, '_sale_price', ''),
(2195, 962, '_purchase_note', ''),
(2196, 962, '_featured', 'no'),
(2197, 962, '_weight', ''),
(2198, 962, '_length', ''),
(2199, 962, '_width', ''),
(2200, 962, '_height', ''),
(2201, 962, '_sku', ''),
(2202, 962, '_product_attributes', 'a:0:{}'),
(2203, 962, '_sale_price_dates_from', ''),
(2204, 962, '_sale_price_dates_to', ''),
(2205, 962, '_price', '0'),
(2206, 962, '_manage_stock', 'no'),
(2207, 962, '_backorders', 'no'),
(2208, 962, '_upsell_ids', 'a:0:{}'),
(2209, 962, '_crosssell_ids', 'a:0:{}'),
(2210, 962, '_wc_booking_min_duration', '1'),
(2211, 962, '_wc_booking_max_duration', '1'),
(2212, 962, '_wc_booking_enable_range_picker', 'no'),
(2213, 962, '_wc_booking_calendar_display_mode', 'always_visible'),
(2214, 962, '_wc_booking_qty', '1'),
(2215, 962, '_wc_booking_has_persons', 'no'),
(2216, 962, '_wc_booking_person_qty_multiplier', 'no'),
(2217, 962, '_wc_booking_person_cost_multiplier', 'no'),
(2218, 962, '_wc_booking_min_persons_group', '1'),
(2219, 962, '_wc_booking_max_persons_group', '1') ;
INSERT INTO `wp_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(2220, 962, '_wc_booking_has_person_types', 'no'),
(2221, 962, '_wc_booking_has_resources', 'no'),
(2222, 962, '_wc_booking_resources_assignment', 'customer'),
(2223, 962, '_wc_booking_duration_type', 'fixed'),
(2224, 962, '_wc_booking_duration', '1'),
(2225, 962, '_wc_booking_duration_unit', 'hour'),
(2226, 962, '_wc_booking_user_can_cancel', 'yes'),
(2227, 962, '_wc_booking_cancel_limit', '1'),
(2228, 962, '_wc_booking_cancel_limit_unit', 'day'),
(2229, 962, '_wc_booking_max_date', '12'),
(2230, 962, '_wc_booking_max_date_unit', 'month'),
(2231, 962, '_wc_booking_min_date', ''),
(2232, 962, '_wc_booking_min_date_unit', 'month'),
(2233, 962, '_wc_booking_default_date_availability', 'available'),
(2234, 962, '_wc_booking_check_availability_against', ''),
(2235, 962, '_wc_booking_resouce_label', ''),
(2236, 962, '_wc_booking_pricing', 'a:0:{}'),
(2237, 962, '_has_additional_costs', 'no'),
(2238, 962, '_product_vendors_commission', ''),
(2239, 962, '_sold_individually', ''),
(2240, 962, '_stock', ''),
(2241, 962, '_wc_booking_base_cost', ''),
(2242, 962, '_wc_booking_cost', ''),
(2243, 962, '_wc_display_cost', ''),
(2244, 962, '_wc_booking_first_block_time', ''),
(2245, 962, '_wc_booking_requires_confirmation', 'no'),
(2246, 962, '_wc_booking_availability', 'a:0:{}'),
(2247, 961, '_job_expires', ''),
(2248, 959, '_wp_trash_meta_status', 'publish'),
(2249, 959, '_wp_trash_meta_time', '1445503286'),
(2250, 962, '_edit_lock', '1445503153:1'),
(2251, 962, '_edit_last', '1'),
(2252, 962, '_product_version', '2.4.7'),
(2253, 962, '_product_image_gallery', ''),
(2254, 962, '_wp_trash_meta_status', 'publish'),
(2255, 962, '_wp_trash_meta_time', '1445504391'),
(2256, 947, '_wp_trash_meta_status', 'publish'),
(2257, 947, '_wp_trash_meta_time', '1445504395'),
(2258, 961, '_wp_trash_meta_status', 'publish'),
(2259, 961, '_wp_trash_meta_time', '1445504406'),
(2260, 963, '_filled', '0'),
(2261, 963, '_featured', '0'),
(2262, 963, '_submitting_key', '5628a5b130433'),
(2263, 963, '_job_title', 'Laura'),
(2264, 963, 'geolocation_lat', '51.5059095'),
(2265, 963, 'geolocation_long', '-0.021714500000030057'),
(2266, 963, 'geolocation_formatted_address', 'London E14 4BB, UK'),
(2267, 963, 'geolocation_city', 'London'),
(2268, 963, 'geolocation_state_short', 'Gt Lon'),
(2269, 963, 'geolocation_state_long', 'Greater London'),
(2270, 963, 'geolocation_postcode', 'E14 4BB'),
(2271, 963, 'geolocation_country_short', 'GB'),
(2272, 963, 'geolocation_country_long', 'United Kingdom'),
(2273, 963, 'geolocated', '1'),
(2274, 963, '_job_location', 'E144BB'),
(2275, 963, '_application', 'asd@ca.com'),
(2276, 963, '_job_hours', 'a:7:{i:1;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:2;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:3;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:4;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:5;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:6;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}i:0;a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}}'),
(2277, 963, '_bh_experience', 'asdasd'),
(2278, 963, '_bh_services', 'a:1:{i:0;s:9:"attending";}'),
(2279, 963, '_bh_insurance', 'state'),
(2280, 963, '_bh_bio', 'asdasd'),
(2281, 963, '_company_website', ''),
(2282, 963, '_company_video', ''),
(2283, 963, '_products', 'a:1:{i:0;s:3:"964";}'),
(2284, 963, '_phone', ''),
(2285, 964, '_thumbnail_id', ''),
(2286, 964, '_visibility', 'visible'),
(2287, 964, '_stock_status', 'instock'),
(2288, 964, 'total_sales', '0'),
(2289, 964, '_downloadable', 'no'),
(2290, 964, '_virtual', 'yes'),
(2291, 964, '_regular_price', ''),
(2292, 964, '_sale_price', ''),
(2293, 964, '_purchase_note', ''),
(2294, 964, '_featured', 'no'),
(2295, 964, '_weight', ''),
(2296, 964, '_length', ''),
(2297, 964, '_width', ''),
(2298, 964, '_height', ''),
(2299, 964, '_sku', ''),
(2300, 964, '_product_attributes', 'a:0:{}'),
(2301, 964, '_sale_price_dates_from', ''),
(2302, 964, '_sale_price_dates_to', ''),
(2303, 964, '_price', '0'),
(2304, 964, '_manage_stock', 'no'),
(2305, 964, '_backorders', 'no'),
(2306, 964, '_upsell_ids', 'a:0:{}'),
(2307, 964, '_crosssell_ids', 'a:0:{}'),
(2308, 964, '_wc_booking_min_duration', '1'),
(2309, 964, '_wc_booking_max_duration', '1'),
(2310, 964, '_wc_booking_enable_range_picker', 'no'),
(2311, 964, '_wc_booking_calendar_display_mode', 'always_visible'),
(2312, 964, '_wc_booking_qty', '1'),
(2313, 964, '_wc_booking_has_persons', 'no'),
(2314, 964, '_wc_booking_person_qty_multiplier', 'no'),
(2315, 964, '_wc_booking_person_cost_multiplier', 'no'),
(2316, 964, '_wc_booking_min_persons_group', '1'),
(2317, 964, '_wc_booking_max_persons_group', '1'),
(2318, 964, '_wc_booking_has_person_types', 'no'),
(2319, 964, '_wc_booking_has_resources', 'no') ;
INSERT INTO `wp_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(2320, 964, '_wc_booking_resources_assignment', 'customer'),
(2321, 964, '_wc_booking_duration_type', 'fixed'),
(2322, 964, '_wc_booking_duration', '1'),
(2323, 964, '_wc_booking_duration_unit', 'hour'),
(2324, 964, '_wc_booking_user_can_cancel', 'yes'),
(2325, 964, '_wc_booking_cancel_limit', '1'),
(2326, 964, '_wc_booking_cancel_limit_unit', 'day'),
(2327, 964, '_wc_booking_max_date', '12'),
(2328, 964, '_wc_booking_max_date_unit', 'month'),
(2329, 964, '_wc_booking_min_date', ''),
(2330, 964, '_wc_booking_min_date_unit', 'month'),
(2331, 964, '_wc_booking_default_date_availability', 'a:0:{}'),
(2332, 964, '_wc_booking_check_availability_against', ''),
(2333, 964, '_wc_booking_resouce_label', ''),
(2334, 964, '_wc_booking_pricing', 'a:0:{}'),
(2335, 964, '_has_additional_costs', 'no'),
(2336, 964, '_product_vendors_commission', ''),
(2337, 964, '_sold_individually', ''),
(2338, 964, '_stock', ''),
(2339, 964, '_wc_booking_base_cost', ''),
(2340, 964, '_wc_booking_cost', ''),
(2341, 964, '_wc_display_cost', ''),
(2342, 964, '_wc_booking_first_block_time', ''),
(2343, 964, '_wc_booking_requires_confirmation', 'no'),
(2344, 964, '_wc_booking_availability', 'a:0:{}'),
(2345, 963, '_job_expires', '') ;

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
) ENGINE=InnoDB AUTO_INCREMENT=965 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `wp_posts`
#
INSERT INTO `wp_posts` ( `ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2015-10-13 08:56:52', '2015-10-13 08:56:52', 'Welcome to WordPress. This is your first post. Edit or delete it, then start writing!', 'Hello world!', '', 'trash', 'open', 'open', '', 'hello-world', '', '', '2015-10-19 11:09:53', '2015-10-19 11:09:53', '', 0, 'http:localhost/?p=1', 0, 'post', '', 1),
(2, 1, '2015-10-13 08:56:52', '2015-10-13 08:56:52', 'This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\n\n<blockquote>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</blockquote>\n\n...or something like this:\n\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\n\nAs a new WordPress user, you should go to <a href="http:localhost/wp-admin/">your dashboard</a> to delete this page and create new pages for your content. Have fun!', 'Sample Page', '', 'trash', 'open', 'open', '', 'sample-page', '', '', '2015-10-19 11:09:28', '2015-10-19 11:09:28', '', 0, 'http:localhost/?page_id=2', 0, 'page', '', 0),
(4, 1, '2015-10-13 09:28:46', '2015-10-13 09:28:46', 'test', 'test post', '', 'trash', 'open', 'open', '', 'test-post', '', '', '2015-10-19 11:09:53', '2015-10-19 11:09:53', '', 0, 'http:localhost/?p=4', 0, 'post', '', 0),
(5, 1, '2015-10-13 09:28:46', '2015-10-13 09:28:46', 'test', 'test post', '', 'inherit', 'closed', 'closed', '', '4-revision-v1', '', '', '2015-10-13 09:28:46', '2015-10-13 09:28:46', '', 4, 'http:localhost/?p=5', 0, 'revision', '', 0),
(6, 1, '2014-10-23 12:16:02', '2014-10-23 12:16:02', '[video width="1280" height="720" loop="true" autoplay="true" preload="auto" mp4="https://f6ca679df901af69ace6-d3d26a34307edc4f7eeb40d85a64c4a7.ssl.cf5.rackcdn.com/listify-loops.mp4" webm="https://f6ca679df901af69ace6-d3d26a34307edc4f7eeb40d85a64c4a7.ssl.cf5.rackcdn.com/listify-loops.webm"][/video]\n\nListify helps you find out whats happening in your city, Let\'s explore.', 'Search Your City', '', 'trash', 'closed', 'closed', '', 'search-your-city', '', '', '2015-10-19 11:09:28', '2015-10-19 11:09:28', '', 0, 'http://demo.astoundify.com/listify/?page_id=6', 0, 'page', '', 0),
(7, 1, '2015-10-13 10:04:21', '2015-10-13 10:04:21', '', 'babyhallo_new_logo2', '', 'inherit', 'open', 'closed', '', 'babyhallo_new_logo2', '', '', '2015-10-13 12:20:30', '2015-10-13 12:20:30', '', 0, 'http:localhost/wp-content/uploads/2015/10/babyhallo_new_logo2.png', 0, 'attachment', 'image/png', 0),
(9, 1, '2015-10-14 09:50:30', '2015-10-14 09:50:30', '', 'babyhallo-100x35', '', 'inherit', 'open', 'closed', '', 'babyhallo-100x35', '', '', '2015-10-14 09:50:30', '2015-10-14 09:50:30', '', 0, 'http:localhost/wp-content/uploads/2015/10/babyhallo-100x35.png', 0, 'attachment', 'image/png', 0),
(10, 1, '2015-10-14 09:52:59', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2015-10-14 09:52:59', '0000-00-00 00:00:00', '', 0, 'http:localhost/?page_id=10', 0, 'page', '', 0),
(11, 1, '2015-10-14 10:07:49', '2015-10-14 10:07:49', 'Find a Midwife near you', 'Search for a Midwife', '', 'publish', 'closed', 'closed', '', 'search-for-a-midwife', '', '', '2015-10-15 15:28:36', '2015-10-15 15:28:36', '', 0, 'http:localhost/?page_id=11', 0, 'page', '', 0),
(12, 1, '2015-10-14 10:07:49', '2015-10-14 10:07:49', 'Find a Midwife near you', 'Search for a Midwife', '', 'inherit', 'closed', 'closed', '', '11-revision-v1', '', '', '2015-10-14 10:07:49', '2015-10-14 10:07:49', '', 11, 'http:localhost/?p=12', 0, 'revision', '', 0),
(15, 1, '2014-10-23 13:23:26', '2014-10-23 13:23:26', '', 'Blog', '', 'trash', 'closed', 'closed', '', 'blog', '', '', '2015-10-19 11:09:27', '2015-10-19 11:09:27', '', 0, 'http://demo.astoundify.com/listify/?page_id=15', 0, 'page', '', 0),
(22, 1, '2014-10-23 17:35:54', '2014-10-23 17:35:54', '', 'Shop', '', 'publish', 'closed', 'open', '', 'shop', '', '', '2014-10-23 17:35:54', '2014-10-23 17:35:54', '', 0, 'http://demo.astoundify.com/listify/shop/', 0, 'page', '', 0),
(23, 1, '2014-10-23 17:35:54', '2014-10-23 17:35:54', '[woocommerce_cart]', 'Cart', '', 'publish', 'closed', 'open', '', 'cart', '', '', '2014-10-23 17:35:54', '2014-10-23 17:35:54', '', 0, 'http://demo.astoundify.com/listify/cart/', 0, 'page', '', 0),
(24, 1, '2014-10-23 17:35:54', '2014-10-23 17:35:54', '[woocommerce_checkout]', 'Checkout', '', 'publish', 'closed', 'open', '', 'checkout', '', '', '2014-10-23 17:35:54', '2014-10-23 17:35:54', '', 0, 'http://demo.astoundify.com/listify/checkout/', 0, 'page', '', 0),
(25, 1, '2014-10-23 17:35:54', '2014-10-23 17:35:54', '[woocommerce_my_account]\r\n[avatar_upload]', 'My Account', '', 'publish', 'closed', 'open', '', 'my-account', '', '', '2015-10-19 12:05:19', '2015-10-19 12:05:19', '', 0, 'http://demo.astoundify.com/listify/my-account/', 0, 'page', '', 0),
(32, 1, '2014-10-23 18:08:41', '2014-10-23 18:08:41', '[submit_job_form]', 'Submit Listing', '', 'publish', 'closed', 'closed', '', 'submit-listing', '', '', '2014-10-23 18:08:41', '2014-10-23 18:08:41', '', 0, 'http://demo.astoundify.com/listify/?page_id=32', 0, 'page', '', 0),
(37, 1, '2014-10-23 18:11:03', '2014-10-23 18:11:03', '[job_dashboard]', 'Listings', '', 'publish', 'closed', 'closed', '', 'listings', '', '', '2014-10-23 18:11:03', '2014-10-23 18:11:03', '', 25, 'http://demo.astoundify.com/listify/?page_id=37', 0, 'page', '', 0),
(55, 1, '2014-10-23 18:26:26', '2014-10-23 18:26:26', '', 'Plans and Pricing', '', 'trash', 'closed', 'closed', '', 'plans-and-pricing', '', '', '2015-10-19 11:09:27', '2015-10-19 11:09:27', '', 0, 'http://demo.astoundify.com/listify/?page_id=55', 0, 'page', '', 0),
(61, 1, '2014-10-23 18:42:08', '2014-10-23 18:42:08', '<h3 class="ion-person-add">1. Create An Account</h3>\n<img class="alignright wp-image-694 size-full" src="http:localhost/wp-content/uploads/2014/10/account.png" alt="feature_sessionPlayback" width="490" />\n\nCreating an account with Listify is easy, with the social login feature it allows your visitors to login easily, so that they won\'t have the “login/register” friction. They\'ll be creating, rating and favouriting listings in no time!\n\nWe’ve even integrated with WooCommerce so that the <a href="http://www.woothemes.com/products/woocommerce-social-login/">Social Login by WooCommerce plugin</a> (Plugin sold separately) and the standard WooCommerce sign up process is fully supported.\n\n<a class="button" href="http://themeforest.net/item/jobify-job-board-wordpress-theme/5247604?ref=Astoundify">How It Works</a>\n<br /></br>\n<h3 class="ion-compose">2. Submit Your Listing</h3>\n<img class="alignleft wp-image-694 size-full" src="http:localhost/wp-content/uploads/2014/10/listing.png" alt="feature_sessionPlayback" width="490" />\nSubmitting a listing using Listify is super simple, we\'ve made entering the address of your place easy, when using our Google Places API plugin (Plugin sold separately) it will auto complete the listing address.\n\nYou can even fully customize your submission form either using PHP code using this <a href="https://wpjobmanager.com/document/editing-job-submission-fields/">tutorial</a> or by installing the <a href="https://plugins.smyl.es/wp-job-manager-field-editor/">Form Editor plugin</a> (Plugin sold separately) this gives you full control over the display of the fields that are shown on your submission form.\n\n<a class="button" href="http://themeforest.net/item/jobify-job-board-wordpress-theme/5247604?ref=Astoundify">Submit Your Listing</a>\n<br /></br>\n<h3 class="ion-bag">3. Get More Interest In Your Place</h3>\nThis won’t be the first time you look for a listing directory theme, but it may be the last time. Because with Listify you have more than you could ever want or need.\n\nWhen using Listify your site will be a thing of beauty. Let’s be honest. The problem with most listing directories, while highly functional, is that many of them aren’t very pretty. It’s why the beautiful ones are so popular, because they match great photography with fantastic functionality.\n\nThat’s what we’ve done with Listify.', 'How It Works', '', 'trash', 'closed', 'closed', '', 'how-it-works', '', '', '2015-10-19 11:09:27', '2015-10-19 11:09:27', '', 0, 'http://demo.astoundify.com/listify/?page_id=61', 0, 'page', '', 0),
(67, 1, '2014-10-23 18:51:02', '2014-10-23 18:51:02', 'A Business directory or business directory is a website or printed listing of information which lists all businesses within some category. Businesses can be categorized by business, location, activity, or size. Business may be compiled either manually or through an automated online search software. Online yellow pages are a type of business directory, as is the traditional phone book.\n\nThe details provided in a business directory varies from business to business. They may include the business name, addresses, telephone numbers, location, type of service or products the business provides, number of employees, the service region and any professional associations. Some directories include a section for user reviews, comments, and feedback. Business directories in the past would take a printed format but have recently been upgraded to websites due to the advent of the internet.\n<h2>Arts</h2>\nThe arts are a vast subdivision of culture, composed of many creative endeavors and disciplines. It is a broader term than "art", which as a description of a field usually means only the visual arts. The arts encompass the visual arts, the literary arts and the performing arts – music, theatre, dance and film, among others. This list is by no means comprehensive, but only meant to introduce the concept of the arts. For all intents and purposes, the history of the arts begins with the history of art. The arts might have origins in early human evolutionary prehistory. According to a recent suggestion, several forms of audio and visual arts (rhythmic singing and drumming on external objects, dancing, body and face painting) were developed very early in hominid evolution by the forces of natural selection in order to reach an altered state of consciousness.', 'Increasing Daily Foot Traffic', '', 'trash', 'open', 'open', '', 'increasing-daily-foot-traffic', '', '', '2015-10-19 11:09:53', '2015-10-19 11:09:53', '', 0, 'http://demo.astoundify.com/listify/?p=67', 0, 'post', '', 0),
(71, 1, '2014-10-23 18:53:15', '2014-10-23 18:53:15', 'Online advertising, also called online marketing or Internet advertising, is a form of marketing and advertising which uses the Internet to deliver promotional marketing messages to consumers. It includes email marketing, search engine marketing (SEM), social media marketing, many types of display advertising (including web banner advertising), and mobile advertising. Like other advertising media, online advertising frequently involves both a publisher, who integrates advertisements into its online content, and an advertiser, who provides the advertisements to be displayed on the publisher\'s content. Other potential participants include advertising agencies who help generate and place the ad copy, an ad server who technologically delivers the ad and tracks statistics, and advertising affiliates who do independent promotional work for the advertiser.\n<blockquote>Online advertising is a large business and is growing rapidly.</blockquote>\nIn 2011, Internet advertising revenues in the United States surpassed those of cable television and nearly exceeded those of broadcast television.:19 In 2012, Internet advertising revenues in the United States totaled $36.57 billion, a 15.2% increase over the $31.74 billion in revenues in 2011. U.S. internet ad revenue hit a historic high of $20.1 billion for the first half of 2013, up 18% over the same period in 2012. Online advertising is widely used across virtually all industry sectors.\n\nMany common online advertising practices are controversial and increasingly subject to regulation. Online ad revenues may not adequately replace other publishers\' revenue streams. Declining ad revenue has led some publishers to hide their content behind paywalls.', 'Converting Online Visits to Offline Sales', '', 'trash', 'open', 'open', '', 'converting-online-visits-to-offline-sales', '', '', '2015-10-19 11:09:53', '2015-10-19 11:09:53', '', 0, 'http://demo.astoundify.com/listify/?p=71', 0, 'post', '', 0),
(74, 1, '2014-10-23 18:59:59', '2014-10-23 18:59:59', 'OpenTable is an American public company, slated to be a wholly owned subsidiary of Priceline.com, that offers online real-time restaurant-reservation service. The firm provides online reservations at about 31,000 upscale restaurants around the world seating some 15 million diners a month.\n\nThe company was founded by Chuck Templeton in San Francisco, California, in 1998. Reservations are free to end users; the company charges restaurants monthly and per-reservation fees for their use of the system.\n\nIn 1999, the website began operations serving a limited selection of restaurants in San Francisco.[4] It has since expanded to cover more than 30,000[5] restaurants in most U.S. states as well as in several major international cities. Reservations can be made online through its website.\n\nOn June 13, 2014 the company announced it had agreed to terms with Priceline.com for that company to acquire OpenTable in a full cash deal worth $2.6 billion.', 'Book a Table Directly in Your Listing', '', 'trash', 'open', 'open', '', 'book-a-table-directly-in-your-listing', '', '', '2015-10-19 11:09:53', '2015-10-19 11:09:53', '', 0, 'http://demo.astoundify.com/listify/?p=74', 0, 'post', '', 0),
(147, 1, '2014-10-31 15:18:23', '2014-10-31 15:18:23', '', 'iphone-home-page', '', 'inherit', 'open', 'open', '', 'iphone-home-page', '', '', '2014-10-31 15:18:23', '2014-10-31 15:18:23', '', 0, 'http:localhost/wp-content/uploads/2014/10/iphone-home-page.jpg', 0, 'attachment', 'image/jpeg', 0),
(374, 1, '2014-11-11 22:51:29', '2014-11-11 22:51:29', 'Credibly innovate granular internal or "organic" sources whereas high standards in web-readiness. Energistically scale future-proof core competencies vis-a-vis impactful experiences. Dramatically synthesize integrated schemas with optimal networks.Interactively procrastinate high-payoff content without backward-compatible data. Quickly cultivate optimal processes and tactical architectures. Completely iterate covalent strategic theme areas via accurate e-markets. Globally incubate standards compliant channels before scalable benefits. Quickly disseminate superior deliverables whereas web-enabled applications.\n<h3>Our Mission Is Simple: Make Finding Business Easier.</h3>\nAn online marketplace (or online e-commerce marketplace) is a type of e-commerce site where product and inventory information is provided by multiple third parties, whereas transactions are processed by the marketplace operator. Online marketplaces are the primary type of multichannel ecommerce.In an online marketplace, consumer transactions are processed by the marketplace operator and then delivered and fulfilled by the participating retailers or wholesalers (often called drop shipping).\n<h3>Serving Your Community</h3>\nEfficiently unleash cross-media information without cross-media value. Quickly maximize timely deliverables for real-time schemas. Dramatically maintain clicks-and-mortar solutions without functional solutions. Completely synergize resource sucking relationships via premier niche markets. Professionally cultivate one-to-one customer service with robust ideas. Dynamically innovate resource-leveling customer service for state of the art customer service. Objectively innovate empowered manufactured products whereas parallel platforms. Holisticly predominate extensible testing procedures for reliable supply chains. Dramatically engage top-line web services vis-a-vis cutting-edge deliverables.\n<h2 style="text-align: center;"></h2>\n<h2 style="text-align: center;">Grow Your Business with Listify</h2>\n<p style="text-align: center;">Get started in just minutes</p>\n<p style="text-align: center;"><a class="button" href="https://demo.astoundify.com/listify/submit-listing/">Create Your Business Listing Today</a></p>\n&nbsp;', 'Driven By Our Mission', '', 'trash', 'closed', 'closed', '', 'about-listify', '', '', '2015-10-19 11:09:27', '2015-10-19 11:09:27', '', 0, 'https://demo.astoundify.com/listify/?page_id=374', 0, 'page', '', 0),
(435, 1, '2014-11-12 16:17:25', '2014-11-12 16:17:25', 'Please read these Terms of Service ("Terms", "Terms of Service") carefully before using the demo.astoundify.com/listify website (the "Service") operated by Listify ("us", "we", or "our").\r\n\r\nYour access to and use of the Service is conditioned on your acceptance of and compliance with these Terms. These Terms apply to all visitors, users and others who access or use the Service.\r\n\r\nBy accessing or using the Service you agree to be bound by these Terms. If you disagree with any part of the terms then you may not access the Service.\r\n<h2>Accounts</h2>\r\nWhen you create an account with us, you must provide us information that is accurate, complete, and current at all times. Failure to do so constitutes a breach of the Terms, which may result in immediate termination of your account on our Service.\r\n\r\nYou are responsible for safeguarding the password that you use to access the Service and for any activities or actions under your password, whether your password is with our Service or a third-party service.\r\n\r\nYou agree not to disclose your password to any third party. You must notify us immediately upon becoming aware of any breach of security or unauthorized use of your account.\r\n<h2>Links To Other Web Sites</h2>\r\nOur Service may contain links to third-party web sites or services that are not owned or controlled by Listify.\r\n\r\nListify has no control over, and assumes no responsibility for, the content, privacy policies, or practices of any third party web sites or services. You further acknowledge and agree that Listify shall not be responsible or liable, directly or indirectly, for any damage or loss caused or alleged to be caused by or in connection with use of or reliance on any such content, goods or services available on or through any such web sites or services.\r\n\r\nWe strongly advise you to read the terms and conditions and privacy policies of any third-party web sites or services that you visit.\r\n<h2>Governing Law</h2>\r\nThese Terms shall be governed and construed in accordance with the laws of Ontario, Canada, without regard to its conflict of law provisions.\r\n\r\nOur failure to enforce any right or provision of these Terms will not be considered a waiver of those rights. If any provision of these Terms is held to be invalid or unenforceable by a court, the remaining provisions of these Terms will remain in effect. These Terms constitute the entire agreement between us regarding our Service, and supersede and replace any prior agreements we might have between us regarding the Service.\r\n<h2>Changes</h2>\r\nWe reserve the right, at our sole discretion, to modify or replace these Terms at any time. If a revision is material we will try to provide at least 30 days notice prior to any new terms taking effect. What constitutes a material change will be determined at our sole discretion.\r\n\r\nBy continuing to access or use our Service after those revisions become effective, you agree to be bound by the revised terms. If you do not agree to the new terms, please stop using the Service.\r\n<h2>Contact Us</h2>\r\nIf you have any questions about these Terms, please contact us.\r\n\r\n&nbsp;\r\n', 'Terms of Service', '', 'trash', 'closed', 'closed', '', 'terms-of-service', '', '', '2015-10-19 11:09:28', '2015-10-19 11:09:28', '', 0, 'https://demo.astoundify.com/listify/?page_id=435', 0, 'page', '', 0),
(692, 1, '2014-11-20 20:02:49', '2014-11-20 20:02:49', '', 'how-it-works', '', 'inherit', 'open', 'open', '', 'how-it-works-2', '', '', '2014-11-20 20:02:49', '2014-11-20 20:02:49', '', 61, 'http:localhost/wp-content/uploads/2014/10/how-it-works.jpg', 0, 'attachment', 'image/jpeg', 0),
(698, 1, '2014-11-21 18:54:28', '2014-11-21 18:54:28', '', 'Vo7YbYQQ8iyOo4J9bOoj_ggb24', '', 'inherit', 'open', 'open', '', 'vo7ybyqq8iyoo4j9booj_ggb24', '', '', '2014-11-21 18:54:28', '2014-11-21 18:54:28', '', 0, 'http:localhost/wp-content/uploads/2014/10/Vo7YbYQQ8iyOo4J9bOoj_ggb24.jpg', 0, 'attachment', 'image/jpeg', 0),
(700, 1, '2014-11-21 18:55:49', '2014-11-21 18:55:49', '', 'ZLSw0SXxThSrkXRIiCdT_DSC_0345', '', 'inherit', 'open', 'open', '', 'zlsw0sxxthsrkxriicdt_dsc_0345', '', '', '2014-11-21 18:55:49', '2014-11-21 18:55:49', '', 0, 'http:localhost/wp-content/uploads/2014/11/ZLSw0SXxThSrkXRIiCdT_DSC_0345.jpg', 0, 'attachment', 'image/jpeg', 0),
(715, 1, '2014-11-20 21:21:26', '2014-11-20 21:21:26', '', 'listing', '', 'inherit', 'open', 'open', '', 'listing', '', '', '2014-11-20 21:21:26', '2014-11-20 21:21:26', '', 61, 'http:localhost/wp-content/uploads/2014/10/listing.png', 0, 'attachment', 'image/png', 0),
(716, 1, '2014-11-20 21:27:21', '2014-11-20 21:27:21', '', 'account', '', 'inherit', 'open', 'open', '', 'account-2', '', '', '2014-11-20 21:27:21', '2014-11-20 21:27:21', '', 61, 'http:localhost/wp-content/uploads/2014/10/account.png', 0, 'attachment', 'image/png', 0),
(804, 1, '2014-11-25 03:40:56', '2014-11-25 03:40:56', '', 'Astoundify Barbershop', '', 'inherit', 'open', 'open', '', 'astoundify-barbershop', '', '', '2014-11-25 03:40:56', '2014-11-25 03:40:56', '', 0, 'http:localhost/wp-content/uploads/2014/11/IMG_9840.jpg', 0, 'attachment', 'image/jpeg', 0),
(805, 1, '2014-11-25 03:42:08', '2014-11-25 03:42:08', '', 'SanTan Brewing Company', '', 'inherit', 'open', 'open', '', 'santan-brewing-company', '', '', '2014-11-25 03:42:08', '2014-11-25 03:42:08', '', 0, 'http:localhost/wp-content/uploads/2014/11/foodiesfeed.com_mobile_small-burger-beer.jpg', 0, 'attachment', 'image/jpeg', 0),
(806, 1, '2014-11-25 03:42:46', '2014-11-25 03:42:46', '', 'Oliver & Bonacini Café Grill', '', 'inherit', 'open', 'open', '', 'oliver-bonacini-cafe-grill', '', '', '2014-11-25 03:42:46', '2014-11-25 03:42:46', '', 0, 'http:localhost/wp-content/uploads/2014/11/foodiesfeed.com_half-of-a-chicken.jpg', 0, 'attachment', 'image/jpeg', 0),
(807, 1, '2014-11-25 03:43:18', '2014-11-25 03:43:18', '', 'Noodlecat', '', 'inherit', 'open', 'open', '', 'noodlecat', '', '', '2014-11-25 03:43:18', '2014-11-25 03:43:18', '', 0, 'http:localhost/wp-content/uploads/2014/11/15757079382_a61f5c8e62_o.jpg', 0, 'attachment', 'image/jpeg', 0),
(808, 1, '2014-11-25 03:43:45', '2014-11-25 03:43:45', '', 'Glory Hole Doughnuts', '', 'inherit', 'open', 'open', '', 'glory-hole-doughnuts', '', '', '2014-11-25 03:43:45', '2014-11-25 03:43:45', '', 0, 'http:localhost/wp-content/uploads/2014/11/foodiesfeed.com_mobile-coffee8.jpg', 0, 'attachment', 'image/jpeg', 0),
(809, 1, '2014-11-25 03:44:17', '2014-11-25 03:44:17', '', 'Four Barrel Coffee', '', 'inherit', 'open', 'open', '', 'four-barrel-coffee', '', '', '2014-11-25 03:44:17', '2014-11-25 03:44:17', '', 0, 'http:localhost/wp-content/uploads/2014/11/20140215-DSC_0362.jpg', 0, 'attachment', 'image/jpeg', 0),
(810, 1, '2014-11-25 03:45:03', '2014-11-25 03:45:03', '', 'Wine Bar Rocky River', '', 'inherit', 'open', 'open', '', 'wine-bar-rocky-river', '', '', '2014-11-25 03:45:03', '2014-11-25 03:45:03', '', 0, 'http:localhost/wp-content/uploads/2014/11/DeathtoStock_NYC19.jpg', 0, 'attachment', 'image/jpeg', 0),
(811, 1, '2014-11-25 03:45:41', '2014-11-25 03:45:41', '', 'Detour Cafe', '', 'inherit', 'open', 'open', '', 'detour-cafe', '', '', '2014-11-25 03:45:41', '2014-11-25 03:45:41', '', 0, 'http:localhost/wp-content/uploads/2014/11/IMG_0027_retouched.jpg', 0, 'attachment', 'image/jpeg', 0),
(815, 1, '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 'facebook', '', 'publish', 'closed', 'closed', '', 'facebook', '', '', '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 0, 'http:localhost/?p=815', 1, 'nav_menu_item', '', 0),
(816, 1, '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 'twitter', '', 'publish', 'closed', 'closed', '', 'twitter', '', '', '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 0, 'http:localhost/?p=816', 2, 'nav_menu_item', '', 0),
(817, 1, '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 'google', '', 'publish', 'closed', 'closed', '', 'google', '', '', '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 0, 'http:localhost/?p=817', 3, 'nav_menu_item', '', 0),
(818, 1, '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 'instagram', '', 'publish', 'closed', 'closed', '', 'instagram', '', '', '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 0, 'http:localhost/?p=818', 4, 'nav_menu_item', '', 0),
(819, 1, '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 'vimeo', '', 'publish', 'closed', 'closed', '', 'vimeo', '', '', '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 0, 'http:localhost/?p=819', 5, 'nav_menu_item', '', 0),
(826, 1, '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 'Twitter', '', 'publish', 'closed', 'closed', '', 'twitter-2', '', '', '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 0, 'http:localhost/?p=826', 1, 'nav_menu_item', '', 0),
(827, 1, '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 'Facebook', '', 'publish', 'closed', 'closed', '', 'facebook-2', '', '', '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 0, 'http:localhost/?p=827', 2, 'nav_menu_item', '', 0),
(828, 1, '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 'Google+', '', 'publish', 'closed', 'closed', '', 'google-2', '', '', '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 0, 'http:localhost/?p=828', 3, 'nav_menu_item', '', 0),
(829, 1, '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 'Instagram', '', 'publish', 'closed', 'closed', '', 'instagram-2', '', '', '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 0, 'http:localhost/?p=829', 4, 'nav_menu_item', '', 0),
(830, 1, '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 'Vimeo', '', 'publish', 'closed', 'closed', '', 'vimeo-2', '', '', '2015-10-14 10:11:02', '2015-10-14 10:11:02', '', 0, 'http:localhost/?p=830', 5, 'nav_menu_item', '', 0),
(839, 1, '2015-10-14 10:11:55', '2015-10-14 10:11:55', '', 'Edit Account', '', 'publish', 'closed', 'closed', '', 'edit-account-2', '', '', '2015-10-21 08:57:40', '2015-10-21 08:57:40', '', 0, 'http:localhost/?p=839', 5, 'nav_menu_item', '', 0),
(841, 1, '2015-10-14 10:11:55', '2015-10-14 10:11:55', '', 'facebook', '', 'publish', 'closed', 'closed', '', 'facebook-3', '', '', '2015-10-14 10:11:55', '2015-10-14 10:11:55', '', 0, 'http:localhost/?p=841', 1, 'nav_menu_item', '', 0),
(842, 1, '2015-10-14 10:11:55', '2015-10-14 10:11:55', '', 'twitter', '', 'publish', 'closed', 'closed', '', 'twitter-3', '', '', '2015-10-14 10:11:55', '2015-10-14 10:11:55', '', 0, 'http:localhost/?p=842', 2, 'nav_menu_item', '', 0),
(843, 1, '2015-10-14 10:11:55', '2015-10-14 10:11:55', '', 'google', '', 'publish', 'closed', 'closed', '', 'google-3', '', '', '2015-10-14 10:11:55', '2015-10-14 10:11:55', '', 0, 'http:localhost/?p=843', 3, 'nav_menu_item', '', 0),
(844, 1, '2015-10-14 10:11:55', '2015-10-14 10:11:55', '', 'instagram', '', 'publish', 'closed', 'closed', '', 'instagram-3', '', '', '2015-10-14 10:11:55', '2015-10-14 10:11:55', '', 0, 'http:localhost/?p=844', 4, 'nav_menu_item', '', 0),
(845, 1, '2015-10-14 10:11:56', '2015-10-14 10:11:56', '', 'vimeo', '', 'publish', 'closed', 'closed', '', 'vimeo-3', '', '', '2015-10-14 10:11:56', '2015-10-14 10:11:56', '', 0, 'http:localhost/?p=845', 5, 'nav_menu_item', '', 0),
(851, 1, '2015-10-14 10:11:56', '2015-10-14 10:11:56', '', 'Sign Out', '', 'publish', 'closed', 'closed', '', 'sign-out-2', '', '', '2015-10-21 08:57:40', '2015-10-21 08:57:40', '', 0, 'http:localhost/?p=851', 6, 'nav_menu_item', '', 0),
(852, 1, '2015-10-14 10:11:56', '2015-10-14 10:11:56', '', 'Twitter', '', 'publish', 'closed', 'closed', '', 'twitter-4', '', '', '2015-10-14 10:11:56', '2015-10-14 10:11:56', '', 0, 'http:localhost/?p=852', 1, 'nav_menu_item', '', 0),
(853, 1, '2015-10-14 10:11:56', '2015-10-14 10:11:56', '', 'Facebook', '', 'publish', 'closed', 'closed', '', 'facebook-4', '', '', '2015-10-14 10:11:56', '2015-10-14 10:11:56', '', 0, 'http:localhost/?p=853', 2, 'nav_menu_item', '', 0),
(854, 1, '2015-10-14 10:11:56', '2015-10-14 10:11:56', '', 'Google+', '', 'publish', 'closed', 'closed', '', 'google-4', '', '', '2015-10-14 10:11:56', '2015-10-14 10:11:56', '', 0, 'http:localhost/?p=854', 3, 'nav_menu_item', '', 0),
(855, 1, '2015-10-14 10:11:56', '2015-10-14 10:11:56', '', 'Instagram', '', 'publish', 'closed', 'closed', '', 'instagram-4', '', '', '2015-10-14 10:11:56', '2015-10-14 10:11:56', '', 0, 'http:localhost/?p=855', 4, 'nav_menu_item', '', 0),
(856, 1, '2015-10-14 10:11:56', '2015-10-14 10:11:56', '', 'Vimeo', '', 'publish', 'closed', 'closed', '', 'vimeo-4', '', '', '2015-10-14 10:11:56', '2015-10-14 10:11:56', '', 0, 'http:localhost/?p=856', 5, 'nav_menu_item', '', 0),
(858, 1, '2015-10-14 10:11:56', '2015-10-14 10:11:56', '', 'Sign In', '', 'publish', 'closed', 'closed', '', 'sign-in-2', '', '', '2015-10-21 08:57:40', '2015-10-21 08:57:40', '', 0, 'http:localhost/?p=858', 1, 'nav_menu_item', '', 0),
(859, 1, '2015-10-14 10:11:56', '2015-10-14 10:11:56', '', '{{account}}', '', 'publish', 'closed', 'closed', '', 'account-2', '', '', '2015-10-21 08:57:40', '2015-10-21 08:57:40', '', 0, 'http:localhost/?p=859', 3, 'nav_menu_item', '', 0),
(860, 1, '2015-10-14 10:11:56', '2015-10-14 10:11:56', '', 'Edit Listings', '', 'publish', 'closed', 'closed', '', 'edit-listings-5', '', '', '2015-10-21 08:57:40', '2015-10-21 08:57:40', '', 25, 'http:localhost/?p=860', 4, 'nav_menu_item', '', 0),
(865, 1, '2015-10-14 10:23:55', '2015-10-14 10:23:55', '<p>Your Name (required)<br />\n    [text* your-name] </p>\n\n<p>Your Email (required)<br />\n    [email* your-email] </p>\n\n<p>Subject<br />\n    [text your-subject] </p>\n\n<p>Your Message<br />\n    [textarea your-message] </p>\n\n<p>[submit "Send"]</p>\n[your-subject]\n[your-name] <wordpress@104.155.17.199>\nFrom: [your-name] <[your-email]>\nSubject: [your-subject]\n\nMessage Body:\n[your-message]\n\n--\nThis e-mail was sent from a contact form on babyhallo (http:localhost)\nnick.j.goodall@gmail.com\nReply-To: [your-email]\n\n0\n0\n\n[your-subject]\nbabyhallo <wordpress@104.155.17.199>\nMessage Body:\n[your-message]\n\n--\nThis e-mail was sent from a contact form on babyhallo (http:localhost)\n[your-email]\nReply-To: nick.j.goodall@gmail.com\n\n0\n0\nYour message was sent successfully. Thanks.\nFailed to send your message. Please try later or contact the administrator by another method.\nValidation errors occurred. Please confirm the fields and submit it again.\nFailed to send your message. Please try later or contact the administrator by another method.\nPlease accept the terms to proceed.\nPlease fill in the required field.\nThis input is too long.\nThis input is too short.', 'Contact form 1', '', 'publish', 'closed', 'closed', '', 'contact-form-1', '', '', '2015-10-14 10:23:55', '2015-10-14 10:23:55', '', 0, 'http:localhost/?post_type=wpcf7_contact_form&p=865', 0, 'wpcf7_contact_form', '', 0),
(866, 1, '2015-10-14 10:36:21', '2015-10-14 10:36:21', '', 'babyhallo-text-100x35', '', 'inherit', 'open', 'closed', '', 'babyhallo-text-100x35', '', '', '2015-10-14 10:36:21', '2015-10-14 10:36:21', '', 0, 'http:localhost/wp-content/uploads/2015/10/babyhallo-text-100x35.png', 0, 'attachment', 'image/png', 0),
(867, 1, '2015-10-14 10:39:18', '2015-10-14 10:39:18', '', 'babyhallo-text-white', '', 'inherit', 'open', 'closed', '', 'babyhallo-text-white', '', '', '2015-10-14 10:39:18', '2015-10-14 10:39:18', '', 0, 'http:localhost/wp-content/uploads/2015/10/babyhallo-text-white.png', 0, 'attachment', 'image/png', 0),
(868, 1, '2015-10-14 11:43:25', '2015-10-14 11:43:25', '', 'Auto Draft', '', 'trash', 'closed', 'closed', '', 'auto-draft', '', '', '2015-10-14 11:44:13', '2015-10-14 11:44:13', '', 0, 'http:localhost/?page_id=868', 0, 'page', '', 0),
(869, 1, '2015-10-14 11:44:13', '2015-10-14 11:44:13', '', 'Auto Draft', '', 'inherit', 'closed', 'closed', '', '868-revision-v1', '', '', '2015-10-14 11:44:13', '2015-10-14 11:44:13', '', 868, 'http:localhost/?p=869', 0, 'revision', '', 0),
(870, 1, '2015-10-14 12:17:01', '2015-10-14 12:17:01', '', 'family-commons-clipped', '', 'inherit', 'open', 'closed', '', 'family-commons-clipped', '', '', '2015-10-14 12:17:01', '2015-10-14 12:17:01', '', 11, 'http:localhost/wp-content/uploads/2015/10/family-commons-clipped.jpg', 0, 'attachment', 'image/jpeg', 0),
(874, 1, '2015-10-15 11:42:21', '2015-10-15 11:42:21', '', 'job_description', '', 'publish', 'closed', 'closed', '', 'job_description', '', '', '2015-10-15 11:42:21', '2015-10-15 11:42:21', '', 0, 'http:localhost/?jmfe_custom_fields=job_description', 0, 'jmfe_custom_fields', '', 0),
(875, 1, '2015-10-15 11:42:30', '2015-10-15 11:42:30', '', 'gallery_images', '', 'publish', 'closed', 'closed', '', 'gallery_images', '', '', '2015-10-15 11:42:30', '2015-10-15 11:42:30', '', 0, 'http:localhost/?jmfe_custom_fields=gallery_images', 0, 'jmfe_custom_fields', '', 0),
(876, 1, '2015-10-15 11:42:34', '2015-10-15 11:42:34', '', 'featured_image', '', 'publish', 'closed', 'closed', '', 'featured_image', '', '', '2015-10-15 11:42:34', '2015-10-15 11:42:34', '', 0, 'http:localhost/?jmfe_custom_fields=featured_image', 0, 'jmfe_custom_fields', '', 0),
(877, 1, '2015-10-15 11:42:37', '2015-10-15 11:42:37', '', 'job_hours', '', 'publish', 'closed', 'closed', '', 'job_hours', '', '', '2015-10-15 11:42:37', '2015-10-15 11:42:37', '', 0, 'http:localhost/?jmfe_custom_fields=job_hours', 0, 'jmfe_custom_fields', '', 0),
(878, 1, '2015-10-15 11:42:39', '2015-10-15 11:42:39', '', 'application', '', 'publish', 'closed', 'closed', '', 'application', '', '', '2015-10-15 11:42:39', '2015-10-15 11:42:39', '', 0, 'http:localhost/?jmfe_custom_fields=application', 0, 'jmfe_custom_fields', '', 0),
(879, 1, '2015-10-15 11:42:42', '2015-10-15 11:42:42', '', 'job_region', '', 'publish', 'closed', 'closed', '', 'job_region', '', '', '2015-10-15 11:42:42', '2015-10-15 11:42:42', '', 0, 'http:localhost/?jmfe_custom_fields=job_region', 0, 'jmfe_custom_fields', '', 0),
(880, 1, '2015-10-15 11:42:46', '2015-10-15 11:42:46', '', 'job_location', '', 'publish', 'closed', 'closed', '', 'job_location', '', '', '2015-10-15 11:42:46', '2015-10-15 11:42:46', '', 0, 'http:localhost/?jmfe_custom_fields=job_location', 0, 'jmfe_custom_fields', '', 0),
(881, 1, '2015-10-15 11:50:21', '2015-10-15 11:50:21', '', 'job_title', '', 'publish', 'closed', 'closed', '', 'job_title', '', '', '2015-10-15 11:50:21', '2015-10-15 11:50:21', '', 0, 'http:localhost/?jmfe_custom_fields=job_title', 0, 'jmfe_custom_fields', '', 0),
(882, 1, '2015-10-15 11:52:26', '2015-10-15 11:52:26', '', 'bh_bio', '', 'publish', 'closed', 'closed', '', 'bh_bio', '', '', '2015-10-15 11:52:26', '2015-10-15 11:52:26', '', 0, 'http:localhost/?jmfe_custom_fields=bh_bio', 0, 'jmfe_custom_fields', '', 0),
(883, 1, '2015-10-15 11:53:45', '2015-10-15 11:53:45', '', 'bh_insurance', '', 'publish', 'closed', 'closed', '', 'bh_insurance', '', '', '2015-10-15 11:53:45', '2015-10-15 11:53:45', '', 0, 'http:localhost/?jmfe_custom_fields=bh_insurance', 0, 'jmfe_custom_fields', '', 0),
(884, 1, '2015-10-15 11:57:29', '2015-10-15 11:57:29', '', 'bh_services', '', 'publish', 'closed', 'closed', '', 'bh_services', '', '', '2015-10-15 11:57:29', '2015-10-15 11:57:29', '', 0, 'http:localhost/?jmfe_custom_fields=bh_services', 0, 'jmfe_custom_fields', '', 0),
(885, 1, '2015-10-15 11:58:24', '2015-10-15 11:58:24', '', 'bh_experience', '', 'publish', 'closed', 'closed', '', 'bh_experience', '', '', '2015-10-15 11:58:24', '2015-10-15 11:58:24', '', 0, 'http:localhost/?jmfe_custom_fields=bh_experience', 0, 'jmfe_custom_fields', '', 0),
(888, 1, '2015-10-15 15:28:04', '2015-10-15 15:28:04', 'Find a Midwife near you\r\n\r\n[facetwp facet="location"]', 'Search for a Midwife', '', 'inherit', 'closed', 'closed', '', '11-revision-v1', '', '', '2015-10-15 15:28:04', '2015-10-15 15:28:04', '', 11, 'http:localhost/?p=888', 0, 'revision', '', 0),
(889, 1, '2015-10-15 15:28:36', '2015-10-15 15:28:36', 'Find a Midwife near you', 'Search for a Midwife', '', 'inherit', 'closed', 'closed', '', '11-revision-v1', '', '', '2015-10-15 15:28:36', '2015-10-15 15:28:36', '', 11, 'http:localhost/?p=889', 0, 'revision', '', 0),
(890, 1, '2015-10-15 15:28:47', '2015-10-15 15:28:47', 'Please read these Terms of Service ("Terms", "Terms of Service") carefully before using the demo.astoundify.com/listify website (the "Service") operated by Listify ("us", "we", or "our").\r\n\r\nYour access to and use of the Service is conditioned on your acceptance of and compliance with these Terms. These Terms apply to all visitors, users and others who access or use the Service.\r\n\r\nBy accessing or using the Service you agree to be bound by these Terms. If you disagree with any part of the terms then you may not access the Service.\r\n<h2>Accounts</h2>\r\nWhen you create an account with us, you must provide us information that is accurate, complete, and current at all times. Failure to do so constitutes a breach of the Terms, which may result in immediate termination of your account on our Service.\r\n\r\nYou are responsible for safeguarding the password that you use to access the Service and for any activities or actions under your password, whether your password is with our Service or a third-party service.\r\n\r\nYou agree not to disclose your password to any third party. You must notify us immediately upon becoming aware of any breach of security or unauthorized use of your account.\r\n<h2>Links To Other Web Sites</h2>\r\nOur Service may contain links to third-party web sites or services that are not owned or controlled by Listify.\r\n\r\nListify has no control over, and assumes no responsibility for, the content, privacy policies, or practices of any third party web sites or services. You further acknowledge and agree that Listify shall not be responsible or liable, directly or indirectly, for any damage or loss caused or alleged to be caused by or in connection with use of or reliance on any such content, goods or services available on or through any such web sites or services.\r\n\r\nWe strongly advise you to read the terms and conditions and privacy policies of any third-party web sites or services that you visit.\r\n<h2>Governing Law</h2>\r\nThese Terms shall be governed and construed in accordance with the laws of Ontario, Canada, without regard to its conflict of law provisions.\r\n\r\nOur failure to enforce any right or provision of these Terms will not be considered a waiver of those rights. If any provision of these Terms is held to be invalid or unenforceable by a court, the remaining provisions of these Terms will remain in effect. These Terms constitute the entire agreement between us regarding our Service, and supersede and replace any prior agreements we might have between us regarding the Service.\r\n<h2>Changes</h2>\r\nWe reserve the right, at our sole discretion, to modify or replace these Terms at any time. If a revision is material we will try to provide at least 30 days notice prior to any new terms taking effect. What constitutes a material change will be determined at our sole discretion.\r\n\r\nBy continuing to access or use our Service after those revisions become effective, you agree to be bound by the revised terms. If you do not agree to the new terms, please stop using the Service.\r\n<h2>Contact Us</h2>\r\nIf you have any questions about these Terms, please contact us.\r\n\r\n&nbsp;\r\n\r\n[facetwp facet="location"]', 'Terms of Service', '', 'inherit', 'closed', 'closed', '', '435-revision-v1', '', '', '2015-10-15 15:28:47', '2015-10-15 15:28:47', '', 435, 'http:localhost/?p=890', 0, 'revision', '', 0),
(891, 1, '2015-10-15 15:31:06', '2015-10-15 15:31:06', 'Please read these Terms of Service ("Terms", "Terms of Service") carefully before using the demo.astoundify.com/listify website (the "Service") operated by Listify ("us", "we", or "our").\n\nYour access to and use of the Service is conditioned on your acceptance of and compliance with these Terms. These Terms apply to all visitors, users and others who access or use the Service.\n\nBy accessing or using the Service you agree to be bound by these Terms. If you disagree with any part of the terms then you may not access the Service.\n<h2>Accounts</h2>\nWhen you create an account with us, you must provide us information that is accurate, complete, and current at all times. Failure to do so constitutes a breach of the Terms, which may result in immediate termination of your account on our Service.\n\nYou are responsible for safeguarding the password that you use to access the Service and for any activities or actions under your password, whether your password is with our Service or a third-party service.\n\nYou agree not to disclose your password to any third party. You must notify us immediately upon becoming aware of any breach of security or unauthorized use of your account.\n<h2>Links To Other Web Sites</h2>\nOur Service may contain links to third-party web sites or services that are not owned or controlled by Listify.\n\nListify has no control over, and assumes no responsibility for, the content, privacy policies, or practices of any third party web sites or services. You further acknowledge and agree that Listify shall not be responsible or liable, directly or indirectly, for any damage or loss caused or alleged to be caused by or in connection with use of or reliance on any such content, goods or services available on or through any such web sites or services.\n\nWe strongly advise you to read the terms and conditions and privacy policies of any third-party web sites or services that you visit.\n<h2>Governing Law</h2>\nThese Terms shall be governed and construed in accordance with the laws of Ontario, Canada, without regard to its conflict of law provisions.\n\nOur failure to enforce any right or provision of these Terms will not be considered a waiver of those rights. If any provision of these Terms is held to be invalid or unenforceable by a court, the remaining provisions of these Terms will remain in effect. These Terms constitute the entire agreement between us regarding our Service, and supersede and replace any prior agreements we might have between us regarding the Service.\n<h2>Changes</h2>\nWe reserve the right, at our sole discretion, to modify or replace these Terms at any time. If a revision is material we will try to provide at least 30 days notice prior to any new terms taking effect. What constitutes a material change will be determined at our sole discretion.\n\nBy continuing to access or use our Service after those revisions become effective, you agree to be bound by the revised terms. If you do not agree to the new terms, please stop using the Service.\n<h2>Contact Us</h2>\nIf you have any questions about these Terms, please contact us.\n\n&nbsp;\n\n<div class="search_location">hello you[facetwp facet=\'location\']</div>\n', 'Terms of Service', '', 'inherit', 'closed', 'closed', '', '435-autosave-v1', '', '', '2015-10-15 15:31:06', '2015-10-15 15:31:06', '', 435, 'http:localhost/?p=891', 0, 'revision', '', 0),
(892, 1, '2015-10-15 15:29:22', '2015-10-15 15:29:22', 'Please read these Terms of Service ("Terms", "Terms of Service") carefully before using the demo.astoundify.com/listify website (the "Service") operated by Listify ("us", "we", or "our").\r\n\r\nYour access to and use of the Service is conditioned on your acceptance of and compliance with these Terms. These Terms apply to all visitors, users and others who access or use the Service.\r\n\r\nBy accessing or using the Service you agree to be bound by these Terms. If you disagree with any part of the terms then you may not access the Service.\r\n<h2>Accounts</h2>\r\nWhen you create an account with us, you must provide us information that is accurate, complete, and current at all times. Failure to do so constitutes a breach of the Terms, which may result in immediate termination of your account on our Service.\r\n\r\nYou are responsible for safeguarding the password that you use to access the Service and for any activities or actions under your password, whether your password is with our Service or a third-party service.\r\n\r\nYou agree not to disclose your password to any third party. You must notify us immediately upon becoming aware of any breach of security or unauthorized use of your account.\r\n<h2>Links To Other Web Sites</h2>\r\nOur Service may contain links to third-party web sites or services that are not owned or controlled by Listify.\r\n\r\nListify has no control over, and assumes no responsibility for, the content, privacy policies, or practices of any third party web sites or services. You further acknowledge and agree that Listify shall not be responsible or liable, directly or indirectly, for any damage or loss caused or alleged to be caused by or in connection with use of or reliance on any such content, goods or services available on or through any such web sites or services.\r\n\r\nWe strongly advise you to read the terms and conditions and privacy policies of any third-party web sites or services that you visit.\r\n<h2>Governing Law</h2>\r\nThese Terms shall be governed and construed in accordance with the laws of Ontario, Canada, without regard to its conflict of law provisions.\r\n\r\nOur failure to enforce any right or provision of these Terms will not be considered a waiver of those rights. If any provision of these Terms is held to be invalid or unenforceable by a court, the remaining provisions of these Terms will remain in effect. These Terms constitute the entire agreement between us regarding our Service, and supersede and replace any prior agreements we might have between us regarding the Service.\r\n<h2>Changes</h2>\r\nWe reserve the right, at our sole discretion, to modify or replace these Terms at any time. If a revision is material we will try to provide at least 30 days notice prior to any new terms taking effect. What constitutes a material change will be determined at our sole discretion.\r\n\r\nBy continuing to access or use our Service after those revisions become effective, you agree to be bound by the revised terms. If you do not agree to the new terms, please stop using the Service.\r\n<h2>Contact Us</h2>\r\nIf you have any questions about these Terms, please contact us.\r\n\r\n&nbsp;\r\n\r\n[facetwp facet=\'location\']', 'Terms of Service', '', 'inherit', 'closed', 'closed', '', '435-revision-v1', '', '', '2015-10-15 15:29:22', '2015-10-15 15:29:22', '', 435, 'http:localhost/?p=892', 0, 'revision', '', 0) ;
INSERT INTO `wp_posts` ( `ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(893, 1, '2015-10-15 15:30:43', '2015-10-15 15:30:43', 'Please read these Terms of Service ("Terms", "Terms of Service") carefully before using the demo.astoundify.com/listify website (the "Service") operated by Listify ("us", "we", or "our").\r\n\r\nYour access to and use of the Service is conditioned on your acceptance of and compliance with these Terms. These Terms apply to all visitors, users and others who access or use the Service.\r\n\r\nBy accessing or using the Service you agree to be bound by these Terms. If you disagree with any part of the terms then you may not access the Service.\r\n<h2>Accounts</h2>\r\nWhen you create an account with us, you must provide us information that is accurate, complete, and current at all times. Failure to do so constitutes a breach of the Terms, which may result in immediate termination of your account on our Service.\r\n\r\nYou are responsible for safeguarding the password that you use to access the Service and for any activities or actions under your password, whether your password is with our Service or a third-party service.\r\n\r\nYou agree not to disclose your password to any third party. You must notify us immediately upon becoming aware of any breach of security or unauthorized use of your account.\r\n<h2>Links To Other Web Sites</h2>\r\nOur Service may contain links to third-party web sites or services that are not owned or controlled by Listify.\r\n\r\nListify has no control over, and assumes no responsibility for, the content, privacy policies, or practices of any third party web sites or services. You further acknowledge and agree that Listify shall not be responsible or liable, directly or indirectly, for any damage or loss caused or alleged to be caused by or in connection with use of or reliance on any such content, goods or services available on or through any such web sites or services.\r\n\r\nWe strongly advise you to read the terms and conditions and privacy policies of any third-party web sites or services that you visit.\r\n<h2>Governing Law</h2>\r\nThese Terms shall be governed and construed in accordance with the laws of Ontario, Canada, without regard to its conflict of law provisions.\r\n\r\nOur failure to enforce any right or provision of these Terms will not be considered a waiver of those rights. If any provision of these Terms is held to be invalid or unenforceable by a court, the remaining provisions of these Terms will remain in effect. These Terms constitute the entire agreement between us regarding our Service, and supersede and replace any prior agreements we might have between us regarding the Service.\r\n<h2>Changes</h2>\r\nWe reserve the right, at our sole discretion, to modify or replace these Terms at any time. If a revision is material we will try to provide at least 30 days notice prior to any new terms taking effect. What constitutes a material change will be determined at our sole discretion.\r\n\r\nBy continuing to access or use our Service after those revisions become effective, you agree to be bound by the revised terms. If you do not agree to the new terms, please stop using the Service.\r\n<h2>Contact Us</h2>\r\nIf you have any questions about these Terms, please contact us.\r\n\r\n&nbsp;\r\n\r\n<div class="search_location">[facetwp facet=\'location\']</div>\r\n', 'Terms of Service', '', 'inherit', 'closed', 'closed', '', '435-revision-v1', '', '', '2015-10-15 15:30:43', '2015-10-15 15:30:43', '', 435, 'http:localhost/?p=893', 0, 'revision', '', 0),
(894, 1, '2015-10-15 15:31:08', '2015-10-15 15:31:08', 'Please read these Terms of Service ("Terms", "Terms of Service") carefully before using the demo.astoundify.com/listify website (the "Service") operated by Listify ("us", "we", or "our").\r\n\r\nYour access to and use of the Service is conditioned on your acceptance of and compliance with these Terms. These Terms apply to all visitors, users and others who access or use the Service.\r\n\r\nBy accessing or using the Service you agree to be bound by these Terms. If you disagree with any part of the terms then you may not access the Service.\r\n<h2>Accounts</h2>\r\nWhen you create an account with us, you must provide us information that is accurate, complete, and current at all times. Failure to do so constitutes a breach of the Terms, which may result in immediate termination of your account on our Service.\r\n\r\nYou are responsible for safeguarding the password that you use to access the Service and for any activities or actions under your password, whether your password is with our Service or a third-party service.\r\n\r\nYou agree not to disclose your password to any third party. You must notify us immediately upon becoming aware of any breach of security or unauthorized use of your account.\r\n<h2>Links To Other Web Sites</h2>\r\nOur Service may contain links to third-party web sites or services that are not owned or controlled by Listify.\r\n\r\nListify has no control over, and assumes no responsibility for, the content, privacy policies, or practices of any third party web sites or services. You further acknowledge and agree that Listify shall not be responsible or liable, directly or indirectly, for any damage or loss caused or alleged to be caused by or in connection with use of or reliance on any such content, goods or services available on or through any such web sites or services.\r\n\r\nWe strongly advise you to read the terms and conditions and privacy policies of any third-party web sites or services that you visit.\r\n<h2>Governing Law</h2>\r\nThese Terms shall be governed and construed in accordance with the laws of Ontario, Canada, without regard to its conflict of law provisions.\r\n\r\nOur failure to enforce any right or provision of these Terms will not be considered a waiver of those rights. If any provision of these Terms is held to be invalid or unenforceable by a court, the remaining provisions of these Terms will remain in effect. These Terms constitute the entire agreement between us regarding our Service, and supersede and replace any prior agreements we might have between us regarding the Service.\r\n<h2>Changes</h2>\r\nWe reserve the right, at our sole discretion, to modify or replace these Terms at any time. If a revision is material we will try to provide at least 30 days notice prior to any new terms taking effect. What constitutes a material change will be determined at our sole discretion.\r\n\r\nBy continuing to access or use our Service after those revisions become effective, you agree to be bound by the revised terms. If you do not agree to the new terms, please stop using the Service.\r\n<h2>Contact Us</h2>\r\nIf you have any questions about these Terms, please contact us.\r\n\r\n&nbsp;\r\n\r\n<div class="search_location">hello you[facetwp facet=\'location\']</div>\r\n', 'Terms of Service', '', 'inherit', 'closed', 'closed', '', '435-revision-v1', '', '', '2015-10-15 15:31:08', '2015-10-15 15:31:08', '', 435, 'http:localhost/?p=894', 0, 'revision', '', 0),
(895, 1, '2015-10-15 15:36:06', '2015-10-15 15:36:06', 'Please read these Terms of Service ("Terms", "Terms of Service") carefully before using the demo.astoundify.com/listify website (the "Service") operated by Listify ("us", "we", or "our").\r\n\r\nYour access to and use of the Service is conditioned on your acceptance of and compliance with these Terms. These Terms apply to all visitors, users and others who access or use the Service.\r\n\r\nBy accessing or using the Service you agree to be bound by these Terms. If you disagree with any part of the terms then you may not access the Service.\r\n<h2>Accounts</h2>\r\nWhen you create an account with us, you must provide us information that is accurate, complete, and current at all times. Failure to do so constitutes a breach of the Terms, which may result in immediate termination of your account on our Service.\r\n\r\nYou are responsible for safeguarding the password that you use to access the Service and for any activities or actions under your password, whether your password is with our Service or a third-party service.\r\n\r\nYou agree not to disclose your password to any third party. You must notify us immediately upon becoming aware of any breach of security or unauthorized use of your account.\r\n<h2>Links To Other Web Sites</h2>\r\nOur Service may contain links to third-party web sites or services that are not owned or controlled by Listify.\r\n\r\nListify has no control over, and assumes no responsibility for, the content, privacy policies, or practices of any third party web sites or services. You further acknowledge and agree that Listify shall not be responsible or liable, directly or indirectly, for any damage or loss caused or alleged to be caused by or in connection with use of or reliance on any such content, goods or services available on or through any such web sites or services.\r\n\r\nWe strongly advise you to read the terms and conditions and privacy policies of any third-party web sites or services that you visit.\r\n<h2>Governing Law</h2>\r\nThese Terms shall be governed and construed in accordance with the laws of Ontario, Canada, without regard to its conflict of law provisions.\r\n\r\nOur failure to enforce any right or provision of these Terms will not be considered a waiver of those rights. If any provision of these Terms is held to be invalid or unenforceable by a court, the remaining provisions of these Terms will remain in effect. These Terms constitute the entire agreement between us regarding our Service, and supersede and replace any prior agreements we might have between us regarding the Service.\r\n<h2>Changes</h2>\r\nWe reserve the right, at our sole discretion, to modify or replace these Terms at any time. If a revision is material we will try to provide at least 30 days notice prior to any new terms taking effect. What constitutes a material change will be determined at our sole discretion.\r\n\r\nBy continuing to access or use our Service after those revisions become effective, you agree to be bound by the revised terms. If you do not agree to the new terms, please stop using the Service.\r\n<h2>Contact Us</h2>\r\nIf you have any questions about these Terms, please contact us.\r\n\r\n&nbsp;\r\n', 'Terms of Service', '', 'inherit', 'closed', 'closed', '', '435-revision-v1', '', '', '2015-10-15 15:36:06', '2015-10-15 15:36:06', '', 435, 'http:localhost/?p=895', 0, 'revision', '', 0),
(896, 1, '2015-10-15 15:58:30', '2015-10-15 15:58:30', '', 'nick', '', 'trash', 'open', 'closed', '', 'london-se193rw-united-kingdom-nick', '', '', '2015-10-20 10:16:02', '2015-10-20 10:16:02', '', 0, 'http:localhost/?job_listing=london-se193rw-united-kingdom-nick', 0, 'job_listing', '', 0),
(898, 1, '2015-10-19 11:09:27', '2015-10-19 11:09:27', '', 'Blog', '', 'inherit', 'closed', 'closed', '', '15-revision-v1', '', '', '2015-10-19 11:09:27', '2015-10-19 11:09:27', '', 15, 'http:localhost/?p=898', 0, 'revision', '', 0),
(899, 1, '2015-10-19 11:09:27', '2015-10-19 11:09:27', 'Credibly innovate granular internal or "organic" sources whereas high standards in web-readiness. Energistically scale future-proof core competencies vis-a-vis impactful experiences. Dramatically synthesize integrated schemas with optimal networks.Interactively procrastinate high-payoff content without backward-compatible data. Quickly cultivate optimal processes and tactical architectures. Completely iterate covalent strategic theme areas via accurate e-markets. Globally incubate standards compliant channels before scalable benefits. Quickly disseminate superior deliverables whereas web-enabled applications.\n<h3>Our Mission Is Simple: Make Finding Business Easier.</h3>\nAn online marketplace (or online e-commerce marketplace) is a type of e-commerce site where product and inventory information is provided by multiple third parties, whereas transactions are processed by the marketplace operator. Online marketplaces are the primary type of multichannel ecommerce.In an online marketplace, consumer transactions are processed by the marketplace operator and then delivered and fulfilled by the participating retailers or wholesalers (often called drop shipping).\n<h3>Serving Your Community</h3>\nEfficiently unleash cross-media information without cross-media value. Quickly maximize timely deliverables for real-time schemas. Dramatically maintain clicks-and-mortar solutions without functional solutions. Completely synergize resource sucking relationships via premier niche markets. Professionally cultivate one-to-one customer service with robust ideas. Dynamically innovate resource-leveling customer service for state of the art customer service. Objectively innovate empowered manufactured products whereas parallel platforms. Holisticly predominate extensible testing procedures for reliable supply chains. Dramatically engage top-line web services vis-a-vis cutting-edge deliverables.\n<h2 style="text-align: center;"></h2>\n<h2 style="text-align: center;">Grow Your Business with Listify</h2>\n<p style="text-align: center;">Get started in just minutes</p>\n<p style="text-align: center;"><a class="button" href="https://demo.astoundify.com/listify/submit-listing/">Create Your Business Listing Today</a></p>\n&nbsp;', 'Driven By Our Mission', '', 'inherit', 'closed', 'closed', '', '374-revision-v1', '', '', '2015-10-19 11:09:27', '2015-10-19 11:09:27', '', 374, 'http:localhost/?p=899', 0, 'revision', '', 0),
(900, 1, '2015-10-19 11:09:27', '2015-10-19 11:09:27', '<h3 class="ion-person-add">1. Create An Account</h3>\n<img class="alignright wp-image-694 size-full" src="http:localhost/wp-content/uploads/2014/10/account.png" alt="feature_sessionPlayback" width="490" />\n\nCreating an account with Listify is easy, with the social login feature it allows your visitors to login easily, so that they won\'t have the “login/register” friction. They\'ll be creating, rating and favouriting listings in no time!\n\nWe’ve even integrated with WooCommerce so that the <a href="http://www.woothemes.com/products/woocommerce-social-login/">Social Login by WooCommerce plugin</a> (Plugin sold separately) and the standard WooCommerce sign up process is fully supported.\n\n<a class="button" href="http://themeforest.net/item/jobify-job-board-wordpress-theme/5247604?ref=Astoundify">How It Works</a>\n<br /></br>\n<h3 class="ion-compose">2. Submit Your Listing</h3>\n<img class="alignleft wp-image-694 size-full" src="http:localhost/wp-content/uploads/2014/10/listing.png" alt="feature_sessionPlayback" width="490" />\nSubmitting a listing using Listify is super simple, we\'ve made entering the address of your place easy, when using our Google Places API plugin (Plugin sold separately) it will auto complete the listing address.\n\nYou can even fully customize your submission form either using PHP code using this <a href="https://wpjobmanager.com/document/editing-job-submission-fields/">tutorial</a> or by installing the <a href="https://plugins.smyl.es/wp-job-manager-field-editor/">Form Editor plugin</a> (Plugin sold separately) this gives you full control over the display of the fields that are shown on your submission form.\n\n<a class="button" href="http://themeforest.net/item/jobify-job-board-wordpress-theme/5247604?ref=Astoundify">Submit Your Listing</a>\n<br /></br>\n<h3 class="ion-bag">3. Get More Interest In Your Place</h3>\nThis won’t be the first time you look for a listing directory theme, but it may be the last time. Because with Listify you have more than you could ever want or need.\n\nWhen using Listify your site will be a thing of beauty. Let’s be honest. The problem with most listing directories, while highly functional, is that many of them aren’t very pretty. It’s why the beautiful ones are so popular, because they match great photography with fantastic functionality.\n\nThat’s what we’ve done with Listify.', 'How It Works', '', 'inherit', 'closed', 'closed', '', '61-revision-v1', '', '', '2015-10-19 11:09:27', '2015-10-19 11:09:27', '', 61, 'http:localhost/?p=900', 0, 'revision', '', 0),
(901, 1, '2015-10-19 11:09:27', '2015-10-19 11:09:27', '', 'Plans and Pricing', '', 'inherit', 'closed', 'closed', '', '55-revision-v1', '', '', '2015-10-19 11:09:27', '2015-10-19 11:09:27', '', 55, 'http:localhost/?p=901', 0, 'revision', '', 0),
(902, 1, '2015-10-19 11:09:28', '2015-10-19 11:09:28', 'This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\n\n<blockquote>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</blockquote>\n\n...or something like this:\n\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\n\nAs a new WordPress user, you should go to <a href="http:localhost/wp-admin/">your dashboard</a> to delete this page and create new pages for your content. Have fun!', 'Sample Page', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2015-10-19 11:09:28', '2015-10-19 11:09:28', '', 2, 'http:localhost/?p=902', 0, 'revision', '', 0),
(903, 1, '2015-10-19 11:09:28', '2015-10-19 11:09:28', '[video width="1280" height="720" loop="true" autoplay="true" preload="auto" mp4="https://f6ca679df901af69ace6-d3d26a34307edc4f7eeb40d85a64c4a7.ssl.cf5.rackcdn.com/listify-loops.mp4" webm="https://f6ca679df901af69ace6-d3d26a34307edc4f7eeb40d85a64c4a7.ssl.cf5.rackcdn.com/listify-loops.webm"][/video]\n\nListify helps you find out whats happening in your city, Let\'s explore.', 'Search Your City', '', 'inherit', 'closed', 'closed', '', '6-revision-v1', '', '', '2015-10-19 11:09:28', '2015-10-19 11:09:28', '', 6, 'http:localhost/?p=903', 0, 'revision', '', 0),
(904, 1, '2015-10-19 11:09:53', '2015-10-19 11:09:53', 'Welcome to WordPress. This is your first post. Edit or delete it, then start writing!', 'Hello world!', '', 'inherit', 'closed', 'closed', '', '1-revision-v1', '', '', '2015-10-19 11:09:53', '2015-10-19 11:09:53', '', 1, 'http:localhost/?p=904', 0, 'revision', '', 0),
(905, 1, '2015-10-19 11:09:53', '2015-10-19 11:09:53', 'OpenTable is an American public company, slated to be a wholly owned subsidiary of Priceline.com, that offers online real-time restaurant-reservation service. The firm provides online reservations at about 31,000 upscale restaurants around the world seating some 15 million diners a month.\n\nThe company was founded by Chuck Templeton in San Francisco, California, in 1998. Reservations are free to end users; the company charges restaurants monthly and per-reservation fees for their use of the system.\n\nIn 1999, the website began operations serving a limited selection of restaurants in San Francisco.[4] It has since expanded to cover more than 30,000[5] restaurants in most U.S. states as well as in several major international cities. Reservations can be made online through its website.\n\nOn June 13, 2014 the company announced it had agreed to terms with Priceline.com for that company to acquire OpenTable in a full cash deal worth $2.6 billion.', 'Book a Table Directly in Your Listing', '', 'inherit', 'closed', 'closed', '', '74-revision-v1', '', '', '2015-10-19 11:09:53', '2015-10-19 11:09:53', '', 74, 'http:localhost/?p=905', 0, 'revision', '', 0),
(906, 1, '2015-10-19 11:09:53', '2015-10-19 11:09:53', 'Online advertising, also called online marketing or Internet advertising, is a form of marketing and advertising which uses the Internet to deliver promotional marketing messages to consumers. It includes email marketing, search engine marketing (SEM), social media marketing, many types of display advertising (including web banner advertising), and mobile advertising. Like other advertising media, online advertising frequently involves both a publisher, who integrates advertisements into its online content, and an advertiser, who provides the advertisements to be displayed on the publisher\'s content. Other potential participants include advertising agencies who help generate and place the ad copy, an ad server who technologically delivers the ad and tracks statistics, and advertising affiliates who do independent promotional work for the advertiser.\n<blockquote>Online advertising is a large business and is growing rapidly.</blockquote>\nIn 2011, Internet advertising revenues in the United States surpassed those of cable television and nearly exceeded those of broadcast television.:19 In 2012, Internet advertising revenues in the United States totaled $36.57 billion, a 15.2% increase over the $31.74 billion in revenues in 2011. U.S. internet ad revenue hit a historic high of $20.1 billion for the first half of 2013, up 18% over the same period in 2012. Online advertising is widely used across virtually all industry sectors.\n\nMany common online advertising practices are controversial and increasingly subject to regulation. Online ad revenues may not adequately replace other publishers\' revenue streams. Declining ad revenue has led some publishers to hide their content behind paywalls.', 'Converting Online Visits to Offline Sales', '', 'inherit', 'closed', 'closed', '', '71-revision-v1', '', '', '2015-10-19 11:09:53', '2015-10-19 11:09:53', '', 71, 'http:localhost/?p=906', 0, 'revision', '', 0),
(907, 1, '2015-10-19 11:09:53', '2015-10-19 11:09:53', 'A Business directory or business directory is a website or printed listing of information which lists all businesses within some category. Businesses can be categorized by business, location, activity, or size. Business may be compiled either manually or through an automated online search software. Online yellow pages are a type of business directory, as is the traditional phone book.\n\nThe details provided in a business directory varies from business to business. They may include the business name, addresses, telephone numbers, location, type of service or products the business provides, number of employees, the service region and any professional associations. Some directories include a section for user reviews, comments, and feedback. Business directories in the past would take a printed format but have recently been upgraded to websites due to the advent of the internet.\n<h2>Arts</h2>\nThe arts are a vast subdivision of culture, composed of many creative endeavors and disciplines. It is a broader term than "art", which as a description of a field usually means only the visual arts. The arts encompass the visual arts, the literary arts and the performing arts – music, theatre, dance and film, among others. This list is by no means comprehensive, but only meant to introduce the concept of the arts. For all intents and purposes, the history of the arts begins with the history of art. The arts might have origins in early human evolutionary prehistory. According to a recent suggestion, several forms of audio and visual arts (rhythmic singing and drumming on external objects, dancing, body and face painting) were developed very early in hominid evolution by the forces of natural selection in order to reach an altered state of consciousness.', 'Increasing Daily Foot Traffic', '', 'inherit', 'closed', 'closed', '', '67-revision-v1', '', '', '2015-10-19 11:09:53', '2015-10-19 11:09:53', '', 67, 'http:localhost/?p=907', 0, 'revision', '', 0) ;
INSERT INTO `wp_posts` ( `ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(908, 1, '2015-10-19 11:11:07', '2015-10-19 11:11:07', '', 'Maria Buckner', '', 'publish', 'open', 'closed', '', 'test-listing-2', '', '', '2015-10-19 12:00:49', '2015-10-19 12:00:49', '', 0, 'http:localhost/?post_type=job_listing&#038;p=908', 0, 'job_listing', '', 0),
(909, 1, '2015-10-19 11:58:29', '2015-10-19 11:58:29', '', 'Maria Buckner', '', 'inherit', 'closed', 'closed', '', '908-autosave-v1', '', '', '2015-10-19 11:58:29', '2015-10-19 11:58:29', '', 908, 'http:localhost/?p=909', 0, 'revision', '', 0),
(910, 1, '2015-10-19 12:02:23', '2015-10-19 12:02:23', '', 'Maria Buckner', '', 'inherit', 'open', 'closed', '', 'maria-buckner', '', '', '2015-10-19 12:02:23', '2015-10-19 12:02:23', '', 908, '/var/www/html/wp-content/uploads/job-manager-uploads/0/2015/10/zoom-46715868-3.jpg', 0, 'attachment', 'image/jpeg', 0),
(911, 1, '2015-10-19 12:05:19', '2015-10-19 12:05:19', '[woocommerce_my_account]\r\n[avatar_upload]', 'My Account', '', 'inherit', 'closed', 'closed', '', '25-revision-v1', '', '', '2015-10-19 12:05:19', '2015-10-19 12:05:19', '', 25, 'http:localhost/?p=911', 0, 'revision', '', 0),
(912, 1, '2015-10-19 12:05:44', '2015-10-19 12:05:44', '', 'stock-photo-asian-woman-smiling-happy-portrait-beautiful-mature-middle-aged-chinese-asian-woman-closeup-beauty-96418745', '', 'inherit', 'open', 'closed', '', 'stock-photo-asian-woman-smiling-happy-portrait-beautiful-mature-middle-aged-chinese-asian-woman-closeup-beauty-96418745', '', '', '2015-10-19 12:05:44', '2015-10-19 12:05:44', '', 0, 'http:localhost/wp-content/uploads/2015/10/stock-photo-asian-woman-smiling-happy-portrait-beautiful-mature-middle-aged-chinese-asian-woman-closeup-beauty-96418745.jpg', 0, 'attachment', 'image/jpeg', 0),
(915, 1, '2015-10-20 08:37:30', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'closed', '', '', '', '', '2015-10-20 08:37:30', '0000-00-00 00:00:00', '', 0, 'http:localhost/?post_type=product&p=915', 0, 'product', '', 0),
(917, 1, '2015-10-20 08:46:26', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'closed', '', '', '', '', '2015-10-20 08:46:26', '0000-00-00 00:00:00', '', 0, 'http:localhost/?post_type=product&p=917', 0, 'product', '', 0),
(919, 1, '2015-10-20 09:31:03', '2015-10-20 09:31:03', '[woocommerce_simple_registration]', 'Register', '', 'publish', 'closed', 'closed', '', 'registration', '', '', '2015-10-20 09:34:37', '2015-10-20 09:34:37', '', 0, 'http:localhost/?page_id=919', 0, 'page', '', 0),
(920, 1, '2015-10-20 09:31:03', '2015-10-20 09:31:03', '[woocommerce_simple_registration]', 'Registration', '', 'inherit', 'closed', 'closed', '', '919-revision-v1', '', '', '2015-10-20 09:31:03', '2015-10-20 09:31:03', '', 919, 'http:localhost/?p=920', 0, 'revision', '', 0),
(921, 1, '2015-10-20 09:34:26', '2015-10-20 09:34:26', ' ', '', '', 'publish', 'closed', 'closed', '', '921', '', '', '2015-10-21 08:57:40', '2015-10-21 08:57:40', '', 0, 'http:localhost/?p=921', 2, 'nav_menu_item', '', 0),
(922, 1, '2015-10-20 09:34:37', '2015-10-20 09:34:37', '[woocommerce_simple_registration]', 'Register', '', 'inherit', 'closed', 'closed', '', '919-revision-v1', '', '', '2015-10-20 09:34:37', '2015-10-20 09:34:37', '', 919, 'http:localhost/?p=922', 0, 'revision', '', 0),
(923, 1, '2015-10-20 09:43:31', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-10-20 09:43:31', '0000-00-00 00:00:00', '', 0, 'http:localhost/?p=923', 0, 'post', '', 0),
(924, 1, '2015-10-20 10:02:52', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'closed', '', '', '', '', '2015-10-20 10:02:52', '0000-00-00 00:00:00', '', 0, 'http:localhost/?post_type=product&p=924', 0, 'product', '', 0),
(925, 3, '2015-10-20 10:09:56', '2015-10-20 10:09:56', '', 'Maria Fowler', '', 'trash', 'open', 'closed', '', 'london-se193rw-maria-fowler', '', '', '2015-10-20 10:16:02', '2015-10-20 10:16:02', '', 0, 'http:localhost/?job_listing=london-se193rw-maria-fowler', 0, 'job_listing', '', 0),
(926, 4, '2015-10-20 10:17:18', '2015-10-20 10:17:18', '', 'stock-photo-asian-woman-smiling-happy-portrait-beautiful-mature-middle-aged-chinese-asian-woman-closeup-beauty-96418745', '', 'inherit', 'open', 'closed', '', 'stock-photo-asian-woman-smiling-happy-portrait-beautiful-mature-middle-aged-chinese-asian-woman-closeup-beauty-96418745-2', '', '', '2015-10-20 10:17:18', '2015-10-20 10:17:18', '', 0, 'http:localhost/wp-content/uploads/2015/10/stock-photo-asian-woman-smiling-happy-portrait-beautiful-mature-middle-aged-chinese-asian-woman-closeup-beauty-964187451.jpg', 0, 'attachment', 'image/jpeg', 0),
(927, 4, '2015-10-20 10:18:02', '2015-10-20 10:18:02', '', 'Maria Fowler', '', 'trash', 'open', 'closed', '', 'london-se193rw-maria-fowler-2', '', '', '2015-10-20 11:13:35', '2015-10-20 11:13:35', '', 0, 'http:localhost/?job_listing=london-se193rw-maria-fowler-2', 0, 'job_listing', '', 0),
(928, 1, '2015-10-20 10:21:25', '2015-10-20 10:21:25', '', 'Midwife Appointment', '', 'publish', 'open', 'closed', '', 'midwife-appointment', '', '', '2015-10-20 10:22:03', '2015-10-20 10:22:03', '', 0, 'http:localhost/?post_type=product&#038;p=928', 0, 'product', '', 0),
(929, 1, '2015-10-20 10:34:25', '2015-10-20 10:34:25', '', 'Pre-Natal Care', '', 'publish', 'closed', 'closed', '', 'pre-natal-care', '', '', '2015-10-20 10:34:25', '2015-10-20 10:34:25', '', 0, 'http:localhost/?post_type=bookable_resource&p=929', 0, 'bookable_resource', '', 0),
(930, 1, '2015-10-20 10:34:38', '2015-10-20 10:34:38', '', 'Post-Natal Care', '', 'publish', 'closed', 'closed', '', 'post-natal-care', '', '', '2015-10-20 10:34:38', '2015-10-20 10:34:38', '', 0, 'http:localhost/?post_type=bookable_resource&p=930', 0, 'bookable_resource', '', 0),
(931, 1, '2015-10-20 10:34:47', '2015-10-20 10:34:47', '', 'Baby Gymnastics', '', 'publish', 'closed', 'closed', '', 'baby-gymnastics', '', '', '2015-10-20 10:34:47', '2015-10-20 10:34:47', '', 0, 'http:localhost/?post_type=bookable_resource&p=931', 0, 'bookable_resource', '', 0),
(933, 4, '2015-10-20 11:14:25', '2015-10-20 11:14:25', '', 'Maria Fowler', '', 'trash', 'open', 'closed', '', 'london-se193rw-maria-fowler-3', '', '', '2015-10-20 11:49:45', '2015-10-20 11:49:45', '', 0, 'http:localhost/?job_listing=london-se193rw-maria-fowler-3', 0, 'job_listing', '', 0),
(934, 4, '2015-10-20 11:49:07', '2015-10-20 11:49:07', '', 'Appointment', '', 'publish', 'open', 'closed', '', 'appointment', '', '', '2015-10-22 08:39:21', '2015-10-22 08:39:21', '', 0, 'http:localhost/?post_type=product&#038;p=934', 0, 'product', '', 0),
(935, 4, '2015-10-20 11:50:27', '2015-10-20 11:50:27', '', 'Maria Fowler', '', 'publish', 'open', 'closed', '', 'london-se193rw-maria-fowler-4', '', '', '2015-10-20 11:51:05', '2015-10-20 11:51:05', '', 0, 'http:localhost/?job_listing=london-se193rw-maria-fowler-4', 0, 'job_listing', '', 0),
(936, 1, '2015-10-20 11:51:17', '2015-10-20 11:51:17', '', 'Booking &ndash; Oct 20, 2015 @ 11:51 AM', '', 'was-in-cart', 'closed', 'closed', '', 'booking-oct-20-2015-1151-am', '', '', '2015-10-20 12:10:03', '2015-10-20 12:10:03', '', 0, 'http:localhost/?post_type=wc_booking&#038;p=936', 0, 'wc_booking', '', 0),
(937, 1, '2015-10-20 11:56:22', '2015-10-20 11:56:22', '', 'Booking &ndash; Oct 20, 2015 @ 11:56 AM', '', 'was-in-cart', 'closed', 'closed', '', 'booking-oct-20-2015-1156-am', '', '', '2015-10-20 12:10:04', '2015-10-20 12:10:04', '', 0, 'http:localhost/?post_type=wc_booking&#038;p=937', 0, 'wc_booking', '', 0),
(938, 1, '2015-10-20 12:01:18', '2015-10-20 12:01:18', '', 'Booking &ndash; Oct 20, 2015 @ 12:01 PM', '', 'was-in-cart', 'closed', 'closed', '', 'booking-oct-20-2015-1201-pm', '', '', '2015-10-20 12:10:06', '2015-10-20 12:10:06', '', 0, 'http:localhost/?post_type=wc_booking&#038;p=938', 0, 'wc_booking', '', 0),
(939, 1, '2015-10-20 12:03:25', '2015-10-20 12:03:25', '', 'Booking &ndash; Oct 20, 2015 @ 12:03 PM', '', 'was-in-cart', 'closed', 'closed', '', 'booking-oct-20-2015-1203-pm', '', '', '2015-10-20 12:10:08', '2015-10-20 12:10:08', '', 0, 'http:localhost/?post_type=wc_booking&#038;p=939', 0, 'wc_booking', '', 0),
(940, 1, '2015-10-20 12:10:23', '2015-10-20 12:10:23', '', 'Booking &ndash; Oct 20, 2015 @ 12:10 PM', '', 'confirmed', 'closed', 'closed', '', 'booking-oct-20-2015-1210-pm', '', '', '2015-10-20 12:15:15', '2015-10-20 12:15:15', '', 941, 'http:localhost/?post_type=wc_booking&#038;p=940', 0, 'wc_booking', '', 0),
(941, 1, '2015-10-20 12:14:56', '2015-10-20 12:14:56', '', 'Order &ndash; October 20, 2015 @ 12:14 PM', '', 'wc-pending', 'open', 'closed', 'order_562630401aca2', 'order-oct-20-2015-1214-pm', '', '', '2015-10-20 12:14:56', '2015-10-20 12:14:56', '', 0, 'http:localhost/?post_type=shop_order&p=941', 0, 'shop_order', '', 3),
(942, 1, '2015-10-20 14:59:38', '2015-10-20 14:59:38', ' ', '', '', 'publish', 'closed', 'closed', '', '942', '', '', '2015-10-21 08:58:15', '2015-10-21 08:58:15', '', 0, 'http:localhost/?p=942', 1, 'nav_menu_item', '', 0),
(943, 1, '2015-10-20 14:59:38', '2015-10-20 14:59:38', '', 'My Profile', '', 'publish', 'closed', 'closed', '', 'my-profile', '', '', '2015-10-21 08:58:15', '2015-10-21 08:58:15', '', 0, 'http:localhost/?p=943', 2, 'nav_menu_item', '', 0),
(944, 1, '2015-10-20 14:58:46', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2015-10-20 14:58:46', '0000-00-00 00:00:00', '', 0, 'http:localhost/?p=944', 1, 'nav_menu_item', '', 0),
(945, 14, '2015-10-21 09:55:32', '2015-10-21 09:55:32', '', 'Laura Cohan', '', 'trash', 'open', 'closed', '', 'se193rw-laura-cohan', '', '', '2015-10-21 10:01:02', '2015-10-21 10:01:02', '', 0, 'http:localhost/?job_listing=se193rw-laura-cohan', 0, 'job_listing', '', 0),
(946, 14, '2015-10-21 10:01:50', '2015-10-21 10:01:50', '', 'Laura Cohan', '', 'trash', 'open', 'closed', '', 'e144bb-laura-cohan', '', '', '2015-10-21 12:18:08', '2015-10-21 12:18:08', '', 0, 'http:localhost/?job_listing=e144bb-laura-cohan', 0, 'job_listing', '', 0),
(947, 14, '2015-10-21 10:01:47', '2015-10-21 10:01:47', '', 'TestProduct', '', 'trash', 'open', 'closed', '', 'testproduct', '', '', '2015-10-22 08:59:55', '2015-10-22 08:59:55', '', 0, 'http:localhost/?product=testproduct', 0, 'product', '', 0),
(948, 14, '2015-10-21 12:18:38', '2015-10-21 12:18:38', '', 'Laura Coh', '', 'trash', 'open', 'closed', '', 'e144bb-laura-coh', '', '', '2015-10-21 12:33:50', '2015-10-21 12:33:50', '', 0, 'http:localhost/?job_listing=e144bb-laura-coh', 0, 'job_listing', '', 0),
(949, 14, '2015-10-21 12:18:36', '2015-10-21 12:18:36', '', 'Appointment_14', '', 'trash', 'open', 'closed', '', 'appointment_14', '', '', '2015-10-21 12:33:44', '2015-10-21 12:33:44', '', 0, 'http:localhost/?product=appointment_14', 0, 'product', '', 0),
(950, 14, '2015-10-21 12:34:20', '2015-10-21 12:34:20', '', 'Laura C', '', 'trash', 'open', 'closed', '', 'e144bb-laura-c', '', '', '2015-10-21 13:01:30', '2015-10-21 13:01:30', '', 0, 'http:localhost/?job_listing=e144bb-laura-c', 0, 'job_listing', '', 0),
(951, 14, '2015-10-21 12:34:17', '2015-10-21 12:34:17', '', 'Appointment_14', '', 'trash', 'open', 'closed', '', 'appointment_14-2', '', '', '2015-10-21 13:01:37', '2015-10-21 13:01:37', '', 0, 'http:localhost/?product=appointment_14-2', 0, 'product', '', 0),
(952, 14, '2015-10-21 13:02:06', '2015-10-21 13:02:06', '', 'Laura Ch', '', 'trash', 'open', 'closed', '', 'e144bb-laura-ch', '', '', '2015-10-21 13:07:03', '2015-10-21 13:07:03', '', 0, 'http:localhost/?job_listing=e144bb-laura-ch', 0, 'job_listing', '', 0),
(953, 14, '2015-10-21 13:02:04', '2015-10-21 13:02:04', '', 'Appointment_14', '', 'trash', 'open', 'closed', '', 'appointment_14-3', '', '', '2015-10-21 13:06:59', '2015-10-21 13:06:59', '', 0, 'http:localhost/?product=appointment_14-3', 0, 'product', '', 0),
(954, 14, '2015-10-21 13:07:36', '2015-10-21 13:07:36', '', 'Laura C', '', 'trash', 'open', 'closed', '', 'e144bb-laura-c-2', '', '', '2015-10-21 13:09:46', '2015-10-21 13:09:46', '', 0, 'http:localhost/?job_listing=e144bb-laura-c-2', 0, 'job_listing', '', 0),
(955, 14, '2015-10-21 13:07:34', '2015-10-21 13:07:34', '', 'Appointment_14', '', 'trash', 'open', 'closed', '', 'appointment_14-4', '', '', '2015-10-21 13:09:41', '2015-10-21 13:09:41', '', 0, 'http:localhost/?product=appointment_14-4', 0, 'product', '', 0),
(956, 14, '2015-10-21 13:10:13', '2015-10-21 13:10:13', '', 'Laur C', '', 'trash', 'open', 'closed', '', 'e144bb-laur-c', '', '', '2015-10-21 13:23:45', '2015-10-21 13:23:45', '', 0, 'http:localhost/?job_listing=e144bb-laur-c', 0, 'job_listing', '', 0),
(957, 14, '2015-10-21 13:10:11', '2015-10-21 13:10:11', '', 'Appointment_14', '', 'publish', 'closed', 'closed', '', 'appointment_14', '', '', '2015-10-21 13:10:11', '2015-10-21 13:10:11', '', 0, 'http:localhost/?p=957', 0, 'bookable_product', '', 0),
(958, 14, '2015-10-21 13:24:14', '2015-10-21 13:24:14', '', 'Laur', '', 'trash', 'open', 'closed', '', 'e144bb-laur', '', '', '2015-10-22 08:36:36', '2015-10-22 08:36:36', '', 0, 'http:localhost/?job_listing=e144bb-laur', 0, 'job_listing', '', 0),
(959, 14, '2015-10-21 13:24:10', '2015-10-21 13:24:10', '', 'Appointment_14', '', 'trash', 'open', 'closed', '', 'appointment_14-5', '', '', '2015-10-22 08:41:26', '2015-10-22 08:41:26', '', 0, 'http:localhost/?product=appointment_14-5', 0, 'product', '', 0),
(960, 14, '2015-10-21 13:24:21', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-10-21 13:24:21', '0000-00-00 00:00:00', '', 0, 'http:localhost/?p=960', 0, 'post', '', 0),
(961, 14, '2015-10-22 08:37:15', '2015-10-22 08:37:15', '', 'Laura C', '', 'trash', 'open', 'closed', '', 'e144bb-laura-c-3', '', '', '2015-10-22 09:00:06', '2015-10-22 09:00:06', '', 0, 'http:localhost/?job_listing=e144bb-laura-c-3', 0, 'job_listing', '', 0),
(962, 14, '2015-10-22 08:37:10', '2015-10-22 08:37:10', '', 'Appointment_14', '', 'trash', 'open', 'closed', '', 'appointment_14-6', '', '', '2015-10-22 08:59:51', '2015-10-22 08:59:51', '', 0, 'http:localhost/?product=appointment_14-6', 0, 'product', '', 0),
(963, 14, '2015-10-22 09:00:36', '2015-10-22 09:00:36', '', 'Laura', '', 'publish', 'open', 'closed', '', 'e144bb-laura', '', '', '2015-10-22 09:00:54', '2015-10-22 09:00:54', '', 0, 'http:localhost/?job_listing=e144bb-laura', 0, 'job_listing', '', 0),
(964, 14, '2015-10-22 09:00:33', '2015-10-22 09:00:33', '', 'Appointment_14', '', 'publish', 'open', 'closed', '', 'appointment_14-7', '', '', '2015-10-22 09:00:33', '2015-10-22 09:00:33', '', 0, 'http:localhost/?product=appointment_14-7', 0, 'product', '', 0) ;

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
(815, 8, 0),
(816, 8, 0),
(817, 8, 0),
(818, 8, 0),
(819, 8, 0),
(826, 10, 0),
(827, 10, 0),
(828, 10, 0),
(829, 10, 0),
(830, 10, 0),
(839, 5, 0),
(841, 8, 0),
(842, 8, 0),
(843, 8, 0),
(844, 8, 0),
(845, 8, 0),
(851, 5, 0),
(852, 10, 0),
(853, 10, 0),
(854, 10, 0),
(855, 10, 0),
(856, 10, 0),
(858, 5, 0),
(859, 5, 0),
(860, 5, 0),
(896, 24, 0),
(908, 23, 0),
(921, 5, 0),
(925, 23, 0),
(927, 23, 0),
(928, 25, 0),
(928, 26, 0),
(933, 23, 0),
(934, 25, 0),
(934, 26, 0),
(934, 35, 0),
(935, 23, 0),
(942, 29, 0),
(943, 29, 0),
(945, 23, 0),
(946, 23, 0),
(947, 12, 0),
(947, 36, 0),
(948, 23, 0),
(949, 12, 0),
(949, 36, 0),
(950, 23, 0),
(951, 12, 0),
(951, 36, 0),
(952, 23, 0),
(953, 25, 0),
(953, 36, 0),
(954, 23, 0),
(955, 12, 0),
(955, 36, 0),
(956, 23, 0),
(957, 12, 0),
(957, 36, 0),
(958, 23, 0),
(959, 25, 0),
(961, 23, 0),
(962, 25, 0),
(962, 26, 0),
(962, 35, 0),
(963, 23, 0),
(964, 25, 0),
(964, 35, 0) ;

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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `wp_term_taxonomy`
#
INSERT INTO `wp_term_taxonomy` ( `term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 0),
(2, 2, 'category', '', 0, 0),
(3, 3, 'category', '', 0, 0),
(4, 4, 'category', '', 0, 0),
(5, 5, 'nav_menu', '', 0, 6),
(8, 8, 'nav_menu', '', 0, 10),
(10, 10, 'nav_menu', '', 0, 10),
(11, 11, 'post_tag', '', 0, 0),
(12, 12, 'product_type', '', 0, 0),
(13, 13, 'product_type', '', 0, 0),
(14, 14, 'product_type', '', 0, 0),
(15, 15, 'product_type', '', 0, 0),
(16, 16, 'job_listing_type', '', 0, 0),
(17, 17, 'job_listing_type', '', 0, 0),
(18, 18, 'job_listing_type', '', 0, 0),
(19, 19, 'job_listing_type', '', 0, 0),
(20, 20, 'job_listing_type', '', 0, 0),
(22, 22, 'job_listing_region', '', 0, 0),
(23, 23, 'job_listing_category', '', 0, 3),
(24, 24, 'job_listing_category', '', 0, 0),
(25, 25, 'product_type', '', 0, 3),
(26, 26, 'shop_vendor', '', 0, 2),
(29, 29, 'nav_menu', '', 0, 2),
(30, 30, 'nav_menu', '', 0, 0),
(35, 35, 'shop_vendor', 'The vendor Laura', 0, 2),
(36, 36, 'product_cat', '', 0, 0) ;

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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `wp_terms`
#
INSERT INTO `wp_terms` ( `term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0),
(2, 'Growth', 'growth', 0),
(3, 'Local', 'local', 0),
(4, 'Sales', 'sales', 0),
(5, 'Menu', 'menu', 0),
(8, 'Social', 'social', 0),
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
(20, 'Internship', 'internship', 0),
(22, 'Default', 'default', 0),
(23, 'Birth Attending', 'attending', 0),
(24, 'Non-Attending', 'nonattending', 0),
(25, 'booking', 'booking', 0),
(26, 'Maria Fowler', 'mariafowler', 0),
(29, 'Navigation', 'navigation', 0),
(30, 'Tertiary', 'tertiary', 0),
(35, 'Laura', 'laura', 0),
(36, 'Races', 'races', 0) ;

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
) ENGINE=InnoDB AUTO_INCREMENT=285 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


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
(15, 1, 'wp_dashboard_quick_press_last_post_id', '923'),
(16, 1, 'wp_user-settings', 'editor=html&libraryContent=browse&mfold=o'),
(17, 1, 'wp_user-settings-time', '1445348948'),
(18, 1, 'managejob_listing_page_edit_job_fieldscolumnshidden', 'a:5:{i:0;s:6:"output";i:1;s:9:"output_as";i:2;s:17:"output_show_label";i:3;s:6:"origin";i:4;s:7:"post_id";}'),
(19, 1, 'managejob_listing_page_edit_company_fieldscolumnshidden', 'a:5:{i:0;s:6:"output";i:1;s:9:"output_as";i:2;s:17:"output_show_label";i:3;s:6:"origin";i:4;s:7:"post_id";}'),
(20, 1, '_company_name', ''),
(21, 1, '_company_website', ''),
(22, 1, '_company_tagline', ''),
(23, 1, '_company_twitter', ''),
(24, 1, '_company_logo', ''),
(25, 1, '_company_video', ''),
(26, 1, '_application', 'nick.j.goodall@gmail.com'),
(27, 1, 'wp_user_avatar', '912'),
(28, 1, 'nav_menu_recently_edited', '29'),
(29, 1, 'managenav-menuscolumnshidden', 'a:5:{i:0;s:11:"link-target";i:1;s:11:"css-classes";i:2;s:3:"xfn";i:3;s:11:"description";i:4;s:15:"title-attribute";}'),
(30, 1, 'metaboxhidden_nav-menus', 'a:10:{i:0;s:30:"woocommerce_endpoints_nav_link";i:1;s:11:"add-product";i:2;s:19:"add-shop_commission";i:3;s:12:"add-post_tag";i:4;s:22:"add-job_listing_region";i:5;s:24:"add-job_listing_category";i:6;s:20:"add-job_listing_type";i:7;s:15:"add-product_cat";i:8;s:15:"add-product_tag";i:9;s:15:"add-shop_vendor";}'),
(46, 1, 'closedpostboxes_dashboard', 'a:1:{i:0;s:21:"dashboard_quick_press";}'),
(47, 1, 'metaboxhidden_dashboard', 'a:0:{}'),
(70, 4, 'nickname', 'Maria'),
(71, 4, 'first_name', ''),
(72, 4, 'last_name', ''),
(73, 4, 'description', ''),
(74, 4, 'rich_editing', 'true'),
(75, 4, 'comment_shortcuts', 'false'),
(76, 4, 'admin_color', 'fresh'),
(77, 4, 'use_ssl', '0'),
(78, 4, 'show_admin_bar_front', 'true'),
(79, 4, 'wp_capabilities', 'a:13:{s:12:"edit_product";b:1;s:12:"read_product";b:1;s:14:"delete_product";b:1;s:13:"edit_products";b:1;s:20:"edit_others_products";b:1;s:15:"delete_products";b:1;s:25:"delete_published_products";b:1;s:22:"delete_others_products";b:1;s:23:"edit_published_products";b:1;s:20:"assign_product_terms";b:1;s:12:"upload_files";b:1;s:15:"manage_bookings";b:1;s:12:"shop_manager";b:1;}'),
(80, 4, 'wp_user_level', '9'),
(82, 4, 'wp_user_avatar', '926'),
(83, 4, '_company_name', ''),
(84, 4, '_company_website', ''),
(85, 4, '_company_tagline', ''),
(86, 4, '_company_twitter', ''),
(87, 4, '_company_logo', ''),
(88, 4, '_company_video', ''),
(89, 4, '_application', 'mr.nicholas.goodall@gmail.com'),
(91, 4, 'product_vendor', '26'),
(103, 1, 'billing_first_name', 'Nick'),
(104, 1, 'billing_last_name', 'Goodall'),
(105, 1, 'billing_company', ''),
(106, 1, 'billing_email', 'nick.j.goodall@gmail.com'),
(107, 1, 'billing_phone', '07818491093'),
(108, 1, 'billing_country', 'GB'),
(109, 1, 'billing_address_1', 'Flat 5, 47 Westow Street'),
(110, 1, 'billing_address_2', ''),
(111, 1, 'billing_city', 'London'),
(112, 1, 'billing_state', 'London'),
(113, 1, 'billing_postcode', 'SE19 3RW'),
(219, 13, 'nickname', 'Claudia'),
(220, 13, 'first_name', ''),
(221, 13, 'last_name', ''),
(222, 13, 'description', ''),
(223, 13, 'rich_editing', 'true'),
(224, 13, 'comment_shortcuts', 'false'),
(225, 13, 'admin_color', 'fresh'),
(226, 13, 'use_ssl', '0'),
(227, 13, 'show_admin_bar_front', 'true'),
(228, 13, 'wp_capabilities', 'a:1:{s:8:"customer";b:1;}'),
(229, 13, 'wp_user_level', '0'),
(230, 13, 'role', 'customer'),
(232, 14, 'nickname', 'Laura'),
(233, 14, 'first_name', ''),
(234, 14, 'last_name', ''),
(235, 14, 'description', ''),
(236, 14, 'rich_editing', 'true'),
(237, 14, 'comment_shortcuts', 'false'),
(238, 14, 'admin_color', 'fresh'),
(239, 14, 'use_ssl', '0'),
(240, 14, 'show_admin_bar_front', 'true'),
(241, 14, 'wp_capabilities', 'a:13:{s:12:"shop_manager";b:1;s:12:"edit_product";b:1;s:12:"read_product";b:1;s:14:"delete_product";b:1;s:13:"edit_products";b:1;s:20:"edit_others_products";b:1;s:15:"delete_products";b:1;s:25:"delete_published_products";b:1;s:22:"delete_others_products";b:1;s:23:"edit_published_products";b:1;s:20:"assign_product_terms";b:1;s:12:"upload_files";b:1;s:15:"manage_bookings";b:1;}'),
(242, 14, 'wp_user_level', '9'),
(243, 14, 'role', 'shop_manager'),
(247, 1, 'session_tokens', 'a:2:{s:64:"924c282d5180fdbfee0a83076af2662da88fcba933c4eb777ae54c36aa56d82c";a:4:{s:10:"expiration";i:1445591152;s:2:"ip";s:13:"84.51.154.153";s:2:"ua";s:121:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36";s:5:"login";i:1445418352;}s:64:"d5dd4c2f3159ae2c7c426a42af38e5ff76faef53ce0dd1c12dd488178fb4c85f";a:4:{s:10:"expiration";i:1445677250;s:2:"ip";s:13:"84.51.154.153";s:2:"ua";s:121:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36";s:5:"login";i:1445504450;}}'),
(248, 1, 'shipping_first_name', ''),
(249, 1, 'shipping_last_name', ''),
(250, 1, 'shipping_company', ''),
(251, 1, 'shipping_address_1', ''),
(252, 1, 'shipping_address_2', ''),
(253, 1, 'shipping_city', ''),
(254, 1, 'shipping_postcode', ''),
(255, 1, 'shipping_country', ''),
(256, 1, 'shipping_state', ''),
(257, 1, 'twitter', ''),
(258, 1, 'facebook', ''),
(259, 1, 'googleplus', ''),
(260, 1, 'pinterest', '') ;
INSERT INTO `wp_usermeta` ( `umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(261, 1, 'linkedin', ''),
(262, 1, 'github', ''),
(263, 1, 'instagram', ''),
(268, 14, '_company_name', ''),
(269, 14, '_company_website', ''),
(270, 14, '_company_tagline', ''),
(271, 14, '_company_twitter', ''),
(272, 14, '_company_logo', ''),
(273, 14, '_company_video', ''),
(274, 14, '_application', 'asd@ca.com'),
(282, 14, 'wp_dashboard_quick_press_last_post_id', '960') ;

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `wp_users`
#
INSERT INTO `wp_users` ( `ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'admin', '$P$BBlCp6vxCUPIrEWiGvfM6C.sSHo/kL0', 'admin', 'nick.j.goodall@gmail.com', '', '2015-10-13 08:56:52', '', 0, 'admin'),
(4, 'Maria', '$P$BqoiDgtq4tsLEcxZRqacoqrjqHN30//', 'maria', 'mr.nicholas.goodall@gmail.com', '', '2015-10-20 10:16:25', '', 0, 'Maria'),
(13, 'Claudia', '$P$BXV5L0ae.iRbPVwqe50NHRkVH1yOmT.', 'claudia', 'asd@das.com', '', '2015-10-21 08:55:44', '', 0, 'Claudia'),
(14, 'Laura', '$P$B8fWnr5Di.H7tkACl0z/j0h4rGcp9./', 'laura', 'asd@ca.com', '', '2015-10-21 08:56:02', '', 0, 'Laura') ;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `wp_wc_booking_relationships`
#
INSERT INTO `wp_wc_booking_relationships` ( `ID`, `product_id`, `resource_id`, `sort_order`) VALUES
(1, 928, 929, 0),
(2, 928, 930, 1),
(3, 928, 931, 2) ;

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `wp_woocommerce_order_itemmeta`
#
INSERT INTO `wp_woocommerce_order_itemmeta` ( `meta_id`, `order_item_id`, `meta_key`, `meta_value`) VALUES
(1, 1, '_qty', '1'),
(2, 1, '_tax_class', ''),
(3, 1, '_product_id', '934'),
(4, 1, '_variation_id', '0'),
(5, 1, '_line_subtotal', '0'),
(6, 1, '_line_total', '0'),
(7, 1, '_line_subtotal_tax', '0'),
(8, 1, '_line_tax', '0'),
(9, 1, '_line_tax_data', 'a:2:{s:5:"total";a:0:{}s:8:"subtotal";a:0:{}}'),
(10, 1, 'Booking Date', 'October 22, 2015'),
(11, 1, 'Booking Time', '10:00 am'),
(12, 1, 'Booking ID', '940') ;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `wp_woocommerce_order_items`
#
INSERT INTO `wp_woocommerce_order_items` ( `order_item_id`, `order_item_name`, `order_item_type`, `order_id`) VALUES
(1, 'Appointment', 'line_item', 941) ;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `wp_woocommerce_termmeta`
#
INSERT INTO `wp_woocommerce_termmeta` ( `meta_id`, `woocommerce_term_id`, `meta_key`, `meta_value`) VALUES
(1, 36, 'product_count_product_cat', '0') ;

#
# End of data contents of table `wp_woocommerce_termmeta`
# --------------------------------------------------------

#
# Add constraints back in and apply any alter data queries.
#

ALTER TABLE `wp_ab_appointments`
  ADD CONSTRAINT `wp_ab_appointments_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `wp_ab_staff` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,  ADD CONSTRAINT `wp_ab_appointments_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `wp_ab_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `wp_ab_customer_appointments`
  ADD CONSTRAINT `wp_ab_customer_appointments_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `wp_ab_customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,  ADD CONSTRAINT `wp_ab_customer_appointments_ibfk_2` FOREIGN KEY (`appointment_id`) REFERENCES `wp_ab_appointments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `wp_ab_holidays`
  ADD CONSTRAINT `wp_ab_holidays_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `wp_ab_staff` (`id`) ON DELETE CASCADE;

ALTER TABLE `wp_ab_payments`
  ADD CONSTRAINT `wp_ab_payments_ibfk_1` FOREIGN KEY (`customer_appointment_id`) REFERENCES `wp_ab_customer_appointments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `wp_ab_schedule_item_breaks`
  ADD CONSTRAINT `wp_ab_schedule_item_breaks_ibfk_1` FOREIGN KEY (`staff_schedule_item_id`) REFERENCES `wp_ab_staff_schedule_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `wp_ab_sent_notifications`
  ADD CONSTRAINT `wp_ab_sent_notifications_ibfk_1` FOREIGN KEY (`customer_appointment_id`) REFERENCES `wp_ab_customer_appointments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,  ADD CONSTRAINT `wp_ab_sent_notifications_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `wp_ab_staff` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `wp_ab_services`
  ADD CONSTRAINT `wp_ab_services_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `wp_ab_categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE `wp_ab_staff_schedule_items`
  ADD CONSTRAINT `wp_ab_staff_schedule_items_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `wp_ab_staff` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `wp_ab_staff_services`
  ADD CONSTRAINT `wp_ab_staff_services_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `wp_ab_staff` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,  ADD CONSTRAINT `wp_ab_staff_services_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `wp_ab_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

