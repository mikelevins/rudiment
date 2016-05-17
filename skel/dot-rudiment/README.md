# .rudiment

This directory contains host-specific data used by the rudiment webapp
server. A rudiment webapp expects to find the dot-rudiment directory
at ~/.rudiment. It is assumed that the application will replace the
name "rudiment" with some application-defined name, and that it may
also add additional application-specific configuration files to the
directory.

You should not use skel/dot-rudiment as the actual configuration files
for a rudiment application. You should instead move it to some
suitable location (such as ~/.<appname>) and change the functions in
src/system-configuration.lisp to look in that location for
configuration data.



