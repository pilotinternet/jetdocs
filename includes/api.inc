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
function _jetdocs_setup_branches($args, &$context) {
  $items = _jetdocs_get_branches();

  // Create branches for API
  foreach ($items as $item) {
    drupal_write_record('api_branch', $item);
  }
  $context['results'][] = t('Created API branches.');

  // Set default API
  variable_set('api_default_branch', 'jumpjet');
  $context['results'][] = t('Set default API to JumpJet.');

  // Finish off API setup
  $msg = st('API branches set up');
  _jetdocs_log($msg);
  $context['message'] = $msg;
}

/**
 * Defined branches
 */
function _jetdocs_get_branches() {
  $items = array();
  $path = realpath('.');

  $branch = new stdClass;
  $branch->branch_name = 'jumpjet';
  $branch->title = 'JumpJet';
  $branch->directories = $path . '/profiles/jumpjet/libraries/jumpjet';
  $branch->weight = 5;
  $items['jumpjet'] = $branch;

  $branch = new stdClass;
  $branch->branch_name = 'drupal_5';
  $branch->title = 'Drupal 5';
  $branch->directories = $path . '/profiles/jumpjet/libraries/drupal_5';
  $branch->weight = 5;
  $items['drupal_5'] = $branch;

  $branch = new stdClass;
  $branch->branch_name = 'drupal_6';
  $branch->title = 'Drupal 6';
  $branch->directories = $path . '/profiles/jumpjet/libraries/drupal_6';
  $branch->weight = 6;
  $items['drupal_6'] = $branch;

  $branch = new stdClass;
  $branch->branch_name = 'drupal_7';
  $branch->title = 'Drupal 7';
  $branch->directories = $path . '/profiles/jumpjet/libraries/drupal_7';
  $branch->weight = 7;
  $items['drupal_7'] = $branch;

  return $items;
}

