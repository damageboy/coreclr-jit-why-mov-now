using System;
using System.Runtime.CompilerServices;
using System.Runtime.Intrinsics;
using static System.Runtime.Intrinsics.X86.Avx;
using static System.Runtime.Intrinsics.X86.Avx2;
using static System.Runtime.Intrinsics.X86.Popcnt.X64;


namespace superfluous_mov
{
    class Program
    {
        static unsafe void Main(string[] args)
        {
            BugBugBug();
        }

        [MethodImpl(MethodImplOptions.AggressiveOptimization)]
        unsafe static void BugBugBug()
        {
            var N = Vector256<int>.Count;
            var P = Vector256.Create(100);

            var nextPtr = stackalloc int[64];

            var L0 = LoadAlignedVector256(nextPtr + 0*N);
            var L1 = LoadAlignedVector256(nextPtr + 1*N);
            var L2 = LoadAlignedVector256(nextPtr + 2*N);
            var L3 = LoadAlignedVector256(nextPtr + 3*N);
            var L4 = LoadAlignedVector256(nextPtr + 4*N);
            var L5 = LoadAlignedVector256(nextPtr + 5*N);
            var L6 = LoadAlignedVector256(nextPtr + 6*N);
            var L7 = LoadAlignedVector256(nextPtr + 7*N);

            ulong maskyMcMaskFace;

            maskyMcMaskFace  = (ulong) (uint) MoveMask(CompareGreaterThan(L0, P).AsSingle()) << 00;
            maskyMcMaskFace |= (ulong) (uint) MoveMask(CompareGreaterThan(L1, P).AsSingle()) << 08;
            maskyMcMaskFace |= (ulong) (uint) MoveMask(CompareGreaterThan(L2, P).AsSingle()) << 16;
            maskyMcMaskFace |= (ulong) (uint) MoveMask(CompareGreaterThan(L3, P).AsSingle()) << 24;
            maskyMcMaskFace |= (ulong) (uint) MoveMask(CompareGreaterThan(L4, P).AsSingle()) << 32;
            maskyMcMaskFace |= (ulong) (uint) MoveMask(CompareGreaterThan(L5, P).AsSingle()) << 40;
            maskyMcMaskFace |= (ulong) (uint) MoveMask(CompareGreaterThan(L6, P).AsSingle()) << 48;
            maskyMcMaskFace |= (ulong) (uint) MoveMask(CompareGreaterThan(L7, P).AsSingle()) << 56;

            var popCount = PopCount((ulong) maskyMcMaskFace);
            Console.WriteLine($"{popCount}");
            Console.ReadLine();

        }
    }
}
