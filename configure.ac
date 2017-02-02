# file      : configure.ac
# copyright : Copyright (c) 2009-2015 Code Synthesis Tools CC
# license   : GNU GPL v2; see accompanying LICENSE file

AC_PREREQ(2.60)
AC_INIT([libodb-sqlite], [2.4.0], [odb-users@codesynthesis.com])
AC_CONFIG_AUX_DIR([config])
AC_CONFIG_MACRO_DIR([m4])
AC_CONFIG_SRCDIR([odb/sqlite/version.hxx])

AM_INIT_AUTOMAKE([-Wall -Werror foreign nostdinc subdir-objects dist-bzip2 dist-zip tar-ustar])
m4_ifdef([AM_PROG_AR], [AM_PROG_AR]) # Required by automake 1.12.

LT_INIT([win32-dll])

AC_CANONICAL_HOST

# Check for C++ compiler and use it to compile the tests.
#
AC_PROG_CXX
AC_LANG(C++)

# Create the libtool executable so that we can use it in further tests.
#
LT_OUTPUT

# Check for threads.
#
THREADS

# Check for libsqlite.
#
LIBSQLITE(
  [],
  [AC_MSG_ERROR([libsqlite3 is not found; consider using CPPFLAGS/LDFLAGS to specify its location])])

AS_IF([test x$libsqlite_unlock_notify = xyes],
AC_DEFINE([LIBODB_SQLITE_HAVE_UNLOCK_NOTIFY], [1], [Have sqlite3_unlock_notify.]))

AS_IF([test x$threads != xnone -a x$libsqlite_unlock_notify = xno],
AC_MSG_WARN([libsqlite3 is built without sqlite3_unlock_notify support; multi-threaded support will be limited]))

# Check for libodb.
#
LIBODB([],[AC_MSG_ERROR([libodb is not found; consider using --with-libodb=DIR])])

# Define LIBODB_SQLITE_STATIC_LIB if we are build static library on certain
# platforms.
#
STATIC_LIB([LIBODB_SQLITE_STATIC_LIB], [Static library interface.])

# Allow the user to specify the pkgconfig directory.
#
PKGCONFIG

# Check if we should disable rpath.
#
DISABLE_RPATH

# Output.
#
AC_CONFIG_HEADERS([odb/sqlite/config.h odb/sqlite/details/config.h])
AC_CONFIG_FILES([libodb-sqlite.pc Makefile odb/sqlite/Makefile])
AC_OUTPUT
