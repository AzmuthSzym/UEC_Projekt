# Constraints for CLK
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
## create_clock -name external_clock -period 10.00 [get_ports clk]




# Constraints for VS and HS
set_property PACKAGE_PIN R19 [get_ports vs]
set_property IOSTANDARD LVCMOS33 [get_ports vs]
set_property PACKAGE_PIN P19 [get_ports hs]
set_property IOSTANDARD LVCMOS33 [get_ports hs]

# Constraints for RED
set_property PACKAGE_PIN G19 [get_ports {r[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {r[0]}]
set_property PACKAGE_PIN H19 [get_ports {r[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {r[1]}]
set_property PACKAGE_PIN J19 [get_ports {r[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {r[2]}]
set_property PACKAGE_PIN N19 [get_ports {r[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {r[3]}]

# Constraints for GRN
set_property PACKAGE_PIN J17 [get_ports {g[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g[0]}]
set_property PACKAGE_PIN H17 [get_ports {g[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g[1]}]
set_property PACKAGE_PIN G17 [get_ports {g[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g[2]}]
set_property PACKAGE_PIN D17 [get_ports {g[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g[3]}]

# Constraints for BLU
set_property PACKAGE_PIN N18 [get_ports {b[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {b[0]}]
set_property PACKAGE_PIN L18 [get_ports {b[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {b[1]}]
set_property PACKAGE_PIN K18 [get_ports {b[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {b[2]}]
set_property PACKAGE_PIN J18 [get_ports {b[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {b[3]}]

# Constraints for PCLK_MIRROR
set_property PACKAGE_PIN J1 [get_ports pclk_mirror]
set_property IOSTANDARD LVCMOS33 [get_ports pclk_mirror]

# Constraints for CFGBVS
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]

#Constraints for RESET Button
set_property PACKAGE_PIN U18 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]

# Constraints for mouse
set_property PACKAGE_PIN C17 [get_ports ps2_clk]
set_property IOSTANDARD LVCMOS33 [get_ports ps2_clk]
set_property PULLUP true [get_ports ps2_clk]
set_property PACKAGE_PIN B17 [get_ports ps2_data]
set_property IOSTANDARD LVCMOS33 [get_ports ps2_data]
set_property PULLUP true [get_ports ps2_data]


set_input_delay -clock [get_clocks [get_clocks -of_objects [get_pins my_clk/inst/mmcm_adv_inst/CLKOUT0]]] 2.000 [get_ports -filter { NAME =~  "*" && DIRECTION == "INOUT" }]
set_input_delay -clock [get_clocks [get_clocks -of_objects [get_pins my_clk/inst/mmcm_adv_inst/CLKOUT0]]] 2.000 [get_ports -filter { NAME =~  "*" && DIRECTION == "INOUT" }]
set_input_delay -clock [get_clocks [get_clocks -of_objects [get_pins my_clk/inst/mmcm_adv_inst/CLKOUT0]]] 2.000 [get_ports reset]
set_output_delay -clock [get_clocks [get_clocks -of_objects [get_pins my_clk/inst/mmcm_adv_inst/CLKOUT1]]] 2.000 [get_ports {{b[0]} {b[1]} {b[2]} {b[3]} {g[0]} {g[1]} {g[2]} {g[3]} hs {r[0]} {r[1]} {r[2]} {r[3]} vs}]


set_output_delay -clock [get_clocks [get_clocks -of_objects [get_pins my_clk/inst/mmcm_adv_inst/CLKOUT1]]] 2.000 [get_ports -filter { NAME =~  "*" && DIRECTION == "INOUT" }]
set_output_delay -clock [get_clocks [get_clocks -of_objects [get_pins my_clk/inst/mmcm_adv_inst/CLKOUT1]]] 2.000 [get_ports pclk_mirror]






set_max_delay -from [get_clocks -of_objects [get_pins my_clk/inst/mmcm_adv_inst/CLKOUT0]] -to [get_clocks -of_objects [get_pins my_clk/inst/mmcm_adv_inst/CLKOUT1]] 12.000




set_false_path -from [get_clocks -of_objects [get_pins my_clk/inst/mmcm_adv_inst/CLKOUT1]] -to [get_clocks -of_objects [get_pins my_clk/inst/mmcm_adv_inst/CLKOUT1]]
