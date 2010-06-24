; $Id$
;
; JetDocs Stub makefile
; This is the makefile you should run manually. It will then build the whole platform.
; For more information see http://atc.pilotinternet.com/jetdocs

core = 6.x 

;=== We'll use pressflow as our core, so have commented out standard drupal
;projects[] = "drupal"

;==== Here comes Pressflow, comment out the next 3 lines if you prefer standard drupal as above
projects[pressflow][type] = "core"
projects[pressflow][download][type] = "get"
projects[pressflow][download][url] = "http://launchpad.net/pressflow/6.x/6.16.77/+download/pressflow-6.16.77.tar.gz"

;=== Now we go get our JetDocs install profile
projects[jetdocs][type] = "profile"
projects[jetdocs][download][type] = "git"
projects[jetdocs][download][url] = "git://github.com/pilotinternet/jetdocs.git"

;=== The install profile contains another makefile which will set everything else up
