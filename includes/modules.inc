<?php
// $Id$

/**
 * @file
 * Setup Extra Modules
 * 
 * This is where to add extra modules and features for custom install profiles
 * 
 */

function _jetdocs_extra_modules() {
  $custommodules = array(
    'skinr',
    'logintoboggan',
    'search404',
    'captcha',
    'css_captcha',
    'pathauto',
    'api',

    // Add more modules if necessary


  );
  return $custommodules;
}
