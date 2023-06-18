#include "riscv_test.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN

	j test_start

crash_backward:
	RVTEST_FAIL

test_start:

xreg_init:
	la x31, xreg_init_data
	ld x0, 0(x31)
	ld x1, 8(x31)
	ld x2, 16(x31)
	ld x3, 24(x31)
	ld x4, 32(x31)
	ld x5, 40(x31)
	ld x6, 48(x31)
	ld x7, 56(x31)
	ld x8, 64(x31)
	ld x9, 72(x31)
	ld x10, 80(x31)
	ld x11, 88(x31)
	ld x12, 96(x31)
	ld x13, 104(x31)
	ld x14, 112(x31)
	ld x15, 120(x31)
	ld x16, 128(x31)
	ld x17, 136(x31)
	ld x18, 144(x31)
	ld x19, 152(x31)
	ld x20, 160(x31)
	ld x21, 168(x31)
	ld x22, 176(x31)
	ld x23, 184(x31)
	ld x24, 192(x31)
	ld x25, 200(x31)
	ld x26, 208(x31)
	ld x27, 216(x31)
	ld x28, 224(x31)
	ld x29, 232(x31)
	ld x30, 240(x31)
	ld x31, 248(x31)

	j pseg_0

pseg_0:
	aes64ks1i x8, x26, 0
	aes64ks1i x9, x31, 15
	aes64ks1i x25, x19, 4
	aes64ks1i x30, x29, 7
	csrr x31, minstret
	aes64ks1i x4, x7, 10
	csrr x20, minstret
	csrr x27, minstret
	csrr x29, minstret
	aes64ks1i x6, x20, 2
	aes64ks1i x22, x10, 10
	aes64ks1i x14, x26, 2
	aes64ks1i x17, x0, 3
	aes64ks1i x3, x16, 0
	aes64ks1i x1, x29, 9
	aes64ks1i x8, x8, 2
	aes64ks1i x27, x17, 2
	csrr x9, minstret
	csrr x30, minstret
	csrr x7, minstret
	csrr x10, minstret
	csrr x18, minstret
	csrr x24, minstret
	aes64ks1i x15, x1, 7
	aes64ks1i x19, x21, 4
	aes64ks1i x26, x11, 3
	aes64ks1i x29, x11, 7
	csrr x16, minstret
	aes64ks1i x31, x24, 5
	csrr x13, minstret
	csrr x5, minstret
	csrr x21, minstret
	csrr x20, minstret
	csrr x23, minstret
	csrr x12, minstret
	aes64ks1i x28, x10, 2
	csrr x2, minstret
	csrr x11, minstret
	aes64ks1i x13, x29, 2
	aes64ks1i x20, x11, 0
	aes64ks1i x9, x5, 1
	csrr x22, minstret
	aes64ks1i x31, x31, 8
	aes64ks1i x14, x28, 3
	aes64ks1i x30, x11, 2
	aes64ks1i x19, x5, 9
	aes64ks1i x16, x0, 6
	csrr x12, minstret
	aes64ks1i x26, x28, 8
	aes64ks1i x7, x4, 6
	aes64ks1i x23, x23, 5
	aes64ks1i x27, x7, 4
	csrr x11, minstret
	csrr x1, minstret
	csrr x8, minstret
	aes64ks1i x18, x13, 3
	csrr x10, minstret
	csrr x21, minstret
	csrr x5, minstret
	aes64ks1i x4, x19, 3
	csrr x15, minstret
	csrr x28, minstret
	csrr x17, minstret
	csrr x25, minstret
	aes64ks1i x31, x6, 6
	aes64ks1i x28, x30, 6
	aes64ks1i x26, x27, 2
	csrr x11, minstret
	aes64ks1i x15, x28, 8
	csrr x6, minstret
	aes64ks1i x1, x6, 1
	aes64ks1i x13, x17, 4
	aes64ks1i x21, x2, 6
	csrr x29, minstret
	aes64ks1i x3, x6, 6
	csrr x30, minstret
	csrr x8, minstret
	csrr x20, minstret
	csrr x17, minstret
	aes64ks1i x16, x28, 4
	aes64ks1i x10, x15, 0
	csrr x2, minstret
	csrr x12, minstret
	csrr x14, minstret
	aes64ks1i x5, x5, 3
	csrr x22, minstret
	aes64ks1i x24, x2, 0
	csrr x9, minstret
	csrr x7, minstret
	csrr x19, minstret
	aes64ks1i x2, x19, 3
	csrr x15, minstret
	aes64ks1i x23, x22, 6
	aes64ks1i x6, x3, 10
	csrr x14, minstret
	csrr x21, minstret
	aes64ks1i x24, x22, 6
	aes64ks1i x16, x7, 10
	csrr x29, minstret
	csrr x8, minstret
	j reg_dump

reg_dump:
	la x1, loop_count
	lw x2, 0(x1)
	addi x3, x2, -1
	sw x3, 0(x1)
	bnez x2, pseg_0
	la x1, xreg_output_data
	sd x0, 0(x1)
	sd x2, 16(x1)
	sd x3, 24(x1)
	sd x4, 32(x1)
	sd x5, 40(x1)
	sd x6, 48(x1)
	sd x7, 56(x1)
	sd x8, 64(x1)
	sd x9, 72(x1)
	sd x10, 80(x1)
	sd x11, 88(x1)
	sd x12, 96(x1)
	sd x13, 104(x1)
	sd x14, 112(x1)
	sd x15, 120(x1)
	sd x16, 128(x1)
	sd x17, 136(x1)
	sd x18, 144(x1)
	sd x19, 152(x1)
	sd x20, 160(x1)
	sd x21, 168(x1)
	sd x22, 176(x1)
	sd x23, 184(x1)
	sd x24, 192(x1)
	sd x25, 200(x1)
	sd x26, 208(x1)
	sd x27, 216(x1)
	sd x28, 224(x1)
	sd x29, 232(x1)
	sd x30, 240(x1)
	sd x31, 248(x1)

	j test_end

crash_forward:
	RVTEST_FAIL

test_end:
	RVTEST_PASS

RVTEST_CODE_END


	.data

hidden_data:
	.align 8
xreg_init_data:
reg_x0_init:	.dword 0xf166eb0c35b60302
reg_x1_init:	.dword 0x3409ce4f4fb9790d
reg_x2_init:	.dword 0x44a86a29e7592a5d
reg_x3_init:	.dword 0x0000000000000000
reg_x4_init:	.dword 0xffffffffffff8007
reg_x5_init:	.dword 0x729b1ccdbc70532c
reg_x6_init:	.dword 0xc06b43f31cdec46a
reg_x7_init:	.dword 0xffffffffffff8000
reg_x8_init:	.dword 0x0000000000000000
reg_x9_init:	.dword 0x09b2c24939e52ea9
reg_x10_init:	.dword 0x0000000000000009
reg_x11_init:	.dword 0xffffffffffff8001
reg_x12_init:	.dword 0x05fca61c77247751
reg_x13_init:	.dword 0x48b8bb766199da51
reg_x14_init:	.dword 0x93fe8b54eb69ce2d
reg_x15_init:	.dword 0xffffffffffffffff
reg_x16_init:	.dword 0x0800000000000000
reg_x17_init:	.dword 0xffffffffffff8001
reg_x18_init:	.dword 0xf35a0e70b3015d9a
reg_x19_init:	.dword 0xffffffffffffffff
reg_x20_init:	.dword 0xd31e429d044663a3
reg_x21_init:	.dword 0xe1d519b62fd3956d
reg_x22_init:	.dword 0xffffffffffff8007
reg_x23_init:	.dword 0x0800000000000007
reg_x24_init:	.dword 0xfce184e3cbcb7a59
reg_x25_init:	.dword 0x0000000000000000
reg_x26_init:	.dword 0xffffffffffffffff
reg_x27_init:	.dword 0xffffffff80000002
reg_x28_init:	.dword 0xffffffff80000008
reg_x29_init:	.dword 0x0000000000000000
reg_x30_init:	.dword 0xca8ac2c81f31867c
reg_x31_init:	.dword 0x0800000000000003

RVTEST_DATA_BEGIN

	.align 8
xreg_output_data:
reg_x0_output:	.dword 0x2b2785515bbe8cb3
reg_x1_output:	.dword 0x18601e69adf45378
reg_x2_output:	.dword 0x5b7493cbbc184c02
reg_x3_output:	.dword 0xeb508f2387a8a037
reg_x4_output:	.dword 0x140112c68e795855
reg_x5_output:	.dword 0xce16969001efb647
reg_x6_output:	.dword 0x6ccf8c3ecbc7ef35
reg_x7_output:	.dword 0x6b603812b1a9c46e
reg_x8_output:	.dword 0x406ccbbb28b0851f
reg_x9_output:	.dword 0xb397b4da7540e47c
reg_x10_output:	.dword 0x733ce5a03f775c42
reg_x11_output:	.dword 0xed44d555250399b3
reg_x12_output:	.dword 0x93c0dfc323864386
reg_x13_output:	.dword 0x71b4d5e5133e5162
reg_x14_output:	.dword 0x1e35cf407868c1d0
reg_x15_output:	.dword 0xdfe7ead35cd9c9d2
reg_x16_output:	.dword 0xb2a77f8898493184
reg_x17_output:	.dword 0xbc3e8f83b73e8366
reg_x18_output:	.dword 0x9b9df6c0a625904b
reg_x19_output:	.dword 0x245014e9b19b9ffd
reg_x20_output:	.dword 0xee2e6b4a2e1b0715
reg_x21_output:	.dword 0xc6f7233e38b1d49a
reg_x22_output:	.dword 0xf7ad7e9c0e936e61
reg_x23_output:	.dword 0xf83822eb6b295147
reg_x24_output:	.dword 0x52c9d158301052bb
reg_x25_output:	.dword 0xfa70c0cd6b83c335
reg_x26_output:	.dword 0xeab3449c33033d86
reg_x27_output:	.dword 0x617f019a3a29d528
reg_x28_output:	.dword 0x08647c98dbdb45fb
reg_x29_output:	.dword 0x6c81989fc025d211
reg_x30_output:	.dword 0xb9697861116c2e71
reg_x31_output:	.dword 0xeeba75aff8134dfc

// Memory Blocks
	.align 8
test_memory:
	.dword 0xf9d75304a95391de, 0xab37be5998e5f92c
	.dword 0xe9d681deb544e59d, 0x2076a6593ba80184
	.dword 0x6b62242b436d5371, 0x9c76db4fbc72a627
	.dword 0x13f437db87acafc9, 0xf5ec77b685e9e163
	.dword 0xc0ffc7acab711045, 0x8fa9b10ea7ae4cca
	.dword 0x0297667552d6c678, 0xe738b55c89c6a3a1
	.dword 0x36af8bbe8786c2ef, 0x22316bd4e334877e
	.dword 0xae51a598b8e9a472, 0x0e5e0cd456fe6b2c
	.dword 0xb60df3abede5f789, 0x427cc512eb32c7d1
	.dword 0x59477f8bf2c46a41, 0x5f9bd818ff070053
	.dword 0x45d6c651163cf82f, 0x70f0f5f0aa7696f6
	.dword 0x3834e766075c52b5, 0x98e3b81ca0ed9949
	.dword 0xc92a6ca03b210984, 0x590e79ca03d36642
	.dword 0xa219ff9250a43761, 0xff77ff43a77932a8
	.dword 0xe5b0a01e9d99b72a, 0x007ba0ab6741efb1
	.dword 0xb54a30500f30251b, 0x19fcebe76b0f77eb
	.dword 0xf0f269660d19304d, 0x14def1d7fa5b265e
	.dword 0xbdd78e3302070080, 0x5486b2d2571e3bf2
	.dword 0xb6856ea48e73b419, 0x54b35e486e10b70e
	.dword 0x6e9490a374543a6d, 0xe36e59c6290b8182
	.dword 0xc1e2921abca80e3f, 0xaa80432435c518a6
	.dword 0x2b26185af6eb9487, 0x48f761f7dcee13c3
	.dword 0x9801e0a0468b2375, 0x551f3c4c76252cb0
	.dword 0x36dfc5ec07d0f5b4, 0x991042906290aec0
	.dword 0xf615d01c7ca88df3, 0x62f9c6d1ac656fdb
	.dword 0x9964a0393e364ea0, 0xf5b7b32b4381b7ea
	.dword 0xbbffce0d3aea49f6, 0xd968b37bc0c4ba78
	.dword 0xef460af92da18e39, 0xc5d0c659f9318695
	.dword 0xa2581e0599d97240, 0x1c9f6945f17690fe
	.dword 0x2a1b0d39172ca634, 0xd76fd420d0613c7a
	.dword 0x3d230829bb8a0c96, 0x8fccf7ddc5570486
	.dword 0x78c9e7d6ac119f86, 0xf5ea3478dd642e34
	.dword 0x158d57b4b883e641, 0xf05cfa27000a234f
	.dword 0x2dfdfc0798f4beeb, 0x7b32c9cdb2f5dbc3
	.dword 0xd64a2973293a808e, 0xa28248b66368f93b
	.dword 0x800401d24d9eb962, 0x0b4d5b8143a6790c
	.dword 0x9f6c0a4708e60d4e, 0x00757c57e45e2051
	.dword 0x6a868e937918f8ae, 0xf7e2c06694200656
	.dword 0x97d365a5b6cf7b56, 0xc1114089db93e139
	.dword 0xcfe4eb77fe5defd7, 0xc13fd947aac5f8ce
	.dword 0xbb8c4418ab619300, 0xb5b675fea495e3c3
	.dword 0x351e3c06ba0f7fa7, 0xc9495b6177717304
	.dword 0xb7b559bf0e9122a9, 0x72a2251e10486f60
	.dword 0x188af4964de56b2e, 0x942e6ae2444c0d6c
	.dword 0x5dca64c7bd6e3b31, 0xf01f408209d73ba7
	.dword 0xf0dea0d14ac5dc3f, 0xe1e405709f0b2ede
	.dword 0xd96bdbfb74f07c7e, 0xd63e3777cf7dd0d2
	.dword 0x572bfa387eb9f7f0, 0x82b33ca5900df517
	.dword 0x5cfded30c85071f9, 0xeffc58842acb783e
	.dword 0xbbe54e9de030831e, 0x0864408d631fad36
	.dword 0x6ab8cbd7417fff0f, 0x360503dc2644bcef
	.dword 0x4c1336aa8c4096e7, 0x5cd03a273be0dc3f
	.dword 0x39044f6f8a93dbb1, 0xfc76adead8847c09
	.dword 0x593b9c5a91de652d, 0xd5e3f5e82e18d79b
	.dword 0xf238e210c73020d4, 0x1255b1cfff3e8558
	.dword 0xabb3117cd0340d1a, 0x965d5e399871ed96
	.dword 0xb91fbee45549e4f2, 0x0c96f3dc4ec5cbc9
	.dword 0xa452763602907f97, 0xe9cdc5f90e621de0
	.dword 0x6ccc80a504cfe888, 0x89ec54178cf825ef
	.dword 0xf7caef7b309e73d3, 0xd1ab02f63442620d
	.dword 0x1faa0028760c5296, 0xf7bcf0bcc8b19e7f
	.dword 0x1b122d9a1dd56bc2, 0x287958748ed68615
	.dword 0x16d482d0b6d17d22, 0x43f338b9412954d4
	.dword 0x2da102b1ff56c89b, 0x975831ae6dc790d4

.align 8
loop_count: .word 0x40

RVTEST_DATA_END
