/* mpz/fac_ui.c forced to use large algorithm . */

/*
Copyright 2000 Free Software Foundation, Inc.

This file is part of the GNU MP Library.

The GNU MP Library is free software; you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation; either version 2.1 of the License, or (at your
option) any later version.

The GNU MP Library is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public
License for more details.

You should have received a copy of the GNU Lesser General Public License
along with the GNU MP Library; see the file COPYING.LIB.  If not, write to
the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
MA 02110-1301, USA.
*/

#include "mpir.h"
#include "gmp-impl.h"

#undef FAC_UI_THRESHOLD
#define FAC_UI_THRESHOLD  1
#define __gmpz_fac_ui  mpz_fac_ui_large

#define MPZ_FAC_IS_TUNING
#ifndef _MSC_VER
#include "../mpz/fac_ui.h"
#else
#include "fac_ui.h"
#endif
#include "../mpz/fac_ui.c"
