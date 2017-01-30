# -*- Autoconf -*-
# Copyright (c) 2014-2015 Tommie Gannert
#
# See the LICENSE file.
#

AC_PREREQ([2.68])
AC_INIT([xtensa-hal], [RF-2015.2])
AM_INIT_AUTOMAKE([foreign])
AC_CONFIG_SRCDIR([src/hal/attribute.c])

AC_CANONICAL_HOST

LDFLAGS="${LDFLAGS:+$LDFLAGS }-nostdlib"

AM_PROG_AS
AM_PROG_AR
AC_PROG_CC
AC_PROG_RANLIB

AC_MSG_CHECKING([for call0 ABI])
AC_COMPILE_IFELSE([AC_LANG_PROGRAM([#if __XTENSA_CALL0_ABI__
#else
#error "Not call0 ABI"
#endif
], [])], [call0_abi=yes], [call0_abi=no])
AC_MSG_RESULT([$call0_abi])
AM_CONDITIONAL([XTENSA_CALL0_ABI], [test x$call0_abi = xyes])

CPPFLAGS="${CPPFLAGS:+$CPPFLAGS }-I\${top_srcdir}/include -I\${top_srcdir}/include/arch/include"

AC_OUTPUT([
	Makefile
	include/Makefile
	src/hal/Makefile
])
