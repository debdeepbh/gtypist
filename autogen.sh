#!/bin/sh
# Run this program to build the configuration
# files for GNU Typist:
# [*/]Makefile.in, aclocal.m4, configure,
# config.h.in, config.sub, config.guess
# INSTALL, configur.bat

# WARNING: You need the following tool
# versions to run this script:
# autoconf-2.50, automake-1.4, m4-1.4, gettext 0.10.39

# Get version and write it in files

. version.sh

makeinfo -Idoc doc/gtypist.texi -o doc/gtypist.info

# TODO: check whether someone has modified $file and if so
# write a meaningful message that this file is generated from $file.in
for file in configur.bat INSTALL
do
  sed "s/@VERSION/$VERSION/g" ${file}.in > $file 
done

# Build configuration files

rm -f config.cache
aclocal
autoheader
automake --add-missing
autoconf

