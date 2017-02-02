dnl file      : m4/libsqlite.m4
dnl copyright : Copyright (c) 2009-2015 Code Synthesis Tools CC
dnl license   : GNU GPL v2; see accompanying LICENSE file
dnl
dnl LIBSQLITE([ACTION-IF-FOUND[,ACTION-IF-NOT-FOUND]])
dnl
dnl Also sets libsqlite_unlock_notify to yes if sqlite3_unlock_notify()
dnl functionality is available.
dnl
AC_DEFUN([LIBSQLITE], [
libsqlite_found=no
libsqlite_unlock_notify=no

AC_MSG_CHECKING([for libsqlite3])

save_LIBS="$LIBS"
LIBS="-lsqlite3 $LIBS"

CXX_LIBTOOL_LINK_IFELSE([
AC_LANG_SOURCE([
#include <sqlite3.h>

int
main ()
{
  sqlite3* handle;
  sqlite3_open ("", &handle);
  sqlite3_stmt* stmt;
  sqlite3_prepare (handle, "", 0, &stmt, 0);
  sqlite3_finalize (stmt);
  sqlite3_close (handle);
}
])],
[
libsqlite_found=yes
])

if test x"$libsqlite_found" = xno; then
  LIBS="$save_LIBS"
fi

# Check for unlock_notify.
#
if test x"$libsqlite_found" = xyes; then
CXX_LIBTOOL_LINK_IFELSE([
AC_LANG_SOURCE([
#include <sqlite3.h>

int
main ()
{
  sqlite3* handle (0);
  sqlite3_unlock_notify (handle, 0, 0);
}
])],
[
libsqlite_unlock_notify=yes
])
fi

if test x"$libsqlite_found" = xyes; then
  AC_MSG_RESULT([yes])
  $1
else
  AC_MSG_RESULT([no])
  $2
fi
])dnl
