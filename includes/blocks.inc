<?php
// $Id$

/**
 * @file
 * Definition and placement of blocks
 * 
 * Blocks setup for the Pilot Jumbo install profile
 * This can be customised for other install profiles
 * 
 */

function _jetdocs_setup_blocks(&$context) {
  global $theme_key, $base_url;
  cache_clear_all();


  /*
   * Create a new custom block
   *
   * install_create_custom_block($body, $description, $format = FILTER_FORMAT_DEFAULT)
   *
   * returns the blocks delta
   *
   */
  $usefullinks = install_create_custom_block("<ul><li><a href='http://atc.pilotinternet.com/jetdocs'>JetDocs Help</a></li></ul>", t('JetDocs resources'), 2);
  $pilotcredit = install_create_custom_block("Powered by Pilot Internet, a <a href='http://pilotinternet.com'>UK Drupal</a> agency.", t('Powered by'), 2);


  /*
   * Add a custom block to a theme
   *
   * install_add_block($module, $delta, $theme, $status, $weight = 0, $region = '', $visibility = 0, $pages = '', $custom = 0, $throttle = 0, $title = '')
   */
  install_add_block('block', $usefullinks, 'singular', 1, 10, 'right');
  install_add_block('block', $usefullinks, 'rubik', 1, -10, 'content');
  install_add_block('block', $pilotcredit, 'singular', 1, 40, 'content');
  install_add_block('block', $pilotcredit, 'rubik', 1, 40, 'content');

  /*
   * Display an existing block in a certain theme
   *
   * install_set_block($module, $delta, $theme, $region, $weight = 0, $visibility = NULL, $pages = NULL, $custom = NULL, $throttle = NULL, $title = NULL)
   */

  // The devel blocks - frontend
  install_set_block('api', 'api-search', 'singular', 'right', 1);
  install_set_block('api', 'navigation', 'singular', 'right', 2);

  // The User Login Block - frontend
  install_set_block('user', 0, 'singular', 'right', -5);
  
  /*
   * Disable an existing block within a theme
   *
   * install_disable_block($module, $delta, $theme)
   */

  // The User Login Block - backend
  install_disable_block('user', '0', 'rubik');

  // The Navigation menu - both
  install_disable_block('user', '1', 'singular');
  install_disable_block('user', '1', 'rubik');

  // The Powered by Drupal block - both
  install_disable_block('system', '0', 'singular');
  install_disable_block('system', '0', 'rubik');





  $msg = st('Configured Blocks');
  _jetdocs_log($msg);
  $context['message'] = $msg;
}
