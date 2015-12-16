<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'ebdb');

/** MySQL database username */
define('DB_USER', 'root');

/** MySQL database password */
define('DB_PASSWORD', 'ng562051');

/** MySQL hostname */
define('DB_HOST', 'aa1s87dobggp8qp.cqkoeb0qtjh8.eu-central-1.rds.amazonaws.com');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8mb4');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

define('SCRIPT_DEBUG', false);

define('WP_HOME','http://babyhallo-test.elasticbeanstalk.com');
define('WP_SITEURL','http://babyhallo-test.elasticbeanstalk.com');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'ZFPeBu^m]79_|4H$XF,eQ /7CZD EBu3h%U$} gh#},Vy5|cd~A[:qZH(CO?ip;f');
define('SECURE_AUTH_KEY',  'KN~-8*cr q<ptye`HVf6#k=A[+Jl$ed6ri8glwP>FMU|m5yVSt+yTtxNrrc1r^:n');
define('LOGGED_IN_KEY',    'e6b1mL0!)(>&L}9d]`ShLh1J/?11v=WFgY-^_[]0RpPzWsG4c`xmtdT~H[d2nO4@');
define('NONCE_KEY',        'q=`n?&?,&(^+tK{Qk++9dJJfh}oV]Izc%%5%=18rsXZT ?]PD1nR2X-r#Y5o6mG|');
define('AUTH_SALT',        '%w<UI>;sSmkS}W>o!SK4X;V#-XX+ZA{EnU>8Z,.vP>Je+-!S-KgYCj7ls]pGS}7 ');
define('SECURE_AUTH_SALT', '~0S<DT8o}jK?Z=%q1/u>pk<*C|w$:-BM|&,NMx13ogi@SoAfRyzaVff*Zx dQ&Su');
define('LOGGED_IN_SALT',   'yNS=OM0qVm@=Qt#n6&a[REAMgPz3/aHon=E7q#HLttcfgZsgVi-llS/A|-(qht$Z');
define('NONCE_SALT',       '.`#&+&9qnGQYlUr$O P%U@oLS7lV|Hny.|-Ik=4Yv[7Jm~xdsBbw%s21N*5(.Np-');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
