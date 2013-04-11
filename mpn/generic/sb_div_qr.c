/* mpn_sb_div_qr -- Schoolbook division using the M�ller-Granlund 3/2
   division algorithm.

   Contributed to the GNU project by Torbjorn Granlund.

   THE FUNCTION IN THIS FILE IS INTERNAL WITH A MUTABLE INTERFACE.  IT IS ONLY
   SAFE TO REACH IT THROUGH DOCUMENTED INTERFACES.  IN FACT, IT IS ALMOST
   GUARANTEED THAT IT WILL CHANGE OR DISAPPEAR IN A FUTURE GMP RELEASE.

Copyright 2007, 2009 Free Software Foundation, Inc.

Copyright 2010, 2013 William Hart

This file is part of the GNU MP Library.

The GNU MP Library is free software; you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation; either version 3 of the License, or (at your
option) any later version.

The GNU MP Library is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public
License for more details.

You should have received a copy of the GNU Lesser General Public License
along with the GNU MP Library.  If not, see http://www.gnu.org/licenses/.  */


#include "mpir.h"
#include "gmp-impl.h"
#include "longlong.h"

#define SB_DIV_QR_SMALL_THRESHOLD 30

mp_limb_t
mpn_sb_div_qr (mp_ptr qp,
		  mp_ptr np, mp_size_t nn,
		  mp_srcptr dp, mp_size_t dn,
		  mp_limb_t dinv)
{
  mp_limb_t qh;
  mp_size_t i;
  mp_limb_t n1, n0;
  mp_limb_t d1, d0, d01, d11;
  mp_limb_t cy, cy1, cy2;
  mp_limb_t q;

  ASSERT (dn > 2);
  ASSERT (nn >= dn);
  ASSERT ((dp[dn-1] & GMP_NUMB_HIGHBIT) != 0);

  np += nn;

  qh = mpn_cmp (np - dn, dp, dn) >= 0;
  if (qh != 0)
    mpn_sub_n (np - dn, np - dn, dp, dn);

  d1 = dp[dn - 1];

  if (dn <= SB_DIV_QR_SMALL_THRESHOLD)
    {
    np--;
    
  for (i = nn - dn - 1; i >= 0; i--)
    {
      /* fetch next word */
      cy = *np--;
      
      mpir_divapprox32_preinv2(q, cy, np[0], dinv);
      
	  /* a -= d*q1 */
      cy -= mpn_submul_1(np - dn + 1, dp, dn, q);

      /* correct if remainder is too large */
      if (UNLIKELY(cy || np[0] >= d1))
      {
         if (cy || mpn_cmp(np - dn + 1, dp, dn) >= 0)
         {
            q++;
            mpn_sub_n(np - dn + 1, np - dn + 1, dp, dn);
         }
      }
      qp[i] = q;
     }
    }
  else
    {
  qp += nn - dn;

  dn -= 2;			/* offset dn by 2 for main division loops,
				   saving two iterations in mpn_submul_1.  */
  d0 = dp[dn];

  d01 = d0 + 1;
  d11 = d1 + (d01 == 0);

  np -= 2;

  n1 = np[1];

  for (i = nn - (dn + 2); i > 0; i--)
    {
      np--;
      if (UNLIKELY (n1 == d1) && np[1] == d0)
	{
	  q = GMP_NUMB_MASK;
	  mpn_submul_1 (np - dn, dp, dn + 2, q);
	  n1 = np[1];		/* update n1, last loop's value will now be invalid */
	}
      else
	{
	  mpir_divrem32_preinv2(q, n1, n0, n1, np[1], np[0], d11, d01, d1, d0, dinv);

     cy2 = mpn_submul_1 (np - dn, dp, dn, q);

	  sub_333(cy, n1, n0, 0, n1, n0, 0, 0, cy2);

	  np[0] = n0;

	  if (UNLIKELY (cy != 0))
	    {
	      n1 += d1 + mpn_add_n (np - dn, np - dn, dp, dn + 1);
         q--;
	    }
	}

      *--qp = q;
    }
  np[1] = n1;
  }

  return qh;
}
