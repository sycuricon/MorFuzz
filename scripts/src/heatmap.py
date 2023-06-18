import csv
import seaborn as sns
import matplotlib.pylab as plt
import numpy as np
import math
import sys

import matplotlib
matplotlib.rcParams['pdf.fonttype'] = 42
matplotlib.rcParams['ps.fonttype'] = 42

path = sys.argv[2]
name = sys.argv[1]

cnt_op = 271
cnt_val = 65
clip_lim = 400
ranges = []
for i in range(1, 63):
  ranges.append((2**(i-1), 2**i-1))
  ranges.append((2**64 - 2**i+1, 2**64 - 2**(i-1)))

print(cnt_val, cnt_op)

def match_data_range(val):
    res = math.log2(val+1)
    return int(res)

def match_pc_range(val):
    return (val // 2) % 128

op_names = ["rv_op_illegal",
  "rv_op_lui",
  "rv_op_auipc",
  "rv_op_jal",
  "rv_op_jalr",
  "rv_op_beq", "rv_op_bne", "rv_op_blt", "rv_op_bge", "rv_op_bltu", "rv_op_bgeu",
  "rv_op_lb", "rv_op_lh", "rv_op_lw", "rv_op_lbu", "rv_op_lhu",
  "rv_op_sb", "rv_op_sh", "rv_op_sw",
  "rv_op_addi", "rv_op_slti", "rv_op_sltiu", "rv_op_xori", "rv_op_ori", "rv_op_andi", "rv_op_slli", "rv_op_srli", "rv_op_srai",
  "rv_op_add", "rv_op_sub", "rv_op_sll", "rv_op_slt", "rv_op_sltu", "rv_op_xor", "rv_op_srl", "rv_op_sra", "rv_op_or", "rv_op_and",
  "rv_op_fence", "rv_op_fence_i",
  "rv_op_lwu", "rv_op_ld", "rv_op_sd",
  "rv_op_addiw", "rv_op_slliw", "rv_op_srliw", "rv_op_sraiw",
  "rv_op_addw", "rv_op_subw", "rv_op_sllw", "rv_op_srlw", "rv_op_sraw",
  "rv_op_ldu", "rv_op_lq", "rv_op_sq",
  "rv_op_addid", "rv_op_sllid", "rv_op_srlid", "rv_op_sraid",
  "rv_op_addd", "rv_op_subd", "rv_op_slld", "rv_op_srld", "rv_op_srad",
  "rv_op_mul", "rv_op_mulh", "rv_op_mulhsu", "rv_op_mulhu",
  "rv_op_div", "rv_op_divu", "rv_op_rem", "rv_op_remu",
  "rv_op_mulw", "rv_op_divw", "rv_op_divuw", "rv_op_remw", "rv_op_remuw",
  "rv_op_muld", "rv_op_divd", "rv_op_divud", "rv_op_remd", "rv_op_remud",
  "rv_op_lr_w", "rv_op_sc_w",
  "rv_op_amoswap_w", "rv_op_amoadd_w", "rv_op_amoxor_w", "rv_op_amoor_w", "rv_op_amoand_w",
  "rv_op_amomin_w", "rv_op_amomax_w", "rv_op_amominu_w", "rv_op_amomaxu_w",
  "rv_op_lr_d", "rv_op_sc_d",
  "rv_op_amoswap_d", "rv_op_amoadd_d", "rv_op_amoxor_d", "rv_op_amoor_d", "rv_op_amoand_d",
  "rv_op_amomin_d", "rv_op_amomax_d", "rv_op_amominu_d", "rv_op_amomaxu_d",
  "rv_op_lr_q", "rv_op_sc_q",
  "rv_op_amoswap_q", "rv_op_amoadd_q", "rv_op_amoxor_q", "rv_op_amoor_q", "rv_op_amoand_q",
  "rv_op_amomin_q", "rv_op_amomax_q", "rv_op_amominu_q", "rv_op_amomaxu_q",
  "rv_op_ecall", "rv_op_ebreak",
  "rv_op_sret", "rv_op_hret", "rv_op_mret", "rv_op_dret",
  "rv_op_sfence_vma", "rv_op_wfi",
  "rv_op_csrrw", "rv_op_csrrs", "rv_op_csrrc", "rv_op_csrrwi", "rv_op_csrrsi", "rv_op_csrrci",
  "rv_op_flw", "rv_op_fsw",
  "rv_op_fmadd_s", "rv_op_fmsub_s", "rv_op_fnmsub_s", "rv_op_fnmadd_s",
  "rv_op_fadd_s", "rv_op_fsub_s", "rv_op_fmul_s", "rv_op_fdiv_s",
  "rv_op_fsgnj_s", "rv_op_fsgnjn_s", "rv_op_fsgnjx_s", "rv_op_fmin_s", "rv_op_fmax_s", "rv_op_fsqrt_s",
  "rv_op_fle_s", "rv_op_flt_s", "rv_op_feq_s",
  "rv_op_fcvt_w_s", "rv_op_fcvt_wu_s", "rv_op_fcvt_s_w", "rv_op_fcvt_s_wu",
  "rv_op_fmv_x_w", "rv_op_fclass_s", "rv_op_fmv_w_x",
  "rv_op_fcvt_l_s", "rv_op_fcvt_lu_s", "rv_op_fcvt_s_l", "rv_op_fcvt_s_lu",
  "rv_op_fld", "rv_op_fsd",
  "rv_op_fmadd_d", "rv_op_fmsub_d", "rv_op_fnmsub_d", "rv_op_fnmadd_d",
  "rv_op_fadd_d", "rv_op_fsub_d", "rv_op_fmul_d", "rv_op_fdiv_d",
  "rv_op_fsgnj_d", "rv_op_fsgnjn_d", "rv_op_fsgnjx_d", "rv_op_fmin_d", "rv_op_fmax_d",
  "rv_op_fcvt_s_d", "rv_op_fcvt_d_s", "rv_op_fsqrt_d",
  "rv_op_fle_d", "rv_op_flt_d", "rv_op_feq_d",
  "rv_op_fcvt_w_d", "rv_op_fcvt_wu_d", "rv_op_fcvt_d_w", "rv_op_fcvt_d_wu",
  "rv_op_fclass_d", "rv_op_fcvt_l_d", "rv_op_fcvt_lu_d",
  "rv_op_fmv_x_d", "rv_op_fcvt_d_l", "rv_op_fcvt_d_lu", "rv_op_fmv_d_x",
  "rv_op_flq", "rv_op_fsq",
  "rv_op_fmadd_q", "rv_op_fmsub_q", "rv_op_fnmsub_q", "rv_op_fnmadd_q",
  "rv_op_fadd_q", "rv_op_fsub_q", "rv_op_fmul_q", "rv_op_fdiv_q",
  "rv_op_fsgnj_q", "rv_op_fsgnjn_q", "rv_op_fsgnjx_q", "rv_op_fmin_q", "rv_op_fmax_q",
  "rv_op_fcvt_s_q", "rv_op_fcvt_q_s", "rv_op_fcvt_d_q", "rv_op_fcvt_q_d", "rv_op_fsqrt_q",
  "rv_op_fle_q", "rv_op_flt_q", "rv_op_feq_q",
  "rv_op_fcvt_w_q", "rv_op_fcvt_wu_q", "rv_op_fcvt_q_w", "rv_op_fcvt_q_wu", "rv_op_fclass_q",
  "rv_op_fcvt_l_q", "rv_op_fcvt_lu_q", "rv_op_fcvt_q_l", "rv_op_fcvt_q_lu",
  "rv_op_fmv_x_q", "rv_op_fmv_q_x",
  "rv_op_c_addi4spn", "rv_op_c_fld", "rv_op_c_lw", "rv_op_c_flw", "rv_op_c_fsd", "rv_op_c_sw", "rv_op_c_fsw",
  "rv_op_c_nop", "rv_op_c_addi", "rv_op_c_jal", "rv_op_c_li", "rv_op_c_addi16sp", "rv_op_c_lui",
  "rv_op_c_srli", "rv_op_c_srai", "rv_op_c_andi", "rv_op_c_sub", "rv_op_c_xor", "rv_op_c_or", "rv_op_c_and",
  "rv_op_c_subw", "rv_op_c_addw", "rv_op_c_j", "rv_op_c_beqz", "rv_op_c_bnez", "rv_op_c_slli", "rv_op_c_fldsp",
  "rv_op_c_lwsp", "rv_op_c_flwsp", "rv_op_c_jr", "rv_op_c_mv", "rv_op_c_ebreak", "rv_op_c_jalr",
  "rv_op_c_add", "rv_op_c_fsdsp", "rv_op_c_swsp", "rv_op_c_fswsp", "rv_op_c_ld", "rv_op_c_sd",
  "rv_op_c_addiw", "rv_op_c_ldsp", "rv_op_c_sdsp", "rv_op_c_lq", "rv_op_c_sq", "rv_op_c_lqsp", "rv_op_c_sqsp"]

items = []
csv_reader = csv.reader(open(path))
for line in csv_reader:
    items.append(line)

data = np.zeros((cnt_val, cnt_op))
op_count = np.zeros(cnt_op)
for line in items:
    op_count[int(line[0], 16)] += int(line[2])
    data[match_data_range(int(line[1], 16)), int(line[0], 16)] += int(line[2])

data = np.clip(data, 0, clip_lim)

lst = []
for i in range(cnt_op):
    lst.append((i, op_count[i]))

print("Counted.")

for i in range(cnt_op):
    print(op_names[lst[i][0]], "("+str(lst[i][0])+")",  ": ", lst[i][1])

fig, ax = plt.subplots()

remove = [op_names.index("rv_op_ldu"),
op_names.index("rv_op_lq"),
op_names.index("rv_op_sq"),
op_names.index("rv_op_addid"),
op_names.index("rv_op_sllid"),
op_names.index("rv_op_srlid"),
op_names.index("rv_op_sraid"),
op_names.index("rv_op_addd"),
op_names.index("rv_op_subd"),
op_names.index("rv_op_slld"),
op_names.index("rv_op_srld"),
op_names.index("rv_op_srad"),
op_names.index("rv_op_muld"),
op_names.index("rv_op_divd"),
op_names.index("rv_op_divud"),
op_names.index("rv_op_remd"),
op_names.index("rv_op_remud"),
op_names.index("rv_op_lr_q"),
op_names.index("rv_op_sc_q"),
op_names.index("rv_op_amoswap_q"),
op_names.index("rv_op_amoadd_q"),
op_names.index("rv_op_amoxor_q"),
op_names.index("rv_op_amoor_q"),
op_names.index("rv_op_amoand_q"),
op_names.index("rv_op_amomin_q"),
op_names.index("rv_op_amomax_q"),
op_names.index("rv_op_amominu_q"),
op_names.index("rv_op_amomaxu_q"),
op_names.index("rv_op_flq"),
op_names.index("rv_op_fsq"),
op_names.index("rv_op_fmadd_q"),
op_names.index("rv_op_fmsub_q"),
op_names.index("rv_op_fnmsub_q"),
op_names.index("rv_op_fnmadd_q"),
op_names.index("rv_op_fadd_q"),
op_names.index("rv_op_fsub_q"),
op_names.index("rv_op_fmul_q"),
op_names.index("rv_op_fdiv_q"),
op_names.index("rv_op_fsgnj_q"),
op_names.index("rv_op_fsgnjn_q"),
op_names.index("rv_op_fsgnjx_q"),
op_names.index("rv_op_fmin_q"),
op_names.index("rv_op_fmax_q"),
op_names.index("rv_op_fcvt_s_q"),
op_names.index("rv_op_fcvt_q_s"),
op_names.index("rv_op_fcvt_d_q"),
op_names.index("rv_op_fcvt_q_d"),
op_names.index("rv_op_fsqrt_q"),
op_names.index("rv_op_fle_q"),
op_names.index("rv_op_flt_q"),
op_names.index("rv_op_feq_q"),
op_names.index("rv_op_fcvt_w_q"),
op_names.index("rv_op_fcvt_wu_q"),
op_names.index("rv_op_fcvt_q_w"),
op_names.index("rv_op_fcvt_q_wu"),
op_names.index("rv_op_fclass_q"),
op_names.index("rv_op_fcvt_l_q"),
op_names.index("rv_op_fcvt_lu_q"),
op_names.index("rv_op_fcvt_q_l"),
op_names.index("rv_op_fcvt_q_lu"),
op_names.index("rv_op_fmv_x_q"),
op_names.index("rv_op_fmv_q_x"),
op_names.index("rv_op_c_flw"),
op_names.index("rv_op_c_fsw"),
op_names.index("rv_op_c_jal"),
op_names.index("rv_op_c_flwsp"),
op_names.index("rv_op_c_fswsp"),
op_names.index("rv_op_c_lq"),
op_names.index("rv_op_c_sq"),
op_names.index("rv_op_c_lqsp"),
op_names.index("rv_op_c_sqsp")]

# data = np.delete(data, remove, axis=1)
im = ax.imshow(data)
ax.set_xlabel("# opcodes", fontsize=16)
ax.set_ylabel("log$_2$(wdata+1)", fontsize=16)
# plt.rcParams['figure.figsize'] = (6.4, 4.8)
ax.set_aspect(2.5)
ax.invert_yaxis()
ax.set_xlim((-0.5, 199.5))
plt.xticks([0, 25, 50, 75, 100, 125, 150, 175, 199], [r'$0$', r'$25$', r'$50$', r'$75$', r'$100$', r'$125$', r'$150$', r'$175$', r'$199$'])
plt.ylim((-0.5, 64.5))
plt.yticks([0, 8, 16, 24, 32, 40, 48, 56, 64], [r'$0$', r'$8$', r'$16$', r'$24$', r'$32$', r'$40$', r'$48$', r'$56$', r'$64$'])

ax.xaxis.set_tick_params(labelsize=12)
ax.yaxis.set_tick_params(labelsize=12)
print(data.shape)
plt.savefig("scripts/output/heatmap_" + name + ".pdf", dpi=600, format='pdf', bbox_inches='tight')