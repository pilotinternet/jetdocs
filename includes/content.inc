<?php
// $Id$

/*
 * @file
 * Creation of, and settings for, content types and nodes.
 *
 */

function _jetdocs_create_content(&$context) {


  /*
   *
   * Create a new content type
   *
   * install_create_content_type($content_type, $content_name, $properties = array())
   *
   * content_type = machine readable name - only alphanumeric and underscores
   * content_name = human readable name
   * properties - shown below with defaults..
   *
   * 	 $properties = array(
   * 	'module' => 'node',
   * 	'description' => '',
   * 	'custom' => TRUE,
   * 	'modified' => TRUE,
   * 	'has_title' => TRUE,
   * 	'has_body' => TRUE,
   * 	'title_label' => 'Title',
   * 	'body_label' => '',
   * 	'locked' => FALSE,
   * 	'min_word_count' => '0',
   * 	'orig_type' => '',
   * 	'help' => '',
   * 	);
   *
   *
   */

  // We'll create our own Page content type - designed for static pages on the site
  $properties = array(
    'module' => 'node',
    'description' => 'Pages of general static content on the site',
    'custom' => TRUE,
    'modified' => TRUE,
    'has_title' => TRUE,
    'has_body' => TRUE,
    'title_label' => 'Title',
    'body_label' => 'Page Content',
    'locked' => FALSE,
    'min_word_count' => '0',
    'orig_type' => '',
    'help' => '',
  );
  install_create_content_type('page', 'Page', $properties);

  /*
   * Create a new node
   *
   * $node = install_create_node($title, $body, $properties = array())
   *
   * $properties = array(
   *  'type' => 'page',
   * 	'teaser' => NULL,
   * 	'log' => '',
   * 	'created' => '',
   * 	'format' => FILTER_FORMAT_DEFAULT,
   * 	'uid' => isset($account) ? $account->uid : 0,
   * );
   *
   * returns the node object
   */

   // Create a welcome node
   $title = "JetDocs";
   $body = "<p>JetDocs provides complete developer documentation for the 'Jet' installation profiles for Drupal, by Pilot Internet. It also includes developer documentation for vanilla Drupal 5, 6 & 7.</p><p>You can get more information, or help, with JetDocs at http://atc.pilotinternet.com/jetdocs</p>";
   $properties = array(
     'type' => 'page',
     'teaser' => NULL,
     'log' => '',
     'created' => '',
     'format' => FILTER_FORMAT_DEFAULT,
     'uid' => isset($account) ? $account->uid : 0,
    );
  $node = install_create_node($title, $body, $properties);

  // Now we set this node to be the front page
  variable_set('site_frontpage', 'node/'.$node->nid);
  /*
   * Set a path alias
   *
   * install_menu_create_url_alias($src = '', $dst = ''
   *
   * src = the original url eg node/1
   * dst = the new url path
   *
   */



  /**
   * Various content type settings
   */
  // Default page to not be promoted and have comments disabled.
  variable_set('node_options_page', array('status'));
  variable_set('comment_page', COMMENT_NODE_DISABLED);

  /**
   * Control whether the 'submitted by information is shown
   */
  $theme_settings = variable_get('theme_settings', array());
  $theme_settings['toggle_node_info_page'] = FALSE;
  variable_set('theme_settings', $theme_settings);


  
// Finish off content setup
  $msg = st('Created Content');
  _jetdocs_log($msg);
  $context['message'] = $msg;
}