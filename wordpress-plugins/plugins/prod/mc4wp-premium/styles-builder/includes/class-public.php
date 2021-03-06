<?php

/**
 * Class MC4WP_Styles_Builder_Public
 *
 * @ignore
 */
class MC4WP_Styles_Builder_Public {

	/**
	 * @var MC4WP_Plugin
	 */
	protected $plugin;

	/**
	 * @param MC4WP_Plugin $plugin
	 */
	public function __construct( MC4WP_Plugin $plugin ) {
		$this->plugin = $plugin;
	}

	/**
	 * Add hooks
	 */
	public function add_hooks() {
		// capture form preview requests
		add_action( 'template_redirect', array( $this, 'maybe_load_preview' ), 99 );
		add_action( 'mc4wp_load_form_stylesheets', array( $this, 'load_stylesheets' ) );
	}

	/**
	 * Load Styles Builder stylesheets
	 *
	 * @param array $stylesheets
	 */
	public function load_stylesheets( $stylesheets ) {

		// only load bundle when stylesheets has `styles-builder` in it.
		if( ! in_array( 'styles-builder', $stylesheets ) ) {
			return;
		}

		// get stylesheet file
		$uploads = wp_upload_dir();
		$filename = MC4WP_Styles_Builder::DIR . MC4WP_Styles_Builder::BUNDLE_FILENAME;
		$version = get_option( MC4WP_Styles_Builder::VERSION_OPTION, 1 );


		// check if file exists, file system check is cheap, 404 in WordPress is not.
		if( file_exists( $uploads['basedir'] . $filename ) ) {

			// generate url of stylesheet & make sure https:// is used when necessary
			$url = $uploads['baseurl'] . $filename;
			if( is_ssl() ) {
				$url = str_ireplace( 'http://', 'https://', $url );
			}

			wp_enqueue_style( 'mc4wp-form-styles-builder', $url, array(), $version );
		}
	}

	/**
	 * Maybe load form preview for Styles Builder
	 */
	public function maybe_load_preview() {

		// make sure form_id is set and current user has required capabilities
		if( ! isset( $_GET['_mc4wp_styles_builder_preview'] ) || empty( $_GET['form_id'] ) || ! current_user_can( 'edit_posts' ) ) {
			return;
		}

		// disable all other stylesheets
		add_filter( 'mc4wp_form_stylesheets', '__return_empty_array' );

		require $this->plugin->dir( '/views/form-preview.php' );
		exit;
	}

}