; ================================================================================
; superfluous_mov.Program.BugBugBug()
; 413 (0x19D) bytes
; 105 (0x69) instructions

00007F05AE6B0900 55                   push    rbp
00007F05AE6B0901 4156                 push    r14
00007F05AE6B0903 53                   push    rbx
00007F05AE6B0904 4883EC30             sub     rsp,30h
00007F05AE6B0908 C5F877               vzeroupper
00007F05AE6B090B 488D6C2440           lea     rbp,[rsp+40h]
00007F05AE6B0910 33C0                 xor     eax,eax
00007F05AE6B0912 488945E8             mov     [rbp-18h],rax
00007F05AE6B0916 48C745E84589A422     mov     qword ptr [rbp-18h],22A48945h

;             var N = Vector256<int>.Count;
00007F05AE6B091E BF64000000           mov     edi,64h
00007F05AE6B0923 C5F96EC7             vmovd   xmm0,edi
00007F05AE6B0927 C4E27D58C0           vpbroadcastd ymm0,xmm0

;             var nextPtr = stackalloc int[64];
00007F05AE6B092C 4883C420             add     rsp,20h
00007F05AE6B0930 BF10000000           mov     edi,10h

LBL_0:
00007F05AE6B0935 6A00                 push    0
00007F05AE6B0937 6A00                 push    0
00007F05AE6B0939 48FFCF               dec     rdi
00007F05AE6B093C 75F7                 jne     short LBL_0
00007F05AE6B093E 4883EC20             sub     rsp,20h
00007F05AE6B0942 488D7C2420           lea     rdi,[rsp+20h]

;             var L0 = LoadAlignedVector256(nextPtr + 0*N);
00007F05AE6B0947 C5FD6F0F             vmovdqa ymm1,[rdi]

;             var L1 = LoadAlignedVector256(nextPtr + 1*N);
00007F05AE6B094B C5FD6F5720           vmovdqa ymm2,[rdi+20h]

;             var L2 = LoadAlignedVector256(nextPtr + 2*N);
00007F05AE6B0950 C5FD6F5F40           vmovdqa ymm3,[rdi+40h]

;             var L3 = LoadAlignedVector256(nextPtr + 3*N);
00007F05AE6B0955 C5FD6F6760           vmovdqa ymm4,[rdi+60h]

;             var L4 = LoadAlignedVector256(nextPtr + 4*N);
00007F05AE6B095A C5FD6FAF80000000     vmovdqa ymm5,[rdi+80h]

;             var L5 = LoadAlignedVector256(nextPtr + 5*N);
00007F05AE6B0962 C5FD6FB7A0000000     vmovdqa ymm6,[rdi+0A0h]

;             var L6 = LoadAlignedVector256(nextPtr + 6*N);
00007F05AE6B096A C5FD6FBFC0000000     vmovdqa ymm7,[rdi+0C0h]

;             var L7 = LoadAlignedVector256(nextPtr + 7*N);
00007F05AE6B0972 C57D6F87E0000000     vmovdqa ymm8,[rdi+0E0h]

;             maskyMcMaskFace  = (ulong) (uint) MoveMask(CompareGreaterThan(L0, P).AsSingle()) << 00;
00007F05AE6B097A C5F566C8             vpcmpgtd ymm1,ymm1,ymm0
00007F05AE6B097E C5FC50F9             vmovmskps edi,ymm1
00007F05AE6B0982 8BFF                 mov     edi,edi

;             maskyMcMaskFace |= (ulong) (uint) MoveMask(CompareGreaterThan(L1, P).AsSingle()) << 08;
00007F05AE6B0984 C5ED66C8             vpcmpgtd ymm1,ymm2,ymm0
00007F05AE6B0988 C5FC50C1             vmovmskps eax,ymm1
00007F05AE6B098C 8BC0                 mov     eax,eax
00007F05AE6B098E 48C1E008             shl     rax,8
00007F05AE6B0992 480BF8               or      rdi,rax

;             maskyMcMaskFace |= (ulong) (uint) MoveMask(CompareGreaterThan(L2, P).AsSingle()) << 16;
00007F05AE6B0995 C5E566C8             vpcmpgtd ymm1,ymm3,ymm0
00007F05AE6B0999 C5FC50C1             vmovmskps eax,ymm1
00007F05AE6B099D 8BC0                 mov     eax,eax
00007F05AE6B099F 48C1E010             shl     rax,10h
00007F05AE6B09A3 480BC7               or      rax,rdi
00007F05AE6B09A6 488BF8               mov     rdi,rax

;             maskyMcMaskFace |= (ulong) (uint) MoveMask(CompareGreaterThan(L3, P).AsSingle()) << 24;
00007F05AE6B09A9 C5DD66C8             vpcmpgtd ymm1,ymm4,ymm0
00007F05AE6B09AD C5FC50C1             vmovmskps eax,ymm1
00007F05AE6B09B1 8BC0                 mov     eax,eax
00007F05AE6B09B3 48C1E018             shl     rax,18h
00007F05AE6B09B7 480BC7               or      rax,rdi
00007F05AE6B09BA 488BF8               mov     rdi,rax

;             maskyMcMaskFace |= (ulong) (uint) MoveMask(CompareGreaterThan(L4, P).AsSingle()) << 32;
00007F05AE6B09BD C5D566C8             vpcmpgtd ymm1,ymm5,ymm0
00007F05AE6B09C1 C5FC50C1             vmovmskps eax,ymm1
00007F05AE6B09C5 8BC0                 mov     eax,eax
00007F05AE6B09C7 48C1E020             shl     rax,20h
00007F05AE6B09CB 480BC7               or      rax,rdi
00007F05AE6B09CE 488BF8               mov     rdi,rax

;             maskyMcMaskFace |= (ulong) (uint) MoveMask(CompareGreaterThan(L5, P).AsSingle()) << 40;
00007F05AE6B09D1 C5CD66C8             vpcmpgtd ymm1,ymm6,ymm0
00007F05AE6B09D5 C5FC50C1             vmovmskps eax,ymm1
00007F05AE6B09D9 8BC0                 mov     eax,eax
00007F05AE6B09DB 48C1E028             shl     rax,28h
00007F05AE6B09DF 480BC7               or      rax,rdi
00007F05AE6B09E2 488BF8               mov     rdi,rax

;             maskyMcMaskFace |= (ulong) (uint) MoveMask(CompareGreaterThan(L6, P).AsSingle()) << 48;
00007F05AE6B09E5 C5C566C8             vpcmpgtd ymm1,ymm7,ymm0
00007F05AE6B09E9 C5FC50C1             vmovmskps eax,ymm1
00007F05AE6B09ED 8BC0                 mov     eax,eax
00007F05AE6B09EF 48C1E030             shl     rax,30h
00007F05AE6B09F3 480BC7               or      rax,rdi
00007F05AE6B09F6 488BF8               mov     rdi,rax

;             maskyMcMaskFace |= (ulong) (uint) MoveMask(CompareGreaterThan(L7, P).AsSingle()) << 56;
00007F05AE6B09F9 C5BD66C0             vpcmpgtd ymm0,ymm8,ymm0
00007F05AE6B09FD C5FC50C0             vmovmskps eax,ymm0
00007F05AE6B0A01 8BC0                 mov     eax,eax
00007F05AE6B0A03 48C1E038             shl     rax,38h
00007F05AE6B0A07 480BC7               or      rax,rdi
00007F05AE6B0A0A 488BF8               mov     rdi,rax

;             var popCount = PopCount((ulong) maskyMcMaskFace);
00007F05AE6B0A0D 33DB                 xor     ebx,ebx
00007F05AE6B0A0F F3480FB8DF           popcnt  rbx,rdi

;             Console.WriteLine($"{popCount}");
00007F05AE6B0A14 48BF28BE72AE057F0000 mov     rdi,offset methodtable(System.UInt64)
00007F05AE6B0A1E E8FDF93879           call    CORINFO_HELP_NEWSFAST
00007F05AE6B0A23 4C8BF0               mov     r14,rax
00007F05AE6B0A26 49895E08             mov     [r14+8],rbx
00007F05AE6B0A2A 48BFC0BDCAAD057F0000 mov     rdi,7F05ADCABDC0h
00007F05AE6B0A34 BE29010000           mov     esi,129h
00007F05AE6B0A39 E8C21C4279           call    CORINFO_HELP_GETSHARED_NONGCSTATIC_BASE
00007F05AE6B0A3E 48BE60F3FF97057F0000 mov     rsi,7F0597FFF360h
00007F05AE6B0A48 488B36               mov     rsi,[rsi]
00007F05AE6B0A4B 33FF                 xor     edi,edi
00007F05AE6B0A4D 33C0                 xor     eax,eax
00007F05AE6B0A4F 4C893424             mov     [rsp],r14
00007F05AE6B0A53 48897C2408           mov     [rsp+8],rdi
00007F05AE6B0A58 4889442410           mov     [rsp+10h],rax
00007F05AE6B0A5D 4889742418           mov     [rsp+18h],rsi
00007F05AE6B0A62 48BEB8100098057F0000 mov     rsi,7F05980010B8h
00007F05AE6B0A6C 488B36               mov     rsi,[rsi]
00007F05AE6B0A6F E8143AFFFF           call    System.String.FormatHelper(System.IFormatProvider, System.String, System.ParamsArray)
00007F05AE6B0A74 488BF8               mov     rdi,rax
00007F05AE6B0A77 E87CF6FFFF           call    System.Console.WriteLine(System.String)

;             Console.ReadLine();
00007F05AE6B0A7C E867FBFFFF           call    System.Console.ReadLine()

;         }
00007F05AE6B0A81 48817DE84589A422     cmp     qword ptr [rbp-18h],22A48945h
00007F05AE6B0A89 7405                 je      short LBL_1
00007F05AE6B0A8B E8407C3979           call    CORINFO_HELP_FAIL_FAST

LBL_1:
00007F05AE6B0A90 90                   nop
00007F05AE6B0A91 C5F877               vzeroupper
00007F05AE6B0A94 488D65F0             lea     rsp,[rbp-10h]
00007F05AE6B0A98 5B                   pop     rbx
00007F05AE6B0A99 415E                 pop     r14
00007F05AE6B0A9B 5D                   pop     rbp
00007F05AE6B0A9C C3                   ret

; ================================================================================
; superfluous_mov.Program.Main(System.String[])
; 26 (0x1A) bytes
; 9 (0x9) instructions

00007F05AE6AFF80 55                   push    rbp
00007F05AE6AFF81 4883EC10             sub     rsp,10h
00007F05AE6AFF85 488D6C2410           lea     rbp,[rsp+10h]
00007F05AE6AFF8A 48897DF8             mov     [rbp-8],rdi

;             BugBugBug();
00007F05AE6AFF8E E805BFFFFF           call    superfluous_mov.Program.BugBugBug()

;         }
00007F05AE6AFF93 90                   nop
00007F05AE6AFF94 488D6500             lea     rsp,[rbp]
00007F05AE6AFF98 5D                   pop     rbp
00007F05AE6AFF99 C3                   ret
