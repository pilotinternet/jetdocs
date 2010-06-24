; $Id$
;
; JetDocs makefile
;
; by PILOT INTERNET - www.pilotinternet.com

core = 6.x

; ============================================================================== Modules - The A List
; -------------------------------------------------------------------------- CCK
projects[cck][subdir] = "contrib"

; ------------------------------------------------------------------------ VIEWS
projects[views][subdir] = "contrib"

; ------------------------------------------------------------------------ TOKEN
projects[token][subdir] = "contrib"


; ============================================================================== Modules - Dev
; ----------------------------------------------------------------------- CTOOLS
projects[ctools][subdir] = "dev"

; ------------------------------------------------------------------------ DEVEL
projects[devel][subdir] = "dev"

; ---------------------------------------------------------- INSTALL PROFILE API
projects[install_profile_api][subdir] = "dev"

; ----------------------------------------------------------- DRUPAL FOR FIREBUG
projects[drupalforfirebug][subdir] = "dev"

; ------------------------------------------------------------------------ CODER
projects[coder][subdir] = "dev"

; --------------------------------------------------------------- MODULE BUILDER
projects[module_builder][subdir] = "dev"

; ---------------------------------------------------------------- VARIABLE DUMP
projects[variable_dump][subdir] = "dev"


; ============================================================================== Modules - Utility
; -------------------------------------------------------------------- LIBRARIES
projects[libraries][subdir] = "contrib"

; -------------------------------------------------------------- TRANSLITERATION
projects[transliteration][subdir] = "contrib"

; ------------------------------------------------------------- BACKUP / MIGRATE
projects[backup_migrate][subdir] = "contrib"

; ----------------------------------------------------------------- SECURE PAGES
projects[securepages][subdir] = "contrib"


; ============================================================================== Modules - Admin
; ------------------------------------------------------------------- ADMIN MENU
projects[admin_menu][subdir] = "contrib"

; ------------------------------------------------------------------------ ADMIN
projects[admin][subdir] = "contrib"

; ------------------------------------------------------------------- ADMIN ROLE
projects[adminrole][subdir] = "contrib"

; ---------------------------------------------------------------- ADVANCED HELP
projects[advanced_help][subdir] = "contrib"

; ------------------------------------------------------------------- SEARCH 404
projects[search404][subdir] = "contrib"



; ============================================================================== Modules - Content Utilities

; ------------------------------------------------------------------------- DIFF
projects[diff][subdir] = "contrib"

; ------------------------------------------------------------------------- FLAG
projects[flag][subdir] = "contrib"

; ----------------------------------------------------------------- FLAG WEIGHTS
projects[flag_weights][subdir] = "contrib"

; ----------------------------------------------------------- NODE RELATIONSHIPS
projects[noderelationships][subdir] = "contrib"

; --------------------------------------------------------------- COMMENT UPLOAD
projects[comment_upload][subdir] = "contrib"

; --------------------------------------------------------------------- GLOSSIFY
projects[glossify][subdir] = "contrib"
; ?? Remove ??

; -------------------------------------------------------------- SIMPLE HTML DOM
projects[simplehtmldom][subdir] = "contrib"


; ============================================================================== Modules - Display Suite
; ---------------------------------------------------------------- DISPLAY SUITE
projects[ds][subdir] = "contrib"

; ---------------------------------------------------------------- NODE DISPLAYS
projects[nd][subdir] = "contrib"

; -------------------------------------------------------- NODE DISPLAYS CONTRIB
projects[nd_contrib][subdir] = "contrib"

; ------------------------------------------------------------- COMMENT DISPLAYS
projects[cd][subdir] = "contrib"

; ---------------------------------------------------------------- USER DISPLAYS
projects[ud][subdir] = "contrib"

; --------------------------------------------------------------- VIEWS DISPLAYS
projects[vd][subdir] = "contrib"


; ============================================================================== Modules - Input Formats

; ------------------------------------------------------------------ CODE FILTER
projects[codefilter][subdir] = "contrib" 



; ============================================================================== Modules -  User / Login /Auth

; ----------------------------------------------------------------- OPENID ADMIN
projects[openidadmin][subdir] = "contrib"

; --------------------------------------------------------------- LOGIN TOBOGGAN
projects[logintoboggan][subdir] = "contrib"

; ---------------------------------------------------------------------- CAPTCHA
projects[captcha][subdir] = "contrib"

; ----------------------------------------------------------------- CAPTCHA PACK
projects[captcha_pack][subdir] = "contrib"

; ----------------------------------------------------------------- ACCOUNT MENU
projects[accountmenu][subdir] = "contrib"


; ============================================================================== Modules - Features/Spaces/Context

; -------------------------------------------------------------------- STRONGARM
projects[strongarm][subdir] = "contrib"


; ============================================================================== Modules - SEO
; --------------------------------------------------------------------- PATHAUTO
projects[pathauto][subdir] = "contrib"


; ============================================================================== Modules - UI
; ---------------------------------------------------------------- VERTICAL TABS
projects[vertical_tabs][subdir] = "contrib"


; ============================================================================== Modules - JQuery
; ---------------------------------------------------------------- JQUERY UPDATE
projects[jquery_update][subdir] = "contrib"
projects[jquery_update][version] = "2.x-dev"

; -------------------------------------------------------------------- JQUERY UI
projects[jquery_ui][subdir] = "contrib"

; --------------------------------------------------------------------------- JQ
projects[jq][subdir] = "contrib"

; ---------------------------------------------------------------- JQUERY PLUGIN
projects[jquery_plugin][subdir] = "contrib"


; ============================================================================== Modules - Theming


; ------------------------------------------------------------------------ SKINR
projects[skinr][subdir] = "contrib"
projects[skinr][version] = "1.x-dev"

; ----------------------------------------------------------- THEME SETTINGS API
projects[themesettingsapi][subdir] = "contrib"


; ------------------------------------------------------------------------ PRINT
projects[print][subdir] = "contrib"

; ------------------------------------------------------------------- BLOCKS 404
projects[blocks404][subdir] = "contrib"

; ============================================================================== Toolbox

; ------------------------------------------------------------------------- SEED
projects[seed][subdir] = "contrib"
projects[seed][location] = http://code.developmentseed.org/fserver

; ============================================================================== API

; -------------------------------------------------------------------------- API
projects[api][subdir] = "api"

; -------------------------------------------------------------------- JOB QUEUE
projects[job_queue][subdir] = "api"

; ----------------------------------------------------------- GRAMMER PARSER 6.x
projects[grammer_parser][subdir] = "api"
projects[grammer_parser][location] = http://code.pilotinternet.com/fserver


; ============================================================================== THEMES - Base =================

; ----------------------------------------------------------------------- FUSION
projects[fusion][subdir] = "base"
projects[fusion][version] = "1.x-dev"

; -------------------------------------------------------------------------- TAO
projects[tao][subdir] = "base"
projects[tao][location] = "http://code.developmentseed.org/fserver"



; ============================================================================== Themes - Admin
; ------------------------------------------------------------------------ RUBIK
projects[rubik][subdir] = "admin"
projects[rubik][location] = http://code.developmentseed.org/fserver



; ============================================================================== Themes - Frontend
projects[singular][subdir] = "admin"
projects[singular][location] = http://code.developmentseed.org/fserver


; ============================================================================== Libraries =====================

libraries[jquery_ui][download][type] = "get"
libraries[jquery_ui][download][url] = "http://jquery-ui.googlecode.com/files/jquery.ui-1.6.zip"
libraries[jquery_ui][directory_name] = "jquery.ui"
libraries[jquery_ui][destination] = modules/contrib/jquery_ui



; ============================================================================== CODEBASES

; ------------------------------------------------------------------------------ Drupal 5
libraries[drupal_5][download][type] = "cvs"
libraries[drupal_5][download][root] = ":pserver:anonymous:anonymous@cvs.drupal.org:/cvs/drupal"
libraries[drupal_5][download][revision] = "DRUPAL-5"
libraries[drupal_5][download][module] = "drupal"

; ------------------------------------------------------------------------------ Drupal 6
libraries[drupal_6][download][type] = "cvs"
libraries[drupal_6][download][root] = ":pserver:anonymous:anonymous@cvs.drupal.org:/cvs/drupal"
libraries[drupal_6][download][revision] = "DRUPAL-6"
libraries[drupal_6][download][module] = "drupal"

;libraries[developer-docs][download][type] = "cvs"
;libraries[developer-docs][download][root] = ":pserver:anonymous:anonymous@cvs.drupal.org:/cvs/drupal-contrib"
;libraries[developer-docs][download][revision] = "DRUPAL-6--1"
;libraries[developer-docs][download][module] = "developer-docs"
;libraries[developer-docs][destination] = libraries/drupal-6
; Testing way to reproduce the cvs command below with Drush Make
; cvs -z6 -d:pserver:anonymous:anonymous@cvs.drupal.org:/cvs/drupal-contrib checkout -r DRUPAL-6--1 -d developer-docs contributions/docs/developer

; ------------------------------------------------------------------------------ Drupal 7 HEAD
libraries[drupal_7][download][type] = "cvs"
libraries[drupal_7][download][root] = ":pserver:anonymous:anonymous@cvs.drupal.org:/cvs/drupal"
libraries[drupal_7][download][revision] = "HEAD"
libraries[drupal_7][download][module] = "drupal"



; ------------------------------------------------------------------------------ JumpJet
libraries[jumpjet][type] = "profile"
libraries[jumpjet][download][type] = "git"
libraries[jumpjet][download][url] = "git://github.com/pilotinternet/jumpjet.git"