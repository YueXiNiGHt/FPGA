/////////////////////////////////////////////////////////////////////////////
//
// Copyright (C) 2013-2023 Efinix Inc. All rights reserved.
//
// Description:
// Example top file for EfxSapphireSoc
//
// Language:  Verilog 2001
//
// ------------------------------------------------------------------------------
// REVISION:
//  $Snapshot: $
//  $Id:$
//
// History:
// 1.0 Initial Release. 
/////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps

module top_soc (
input		io_jtag_tms,
input		io_jtag_tdi,
output		io_jtag_tdo,
input		io_jtag_tck,
input		io_memoryClk,
output		system_spi_0_io_sclk_write,
output		system_spi_0_io_data_0_writeEnable,
input		system_spi_0_io_data_0_read,
output		system_spi_0_io_data_0_write,
output		system_spi_0_io_data_1_writeEnable,
input		system_spi_0_io_data_1_read,
output		system_spi_0_io_data_1_write,
output		system_spi_0_io_ss,
output		io_ddrA_arw_valid,
input		io_ddrA_arw_ready,
output [31:0] io_ddrA_arw_payload_addr,
output [7:0] io_ddrA_arw_payload_id,
output [7:0] io_ddrA_arw_payload_len,
output [2:0] io_ddrA_arw_payload_size,
output [1:0] io_ddrA_arw_payload_burst,
output [1:0] io_ddrA_arw_payload_lock,
output		io_ddrA_arw_payload_write,
output [7:0] io_ddrA_w_payload_id,
output		io_ddrA_w_valid,
input		io_ddrA_w_ready,
output [127:0] io_ddrA_w_payload_data,
output [15:0] io_ddrA_w_payload_strb,
output		io_ddrA_w_payload_last,
input		io_ddrA_b_valid,
output		io_ddrA_b_ready,
input [7:0] io_ddrA_b_payload_id,
input		io_ddrA_r_valid,
output		io_ddrA_r_ready,
input [127:0] io_ddrA_r_payload_data,
input [7:0] io_ddrA_r_payload_id,
input [1:0] io_ddrA_r_payload_resp,
input		io_ddrA_r_payload_last,
output		ddr_inst1_CFG_SEQ_START,
output		ddr_inst1_CFG_RST_N,
output		ddr_inst1_CFG_SEQ_RST,
output		memoryClk_rstn,
output		system_i2c_0_io_sda_writeEnable,
output		system_i2c_0_io_sda_write,
input		system_i2c_0_io_sda_read,
output		system_i2c_0_io_scl_writeEnable,
output		system_i2c_0_io_scl_write,
input		system_i2c_0_io_scl_read,
input [3:0] system_gpio_0_io_read,
output [3:0] system_gpio_0_io_write,
output [3:0] system_gpio_0_io_writeEnable,
output		system_uart_0_io_txd,
input		system_uart_0_io_rxd,

output      memoryCheckerPass,
output      systemClk_rstn,
input       systemClk_locked,
input       io_systemClk,
input       io_asyncResetn

);
/////////////////////////////////////////////////////////////////////////////
//Reset and PLL
wire 		reset;
wire		io_systemReset;
wire 	    io_memoryReset;				
wire [1:0]  io_ddrA_b_payload_resp=2'b00;
wire userInterrupt_0;
wire [15:0] io_apbSlave_0_PADDR;
wire		io_apbSlave_0_PSEL;
wire		io_apbSlave_0_PENABLE;
wire		io_apbSlave_0_PREADY;
wire		io_apbSlave_0_PWRITE;
wire [31:0] io_apbSlave_0_PWDATA;
wire [31:0] io_apbSlave_0_PRDATA;
wire		io_apbSlave_0_PSLVERROR;
wire		start;
wire [31:0] iaddr;
wire [31:0] idata;
wire [7:0]  ilen;
wire [1:0]  status;
wire axi4Interrupt;
wire [7:0] axi_awid;
wire [31:0]	axi_awaddr;
wire [7:0]	axi_awlen;
wire [2:0]	axi_awsize;
wire [1:0]	axi_awburst;
wire		axi_awlock;
wire [3:0]	axi_awcache;
wire [2:0]	axi_awprot;
wire [3:0]	axi_awqos;
wire [3:0]	axi_awregion;
wire		axi_awvalid;
wire		axi_awready;
wire [31:0]	axi_wdata;
wire [3:0] axi_wstrb;
wire		axi_wvalid;
wire		axi_wlast;
wire		axi_wready;
wire [7:0] axi_bid;
wire [1:0] axi_bresp;
wire		axi_bvalid;
wire		axi_bready;
wire [7:0]	axi_arid;
wire [31:0]	axi_araddr;
wire [7:0]	axi_arlen;
wire [2:0]	axi_arsize;
wire [1:0]	axi_arburst;
wire		axi_arlock;
wire [3:0]	axi_arcache;
wire [2:0]	axi_arprot;
wire [3:0]	axi_arqos;
wire [3:0]	axi_arregion;
wire		axi_arvalid;
wire		axi_arready;
wire [7:0]	axi_rid;
wire [31:0]	axi_rdata;
wire [1:0]	axi_rresp;
wire		axi_rlast;
wire		axi_rvalid;
wire		axi_rready;
wire [7:0] m_aid_0;
wire [31:0] m_aaddr_0;
wire [7:0]  m_alen_0;
wire [2:0]  m_asize_0;
wire [1:0]  m_aburst_0;
wire [1:0]  m_alock_0;
wire		m_avalid_0;
wire		m_aready_0;
wire		m_awready_0;
wire		m_arready_0;
wire		m_atype_0;
wire [7:0]  m_wid_0;
wire [31:0] m_wdata_0;
wire [3:0]	m_wstrb_0;
wire		m_wlast_0;
wire		m_wvalid_0;
wire		m_wready_0;
wire [3:0] m_rid_0;
wire [31:0] m_rdata_0;
wire		m_rlast_0;
wire		m_rvalid_0;
wire		m_rready_0;
wire [1:0] m_rresp_0;
wire [7:0] m_bid_0;
wire [1:0] m_bresp_0;
wire		m_bvalid_0;
wire		m_bready_0;
wire		m_awvalid_0;
wire		m_arvalid_0;
wire		m_pass_0;
wire		m_start_0;
wire		io_axiMasterReset_0;


/////////////////////////////////////////////////////////////////////////////
//Reset and PLL
assign reset 	= ~( io_asyncResetn & systemClk_locked);
assign systemClk_rstn 	= 1'b1;
assign system_i2c_0_io_sda_writeEnable = !system_i2c_0_io_sda_write;
assign system_i2c_0_io_scl_writeEnable = !system_i2c_0_io_scl_write;
assign memoryClk_rstn=1'b1;
assign m_aready_0=(m_atype_0 & m_awready_0) | (!m_atype_0 & m_arready_0);
assign m_awvalid_0=m_avalid_0 & m_atype_0;
assign m_arvalid_0=m_avalid_0 & ~m_atype_0;
assign memoryCheckerPass=m_pass_0;


/////////////////////////////////////////////////////////////////////////////
ddr_reset_sequencer#(
.FREQ(100)
) reset_sequencer (
.ddr_rstn_i(~io_memoryReset),
.clk(io_memoryClk),
.ddr_rstn(ddr_inst1_CFG_RST_N),
.ddr_cfg_seq_rst(ddr_inst1_CFG_SEQ_RST),
.ddr_cfg_seq_start(ddr_inst1_CFG_SEQ_START),
.ddr_init_done());

apb3_slave #(
.ADDR_WIDTH(16)) apb_slave_0 (
.clk(io_systemClk),
.resetn(~io_systemReset),
.PADDR(io_apbSlave_0_PADDR),
.PSEL(io_apbSlave_0_PSEL),
.PENABLE(io_apbSlave_0_PENABLE),
.PREADY(io_apbSlave_0_PREADY),
.PWRITE(io_apbSlave_0_PWRITE),
.PWDATA(io_apbSlave_0_PWDATA),
.PRDATA(io_apbSlave_0_PRDATA),
.PSLVERROR(io_apbSlave_0_PSLVERROR),
.start(start),
.iaddr(iaddr),
.ilen(ilen),
.idata(idata),
.status(status));

timer_start #(
.MHZ(100),
.SECOND(3)
) memcheck_s0 (
.clk(io_systemClk),
.rst_n(~io_systemReset),
.start(m_start_0));

memory_checker #(
.START_ADDR('h00100000),
.STOP_ADDR('h001FF800),
.ALEN(63),
.WIDTH(32)
) memcheck_0 (
.axi_clk(io_memoryClk),
.rstn(~io_axiMasterReset_0),
.start(m_start_0),
.aid(m_aid_0),
.aaddr(m_aaddr_0),
.alen(m_alen_0),
.asize(m_asize_0),
.aburst(m_aburst_0),
.alock(m_alock_0),
.avalid(m_avalid_0),
.aready(m_aready_0),
.atype(m_atype_0),
.wid(m_wid_0),
.wdata(m_wdata_0),
.wstrb(m_wstrb_0),
.wlast(m_wlast_0),
.wvalid(m_wvalid_0),
.wready(m_wready_0),
.rid(m_rid_0),
.rdata(m_rdata_0),
.rlast(m_rlast_0),
.rvalid(m_rvalid_0),
.rready(m_rready_0),
.rresp(m_rresp_0),
.bid(m_bid_0),
.bvalid(m_bvalid_0),
.bready(m_bready_0),
.pass(m_pass_0),
.apb3_clk(io_systemClk),
.start2(start),
.iaddr(iaddr),
.idata(idata),
.ilen(ilen),
.status(status));

timer_start #(
.MHZ(100),
.SECOND(10),
.PULSE(1)
) intr_s0 (
.clk(io_systemClk),
.rst_n(~io_systemReset),
.start(userInterrupt_0));

axi4_slave #(
.ADDR_WIDTH(32),
.DATA_WIDTH(32)
) axi_slave_0 (
.axi_interrupt(axi4Interrupt),
.axi_aclk(io_systemClk),
.axi_resetn(~io_systemReset),
.axi_awid(axi_awid),
.axi_awaddr(axi_awaddr),
.axi_awlen(axi_awlen),
.axi_awsize(axi_awsize),
.axi_awburst(axi_awburst),
.axi_awlock(axi_awlock),
.axi_awcache(axi_awcache),
.axi_awprot(axi_awprot),
.axi_awqos(axi_awqos),
.axi_awregion(axi_awregion),
.axi_awvalid(axi_awvalid),
.axi_awready(axi_awready),
.axi_wdata(axi_wdata),
.axi_wstrb(axi_wstrb),
.axi_wlast(axi_wlast),
.axi_wvalid(axi_wvalid),
.axi_wready(axi_wready),
.axi_bid(axi_bid),
.axi_bresp(axi_bresp),
.axi_bvalid(axi_bvalid),
.axi_bready(axi_bready),
.axi_arid(axi_arid),
.axi_araddr(axi_araddr),
.axi_arlen(axi_arlen),
.axi_arsize(axi_arsize),
.axi_arburst(axi_arburst),
.axi_arlock(axi_arlock),
.axi_arcache(axi_arcache),
.axi_arprot(axi_arprot),
.axi_arqos(axi_arqos),
.axi_arregion(axi_arregion),
.axi_arvalid(axi_arvalid),
.axi_arready(axi_arready),
.axi_rid(axi_rid),
.axi_rdata(axi_rdata),
.axi_rresp(axi_rresp),
.axi_rlast(axi_rlast),
.axi_rvalid(axi_rvalid),
.axi_rready(axi_rready));



/////////////////////////////////////////////////////////////////////////////

generateIP soc_inst
(
.io_memoryClk(io_memoryClk),
.io_memoryReset(io_memoryReset),
.system_gpio_0_io_read(system_gpio_0_io_read),
.system_gpio_0_io_write(system_gpio_0_io_write),
.system_gpio_0_io_writeEnable(system_gpio_0_io_writeEnable),
.io_apbSlave_0_PADDR(io_apbSlave_0_PADDR),
.io_apbSlave_0_PSEL(io_apbSlave_0_PSEL),
.io_apbSlave_0_PENABLE(io_apbSlave_0_PENABLE),
.io_apbSlave_0_PREADY(io_apbSlave_0_PREADY),
.io_apbSlave_0_PWRITE(io_apbSlave_0_PWRITE),
.io_apbSlave_0_PWDATA(io_apbSlave_0_PWDATA),
.io_apbSlave_0_PRDATA(io_apbSlave_0_PRDATA),
.io_apbSlave_0_PSLVERROR(io_apbSlave_0_PSLVERROR),
.axiA_awvalid(axi_awvalid),
.axiA_awready(axi_awready),
.axiA_awaddr(axi_awaddr),
.axiA_awid(axi_awid),
.axiA_awregion(axi_awregion),
.axiA_awlen(axi_awlen),
.axiA_awsize(axi_awsize),
.axiA_awburst(axi_awburst),
.axiA_awlock(axi_awlock),
.axiA_awcache(axi_awcache),
.axiA_awqos(axi_awqos),
.axiA_awprot(axi_awprot),
.axiA_wvalid(axi_wvalid),
.axiA_wready(axi_wready),
.axiA_wdata(axi_wdata),
.axiA_wstrb(axi_wstrb),
.axiA_wlast(axi_wlast),
.axiA_bvalid(axi_bvalid),
.axiA_bready(axi_bready),
.axiA_bid(axi_bid),
.axiA_bresp(axi_bresp),
.axiA_arvalid(axi_arvalid),
.axiA_arready(axi_arready),
.axiA_araddr(axi_araddr),
.axiA_arid(axi_arid),
.axiA_arregion(axi_arregion),
.axiA_arlen(axi_arlen),
.axiA_arsize(axi_arsize),
.axiA_arburst(axi_arburst),
.axiA_arlock(axi_arlock),
.axiA_arcache(axi_arcache),
.axiA_arqos(axi_arqos),
.axiA_arprot(axi_arprot),
.axiA_rvalid(axi_rvalid),
.axiA_rready(axi_rready),
.axiA_rdata(axi_rdata),
.axiA_rid(axi_rid),
.axiA_rresp(axi_rresp),
.axiA_rlast(axi_rlast),
.axiAInterrupt(axi4Interrupt),
.system_i2c_0_io_sda_write(system_i2c_0_io_sda_write),
.system_i2c_0_io_sda_read(system_i2c_0_io_sda_read),
.system_i2c_0_io_scl_write(system_i2c_0_io_scl_write),
.system_i2c_0_io_scl_read(system_i2c_0_io_scl_read),
.io_ddrA_arw_valid(io_ddrA_arw_valid),
.io_ddrA_arw_ready(io_ddrA_arw_ready),
.io_ddrA_arw_payload_addr(io_ddrA_arw_payload_addr),
.io_ddrA_arw_payload_id(io_ddrA_arw_payload_id),
.io_ddrA_arw_payload_len(io_ddrA_arw_payload_len),
.io_ddrA_arw_payload_size(io_ddrA_arw_payload_size),
.io_ddrA_arw_payload_burst(io_ddrA_arw_payload_burst),
.io_ddrA_arw_payload_lock(io_ddrA_arw_payload_lock[0]),
.io_ddrA_arw_payload_write(io_ddrA_arw_payload_write),
.io_ddrA_arw_payload_prot(),
.io_ddrA_arw_payload_qos(),
.io_ddrA_arw_payload_cache(),
.io_ddrA_arw_payload_region(),
.io_ddrA_w_payload_id(io_ddrA_w_payload_id),
.io_ddrA_w_valid(io_ddrA_w_valid),
.io_ddrA_w_ready(io_ddrA_w_ready),
.io_ddrA_w_payload_data(io_ddrA_w_payload_data),
.io_ddrA_w_payload_strb(io_ddrA_w_payload_strb),
.io_ddrA_w_payload_last(io_ddrA_w_payload_last),
.io_ddrA_b_valid(io_ddrA_b_valid),
.io_ddrA_b_ready(io_ddrA_b_ready),
.io_ddrA_b_payload_id(io_ddrA_b_payload_id),
.io_ddrA_b_payload_resp(io_ddrA_b_payload_resp),
.io_ddrA_r_valid(io_ddrA_r_valid),
.io_ddrA_r_ready(io_ddrA_r_ready),
.io_ddrA_r_payload_data(io_ddrA_r_payload_data),
.io_ddrA_r_payload_id(io_ddrA_r_payload_id),
.io_ddrA_r_payload_resp(io_ddrA_r_payload_resp),
.io_ddrA_r_payload_last(io_ddrA_r_payload_last),
.io_jtag_tms(io_jtag_tms),
.io_jtag_tdi(io_jtag_tdi),
.io_jtag_tdo(io_jtag_tdo),
.io_jtag_tck(io_jtag_tck),
.io_ddrMasters_0_clk(io_memoryClk),
.io_ddrMasters_0_reset(io_axiMasterReset_0),
.io_ddrMasters_0_aw_valid(m_awvalid_0),
.io_ddrMasters_0_aw_ready(m_awready_0),
.io_ddrMasters_0_aw_payload_addr(m_aaddr_0),
.io_ddrMasters_0_aw_payload_id(m_aid_0[3:0]),
.io_ddrMasters_0_aw_payload_region(4'h0),
.io_ddrMasters_0_aw_payload_len(m_alen_0),
.io_ddrMasters_0_aw_payload_size(m_asize_0),
.io_ddrMasters_0_aw_payload_burst(m_aburst_0),
.io_ddrMasters_0_aw_payload_lock(m_alock_0[0]),
.io_ddrMasters_0_aw_payload_cache(4'h0),
.io_ddrMasters_0_aw_payload_qos(4'h0),
.io_ddrMasters_0_aw_payload_prot(3'h0),
.io_ddrMasters_0_w_valid(m_wvalid_0),
.io_ddrMasters_0_w_ready(m_wready_0),
.io_ddrMasters_0_w_payload_data(m_wdata_0),
.io_ddrMasters_0_w_payload_strb(m_wstrb_0),
.io_ddrMasters_0_w_payload_last(m_wlast_0),
.io_ddrMasters_0_b_valid(m_bvalid_0),
.io_ddrMasters_0_b_ready(m_bready_0),
.io_ddrMasters_0_b_payload_id(m_bid_0[3:0]),
.io_ddrMasters_0_b_payload_resp(m_bresp_0),
.io_ddrMasters_0_ar_valid(m_arvalid_0),
.io_ddrMasters_0_ar_ready(m_arready_0),
.io_ddrMasters_0_ar_payload_addr(m_aaddr_0),
.io_ddrMasters_0_ar_payload_id(m_aid_0[3:0]),
.io_ddrMasters_0_ar_payload_region(4'h0),
.io_ddrMasters_0_ar_payload_len(m_alen_0),
.io_ddrMasters_0_ar_payload_size(m_asize_0),
.io_ddrMasters_0_ar_payload_burst(m_aburst_0),
.io_ddrMasters_0_ar_payload_lock(m_alock_0[0]),
.io_ddrMasters_0_ar_payload_cache(4'h0),
.io_ddrMasters_0_ar_payload_qos(4'h0),
.io_ddrMasters_0_ar_payload_prot(3'h0),
.io_ddrMasters_0_r_valid(m_rvalid_0),
.io_ddrMasters_0_r_ready(m_rready_0),
.io_ddrMasters_0_r_payload_data(m_rdata_0),
.io_ddrMasters_0_r_payload_id(m_rid_0),
.io_ddrMasters_0_r_payload_resp(m_rresp_0),
.io_ddrMasters_0_r_payload_last(m_rlast_0),
.userInterruptA(userInterrupt_0),
.system_spi_0_io_sclk_write(system_spi_0_io_sclk_write),
.system_spi_0_io_data_0_writeEnable(system_spi_0_io_data_0_writeEnable),
.system_spi_0_io_data_0_read(system_spi_0_io_data_0_read),
.system_spi_0_io_data_0_write(system_spi_0_io_data_0_write),
.system_spi_0_io_data_1_writeEnable(system_spi_0_io_data_1_writeEnable),
.system_spi_0_io_data_1_read(system_spi_0_io_data_1_read),
.system_spi_0_io_data_1_write(system_spi_0_io_data_1_write),
.system_spi_0_io_data_2_writeEnable(),
.system_spi_0_io_data_2_read(),
.system_spi_0_io_data_2_write(),
.system_spi_0_io_data_3_writeEnable(),
.system_spi_0_io_data_3_read(),
.system_spi_0_io_data_3_write(),
.system_spi_0_io_ss(system_spi_0_io_ss),
.system_uart_0_io_txd(system_uart_0_io_txd),
.system_uart_0_io_rxd(system_uart_0_io_rxd),

.io_systemClk(io_systemClk),
.io_asyncReset(reset),
.io_systemReset(io_systemReset)		
);

endmodule

//////////////////////////////////////////////////////////////////////////////
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
/////////////////////////////////////////////////////////////////////////////