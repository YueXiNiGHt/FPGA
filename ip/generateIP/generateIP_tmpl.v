////////////////////////////////////////////////////////////////////////////////
// Copyright (C) 2013-2023 Efinix Inc. All rights reserved.              
//
// This   document  contains  proprietary information  which   is        
// protected by  copyright. All rights  are reserved.  This notice       
// refers to original work by Efinix, Inc. which may be derivitive       
// of other work distributed under license of the authors.  In the       
// case of derivative work, nothing in this notice overrides the         
// original author's license agreement.  Where applicable, the           
// original license agreement is included in it's original               
// unmodified form immediately below this header.                        
//                                                                       
// WARRANTY DISCLAIMER.                                                  
//     THE  DESIGN, CODE, OR INFORMATION ARE PROVIDED “AS IS” AND        
//     EFINIX MAKES NO WARRANTIES, EXPRESS OR IMPLIED WITH               
//     RESPECT THERETO, AND EXPRESSLY DISCLAIMS ANY IMPLIED WARRANTIES,  
//     INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF          
//     MERCHANTABILITY, NON-INFRINGEMENT AND FITNESS FOR A PARTICULAR    
//     PURPOSE.  SOME STATES DO NOT ALLOW EXCLUSIONS OF AN IMPLIED       
//     WARRANTY, SO THIS DISCLAIMER MAY NOT APPLY TO LICENSEE.           
//                                                                       
// LIMITATION OF LIABILITY.                                              
//     NOTWITHSTANDING ANYTHING TO THE CONTRARY, EXCEPT FOR BODILY       
//     INJURY, EFINIX SHALL NOT BE LIABLE WITH RESPECT TO ANY SUBJECT    
//     MATTER OF THIS AGREEMENT UNDER TORT, CONTRACT, STRICT LIABILITY   
//     OR ANY OTHER LEGAL OR EQUITABLE THEORY (I) FOR ANY INDIRECT,      
//     SPECIAL, INCIDENTAL, EXEMPLARY OR CONSEQUENTIAL DAMAGES OF ANY    
//     CHARACTER INCLUDING, WITHOUT LIMITATION, DAMAGES FOR LOSS OF      
//     GOODWILL, DATA OR PROFIT, WORK STOPPAGE, OR COMPUTER FAILURE OR   
//     MALFUNCTION, OR IN ANY EVENT (II) FOR ANY AMOUNT IN EXCESS, IN    
//     THE AGGREGATE, OF THE FEE PAID BY LICENSEE TO EFINIX HEREUNDER    
//     (OR, IF THE FEE HAS BEEN WAIVED, $100), EVEN IF EFINIX SHALL HAVE 
//     BEEN INFORMED OF THE POSSIBILITY OF SUCH DAMAGES.  SOME STATES DO 
//     NOT ALLOW THE EXCLUSION OR LIMITATION OF INCIDENTAL OR            
//     CONSEQUENTIAL DAMAGES, SO THIS LIMITATION AND EXCLUSION MAY NOT   
//     APPLY TO LICENSEE.                                                
//
////////////////////////////////////////////////////////////////////////////////

generateIP  u_generateIP(
.io_systemClk ( io_systemClk ),
.io_ddrA_w_payload_strb ( io_ddrA_w_payload_strb ),
.io_ddrA_w_payload_data ( io_ddrA_w_payload_data ),
.axiA_awready ( axiA_awready ),
.axiA_awlen ( axiA_awlen ),
.axiA_awsize ( axiA_awsize ),
.axiA_arburst ( axiA_arburst ),
.axiA_awlock ( axiA_awlock ),
.axiA_arcache ( axiA_arcache ),
.axiA_awqos ( axiA_awqos ),
.axiA_awprot ( axiA_awprot ),
.axiA_arsize ( axiA_arsize ),
.axiA_arregion ( axiA_arregion ),
.axiA_arready ( axiA_arready ),
.axiA_arqos ( axiA_arqos ),
.axiA_arprot ( axiA_arprot ),
.axiA_arlock ( axiA_arlock ),
.axiA_arlen ( axiA_arlen ),
.axiA_arid ( axiA_arid ),
.axiA_awcache ( axiA_awcache ),
.axiA_awburst ( axiA_awburst ),
.axiA_awaddr ( axiA_awaddr ),
.axiAInterrupt ( axiAInterrupt ),
.axiA_rlast ( axiA_rlast ),
.io_jtag_tms ( io_jtag_tms ),
.io_jtag_tdi ( io_jtag_tdi ),
.io_jtag_tdo ( io_jtag_tdo ),
.io_jtag_tck ( io_jtag_tck ),
.axiA_araddr ( axiA_araddr ),
.axiA_wvalid ( axiA_wvalid ),
.axiA_wready ( axiA_wready ),
.axiA_wdata ( axiA_wdata ),
.axiA_wstrb ( axiA_wstrb ),
.axiA_wlast ( axiA_wlast ),
.axiA_bvalid ( axiA_bvalid ),
.axiA_bready ( axiA_bready ),
.axiA_bid ( axiA_bid ),
.axiA_bresp ( axiA_bresp ),
.axiA_rvalid ( axiA_rvalid ),
.axiA_rready ( axiA_rready ),
.axiA_rdata ( axiA_rdata ),
.axiA_rid ( axiA_rid ),
.axiA_rresp ( axiA_rresp ),
.axiA_arvalid ( axiA_arvalid ),
.axiA_awid ( axiA_awid ),
.axiA_awregion ( axiA_awregion ),
.axiA_awvalid ( axiA_awvalid ),
.io_ddrA_w_payload_id ( io_ddrA_w_payload_id ),
.io_ddrA_r_payload_last ( io_ddrA_r_payload_last ),
.io_ddrA_r_payload_resp ( io_ddrA_r_payload_resp ),
.io_ddrA_r_payload_id ( io_ddrA_r_payload_id ),
.io_ddrA_r_payload_data ( io_ddrA_r_payload_data ),
.io_ddrA_r_ready ( io_ddrA_r_ready ),
.io_ddrA_r_valid ( io_ddrA_r_valid ),
.io_ddrA_b_payload_resp ( io_ddrA_b_payload_resp ),
.io_ddrA_b_payload_id ( io_ddrA_b_payload_id ),
.io_ddrA_b_ready ( io_ddrA_b_ready ),
.io_ddrA_b_valid ( io_ddrA_b_valid ),
.io_ddrA_w_payload_last ( io_ddrA_w_payload_last ),
.io_ddrA_w_ready ( io_ddrA_w_ready ),
.io_ddrA_w_valid ( io_ddrA_w_valid ),
.io_ddrA_arw_payload_write ( io_ddrA_arw_payload_write ),
.io_ddrA_arw_payload_prot ( io_ddrA_arw_payload_prot ),
.io_ddrA_arw_payload_qos ( io_ddrA_arw_payload_qos ),
.io_ddrA_arw_payload_cache ( io_ddrA_arw_payload_cache ),
.io_ddrA_arw_payload_lock ( io_ddrA_arw_payload_lock ),
.io_ddrA_arw_payload_burst ( io_ddrA_arw_payload_burst ),
.io_ddrA_arw_payload_size ( io_ddrA_arw_payload_size ),
.io_ddrA_arw_payload_len ( io_ddrA_arw_payload_len ),
.io_ddrA_arw_payload_region ( io_ddrA_arw_payload_region ),
.io_ddrA_arw_payload_id ( io_ddrA_arw_payload_id ),
.io_ddrA_arw_payload_addr ( io_ddrA_arw_payload_addr ),
.io_ddrA_arw_ready ( io_ddrA_arw_ready ),
.io_ddrA_arw_valid ( io_ddrA_arw_valid ),
.system_spi_0_io_data_0_read ( system_spi_0_io_data_0_read ),
.system_spi_0_io_data_0_write ( system_spi_0_io_data_0_write ),
.system_spi_0_io_data_0_writeEnable ( system_spi_0_io_data_0_writeEnable ),
.system_spi_0_io_data_1_read ( system_spi_0_io_data_1_read ),
.system_spi_0_io_data_1_write ( system_spi_0_io_data_1_write ),
.system_spi_0_io_data_1_writeEnable ( system_spi_0_io_data_1_writeEnable ),
.system_spi_0_io_data_2_read ( system_spi_0_io_data_2_read ),
.system_spi_0_io_data_2_write ( system_spi_0_io_data_2_write ),
.system_spi_0_io_data_2_writeEnable ( system_spi_0_io_data_2_writeEnable ),
.system_spi_0_io_data_3_read ( system_spi_0_io_data_3_read ),
.system_spi_0_io_data_3_write ( system_spi_0_io_data_3_write ),
.system_spi_0_io_data_3_writeEnable ( system_spi_0_io_data_3_writeEnable ),
.system_spi_0_io_sclk_write ( system_spi_0_io_sclk_write ),
.userInterruptA ( userInterruptA ),
.io_apbSlave_0_PADDR ( io_apbSlave_0_PADDR ),
.io_apbSlave_0_PENABLE ( io_apbSlave_0_PENABLE ),
.io_apbSlave_0_PRDATA ( io_apbSlave_0_PRDATA ),
.io_apbSlave_0_PREADY ( io_apbSlave_0_PREADY ),
.io_apbSlave_0_PSEL ( io_apbSlave_0_PSEL ),
.io_apbSlave_0_PSLVERROR ( io_apbSlave_0_PSLVERROR ),
.io_apbSlave_0_PWDATA ( io_apbSlave_0_PWDATA ),
.io_apbSlave_0_PWRITE ( io_apbSlave_0_PWRITE ),
.io_asyncReset ( io_asyncReset ),
.io_memoryClk ( io_memoryClk ),
.io_systemReset ( io_systemReset ),
.system_uart_0_io_txd ( system_uart_0_io_txd ),
.io_memoryReset ( io_memoryReset ),
.system_uart_0_io_rxd ( system_uart_0_io_rxd ),
.system_i2c_0_io_scl_read ( system_i2c_0_io_scl_read ),
.system_i2c_0_io_scl_write ( system_i2c_0_io_scl_write ),
.system_i2c_0_io_sda_read ( system_i2c_0_io_sda_read ),
.system_i2c_0_io_sda_write ( system_i2c_0_io_sda_write ),
.system_gpio_0_io_writeEnable ( system_gpio_0_io_writeEnable ),
.io_ddrMasters_0_reset ( io_ddrMasters_0_reset ),
.io_ddrMasters_0_clk ( io_ddrMasters_0_clk ),
.io_ddrMasters_0_r_payload_last ( io_ddrMasters_0_r_payload_last ),
.io_ddrMasters_0_r_payload_resp ( io_ddrMasters_0_r_payload_resp ),
.io_ddrMasters_0_r_payload_id ( io_ddrMasters_0_r_payload_id ),
.io_ddrMasters_0_r_payload_data ( io_ddrMasters_0_r_payload_data ),
.io_ddrMasters_0_r_ready ( io_ddrMasters_0_r_ready ),
.io_ddrMasters_0_r_valid ( io_ddrMasters_0_r_valid ),
.io_ddrMasters_0_ar_payload_prot ( io_ddrMasters_0_ar_payload_prot ),
.io_ddrMasters_0_ar_payload_qos ( io_ddrMasters_0_ar_payload_qos ),
.io_ddrMasters_0_ar_payload_cache ( io_ddrMasters_0_ar_payload_cache ),
.io_ddrMasters_0_ar_payload_lock ( io_ddrMasters_0_ar_payload_lock ),
.io_ddrMasters_0_ar_payload_burst ( io_ddrMasters_0_ar_payload_burst ),
.io_ddrMasters_0_ar_payload_size ( io_ddrMasters_0_ar_payload_size ),
.io_ddrMasters_0_ar_payload_len ( io_ddrMasters_0_ar_payload_len ),
.io_ddrMasters_0_ar_payload_region ( io_ddrMasters_0_ar_payload_region ),
.io_ddrMasters_0_ar_payload_id ( io_ddrMasters_0_ar_payload_id ),
.io_ddrMasters_0_ar_payload_addr ( io_ddrMasters_0_ar_payload_addr ),
.io_ddrMasters_0_ar_ready ( io_ddrMasters_0_ar_ready ),
.io_ddrMasters_0_ar_valid ( io_ddrMasters_0_ar_valid ),
.io_ddrMasters_0_b_payload_resp ( io_ddrMasters_0_b_payload_resp ),
.io_ddrMasters_0_b_payload_id ( io_ddrMasters_0_b_payload_id ),
.io_ddrMasters_0_b_ready ( io_ddrMasters_0_b_ready ),
.io_ddrMasters_0_b_valid ( io_ddrMasters_0_b_valid ),
.io_ddrMasters_0_w_payload_last ( io_ddrMasters_0_w_payload_last ),
.io_ddrMasters_0_w_payload_strb ( io_ddrMasters_0_w_payload_strb ),
.io_ddrMasters_0_w_payload_data ( io_ddrMasters_0_w_payload_data ),
.io_ddrMasters_0_w_ready ( io_ddrMasters_0_w_ready ),
.io_ddrMasters_0_w_valid ( io_ddrMasters_0_w_valid ),
.io_ddrMasters_0_aw_payload_prot ( io_ddrMasters_0_aw_payload_prot ),
.io_ddrMasters_0_aw_payload_qos ( io_ddrMasters_0_aw_payload_qos ),
.io_ddrMasters_0_aw_payload_cache ( io_ddrMasters_0_aw_payload_cache ),
.io_ddrMasters_0_aw_payload_lock ( io_ddrMasters_0_aw_payload_lock ),
.io_ddrMasters_0_aw_payload_burst ( io_ddrMasters_0_aw_payload_burst ),
.io_ddrMasters_0_aw_payload_size ( io_ddrMasters_0_aw_payload_size ),
.io_ddrMasters_0_aw_payload_len ( io_ddrMasters_0_aw_payload_len ),
.io_ddrMasters_0_aw_payload_region ( io_ddrMasters_0_aw_payload_region ),
.io_ddrMasters_0_aw_payload_id ( io_ddrMasters_0_aw_payload_id ),
.io_ddrMasters_0_aw_payload_addr ( io_ddrMasters_0_aw_payload_addr ),
.io_ddrMasters_0_aw_ready ( io_ddrMasters_0_aw_ready ),
.io_ddrMasters_0_aw_valid ( io_ddrMasters_0_aw_valid ),
.system_gpio_0_io_write ( system_gpio_0_io_write ),
.system_gpio_0_io_read ( system_gpio_0_io_read ),
.system_spi_0_io_ss ( system_spi_0_io_ss )
);
