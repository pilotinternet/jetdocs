<?php
// $Id$

/**
 * @file
 * JetDocs Install Profile
 *
 *  An install profile to provide complete documentation for the Jet series
 *  of Drupal platforms from Pilot Internet
 *
 *  by Steve Parks (steve.parks@pilotinternet.com)
 *  of Pilot Internet (www.pilotinternet.com)
 * 
 */


/**
 * Include files with specialist settings
 */
require_once dirname(__FILE__) . '/includes/blocks.inc';
require_once dirname(__FILE__) . '/includes/content.inc';
require_once dirname(__FILE__) . '/includes/menu.inc';
require_once dirname(__FILE__) . '/includes/modules.inc';
require_once dirname(__FILE__) . '/includes/pathauto.inc';
require_once dirname(__FILE__) . '/includes/permissions.inc';
require_once dirname(__FILE__) . '/includes/settings.inc';
require_once dirname(__FILE__) . '/includes/taxonomy.inc';
// The next file is for common customisations for your drupal shop
require_once dirname(__FILE__) . '/includes/custom.inc';

/**
 * Return a description of the profile for the initial installation screen.
 *
 * @return
 *   An array with keys 'name' and 'description' describing this profile.
 */
function jetdocs_profile_details() {
  return array(
    'name' => 'JetDocs',
    'description' => 'JetDocs is an install profile for Drupal that provides developer documentation for the Jet series of Drupal platforms from Pilot Internet.'
  );
}

/**
 * Return an array of the modules to be enabled when this profile is installed.
 *
 * @return
 *  An array of modules to be enabled.
 */
function jetdocs_profile_modules() {
  $modules = array(
    /* Required core modules */
    'block', 'filter', 'node', 'system', 'user',

    /* Optional core modules.*/
    'dblog',
    //'blog',
    'comment',
    'contact',
    //'help',
    //'locale',
    'menu',
    //'openid',
    'path',
    //'profile',
    'search',
    //'statistics',
    'taxonomy',
    //'translation',
    //'upload',

    /* The A-List */
    'views', 'views_ui',
    'content', 'text', 'number',
    'token',

    /* Admin */
    'admin_menu',
    'admin',
    'adminrole',

    /* Dev */
    'ctools',
    'devel',
    'drupalforfirebug',
    'install_profile_api',

    /* UI */
    'vertical_tabs',

    /* Features */
    'strongarm',

    /* API */
    'grammer_parser',
    'job_queue',

  );

  return $modules;
}

/**
 * Return a list of tasks that this profile supports.
 *
 * @return
 *   A keyed array of tasks the profile will perform during
 *   the final stage. The keys of the array will be used internally,
 *   while the values will be displayed to the user in the installer
 *   task list.
 */
function jetdocs_profile_task_list() {
  global $conf;
  $conf['site_name'] = 'JetDocs';
  $conf['site_footer'] = 'JetDocs by <a href="http://pilotinternet.com">Pilot Internet</a>. For more information please go to <a href="http://atc.pilotinternet.com/jetdocs">http://atc.pilotinternet.com/jetdocs</a>.';


  $tasks['jetdocs-configure-batch'] = st('Configure site');
  return $tasks;
}

/**
 * Implementation of hook_profile_tasks().
 */
function jetdocs_profile_tasks(&$task, $url) {
  $output = "";

  install_include(jetdocs_profile_modules());

  if ($task == 'profile') {
    drupal_set_title(t('JetDocs Installation'));
    _jetdocs_log(t('Starting Installation'));
    _jetdocs_base_settings();
    $task = "jetdocs-configure";
  }

  if ($task == 'jetdocs-configure') {
    $batch['title'] = st('Configuring @drupal', array('@drupal' => drupal_install_profile_name()));
    $files = module_rebuild_cache();
    foreach (_jetdocs_extra_modules () as $module) {
      $batch['operations'][] = array('_install_module_batch', array($module, $files[$module]->info['name']));
      //-- Initialize each feature individually rather then all together in the end, to avoid execution timeout.
      $batch['operations'][] = array('features_flush_caches', array());
    }
    $batch['operations'][] = array('_jetdocs_setup_branches', array());
    $batch['operations'][] = array('_jetdocs_create_content', array());
    $batch['operations'][] = array('_jetdocs_set_permissions', array());
    $batch['operations'][] = array('_jetdocs_initialize_settings', array());
    $batch['operations'][] = array('_jetdocs_setup_taxonomy', array());
    $batch['operations'][] = array('_jetdocs_set_pathauto', array());
    $batch['operations'][] = array('_jetdocs_install_menus', array());
    $batch['operations'][] = array('_jetdocs_setup_blocks', array());
    $batch['operations'][] = array('_jetdocs_custom', array());
    $batch['operations'][] = array('_jetdocs_cleanup', array());
    $batch['error_message'] = st('There was an error configuring @drupal.', array('@drupal' => drupal_install_profile_name()));
    $batch['finished'] = '_jetdocs_configure_finished';
    variable_set('install_task', 'jetdocs-configure-batch');
    batch_set($batch);
    batch_process($url, $url);
  }
  // Land here until the batches are done
  if ($task == 'jetdocs-configure-batch') {
    include_once 'includes/batch.inc';
    $output = _batch_page();
  }

  return $output;
}

/**
 * Batch process is finished
 */
function _jetdocs_configure_finished($success, $results) {
  _jetdocs_log(t('jetdocs has been installed.'));
  variable_set('install_task', 'profile-finished');
}

/**
 *
 *  Do some basic setup
 */
function _jetdocs_base_settings() {
  global $base_url;

  // Theme related.
  install_default_theme('cube');
  install_admin_theme('rubik');
  variable_set('node_admin_theme', TRUE);

  // Set the default timezone name from the offset
  $offset = variable_get('date_default_timezone', '');
  $tzname = timezone_name_from_abbr("", $offset, 0);
  variable_set('date_default_timezone_name', $tzname);

  // In Aegir install processes, we need to init strongarm manually as a
  // separate page load isn't available to do this for us.
  if (function_exists('strongarm_init')) {
    strongarm_init();
  }

  _jetdocs_log(st('Configured basic settings'));
}

/**
 * Cleanup after the install
 */
function _jetdocs_cleanup($success, $results='') {
  // DO NOT call drupal_flush_all_caches(), it disables all themes
  $functions = array(
    'drupal_rebuild_theme_registry',
    'menu_rebuild',
    'install_init_blocks',
    'views_invalidate_cache',
    'node_types_rebuild',
  );

  foreach ($functions as $func) {
    //$start = time();
    $func();
    //$elapsed = time() - $start;
    //error_log("####  $func took $elapsed seconds ###");
  }

  ctools_flush_caches();
  cache_clear_all('*', 'cache', TRUE);
  cache_clear_all('*', 'cache_content', TRUE);
}

/**
 * Set jetdocs as the default install profile
 */
function system_form_install_select_profile_form_alter(&$form, $form_state) {
  foreach ($form['profile'] as $key => $element) {
    $form['profile'][$key]['#value'] = 'jetdocs';
  }
}

/**
 * Consolidate logging.
 */
function _jetdocs_log($msg) {
  error_log($msg);
  drupal_set_message($msg);
}

