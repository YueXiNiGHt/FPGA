# PLL Constraints
#################
create_clock -period 10.0 io_systemClk
create_clock -period 10 io_memoryClk
create_clock -period 100 io_jtag_tck

# False Path
#################
set_clock_groups -exclusive  -group {io_systemClk} -group {io_memoryClk} -group {io_jtag_tck}

#SPI Constraints
#################
set_output_delay -clock io_systemClk -max -4.700 [get_ports {system_spi_0_io_sclk_write}]
set_output_delay -clock io_systemClk -min -2.571 [get_ports {system_spi_0_io_sclk_write}]
set_output_delay -clock io_systemClk -max -4.700 [get_ports {system_spi_0_io_ss}]
set_output_delay -clock io_systemClk -min -2.571 [get_ports {system_spi_0_io_ss}]
set_input_delay -clock io_systemClk -max 6.168 [get_ports {system_spi_0_io_data_0_read}]
set_input_delay -clock io_systemClk -min 3.084 [get_ports {system_spi_0_io_data_0_read}]
set_output_delay -clock io_systemClk -max -4.700 [get_ports {system_spi_0_io_data_0_write}]
set_output_delay -clock io_systemClk -min -2.571 [get_ports {system_spi_0_io_data_0_write}]
set_output_delay -clock io_systemClk -max -4.707 [get_ports {system_spi_0_io_data_0_writeEnable}]
set_output_delay -clock io_systemClk -min -2.567 [get_ports {system_spi_0_io_data_0_writeEnable}]
set_input_delay -clock io_systemClk -max 6.168 [get_ports {system_spi_0_io_data_1_read}]
set_input_delay -clock io_systemClk -min 3.084 [get_ports {system_spi_0_io_data_1_read}]
set_output_delay -clock io_systemClk -max -4.700 [get_ports {system_spi_0_io_data_1_write}]
set_output_delay -clock io_systemClk -min -2.571 [get_ports {system_spi_0_io_data_1_write}]
set_output_delay -clock io_systemClk -max -4.707 [get_ports {system_spi_0_io_data_1_writeEnable}]
set_output_delay -clock io_systemClk -min -2.567 [get_ports {system_spi_0_io_data_1_writeEnable}]

# DDR Constraints
#####################
set_output_delay -clock io_memoryClk -max -2.810 [get_ports {io_ddrA_arw_payload_addr[*]}]
set_output_delay -clock io_memoryClk -min -2.155 [get_ports {io_ddrA_arw_payload_addr[*]}]
set_output_delay -clock io_memoryClk -max -2.810 [get_ports {io_ddrA_arw_payload_burst[1] io_ddrA_arw_payload_burst[0]}]
set_output_delay -clock io_memoryClk -min -2.155 [get_ports {io_ddrA_arw_payload_burst[1] io_ddrA_arw_payload_burst[0]}]
set_output_delay -clock io_memoryClk -max -2.810 [get_ports {io_ddrA_arw_payload_id[*]}]
set_output_delay -clock io_memoryClk -min -2.155 [get_ports {io_ddrA_arw_payload_id[*]}]
set_output_delay -clock io_memoryClk -max -2.810 [get_ports {io_ddrA_arw_payload_len[*]}]
set_output_delay -clock io_memoryClk -min -2.155 [get_ports {io_ddrA_arw_payload_len[*]}]
set_output_delay -clock io_memoryClk -max -2.810 [get_ports {io_ddrA_arw_payload_lock[1] io_ddrA_arw_payload_lock[0]}]
set_output_delay -clock io_memoryClk -min -2.155 [get_ports {io_ddrA_arw_payload_lock[1] io_ddrA_arw_payload_lock[0]}]
set_output_delay -clock io_memoryClk -max -2.810 [get_ports {io_ddrA_arw_payload_size[2] io_ddrA_arw_payload_size[1] io_ddrA_arw_payload_size[0]}]
set_output_delay -clock io_memoryClk -min -2.155 [get_ports {io_ddrA_arw_payload_size[2] io_ddrA_arw_payload_size[1] io_ddrA_arw_payload_size[0]}]
set_output_delay -clock io_memoryClk -max -2.810 [get_ports {io_ddrA_arw_payload_write}]
set_output_delay -clock io_memoryClk -min -2.155 [get_ports {io_ddrA_arw_payload_write}]
set_output_delay -clock io_memoryClk -max -2.810 [get_ports {io_ddrA_arw_valid}]
set_output_delay -clock io_memoryClk -min -2.155 [get_ports {io_ddrA_arw_valid}]
set_output_delay -clock io_memoryClk -max -2.810 [get_ports {io_ddrA_b_ready}]
set_output_delay -clock io_memoryClk -min -2.155 [get_ports {io_ddrA_b_ready}]
set_output_delay -clock io_memoryClk -max -2.810 [get_ports {io_ddrA_r_ready}]
set_output_delay -clock io_memoryClk -min -2.155 [get_ports {io_ddrA_r_ready}]
set_output_delay -clock io_memoryClk -max -2.810 [get_ports {io_ddrA_w_payload_data[*]}]
set_output_delay -clock io_memoryClk -min -2.155 [get_ports {io_ddrA_w_payload_data[*]}]
set_output_delay -clock io_memoryClk -max -2.810 [get_ports {io_ddrA_w_payload_id[*]}]
set_output_delay -clock io_memoryClk -min -2.155 [get_ports {io_ddrA_w_payload_id[*]}]
set_output_delay -clock io_memoryClk -max -2.810 [get_ports {io_ddrA_w_payload_last}]
set_output_delay -clock io_memoryClk -min -2.155 [get_ports {io_ddrA_w_payload_last}]
set_output_delay -clock io_memoryClk -max -2.810 [get_ports {io_ddrA_w_payload_strb[*]}]
set_output_delay -clock io_memoryClk -min -2.155 [get_ports {io_ddrA_w_payload_strb[*]}]
set_output_delay -clock io_memoryClk -max -2.810 [get_ports {io_ddrA_w_valid}]
set_output_delay -clock io_memoryClk -min -2.155 [get_ports {io_ddrA_w_valid}]
set_input_delay -clock io_memoryClk -max 8.310 [get_ports {io_ddrA_arw_ready}]
set_input_delay -clock io_memoryClk -min 4.155 [get_ports {io_ddrA_arw_ready}]
set_input_delay -clock io_memoryClk -max 8.310 [get_ports {io_ddrA_b_payload_id[*]}]
set_input_delay -clock io_memoryClk -min 4.155 [get_ports {io_ddrA_b_payload_id[*]}]
set_input_delay -clock io_memoryClk -max 8.310 [get_ports {io_ddrA_b_valid}]
set_input_delay -clock io_memoryClk -min 4.155 [get_ports {io_ddrA_b_valid}]
set_input_delay -clock io_memoryClk -max 8.310 [get_ports {io_ddrA_r_payload_data[*]}]
set_input_delay -clock io_memoryClk -min 4.155 [get_ports {io_ddrA_r_payload_data[*]}]
set_input_delay -clock io_memoryClk -max 8.310 [get_ports {io_ddrA_r_payload_id[*]}]
set_input_delay -clock io_memoryClk -min 4.155 [get_ports {io_ddrA_r_payload_id[*]}]
set_input_delay -clock io_memoryClk -max 8.310 [get_ports {io_ddrA_r_payload_last}]
set_input_delay -clock io_memoryClk -min 4.155 [get_ports {io_ddrA_r_payload_last}]
set_input_delay -clock io_memoryClk -max 8.310 [get_ports {io_ddrA_r_payload_resp[1] io_ddrA_r_payload_resp[0]}]
set_input_delay -clock io_memoryClk -min 4.155 [get_ports {io_ddrA_r_payload_resp[1] io_ddrA_r_payload_resp[0]}]
set_input_delay -clock io_memoryClk -max 8.310 [get_ports {io_ddrA_r_valid}]
set_input_delay -clock io_memoryClk -min 4.155 [get_ports {io_ddrA_r_valid}]
set_input_delay -clock io_memoryClk -max 8.310 [get_ports {io_ddrA_w_ready}]
set_input_delay -clock io_memoryClk -min 4.155 [get_ports {io_ddrA_w_ready}]
