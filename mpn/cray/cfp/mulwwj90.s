*     Helper for mpn_mul_1, mpn_addmul_1, and mpn_submul_1 for Cray PVP.

*     Copyright 1996, 2000 Free Software Foundation, Inc.
*     This file is generated from mulww.f in this same directory.

*     This file is part of the GNU MP Library.

*     The GNU MP Library is free software; you can redistribute it and/or
*     modify it under the terms of the GNU Lesser General Public License as
*     published by the Free Software Foundation; either version 2.1 of the
*     License, or (at your option) any later version.

*     The GNU MP Library is distributed in the hope that it will be useful,
*     but WITHOUT ANY WARRANTY; without even the implied warranty of
*     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
*     Lesser General Public License for more details.

*     You should have received a copy of the GNU Lesser General Public
*     License along with the GNU MP Library; see the file COPYING.LIB.  If
*     not, write to the Free Software Foundation, Inc., 51 Franklin Street,
*     Fifth Floor, Boston, MA 02110-1301, USA.

            IDENT           GMPN_MULWW
**********************************************
*      Assemble with Cal Version 2.0         *
*                                            *
* Generated by CFT77   6.0.4.19              *
*           on 06/27/00 at 04:34:13          *
*                                            *
**********************************************
* ALLOW UNDERSCORES IN IDENTIFIERS
            EDIT            OFF
            FORMAT          NEW
@DATA       SECTION         DATA,CM
@DATA       =               W.*
            CON             O'0000000000040000000000
            CON             O'0435152404713723252514
            CON             O'0535270000000000000000
            CON             O'0000000000000001200012
            VWD             32/0,32/P.GMPN_MULWW
            CON             O'0014003000000000001416
            CON             O'0000000000000000000011
            CON             O'0000000000000000000215
            BSSZ            1
@CODE       SECTION         CODE
@CODE       =               P.*
L3          =               P.*
            A0              A6
            A5              6
            B03,A5          0,A0
            A0              A1+A2
            A5              1
            0,A0            T00,A5
            B02             A2
            B66             A3
            B01             A6
            A7              P.L4
            B00             A7
            A6              @DATA
            J               $STKOFEN
GMPN_MULWW  =               P.*
            A0              @DATA+3
            B77             A0
            A1              13
            A0              B66
            A2              B66
            A4              B67
            0,A0            B77,A1
            A7              782
            A3              A2+A7
            A0              A4-A3
            JAM             L3
            A0              A6
            A5              6
            B03,A5          0,A0
            A0              A1+A2
            A5              1
            0,A0            T00,A5
            B02             A2
            B66             A3
            B01             A6
L4          =               P.*
            A7              B07
            S7              0,A7
            A6              B10
            S6              0,A6
            S5              1
            S4              <22
            S7              S7-S5
            S5              #S7
            T00             S6
            S6              S6>22
            S7              T00
            S7              S7>44
            S3              T00
            S3              S3&S4
            S6              S6&S4
            S7              S7&S4
            S3              S3<24
            S6              S6<24
            S7              S7<24
            S0              S5
            S4              S5
            S1              S6
            S2              S3
            S3              S7
            JSP             L5
L6          =               P.*
            S7              -S4
            A2              S7
            VL              A2
            A3              B06
            A5              B05
            A4              B04
            A1              VL
            A2              S4
L7          =               P.*
            A0              A3
            VL              A1
            V7              ,A0,1
            B11             A5
            A7              22
            B12             A4
            V6              V7>A7
            B13             A3
            S7              <22
            A3              B02
            V5              S7&V6
            A6              24
            V4              V5<A6
            V3              S1*FV4
            V2              S7&V7
            V1              V2<A6
            V0              S3*FV1
            V6              V0+V3
            A5              44
            V5              V7>A5
            V2              S1*FV1
            V3              S7&V5
            A0              14
            B77             A0
            A4              B77
            A0              A4+A3
            ,A0,1           V2
            V0              V3<A6
            V7              S2*FV1
            A4              142
            A0              A4+A3
            ,A0,1           V7
            V5              V7>A7
            V2              S2*FV0
            V3              V6+V2
            S7              <20
            V1              S7&V3
            A4              270
            A0              A4+A3
            ,A0,1           V0
            A4              14
            A0              A4+A3
            V7              ,A0,1
            V6              V1<A7
            V2              S2*FV4
            V0              V7+V2
            S7              <42
            V1              S7&V0
            A4              398
            A0              A4+A3
            ,A0,1           V0
            V7              S3*FV4
            V2              V5+V1
            V0              V3<A5
            A5              526
            A0              A5+A3
            ,A0,1           V0
            A5              270
            A0              A5+A3
            V4              ,A0,1
            V5              V2+V6
            A5              20
            V1              V3>A5
            V0              S1*FV4
            A5              654
            A0              A5+A3
            ,A0,1           V1
            V6              V7+V0
            A5              2
            V2              V6<A5
            V3              S3*FV4
            A5              142
            A0              A5+A3
            V1              ,A0,1
            A5              526
            A0              A5+A3
            V7              ,A0,1
            V0              V1+V7
            V6              V3<A6
            V4              V6+V2
            A6              42
            V7              V5>A6
            A5              654
            A0              A5+A3
            V1              ,A0,1
            A5              398
            A0              A5+A3
            V3              ,A0,1
            V6              V4+V1
            V2              V3>A6
            V5              V6+V2
            A6              B12
            V4              V3<A7
            A7              B13
            A3              A7+A1
            A7              B11
            A5              A7+A1
            A4              A6+A1
            A7              A2+A1
            A0              A2+A1
            A2              64
            B13             A0
            V1              V0+V4
            A0              B11
            ,A0,1           V1
            V6              V5+V7
            A0              A6
            ,A0,1           V6
            A0              B13
            A1              A2
            A2              A7
            JAN             L7
L8          =               P.*
L5          =               P.*
            S1              0
            A0              B02
            A2              B02
            A1              13
            B66             A0
            B77,A1          0,A0
            A0              A2+A1
            A1              1
            T00,A1          0,A0
            J               B00
            EXT             $STKOFEN:p
            ENTRY           GMPN_MULWW
            END