//
// Generated by LLVM NVPTX Back-End
//

.version 3.2
.target sm_20, texmode_independent
.address_size 64

	// .globl	SYCL_struct_body_integrator // -- Begin function SYCL_struct_body_integrator
                                        // @SYCL_struct_body_integrator
.entry SYCL_struct_body_integrator(
	.param .u64 .ptr .global .align 16 SYCL_struct_body_integrator_param_0,
	.param .align 4 .b8 SYCL_struct_body_integrator_param_1[16],
	.param .align 4 .b8 SYCL_struct_body_integrator_param_2[16],
	.param .align 4 .b8 SYCL_struct_body_integrator_param_3[16],
	.param .u64 .ptr .global .align 16 SYCL_struct_body_integrator_param_4,
	.param .align 4 .b8 SYCL_struct_body_integrator_param_5[16],
	.param .align 4 .b8 SYCL_struct_body_integrator_param_6[16],
	.param .align 4 .b8 SYCL_struct_body_integrator_param_7[16],
	.param .u64 .ptr .global .align 16 SYCL_struct_body_integrator_param_8,
	.param .align 4 .b8 SYCL_struct_body_integrator_param_9[16],
	.param .align 4 .b8 SYCL_struct_body_integrator_param_10[16],
	.param .align 4 .b8 SYCL_struct_body_integrator_param_11[16],
	.param .u64 .ptr .shared .align 16 SYCL_struct_body_integrator_param_12,
	.param .align 4 .b8 SYCL_struct_body_integrator_param_13[16],
	.param .align 4 .b8 SYCL_struct_body_integrator_param_14[16],
	.param .align 4 .b8 SYCL_struct_body_integrator_param_15[16],
	.param .u64 SYCL_struct_body_integrator_param_16,
	.param .u32 SYCL_struct_body_integrator_param_17
)
{
	.reg .pred 	%p<7>;
	.reg .f32 	%f<140>;
	.reg .b32 	%r<27>;
	.reg .b64 	%rd<36>;

// %bb.0:
	ld.param.u64 	%rd15, [SYCL_struct_body_integrator_param_16];
	mov.u32 	%r9, %tid.x;
	mov.u32 	%r10, %ctaid.x;
	mov.u32 	%r11, %ntid.x;
	mad.lo.s32 	%r12, %r11, %r10, %r9;
	cvt.u64.u32 	%rd2, %r12;
	setp.ge.u64 	%p1, %rd2, %rd15;
	@%p1 bra 	LBB0_11;
// %bb.1:
	ld.param.u32 	%r8, [SYCL_struct_body_integrator_param_17];
	ld.param.u64 	%rd13, [SYCL_struct_body_integrator_param_8];
	ld.param.u64 	%rd12, [SYCL_struct_body_integrator_param_4];
	ld.param.u64 	%rd11, [SYCL_struct_body_integrator_param_0];
	shl.b64 	%rd16, %rd2, 4;
	add.s64 	%rd17, %rd11, %rd16;
	ld.global.v4.f32 	{%f1, %f2, %f3, %f4}, [%rd17];
	setp.eq.s32 	%p2, %r8, 0;
	@%p2 bra 	LBB0_2;
// %bb.3:
	ld.param.u64 	%rd14, [SYCL_struct_body_integrator_param_12];
	ld.param.u32 	%r1, [SYCL_struct_body_integrator_param_15+4];
	ld.param.u32 	%r2, [SYCL_struct_body_integrator_param_15+8];
	cvt.u64.u32 	%rd1, %r9;
	cvt.u64.u32 	%rd3, %r11;
	cvt.u32.u64 	%r3, %rd3;
	mul.wide.s32 	%rd18, %r2, %r1;
	mul.lo.s64 	%rd19, %rd18, %rd1;
	shl.b64 	%rd20, %rd19, 4;
	add.s64 	%rd4, %rd14, %rd20;
	and.b32  	%r4, %r3, 1;
	sub.s32 	%r5, %r3, %r4;
	add.s64 	%rd5, %rd14, 16;
	mov.f32 	%f125, 0f00000000;
	mov.u32 	%r26, 0;
	setp.eq.s32 	%p3, %r3, 1;
	setp.eq.s32 	%p5, %r4, 0;
	mov.f32 	%f126, %f125;
	mov.f32 	%f127, %f125;
LBB0_4:                                 // =>This Loop Header: Depth=1
                                        //     Child Loop BB0_6 Depth 2
	cvt.u64.u32 	%rd22, %r26;
	mul.lo.s64 	%rd23, %rd22, %rd3;
	add.s64 	%rd24, %rd23, %rd1;
	shl.b64 	%rd25, %rd24, 4;
	add.s64 	%rd26, %rd11, %rd25;
	ld.global.v4.f32 	{%f41, %f42, %f43, %f44}, [%rd26];
	st.shared.v4.f32 	[%rd4], {%f41, %f42, %f43, %f44};
	bar.sync 	0;
	mov.u64 	%rd34, 0;
	@%p3 bra 	LBB0_8;
// %bb.5:                               //   in Loop: Header=BB0_4 Depth=1
	mov.u64 	%rd35, %rd5;
LBB0_6:                                 //   Parent Loop BB0_4 Depth=1
                                        // =>  This Inner Loop Header: Depth=2
	.pragma "nounroll";
	ld.shared.v4.f32 	{%f45, %f46, %f47, %f48}, [%rd35+-16];
	sub.rn.f32 	%f49, %f45, %f1;
	sub.rn.f32 	%f50, %f46, %f2;
	sub.rn.f32 	%f51, %f47, %f3;
	fma.rn.f32 	%f52, %f51, %f51, 0f358637BE;
	fma.rn.f32 	%f53, %f50, %f50, %f52;
	fma.rn.f32 	%f54, %f49, %f49, %f53;
	mul.rn.f32 	%f55, %f54, %f54;
	mul.rn.f32 	%f56, %f54, %f55;
	mul.rn.f32 	%f57, %f56, 0f3F000000;
	mov.b32 	%r14, %f56;
	shr.s32 	%r15, %r14, 1;
	mov.u32 	%r16, 1597463007;
	sub.s32 	%r17, %r16, %r15;
	mov.b32 	%f58, %r17;
	mul.rn.f32 	%f59, %f57, %f58;
	mul.rn.f32 	%f60, %f59, %f58;
	mov.f32 	%f61, 0f3FC00000;
	sub.rn.f32 	%f62, %f61, %f60;
	mul.rn.f32 	%f63, %f62, %f58;
	mul.rn.f32 	%f64, %f48, %f63;
	fma.rn.f32 	%f65, %f49, %f64, %f125;
	fma.rn.f32 	%f66, %f50, %f64, %f126;
	fma.rn.f32 	%f67, %f51, %f64, %f127;
	ld.shared.v4.f32 	{%f68, %f69, %f70, %f71}, [%rd35];
	sub.rn.f32 	%f72, %f68, %f1;
	sub.rn.f32 	%f73, %f69, %f2;
	sub.rn.f32 	%f74, %f70, %f3;
	fma.rn.f32 	%f75, %f74, %f74, 0f358637BE;
	fma.rn.f32 	%f76, %f73, %f73, %f75;
	fma.rn.f32 	%f77, %f72, %f72, %f76;
	mul.rn.f32 	%f78, %f77, %f77;
	mul.rn.f32 	%f79, %f77, %f78;
	mul.rn.f32 	%f80, %f79, 0f3F000000;
	mov.b32 	%r18, %f79;
	shr.s32 	%r19, %r18, 1;
	sub.s32 	%r20, %r16, %r19;
	mov.b32 	%f81, %r20;
	mul.rn.f32 	%f82, %f80, %f81;
	mul.rn.f32 	%f83, %f82, %f81;
	sub.rn.f32 	%f84, %f61, %f83;
	mul.rn.f32 	%f85, %f84, %f81;
	mul.rn.f32 	%f86, %f71, %f85;
	fma.rn.f32 	%f127, %f74, %f86, %f67;
	fma.rn.f32 	%f126, %f73, %f86, %f66;
	fma.rn.f32 	%f125, %f72, %f86, %f65;
	add.s64 	%rd35, %rd35, 32;
	add.s64 	%rd34, %rd34, 2;
	cvt.u32.u64 	%r21, %rd34;
	setp.eq.s32 	%p4, %r5, %r21;
	@%p4 bra 	LBB0_7;
	bra.uni 	LBB0_6;
LBB0_7:                                 //   in Loop: Header=BB0_4 Depth=1
	@%p5 bra 	LBB0_9;
LBB0_8:                                 //   in Loop: Header=BB0_4 Depth=1
	shl.b64 	%rd28, %rd34, 4;
	add.s64 	%rd29, %rd14, %rd28;
	ld.shared.v4.f32 	{%f87, %f88, %f89, %f90}, [%rd29];
	sub.rn.f32 	%f91, %f87, %f1;
	sub.rn.f32 	%f92, %f88, %f2;
	sub.rn.f32 	%f93, %f89, %f3;
	fma.rn.f32 	%f94, %f93, %f93, 0f358637BE;
	fma.rn.f32 	%f95, %f92, %f92, %f94;
	fma.rn.f32 	%f96, %f91, %f91, %f95;
	mul.rn.f32 	%f97, %f96, %f96;
	mul.rn.f32 	%f98, %f96, %f97;
	mul.rn.f32 	%f99, %f98, 0fBF000000;
	mov.b32 	%r22, %f98;
	shr.s32 	%r23, %r22, 1;
	mov.u32 	%r24, 1597463007;
	sub.s32 	%r25, %r24, %r23;
	mov.b32 	%f100, %r25;
	mul.rn.f32 	%f101, %f99, %f100;
	mul.rn.f32 	%f102, %f101, %f100;
	add.rn.f32 	%f103, %f102, 0f3FC00000;
	mul.rn.f32 	%f104, %f103, %f100;
	mul.rn.f32 	%f105, %f90, %f104;
	fma.rn.f32 	%f127, %f93, %f105, %f127;
	fma.rn.f32 	%f126, %f92, %f105, %f126;
	fma.rn.f32 	%f125, %f91, %f105, %f125;
LBB0_9:                                 //   in Loop: Header=BB0_4 Depth=1
	bar.sync 	0;
	add.s32 	%r26, %r26, 1;
	setp.eq.s32 	%p6, %r26, %r8;
	@%p6 bra 	LBB0_10;
	bra.uni 	LBB0_4;
LBB0_2:
	mov.f32 	%f125, 0f00000000;
	mov.f32 	%f126, %f125;
	mov.f32 	%f127, %f125;
LBB0_10:
	add.s64 	%rd31, %rd13, %rd16;
	ld.global.v4.f32 	{%f106, %f107, %f108, %f109}, [%rd31];
	mul.rn.f32 	%f110, %f127, 0f3E4CCCCD;
	mul.rn.f32 	%f111, %f126, 0f3E4CCCCD;
	mul.rn.f32 	%f112, %f125, 0f3E4CCCCD;
	add.rn.f32 	%f113, %f106, %f112;
	add.rn.f32 	%f114, %f107, %f111;
	add.rn.f32 	%f115, %f108, %f110;
	mul.rn.f32 	%f116, %f115, 0f3F000000;
	mul.rn.f32 	%f117, %f114, 0f3F000000;
	mul.rn.f32 	%f118, %f113, 0f3F000000;
	mul.rn.f32 	%f119, %f118, 0f3E4CCCCD;
	mul.rn.f32 	%f120, %f117, 0f3E4CCCCD;
	mul.rn.f32 	%f121, %f116, 0f3E4CCCCD;
	add.rn.f32 	%f122, %f3, %f121;
	add.rn.f32 	%f123, %f2, %f120;
	add.rn.f32 	%f124, %f1, %f119;
	add.s64 	%rd32, %rd12, %rd16;
	st.global.v4.f32 	[%rd32], {%f124, %f123, %f122, %f4};
	st.global.v4.f32 	[%rd31], {%f118, %f117, %f116, %f109};
LBB0_11:
	ret;
}
                                        // -- End function
