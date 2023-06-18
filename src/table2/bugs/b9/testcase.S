#include "riscv_test.h"

RVTEST_RV64S


        .section .text.init;                                            
        .align  6;                                                      
        .weak stvec_handler;                                            
        .weak mtvec_handler;                                            
        .globl _start;                                                  
_start:                                                                 
        /* reset vector */                                              
        j reset_vector;                                                 
        .align 2;                                                       
trap_vector:                                                            
        /* test whether the test came from pass/fail */   
        /* skiped */    
        /*          
        csrr t5, mcause;                                                
        li t6, CAUSE_USER_ECALL;                                        
        beq t5, t6, write_tohost;                                       
        li t6, CAUSE_SUPERVISOR_ECALL;                                  
        beq t5, t6, write_tohost;                                       
        li t6, CAUSE_MACHINE_ECALL;                                     
        beq t5, t6, write_tohost;      
        */                                 
        /* if an mtvec_handler is defined, jump to it */                
        la t5, mtvec_handler;                                           
        beqz t5, 1f;                                                    
        jr t5;                                                          
        /* was it an interrupt or an exception? */                      
  1:    csrr t5, mcause;                                                
        bgez t5, handle_exception;                                      
        INTERRUPT_HANDLER;                                              
handle_exception:                                                       
        /* we don't know how to handle whatever the exception was */    
  other_exception:                                                      
        /* some unhandlable exception occurred */                       
  1:    ori TESTNUM, TESTNUM, 1337;                                     
  write_tohost:                                                         
        sw TESTNUM, tohost, t5;                                         
        j write_tohost;                                                 
reset_vector:                                                           
        INIT_XREG;                                                      
        RISCV_MULTICORE_DISABLE;                                        
        INIT_SATP;                                                      
        INIT_PMP;                                                       
        DELEGATE_NO_TRAPS;                                              
        li TESTNUM, 0;                                                  
        la t0, trap_vector;                                             
        csrw mtvec, t0;                                                 
        CHECK_XLEN;                                                     
        /* if an stvec_handler is defined, delegate exceptions to it */ 
        la t0, stvec_handler;                                           
        beqz t0, 1f;                                                    
        csrw stvec, t0;                                                 
        li t0, (1 << CAUSE_LOAD_PAGE_FAULT) | (1 << CAUSE_STORE_PAGE_FAULT) | (1 << CAUSE_FETCH_PAGE_FAULT) | (1 << CAUSE_MISALIGNED_FETCH) | (1 << CAUSE_USER_ECALL) | (1 << CAUSE_BREAKPOINT);                                 
        csrw medeleg, t0;                                               
1:      csrwi mstatus, 0;                                               
        init;                                                           
        EXTRA_INIT;                                                     
        EXTRA_INIT_TIMER;                                               
        la t0, 1f;                                                      
        csrw mepc, t0;                                                  
        csrr a0, mhartid;                                               
        mret;                                                           
1:


  li TESTNUM, 1
  ebreak
  RVTEST_PASS


mtvec_handler:
  // dret
  csrr t0, dpc
  addi t0, t0, 4
  csrw dpc, t0
  .word 0x7b200273
  csrr t0, mepc
  addi t0, t0, 4
  csrw mepc, t0
  mret

RVTEST_CODE_END     

RVTEST_DATA_BEGIN  
RVTEST_DATA_END     