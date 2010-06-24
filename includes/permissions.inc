<?php
// $Id$

/**
 * @file
 * Sets up User Roles and Configures Permissions
 *
 * can be customised
 */

function _jetdocs_set_permissions(&$context) {

  // First set up roles
  $sitemgr_rid = install_add_role('site manager');
  $developer_rid = install_add_role('developer');
  $staff_rid = install_add_role('staff');
  $registered_rid = install_add_role('registered');

  // The value of each variable is now the role id
  // Login toboggan needs the rid of the registered but not authenticated role
  variable_set('logintoboggan_pre_auth_role', $registered_rid);

  // administrator user is managed by admin_role module

  // Setup permissions for site manager user
  install_add_permissions($sitemgr_rid, array(
    'access user profiles',
    'create comment content',
    'edit any comment content',
    'revert revisions',
    'post comments without approval',
  ));

  // Setup permissions for editor user
  install_add_permissions($developer_rid, array(
    'create comment content',
    'edit any comment content',
    'revert revisions',
    'post comments without approval',
  ));

  // Setup permissions for staff user
  install_add_permissions($staff_rid, array(
    'create comment content',
    'delete own comment content',
    'edit own comment content',
    'post comments without approval',
  ));

  // Setup permissions for authenticated user
  install_add_permissions(2, array(
    'access comments',
    'post comments',
    'access content',
    'create comment content',
    'search content',
  ));

  // Setup permissions for anonymous user
  install_add_permissions(1, array(
    'access comments',
    'access content',
    'search content',
  ));



  // Now we set up permissions on input filters

  /*
   * To set up a new input format:
   *
   * $formatid = install_add_format($name, $cache = 1)
   *
   * $name = human readable name of input format
   * $cache = if it is cacheable
   *
   * it returns the new format id
   */

  /*
   * Add a filter to the specified format
   *
   * install_set_filter($format_id, $module, $delta = 0, $weight = 0)
   *
   * format_id = the id of the input format to add the filter to
   * module = the module this filter belongs to
   * delta = the delta of this filter within the module
   * weight = the weight to apply to the filter
   */

  /*
   * Assign an input filter to be available to a role
   *
   * install_format_set_roles($roles, $format_id)
   *
   * $roles = an array of role IDs
   * $format_id = an integer of the format ID
   */


  // And we're done
  $msg = st('Configured Permissions');
  _jetdocs_log($msg);
  $context['message'] = $msg;
}

