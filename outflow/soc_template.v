
// Efinity Top-level template
// Version: 2023.2.307.5.10
// Date: 2024-11-09 23:11

// Copyright (C) 2013 - 2023 Efinix Inc. All rights reserved.

// This file may be used as a starting point for Efinity synthesis top-level target.
// The port list here matches what is expected by Efinity constraint files generated
// by the Efinity Interface Designer.

// To use this:
//     #1)  Save this file with a different name to a different directory, where source files are kept.
//              Example: you may wish to save as E:\infinix\T120F324_devkit\soc.v
//     #2)  Add the newly saved file into Efinity project as design file
//     #3)  Edit the top level entity in Efinity project to:  soc
//     #4)  Insert design content.


module soc
(
  input my_ddr_pll_refclk,
  input my_pll_refclk,
  input system_i2c_0_io_scl_read,
  input system_i2c_0_io_sda_read,
  input system_spi_0_io_data_0_read,
  input system_spi_0_io_data_1_read,
  input systemClk_locked,
  input io_asyncResetn,
  input io_jtag_tck,
  input io_jtag_tdi,
  input io_jtag_tms,
  input [3:0] system_gpio_0_io_read,
  input system_uart_0_io_rxd,
  input io_memoryClk,
  input io_systemClk,
  input jtag_inst1_CAPTURE,
  input jtag_inst1_DRCK,
  input jtag_inst1_RESET,
  input jtag_inst1_RUNTEST,
  input jtag_inst1_SEL,
  input jtag_inst1_SHIFT,
  input jtag_inst1_TCK,
  input jtag_inst1_TDI,
  input jtag_inst1_TMS,
  input jtag_inst1_UPDATE,
  input io_ddrA_arw_ready,
  input [7:0] io_ddrA_b_payload_id,
  input io_ddrA_b_valid,
  input [127:0] io_ddrA_r_payload_data,
  input [7:0] io_ddrA_r_payload_id,
  input io_ddrA_r_payload_last,
  input [1:0] io_ddrA_r_payload_resp,
  input io_ddrA_r_valid,
  input io_ddrA_w_ready,
  output system_i2c_0_io_scl_write,
  output system_i2c_0_io_scl_writeEnable,
  output system_i2c_0_io_sda_write,
  output system_i2c_0_io_sda_writeEnable,
  output system_spi_0_io_data_0_write,
  output system_spi_0_io_data_0_writeEnable,
  output system_spi_0_io_data_1_write,
  output system_spi_0_io_data_1_writeEnable,
  output system_spi_0_io_sclk_write,
  output system_spi_0_io_ss,
  output memoryClk_rstn,
  output systemClk_rstn,
  output io_jtag_tdo,
  output memoryCheckerPass,
  output [3:0] system_gpio_0_io_write,
  output [3:0] system_gpio_0_io_writeEnable,
  output system_uart_0_io_txd,
  output jtag_inst1_TDO,
  output [31:0] io_ddrA_arw_payload_addr,
  output [1:0] io_ddrA_arw_payload_burst,
  output [7:0] io_ddrA_arw_payload_id,
  output [7:0] io_ddrA_arw_payload_len,
  output [1:0] io_ddrA_arw_payload_lock,
  output [2:0] io_ddrA_arw_payload_size,
  output io_ddrA_arw_payload_write,
  output io_ddrA_arw_valid,
  output io_ddrA_b_ready,
  output ddr_inst1_CFG_SEQ_RST,
  output ddr_inst1_CFG_SEQ_START,
  output io_ddrA_r_ready,
  output ddr_inst1_CFG_RST_N,
  output [127:0] io_ddrA_w_payload_data,
  output [7:0] io_ddrA_w_payload_id,
  output io_ddrA_w_payload_last,
  output [15:0] io_ddrA_w_payload_strb,
  output io_ddrA_w_valid
);


endmodule

