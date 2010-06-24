<?php
/* 
 * @file
 * API site settings
 *
 * Thanks to authors of apisite profile
 */

/**
 * Branch items for API Site
 */
function _jetdocs_setup_branches(&$context) {
  $items = _jetdocs_get_branches();

  module_rebuild_cache();
  drupal_get_schema(NULL, TRUE); // Refresh schema so we can use drupal_write_record
  
  
  // Create branches for API
  foreach ($items as $item) {
    if(drupal_write_record('api_branch', $item)) {
          $msg = st('API branch setup:'). $item->title;
          _jetdocs_log($msg);
          $context['message'] = $msg;
    } else {
          $msg = st('API branch setup FAILED:'). $item->title;
          _jetdocs_log($msg);
          $context['message'] = $msg;
    }
  }
  $context['results'][] = t('Created API branches.');

  // Set default API
  variable_set('api_default_branch', 'jet');
  $context['results'][] = t('Set default API to Jet.');

}

/**
 * Defined branches
 */
function _jetdocs_get_branches() {
  $items = array();
  $path = realpath('.');

  $branch = new stdClass;
  $branch->branch_name = 'jet';
  $branch->title = 'Jet';
  $branch->directories = $path;
  $branch->excluded_directories = $path . '/profiles/jetdocs/libraries';
  $branch->weight = 1;
  $items['jet'] = $branch;

  $branch = new stdClass;
  $branch->branch_name = 'drupal_5';
  $branch->title = 'Drupal 5';
  $branch->directories = $path . '/profiles/jetdocs/libraries/drupal_5';
  $branch->weight = 5;
  $items['drupal_5'] = $branch;

  $branch = new stdClass;
  $branch->branch_name = 'drupal_6';
  $branch->title = 'Drupal 6';
  $branch->directories = $path . '/profiles/jetdocs/libraries/drupal_6';
  $branch->weight = 6;
  $items['drupal_6'] = $branch;

  $branch = new stdClass;
  $branch->branch_name = 'drupal_7';
  $branch->title = 'Drupal 7';
  $branch->directories = $path . '/profiles/jetdocs/libraries/drupal_7';
  $branch->weight = 7;
  $items['drupal_7'] = $branch; 

  return $items;
}

