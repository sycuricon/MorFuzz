+define+WT_DCACHE

+incdir+${DEPENDENCY}/cva6/common/submodules/common_cells/include/
+incdir+${DEPENDENCY}/cva6/common/submodules/common_cells/src/
+incdir+${DEPENDENCY}/cva6/common/local/util/


${DEPENDENCY}/cva6/core/include/cv64a6_imafdc_sv39_config_pkg.sv
// Broken (?) dependencies in packages:
//    - include/ariane_pkg.sv is dependent on src/riscv-dbg/src/dm_pkg.sv
//      (ariane should not depend on debug-module)
${DEPENDENCY}/cva6/core/include/riscv_pkg.sv
// TODO: should not be needed.
${DEPENDENCY}/cva6/corev_apu/riscv-dbg/src/dm_pkg.sv
${DEPENDENCY}/cva6/core/include/ariane_pkg.sv
// TODO: ariane_axi_pkg is dependent on this.
${DEPENDENCY}/cva6/corev_apu/axi/src/axi_pkg.sv
${DEPENDENCY}/cva6/core/include/ariane_rvfi_pkg.sv

// Packages
${DEPENDENCY}/cva6/core/include/ariane_axi_pkg.sv
${DEPENDENCY}/cva6/core/include/wt_cache_pkg.sv
${DEPENDENCY}/cva6/core/include/std_cache_pkg.sv
${DEPENDENCY}/cva6/core/include/axi_intf.sv
${DEPENDENCY}/cva6/core/include/instr_tracer_pkg.sv

//CVXIF
${DEPENDENCY}/cva6/core/include/cvxif_pkg.sv
${DEPENDENCY}/cva6/core/cvxif_example/include/cvxif_instr_pkg.sv
${DEPENDENCY}/cva6/core/cvxif_fu.sv
${DEPENDENCY}/cva6/core/cvxif_example/cvxif_example_coprocessor.sv
${DEPENDENCY}/cva6/core/cvxif_example/instr_decoder.sv

// Common Cells
${DEPENDENCY}/cva6/common/submodules/common_cells/src/cf_math_pkg.sv
${DEPENDENCY}/cva6/common/submodules/common_cells/src/fifo_v3.sv
${DEPENDENCY}/cva6/common/submodules/common_cells/src/lfsr.sv
${DEPENDENCY}/cva6/common/submodules/common_cells/src/lzc.sv
${DEPENDENCY}/cva6/common/submodules/common_cells/src/rr_arb_tree.sv
${DEPENDENCY}/cva6/common/submodules/common_cells/src/shift_reg.sv
${DEPENDENCY}/cva6/common/submodules/common_cells/src/unread.sv
${DEPENDENCY}/cva6/common/submodules/common_cells/src/popcount.sv
${DEPENDENCY}/cva6/common/submodules/common_cells/src/exp_backoff.sv

// Common Cells for example coprocessor
${DEPENDENCY}/cva6/common/submodules/common_cells/src/counter.sv
${DEPENDENCY}/cva6/common/submodules/common_cells/src/delta_counter.sv

// Floating point unit
${DEPENDENCY}/cva6/core/fpu/src/fpnew_pkg.sv
${DEPENDENCY}/cva6/core/fpu/src/fpnew_cast_multi.sv
${DEPENDENCY}/cva6/core/fpu/src/fpnew_classifier.sv
${DEPENDENCY}/cva6/core/fpu/src/fpnew_divsqrt_multi.sv
${DEPENDENCY}/cva6/core/fpu/src/fpnew_fma_multi.sv
${DEPENDENCY}/cva6/core/fpu/src/fpnew_fma.sv
${DEPENDENCY}/cva6/core/fpu/src/fpnew_noncomp.sv
${DEPENDENCY}/cva6/core/fpu/src/fpnew_opgroup_block.sv
${DEPENDENCY}/cva6/core/fpu/src/fpnew_opgroup_fmt_slice.sv
${DEPENDENCY}/cva6/core/fpu/src/fpnew_opgroup_multifmt_slice.sv
${DEPENDENCY}/cva6/core/fpu/src/fpnew_rounding.sv
${DEPENDENCY}/cva6/core/fpu/src/fpnew_top.sv
${DEPENDENCY}/cva6/core/fpu/src/fpu_div_sqrt_mvp/hdl/defs_div_sqrt_mvp.sv
${DEPENDENCY}/cva6/core/fpu/src/fpu_div_sqrt_mvp/hdl/control_mvp.sv
${DEPENDENCY}/cva6/core/fpu/src/fpu_div_sqrt_mvp/hdl/div_sqrt_top_mvp.sv
${DEPENDENCY}/cva6/core/fpu/src/fpu_div_sqrt_mvp/hdl/iteration_div_sqrt_mvp.sv
${DEPENDENCY}/cva6/core/fpu/src/fpu_div_sqrt_mvp/hdl/norm_div_sqrt_mvp.sv
${DEPENDENCY}/cva6/core/fpu/src/fpu_div_sqrt_mvp/hdl/nrbd_nrsc_mvp.sv
${DEPENDENCY}/cva6/core/fpu/src/fpu_div_sqrt_mvp/hdl/preprocess_mvp.sv

// Top-level source files (not necessarily instantiated at the top of the cva6).
${DEPENDENCY}/cva6/core/ariane.sv
${DEPENDENCY}/cva6/core/cva6.sv
${DEPENDENCY}/cva6/core/alu.sv
// Note: depends on fpnew_pkg, above
${DEPENDENCY}/cva6/core/fpu_wrap.sv
${DEPENDENCY}/cva6/core/branch_unit.sv
${DEPENDENCY}/cva6/core/compressed_decoder.sv
${DEPENDENCY}/cva6/core/controller.sv
${DEPENDENCY}/cva6/core/csr_buffer.sv
${DEPENDENCY}/cva6/core/csr_regfile.sv
${DEPENDENCY}/cva6/core/decoder.sv
${DEPENDENCY}/cva6/core/ex_stage.sv
${DEPENDENCY}/cva6/core/instr_realign.sv
${DEPENDENCY}/cva6/core/id_stage.sv
${DEPENDENCY}/cva6/core/issue_read_operands.sv
${DEPENDENCY}/cva6/core/issue_stage.sv
${DEPENDENCY}/cva6/core/load_unit.sv
${DEPENDENCY}/cva6/core/load_store_unit.sv
${DEPENDENCY}/cva6/core/mult.sv
${DEPENDENCY}/cva6/core/multiplier.sv
${DEPENDENCY}/cva6/core/serdiv.sv
${DEPENDENCY}/cva6/core/perf_counters.sv
${DEPENDENCY}/cva6/core/ariane_regfile_ff.sv
${DEPENDENCY}/cva6/core/re_name.sv
// NOTE: scoreboard.sv modified for DSIM (unchanged for other simulators)
${DEPENDENCY}/cva6/core/scoreboard.sv
${DEPENDENCY}/cva6/core/store_buffer.sv
${DEPENDENCY}/cva6/core/amo_buffer.sv
${DEPENDENCY}/cva6/core/store_unit.sv
${DEPENDENCY}/cva6/core/commit_stage.sv
${DEPENDENCY}/cva6/core/axi_shim.sv

// What is "frontend"?
${DEPENDENCY}/cva6/core/frontend/btb.sv
${DEPENDENCY}/cva6/core/frontend/bht.sv
${DEPENDENCY}/cva6/core/frontend/ras.sv
${DEPENDENCY}/cva6/core/frontend/instr_scan.sv
${DEPENDENCY}/cva6/core/frontend/instr_queue.sv
${DEPENDENCY}/cva6/core/frontend/frontend.sv

// Cache subsystem
${DEPENDENCY}/cva6/core/cache_subsystem/wt_dcache_ctrl.sv
${DEPENDENCY}/cva6/core/cache_subsystem/wt_dcache_mem.sv
${DEPENDENCY}/cva6/core/cache_subsystem/wt_dcache_missunit.sv
${DEPENDENCY}/cva6/core/cache_subsystem/wt_dcache_wbuffer.sv
${DEPENDENCY}/cva6/core/cache_subsystem/wt_dcache.sv
${DEPENDENCY}/cva6/core/cache_subsystem/cva6_icache.sv
${DEPENDENCY}/cva6/core/cache_subsystem/wt_cache_subsystem.sv
${DEPENDENCY}/cva6/core/cache_subsystem/wt_axi_adapter.sv

// Physical Memory Protection
// NOTE: pmp.sv modified for DSIM (unchanged for other simulators)
${DEPENDENCY}/cva6/core/pmp/src/pmp.sv
${DEPENDENCY}/cva6/core/pmp/src/pmp_entry.sv

// Tracer (behavioral code, not RTL)
${DEPENDENCY}/cva6/common/local/util/instr_tracer_if.sv
// ${DEPENDENCY}/cva6/common/local/util/instr_tracer.sv
${DEPENDENCY}/cva6/common/local/util/tc_sram_wrapper.sv
${DEPENDENCY}/cva6/corev_apu/src/tech_cells_generic/src/rtl/tc_sram.sv
${DEPENDENCY}/cva6/common/local/util/sram.sv

// MMU Sv39
${DEPENDENCY}/cva6/core/mmu_sv39/mmu.sv
${DEPENDENCY}/cva6/core/mmu_sv39/ptw.sv
${DEPENDENCY}/cva6/core/mmu_sv39/tlb.sv

// axi auto matic
${DEPENDENCY}/cva6/core/fpu/src/common_cells/src/stream_arbiter.sv
${DEPENDENCY}/cva6/core/fpu/src/common_cells/src/stream_arbiter_flushable.sv
${DEPENDENCY}/cva6/corev_apu/src/axi_riscv_atomics/src/axi_riscv_atomics_wrap.sv
${DEPENDENCY}/cva6/corev_apu/src/axi_riscv_atomics/src/axi_riscv_atomics.sv
${DEPENDENCY}/cva6/corev_apu/src/axi_riscv_atomics/src/axi_res_tbl.sv
${DEPENDENCY}/cva6/corev_apu/src/axi_riscv_atomics/src/axi_riscv_amos.sv
${DEPENDENCY}/cva6/corev_apu/src/axi_riscv_atomics/src/axi_riscv_amos_alu.sv
${DEPENDENCY}/cva6/corev_apu/src/axi_riscv_atomics/src/axi_riscv_lrsc.sv