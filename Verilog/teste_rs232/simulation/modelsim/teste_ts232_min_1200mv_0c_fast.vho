-- Copyright (C) 1991-2014 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus II License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 14.0.0 Build 200 06/17/2014 SJ Web Edition"

-- DATE "02/23/2015 21:21:10"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	teste_ts232 IS
    PORT (
	CLOCK_50 : IN std_logic;
	KEY : IN std_logic_vector(3 DOWNTO 0);
	LEDR : OUT std_logic_vector(17 DOWNTO 0);
	SW : IN std_logic_vector(17 DOWNTO 0);
	UART_RXD : IN std_logic;
	UART_TXD : OUT std_logic
	);
END teste_ts232;

-- Design Ports Information
-- KEY[2]	=>  Location: PIN_N21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[3]	=>  Location: PIN_R24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[0]	=>  Location: PIN_G19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[1]	=>  Location: PIN_F19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[2]	=>  Location: PIN_E19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[3]	=>  Location: PIN_F21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[4]	=>  Location: PIN_F18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[5]	=>  Location: PIN_E18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[6]	=>  Location: PIN_J19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[7]	=>  Location: PIN_H19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[8]	=>  Location: PIN_J17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[9]	=>  Location: PIN_G17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[10]	=>  Location: PIN_J15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[11]	=>  Location: PIN_H16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[12]	=>  Location: PIN_J16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[13]	=>  Location: PIN_H17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[14]	=>  Location: PIN_F15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[15]	=>  Location: PIN_G15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[16]	=>  Location: PIN_G16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[17]	=>  Location: PIN_H15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[8]	=>  Location: PIN_AC25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[9]	=>  Location: PIN_AB25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[10]	=>  Location: PIN_AC24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[11]	=>  Location: PIN_AB24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[12]	=>  Location: PIN_AB23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[13]	=>  Location: PIN_AA24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[14]	=>  Location: PIN_AA23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[15]	=>  Location: PIN_AA22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[16]	=>  Location: PIN_Y24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[17]	=>  Location: PIN_Y23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- UART_TXD	=>  Location: PIN_G9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- KEY[1]	=>  Location: PIN_M21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLOCK_50	=>  Location: PIN_Y2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- KEY[0]	=>  Location: PIN_M23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[0]	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[1]	=>  Location: PIN_AC28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- UART_RXD	=>  Location: PIN_G12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- SW[2]	=>  Location: PIN_AC27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[3]	=>  Location: PIN_AD27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[4]	=>  Location: PIN_AB27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[5]	=>  Location: PIN_AC26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[6]	=>  Location: PIN_AD26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[7]	=>  Location: PIN_AB26,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF teste_ts232 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_CLOCK_50 : std_logic;
SIGNAL ww_KEY : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_LEDR : std_logic_vector(17 DOWNTO 0);
SIGNAL ww_SW : std_logic_vector(17 DOWNTO 0);
SIGNAL ww_UART_RXD : std_logic;
SIGNAL ww_UART_TXD : std_logic;
SIGNAL \CLOCK_50~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \KEY[2]~input_o\ : std_logic;
SIGNAL \KEY[3]~input_o\ : std_logic;
SIGNAL \SW[8]~input_o\ : std_logic;
SIGNAL \SW[9]~input_o\ : std_logic;
SIGNAL \SW[10]~input_o\ : std_logic;
SIGNAL \SW[11]~input_o\ : std_logic;
SIGNAL \SW[12]~input_o\ : std_logic;
SIGNAL \SW[13]~input_o\ : std_logic;
SIGNAL \SW[14]~input_o\ : std_logic;
SIGNAL \SW[15]~input_o\ : std_logic;
SIGNAL \SW[16]~input_o\ : std_logic;
SIGNAL \SW[17]~input_o\ : std_logic;
SIGNAL \LEDR[0]~output_o\ : std_logic;
SIGNAL \LEDR[1]~output_o\ : std_logic;
SIGNAL \LEDR[2]~output_o\ : std_logic;
SIGNAL \LEDR[3]~output_o\ : std_logic;
SIGNAL \LEDR[4]~output_o\ : std_logic;
SIGNAL \LEDR[5]~output_o\ : std_logic;
SIGNAL \LEDR[6]~output_o\ : std_logic;
SIGNAL \LEDR[7]~output_o\ : std_logic;
SIGNAL \LEDR[8]~output_o\ : std_logic;
SIGNAL \LEDR[9]~output_o\ : std_logic;
SIGNAL \LEDR[10]~output_o\ : std_logic;
SIGNAL \LEDR[11]~output_o\ : std_logic;
SIGNAL \LEDR[12]~output_o\ : std_logic;
SIGNAL \LEDR[13]~output_o\ : std_logic;
SIGNAL \LEDR[14]~output_o\ : std_logic;
SIGNAL \LEDR[15]~output_o\ : std_logic;
SIGNAL \LEDR[16]~output_o\ : std_logic;
SIGNAL \LEDR[17]~output_o\ : std_logic;
SIGNAL \UART_TXD~output_o\ : std_logic;
SIGNAL \CLOCK_50~input_o\ : std_logic;
SIGNAL \CLOCK_50~inputclkctrl_outclk\ : std_logic;
SIGNAL \UART_RXD~input_o\ : std_logic;
SIGNAL \rs232|transceiver|uart_rx1~q\ : std_logic;
SIGNAL \rs232|transceiver|uart_rx2~feeder_combout\ : std_logic;
SIGNAL \rs232|transceiver|uart_rx2~q\ : std_logic;
SIGNAL \rs232|transceiver|rx_reg[7]~feeder_combout\ : std_logic;
SIGNAL \KEY[1]~input_o\ : std_logic;
SIGNAL \rs232|transceiver|enable16_counter[0]~16_combout\ : std_logic;
SIGNAL \~GND~combout\ : std_logic;
SIGNAL \rs232|transceiver|enable16_counter[5]~18_combout\ : std_logic;
SIGNAL \rs232|transceiver|enable16_counter[0]~17\ : std_logic;
SIGNAL \rs232|transceiver|enable16_counter[1]~19_combout\ : std_logic;
SIGNAL \rs232|transceiver|enable16_counter[1]~20\ : std_logic;
SIGNAL \rs232|transceiver|enable16_counter[2]~21_combout\ : std_logic;
SIGNAL \rs232|transceiver|enable16_counter[2]~22\ : std_logic;
SIGNAL \rs232|transceiver|enable16_counter[3]~23_combout\ : std_logic;
SIGNAL \rs232|transceiver|enable16_counter[3]~24\ : std_logic;
SIGNAL \rs232|transceiver|enable16_counter[4]~25_combout\ : std_logic;
SIGNAL \rs232|transceiver|enable16_counter[4]~26\ : std_logic;
SIGNAL \rs232|transceiver|enable16_counter[5]~27_combout\ : std_logic;
SIGNAL \rs232|transceiver|enable16_counter[5]~28\ : std_logic;
SIGNAL \rs232|transceiver|enable16_counter[6]~29_combout\ : std_logic;
SIGNAL \rs232|transceiver|enable16_counter[6]~30\ : std_logic;
SIGNAL \rs232|transceiver|enable16_counter[7]~31_combout\ : std_logic;
SIGNAL \rs232|transceiver|enable16_counter[7]~32\ : std_logic;
SIGNAL \rs232|transceiver|enable16_counter[8]~33_combout\ : std_logic;
SIGNAL \rs232|transceiver|enable16_counter[8]~34\ : std_logic;
SIGNAL \rs232|transceiver|enable16_counter[9]~35_combout\ : std_logic;
SIGNAL \rs232|transceiver|enable16_counter[9]~36\ : std_logic;
SIGNAL \rs232|transceiver|enable16_counter[10]~37_combout\ : std_logic;
SIGNAL \rs232|transceiver|enable16_counter[10]~38\ : std_logic;
SIGNAL \rs232|transceiver|enable16_counter[11]~39_combout\ : std_logic;
SIGNAL \rs232|transceiver|enable16_counter[11]~40\ : std_logic;
SIGNAL \rs232|transceiver|enable16_counter[12]~41_combout\ : std_logic;
SIGNAL \rs232|transceiver|enable16_counter[12]~42\ : std_logic;
SIGNAL \rs232|transceiver|enable16_counter[13]~43_combout\ : std_logic;
SIGNAL \rs232|transceiver|enable16_counter[13]~44\ : std_logic;
SIGNAL \rs232|transceiver|enable16_counter[14]~45_combout\ : std_logic;
SIGNAL \rs232|transceiver|enable16_counter[14]~46\ : std_logic;
SIGNAL \rs232|transceiver|enable16_counter[15]~47_combout\ : std_logic;
SIGNAL \rs232|transceiver|Equal0~3_combout\ : std_logic;
SIGNAL \rs232|transceiver|Equal0~2_combout\ : std_logic;
SIGNAL \rs232|transceiver|Equal0~1_combout\ : std_logic;
SIGNAL \rs232|transceiver|Equal0~0_combout\ : std_logic;
SIGNAL \rs232|transceiver|Equal0~4_combout\ : std_logic;
SIGNAL \rs232|transceiver|rx_count16~3_combout\ : std_logic;
SIGNAL \rs232|transceiver|rx_count16[0]~4_combout\ : std_logic;
SIGNAL \rs232|transceiver|rx_count16~5_combout\ : std_logic;
SIGNAL \rs232|transceiver|Add2~0_combout\ : std_logic;
SIGNAL \rs232|transceiver|rx_count16~7_combout\ : std_logic;
SIGNAL \rs232|transceiver|rx_count16[0]~2_combout\ : std_logic;
SIGNAL \rs232|transceiver|rx_count16~6_combout\ : std_logic;
SIGNAL \rs232|transceiver|Equal1~0_combout\ : std_logic;
SIGNAL \rs232|transceiver|rx_busy~0_combout\ : std_logic;
SIGNAL \rs232|transceiver|rx_bitcount~5_combout\ : std_logic;
SIGNAL \rs232|transceiver|rx_bitcount[0]~3_combout\ : std_logic;
SIGNAL \rs232|transceiver|rx_bitcount[0]~4_combout\ : std_logic;
SIGNAL \rs232|transceiver|Add3~0_combout\ : std_logic;
SIGNAL \rs232|transceiver|rx_bitcount~7_combout\ : std_logic;
SIGNAL \rs232|transceiver|Equal2~0_combout\ : std_logic;
SIGNAL \rs232|transceiver|rx_busy~1_combout\ : std_logic;
SIGNAL \rs232|transceiver|rx_busy~2_combout\ : std_logic;
SIGNAL \rs232|transceiver|rx_busy~q\ : std_logic;
SIGNAL \rs232|transceiver|rx_bitcount~6_combout\ : std_logic;
SIGNAL \rs232|transceiver|rx_bitcount~2_combout\ : std_logic;
SIGNAL \rs232|transceiver|rx_reg[0]~0_combout\ : std_logic;
SIGNAL \rs232|transceiver|rx_reg[0]~1_combout\ : std_logic;
SIGNAL \rs232|transceiver|rx_reg[6]~feeder_combout\ : std_logic;
SIGNAL \rs232|transceiver|rx_reg[5]~feeder_combout\ : std_logic;
SIGNAL \rs232|transceiver|Equal3~0_combout\ : std_logic;
SIGNAL \rs232|transceiver|rx_data[0]~0_combout\ : std_logic;
SIGNAL \rs232|csr_do~0_combout\ : std_logic;
SIGNAL \rs232|csr_do~1_combout\ : std_logic;
SIGNAL \rs232|csr_do~2_combout\ : std_logic;
SIGNAL \rs232|csr_do~3_combout\ : std_logic;
SIGNAL \rs232|csr_do~4_combout\ : std_logic;
SIGNAL \rs232|csr_do~5_combout\ : std_logic;
SIGNAL \rs232|csr_do~6_combout\ : std_logic;
SIGNAL \rs232|csr_do~7_combout\ : std_logic;
SIGNAL \KEY[0]~input_o\ : std_logic;
SIGNAL \rs232|transceiver|tx_bitcount~0_combout\ : std_logic;
SIGNAL \rs232|transceiver|tx_count16~0_combout\ : std_logic;
SIGNAL \rs232|transceiver|Add5~2_combout\ : std_logic;
SIGNAL \rs232|transceiver|Add5~0_combout\ : std_logic;
SIGNAL \rs232|transceiver|Equal6~0_combout\ : std_logic;
SIGNAL \rs232|transceiver|tx_busy~0_combout\ : std_logic;
SIGNAL \rs232|transceiver|tx_busy~q\ : std_logic;
SIGNAL \rs232|transceiver|tx_count16[0]~1_combout\ : std_logic;
SIGNAL \rs232|transceiver|Add4~0_combout\ : std_logic;
SIGNAL \rs232|transceiver|Add4~1_combout\ : std_logic;
SIGNAL \rs232|transceiver|Add4~2_combout\ : std_logic;
SIGNAL \rs232|transceiver|tx_reg~0_combout\ : std_logic;
SIGNAL \rs232|transceiver|tx_reg[0]~4_combout\ : std_logic;
SIGNAL \rs232|transceiver|tx_reg[0]~5_combout\ : std_logic;
SIGNAL \rs232|transceiver|Add5~1_combout\ : std_logic;
SIGNAL \SW[0]~input_o\ : std_logic;
SIGNAL \SW[1]~input_o\ : std_logic;
SIGNAL \SW[4]~input_o\ : std_logic;
SIGNAL \SW[5]~input_o\ : std_logic;
SIGNAL \SW[6]~input_o\ : std_logic;
SIGNAL \rs232|transceiver|Equal5~0_combout\ : std_logic;
SIGNAL \rs232|transceiver|tx_reg~1_combout\ : std_logic;
SIGNAL \rs232|transceiver|tx_reg~12_combout\ : std_logic;
SIGNAL \SW[7]~input_o\ : std_logic;
SIGNAL \rs232|transceiver|tx_reg~11_combout\ : std_logic;
SIGNAL \rs232|transceiver|tx_reg[0]~3_combout\ : std_logic;
SIGNAL \rs232|transceiver|tx_reg~10_combout\ : std_logic;
SIGNAL \rs232|transceiver|tx_reg~9_combout\ : std_logic;
SIGNAL \SW[3]~input_o\ : std_logic;
SIGNAL \rs232|transceiver|tx_reg~8_combout\ : std_logic;
SIGNAL \SW[2]~input_o\ : std_logic;
SIGNAL \rs232|transceiver|tx_reg~7_combout\ : std_logic;
SIGNAL \rs232|transceiver|tx_reg~6_combout\ : std_logic;
SIGNAL \rs232|transceiver|tx_reg~2_combout\ : std_logic;
SIGNAL \rs232|transceiver|uart_tx~0_combout\ : std_logic;
SIGNAL \rs232|transceiver|uart_tx~_Duplicate_1_q\ : std_logic;
SIGNAL \rs232|transceiver|uart_tx~1_combout\ : std_logic;
SIGNAL \rs232|transceiver|uart_tx~q\ : std_logic;
SIGNAL \rs232|transceiver|tx_count16\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \rs232|transceiver|enable16_counter\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \rs232|transceiver|rx_data\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \rs232|transceiver|rx_count16\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \rs232|transceiver|rx_bitcount\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \rs232|transceiver|rx_reg\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \rs232|transceiver|tx_bitcount\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \rs232|transceiver|tx_reg\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \rs232|csr_do\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \ALT_INV_KEY[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_KEY[1]~input_o\ : std_logic;

BEGIN

ww_CLOCK_50 <= CLOCK_50;
ww_KEY <= KEY;
LEDR <= ww_LEDR;
ww_SW <= SW;
ww_UART_RXD <= UART_RXD;
UART_TXD <= ww_UART_TXD;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\CLOCK_50~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLOCK_50~input_o\);
\ALT_INV_KEY[0]~input_o\ <= NOT \KEY[0]~input_o\;
\ALT_INV_KEY[1]~input_o\ <= NOT \KEY[1]~input_o\;

-- Location: IOOBUF_X69_Y73_N16
\LEDR[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rs232|csr_do\(0),
	devoe => ww_devoe,
	o => \LEDR[0]~output_o\);

-- Location: IOOBUF_X94_Y73_N2
\LEDR[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rs232|csr_do\(1),
	devoe => ww_devoe,
	o => \LEDR[1]~output_o\);

-- Location: IOOBUF_X94_Y73_N9
\LEDR[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rs232|csr_do\(2),
	devoe => ww_devoe,
	o => \LEDR[2]~output_o\);

-- Location: IOOBUF_X107_Y73_N16
\LEDR[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rs232|csr_do\(3),
	devoe => ww_devoe,
	o => \LEDR[3]~output_o\);

-- Location: IOOBUF_X87_Y73_N16
\LEDR[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rs232|csr_do\(4),
	devoe => ww_devoe,
	o => \LEDR[4]~output_o\);

-- Location: IOOBUF_X87_Y73_N9
\LEDR[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rs232|csr_do\(5),
	devoe => ww_devoe,
	o => \LEDR[5]~output_o\);

-- Location: IOOBUF_X72_Y73_N9
\LEDR[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rs232|csr_do\(6),
	devoe => ww_devoe,
	o => \LEDR[6]~output_o\);

-- Location: IOOBUF_X72_Y73_N2
\LEDR[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rs232|csr_do\(7),
	devoe => ww_devoe,
	o => \LEDR[7]~output_o\);

-- Location: IOOBUF_X69_Y73_N2
\LEDR[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[8]~output_o\);

-- Location: IOOBUF_X83_Y73_N23
\LEDR[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[9]~output_o\);

-- Location: IOOBUF_X60_Y73_N23
\LEDR[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[10]~output_o\);

-- Location: IOOBUF_X65_Y73_N23
\LEDR[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[11]~output_o\);

-- Location: IOOBUF_X65_Y73_N16
\LEDR[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[12]~output_o\);

-- Location: IOOBUF_X67_Y73_N9
\LEDR[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[13]~output_o\);

-- Location: IOOBUF_X58_Y73_N2
\LEDR[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[14]~output_o\);

-- Location: IOOBUF_X65_Y73_N9
\LEDR[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[15]~output_o\);

-- Location: IOOBUF_X67_Y73_N2
\LEDR[16]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[16]~output_o\);

-- Location: IOOBUF_X60_Y73_N16
\LEDR[17]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[17]~output_o\);

-- Location: IOOBUF_X13_Y73_N23
\UART_TXD~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \rs232|transceiver|uart_tx~q\,
	devoe => ww_devoe,
	o => \UART_TXD~output_o\);

-- Location: IOIBUF_X0_Y36_N15
\CLOCK_50~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLOCK_50,
	o => \CLOCK_50~input_o\);

-- Location: CLKCTRL_G4
\CLOCK_50~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CLOCK_50~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CLOCK_50~inputclkctrl_outclk\);

-- Location: IOIBUF_X27_Y73_N8
\UART_RXD~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_UART_RXD,
	o => \UART_RXD~input_o\);

-- Location: FF_X27_Y73_N10
\rs232|transceiver|uart_rx1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \UART_RXD~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|uart_rx1~q\);

-- Location: LCCOMB_X75_Y69_N12
\rs232|transceiver|uart_rx2~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|uart_rx2~feeder_combout\ = \rs232|transceiver|uart_rx1~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rs232|transceiver|uart_rx1~q\,
	combout => \rs232|transceiver|uart_rx2~feeder_combout\);

-- Location: FF_X75_Y69_N13
\rs232|transceiver|uart_rx2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \rs232|transceiver|uart_rx2~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|uart_rx2~q\);

-- Location: LCCOMB_X82_Y69_N22
\rs232|transceiver|rx_reg[7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|rx_reg[7]~feeder_combout\ = \rs232|transceiver|uart_rx2~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rs232|transceiver|uart_rx2~q\,
	combout => \rs232|transceiver|rx_reg[7]~feeder_combout\);

-- Location: IOIBUF_X115_Y53_N15
\KEY[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(1),
	o => \KEY[1]~input_o\);

-- Location: LCCOMB_X79_Y69_N0
\rs232|transceiver|enable16_counter[0]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|enable16_counter[0]~16_combout\ = \rs232|transceiver|enable16_counter\(0) $ (VCC)
-- \rs232|transceiver|enable16_counter[0]~17\ = CARRY(\rs232|transceiver|enable16_counter\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rs232|transceiver|enable16_counter\(0),
	datad => VCC,
	combout => \rs232|transceiver|enable16_counter[0]~16_combout\,
	cout => \rs232|transceiver|enable16_counter[0]~17\);

-- Location: LCCOMB_X79_Y68_N0
\~GND\ : cycloneive_lcell_comb
-- Equation(s):
-- \~GND~combout\ = GND

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \~GND~combout\);

-- Location: LCCOMB_X80_Y69_N24
\rs232|transceiver|enable16_counter[5]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|enable16_counter[5]~18_combout\ = (!\rs232|transceiver|Equal0~4_combout\) # (!\KEY[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[1]~input_o\,
	datad => \rs232|transceiver|Equal0~4_combout\,
	combout => \rs232|transceiver|enable16_counter[5]~18_combout\);

-- Location: FF_X79_Y69_N1
\rs232|transceiver|enable16_counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \rs232|transceiver|enable16_counter[0]~16_combout\,
	asdata => \~GND~combout\,
	sload => \rs232|transceiver|enable16_counter[5]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|enable16_counter\(0));

-- Location: LCCOMB_X79_Y69_N2
\rs232|transceiver|enable16_counter[1]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|enable16_counter[1]~19_combout\ = (\rs232|transceiver|enable16_counter\(1) & (\rs232|transceiver|enable16_counter[0]~17\ & VCC)) # (!\rs232|transceiver|enable16_counter\(1) & (!\rs232|transceiver|enable16_counter[0]~17\))
-- \rs232|transceiver|enable16_counter[1]~20\ = CARRY((!\rs232|transceiver|enable16_counter\(1) & !\rs232|transceiver|enable16_counter[0]~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \rs232|transceiver|enable16_counter\(1),
	datad => VCC,
	cin => \rs232|transceiver|enable16_counter[0]~17\,
	combout => \rs232|transceiver|enable16_counter[1]~19_combout\,
	cout => \rs232|transceiver|enable16_counter[1]~20\);

-- Location: FF_X79_Y69_N3
\rs232|transceiver|enable16_counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \rs232|transceiver|enable16_counter[1]~19_combout\,
	asdata => VCC,
	sload => \rs232|transceiver|enable16_counter[5]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|enable16_counter\(1));

-- Location: LCCOMB_X79_Y69_N4
\rs232|transceiver|enable16_counter[2]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|enable16_counter[2]~21_combout\ = (\rs232|transceiver|enable16_counter\(2) & ((GND) # (!\rs232|transceiver|enable16_counter[1]~20\))) # (!\rs232|transceiver|enable16_counter\(2) & (\rs232|transceiver|enable16_counter[1]~20\ $ (GND)))
-- \rs232|transceiver|enable16_counter[2]~22\ = CARRY((\rs232|transceiver|enable16_counter\(2)) # (!\rs232|transceiver|enable16_counter[1]~20\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \rs232|transceiver|enable16_counter\(2),
	datad => VCC,
	cin => \rs232|transceiver|enable16_counter[1]~20\,
	combout => \rs232|transceiver|enable16_counter[2]~21_combout\,
	cout => \rs232|transceiver|enable16_counter[2]~22\);

-- Location: FF_X79_Y69_N5
\rs232|transceiver|enable16_counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \rs232|transceiver|enable16_counter[2]~21_combout\,
	asdata => \~GND~combout\,
	sload => \rs232|transceiver|enable16_counter[5]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|enable16_counter\(2));

-- Location: LCCOMB_X79_Y69_N6
\rs232|transceiver|enable16_counter[3]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|enable16_counter[3]~23_combout\ = (\rs232|transceiver|enable16_counter\(3) & (\rs232|transceiver|enable16_counter[2]~22\ & VCC)) # (!\rs232|transceiver|enable16_counter\(3) & (!\rs232|transceiver|enable16_counter[2]~22\))
-- \rs232|transceiver|enable16_counter[3]~24\ = CARRY((!\rs232|transceiver|enable16_counter\(3) & !\rs232|transceiver|enable16_counter[2]~22\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \rs232|transceiver|enable16_counter\(3),
	datad => VCC,
	cin => \rs232|transceiver|enable16_counter[2]~22\,
	combout => \rs232|transceiver|enable16_counter[3]~23_combout\,
	cout => \rs232|transceiver|enable16_counter[3]~24\);

-- Location: FF_X79_Y69_N7
\rs232|transceiver|enable16_counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \rs232|transceiver|enable16_counter[3]~23_combout\,
	asdata => VCC,
	sload => \rs232|transceiver|enable16_counter[5]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|enable16_counter\(3));

-- Location: LCCOMB_X79_Y69_N8
\rs232|transceiver|enable16_counter[4]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|enable16_counter[4]~25_combout\ = (\rs232|transceiver|enable16_counter\(4) & ((GND) # (!\rs232|transceiver|enable16_counter[3]~24\))) # (!\rs232|transceiver|enable16_counter\(4) & (\rs232|transceiver|enable16_counter[3]~24\ $ (GND)))
-- \rs232|transceiver|enable16_counter[4]~26\ = CARRY((\rs232|transceiver|enable16_counter\(4)) # (!\rs232|transceiver|enable16_counter[3]~24\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \rs232|transceiver|enable16_counter\(4),
	datad => VCC,
	cin => \rs232|transceiver|enable16_counter[3]~24\,
	combout => \rs232|transceiver|enable16_counter[4]~25_combout\,
	cout => \rs232|transceiver|enable16_counter[4]~26\);

-- Location: FF_X79_Y69_N9
\rs232|transceiver|enable16_counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \rs232|transceiver|enable16_counter[4]~25_combout\,
	asdata => VCC,
	sload => \rs232|transceiver|enable16_counter[5]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|enable16_counter\(4));

-- Location: LCCOMB_X79_Y69_N10
\rs232|transceiver|enable16_counter[5]~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|enable16_counter[5]~27_combout\ = (\rs232|transceiver|enable16_counter\(5) & (\rs232|transceiver|enable16_counter[4]~26\ & VCC)) # (!\rs232|transceiver|enable16_counter\(5) & (!\rs232|transceiver|enable16_counter[4]~26\))
-- \rs232|transceiver|enable16_counter[5]~28\ = CARRY((!\rs232|transceiver|enable16_counter\(5) & !\rs232|transceiver|enable16_counter[4]~26\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \rs232|transceiver|enable16_counter\(5),
	datad => VCC,
	cin => \rs232|transceiver|enable16_counter[4]~26\,
	combout => \rs232|transceiver|enable16_counter[5]~27_combout\,
	cout => \rs232|transceiver|enable16_counter[5]~28\);

-- Location: FF_X79_Y69_N11
\rs232|transceiver|enable16_counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \rs232|transceiver|enable16_counter[5]~27_combout\,
	asdata => \~GND~combout\,
	sload => \rs232|transceiver|enable16_counter[5]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|enable16_counter\(5));

-- Location: LCCOMB_X79_Y69_N12
\rs232|transceiver|enable16_counter[6]~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|enable16_counter[6]~29_combout\ = (\rs232|transceiver|enable16_counter\(6) & ((GND) # (!\rs232|transceiver|enable16_counter[5]~28\))) # (!\rs232|transceiver|enable16_counter\(6) & (\rs232|transceiver|enable16_counter[5]~28\ $ (GND)))
-- \rs232|transceiver|enable16_counter[6]~30\ = CARRY((\rs232|transceiver|enable16_counter\(6)) # (!\rs232|transceiver|enable16_counter[5]~28\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \rs232|transceiver|enable16_counter\(6),
	datad => VCC,
	cin => \rs232|transceiver|enable16_counter[5]~28\,
	combout => \rs232|transceiver|enable16_counter[6]~29_combout\,
	cout => \rs232|transceiver|enable16_counter[6]~30\);

-- Location: FF_X79_Y69_N13
\rs232|transceiver|enable16_counter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \rs232|transceiver|enable16_counter[6]~29_combout\,
	asdata => \~GND~combout\,
	sload => \rs232|transceiver|enable16_counter[5]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|enable16_counter\(6));

-- Location: LCCOMB_X79_Y69_N14
\rs232|transceiver|enable16_counter[7]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|enable16_counter[7]~31_combout\ = (\rs232|transceiver|enable16_counter\(7) & (\rs232|transceiver|enable16_counter[6]~30\ & VCC)) # (!\rs232|transceiver|enable16_counter\(7) & (!\rs232|transceiver|enable16_counter[6]~30\))
-- \rs232|transceiver|enable16_counter[7]~32\ = CARRY((!\rs232|transceiver|enable16_counter\(7) & !\rs232|transceiver|enable16_counter[6]~30\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \rs232|transceiver|enable16_counter\(7),
	datad => VCC,
	cin => \rs232|transceiver|enable16_counter[6]~30\,
	combout => \rs232|transceiver|enable16_counter[7]~31_combout\,
	cout => \rs232|transceiver|enable16_counter[7]~32\);

-- Location: FF_X79_Y69_N15
\rs232|transceiver|enable16_counter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \rs232|transceiver|enable16_counter[7]~31_combout\,
	asdata => \~GND~combout\,
	sload => \rs232|transceiver|enable16_counter[5]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|enable16_counter\(7));

-- Location: LCCOMB_X79_Y69_N16
\rs232|transceiver|enable16_counter[8]~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|enable16_counter[8]~33_combout\ = (\rs232|transceiver|enable16_counter\(8) & ((GND) # (!\rs232|transceiver|enable16_counter[7]~32\))) # (!\rs232|transceiver|enable16_counter\(8) & (\rs232|transceiver|enable16_counter[7]~32\ $ (GND)))
-- \rs232|transceiver|enable16_counter[8]~34\ = CARRY((\rs232|transceiver|enable16_counter\(8)) # (!\rs232|transceiver|enable16_counter[7]~32\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \rs232|transceiver|enable16_counter\(8),
	datad => VCC,
	cin => \rs232|transceiver|enable16_counter[7]~32\,
	combout => \rs232|transceiver|enable16_counter[8]~33_combout\,
	cout => \rs232|transceiver|enable16_counter[8]~34\);

-- Location: FF_X79_Y69_N17
\rs232|transceiver|enable16_counter[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \rs232|transceiver|enable16_counter[8]~33_combout\,
	asdata => \~GND~combout\,
	sload => \rs232|transceiver|enable16_counter[5]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|enable16_counter\(8));

-- Location: LCCOMB_X79_Y69_N18
\rs232|transceiver|enable16_counter[9]~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|enable16_counter[9]~35_combout\ = (\rs232|transceiver|enable16_counter\(9) & (\rs232|transceiver|enable16_counter[8]~34\ & VCC)) # (!\rs232|transceiver|enable16_counter\(9) & (!\rs232|transceiver|enable16_counter[8]~34\))
-- \rs232|transceiver|enable16_counter[9]~36\ = CARRY((!\rs232|transceiver|enable16_counter\(9) & !\rs232|transceiver|enable16_counter[8]~34\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \rs232|transceiver|enable16_counter\(9),
	datad => VCC,
	cin => \rs232|transceiver|enable16_counter[8]~34\,
	combout => \rs232|transceiver|enable16_counter[9]~35_combout\,
	cout => \rs232|transceiver|enable16_counter[9]~36\);

-- Location: FF_X79_Y69_N19
\rs232|transceiver|enable16_counter[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \rs232|transceiver|enable16_counter[9]~35_combout\,
	asdata => \~GND~combout\,
	sload => \rs232|transceiver|enable16_counter[5]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|enable16_counter\(9));

-- Location: LCCOMB_X79_Y69_N20
\rs232|transceiver|enable16_counter[10]~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|enable16_counter[10]~37_combout\ = (\rs232|transceiver|enable16_counter\(10) & ((GND) # (!\rs232|transceiver|enable16_counter[9]~36\))) # (!\rs232|transceiver|enable16_counter\(10) & (\rs232|transceiver|enable16_counter[9]~36\ $ (GND)))
-- \rs232|transceiver|enable16_counter[10]~38\ = CARRY((\rs232|transceiver|enable16_counter\(10)) # (!\rs232|transceiver|enable16_counter[9]~36\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \rs232|transceiver|enable16_counter\(10),
	datad => VCC,
	cin => \rs232|transceiver|enable16_counter[9]~36\,
	combout => \rs232|transceiver|enable16_counter[10]~37_combout\,
	cout => \rs232|transceiver|enable16_counter[10]~38\);

-- Location: FF_X79_Y69_N21
\rs232|transceiver|enable16_counter[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \rs232|transceiver|enable16_counter[10]~37_combout\,
	asdata => \~GND~combout\,
	sload => \rs232|transceiver|enable16_counter[5]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|enable16_counter\(10));

-- Location: LCCOMB_X79_Y69_N22
\rs232|transceiver|enable16_counter[11]~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|enable16_counter[11]~39_combout\ = (\rs232|transceiver|enable16_counter\(11) & (\rs232|transceiver|enable16_counter[10]~38\ & VCC)) # (!\rs232|transceiver|enable16_counter\(11) & (!\rs232|transceiver|enable16_counter[10]~38\))
-- \rs232|transceiver|enable16_counter[11]~40\ = CARRY((!\rs232|transceiver|enable16_counter\(11) & !\rs232|transceiver|enable16_counter[10]~38\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \rs232|transceiver|enable16_counter\(11),
	datad => VCC,
	cin => \rs232|transceiver|enable16_counter[10]~38\,
	combout => \rs232|transceiver|enable16_counter[11]~39_combout\,
	cout => \rs232|transceiver|enable16_counter[11]~40\);

-- Location: FF_X79_Y69_N23
\rs232|transceiver|enable16_counter[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \rs232|transceiver|enable16_counter[11]~39_combout\,
	asdata => \~GND~combout\,
	sload => \rs232|transceiver|enable16_counter[5]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|enable16_counter\(11));

-- Location: LCCOMB_X79_Y69_N24
\rs232|transceiver|enable16_counter[12]~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|enable16_counter[12]~41_combout\ = (\rs232|transceiver|enable16_counter\(12) & ((GND) # (!\rs232|transceiver|enable16_counter[11]~40\))) # (!\rs232|transceiver|enable16_counter\(12) & (\rs232|transceiver|enable16_counter[11]~40\ $ 
-- (GND)))
-- \rs232|transceiver|enable16_counter[12]~42\ = CARRY((\rs232|transceiver|enable16_counter\(12)) # (!\rs232|transceiver|enable16_counter[11]~40\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \rs232|transceiver|enable16_counter\(12),
	datad => VCC,
	cin => \rs232|transceiver|enable16_counter[11]~40\,
	combout => \rs232|transceiver|enable16_counter[12]~41_combout\,
	cout => \rs232|transceiver|enable16_counter[12]~42\);

-- Location: FF_X79_Y69_N25
\rs232|transceiver|enable16_counter[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \rs232|transceiver|enable16_counter[12]~41_combout\,
	asdata => \~GND~combout\,
	sload => \rs232|transceiver|enable16_counter[5]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|enable16_counter\(12));

-- Location: LCCOMB_X79_Y69_N26
\rs232|transceiver|enable16_counter[13]~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|enable16_counter[13]~43_combout\ = (\rs232|transceiver|enable16_counter\(13) & (\rs232|transceiver|enable16_counter[12]~42\ & VCC)) # (!\rs232|transceiver|enable16_counter\(13) & (!\rs232|transceiver|enable16_counter[12]~42\))
-- \rs232|transceiver|enable16_counter[13]~44\ = CARRY((!\rs232|transceiver|enable16_counter\(13) & !\rs232|transceiver|enable16_counter[12]~42\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \rs232|transceiver|enable16_counter\(13),
	datad => VCC,
	cin => \rs232|transceiver|enable16_counter[12]~42\,
	combout => \rs232|transceiver|enable16_counter[13]~43_combout\,
	cout => \rs232|transceiver|enable16_counter[13]~44\);

-- Location: FF_X79_Y69_N27
\rs232|transceiver|enable16_counter[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \rs232|transceiver|enable16_counter[13]~43_combout\,
	asdata => \~GND~combout\,
	sload => \rs232|transceiver|enable16_counter[5]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|enable16_counter\(13));

-- Location: LCCOMB_X79_Y69_N28
\rs232|transceiver|enable16_counter[14]~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|enable16_counter[14]~45_combout\ = (\rs232|transceiver|enable16_counter\(14) & ((GND) # (!\rs232|transceiver|enable16_counter[13]~44\))) # (!\rs232|transceiver|enable16_counter\(14) & (\rs232|transceiver|enable16_counter[13]~44\ $ 
-- (GND)))
-- \rs232|transceiver|enable16_counter[14]~46\ = CARRY((\rs232|transceiver|enable16_counter\(14)) # (!\rs232|transceiver|enable16_counter[13]~44\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \rs232|transceiver|enable16_counter\(14),
	datad => VCC,
	cin => \rs232|transceiver|enable16_counter[13]~44\,
	combout => \rs232|transceiver|enable16_counter[14]~45_combout\,
	cout => \rs232|transceiver|enable16_counter[14]~46\);

-- Location: FF_X79_Y69_N29
\rs232|transceiver|enable16_counter[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \rs232|transceiver|enable16_counter[14]~45_combout\,
	asdata => \~GND~combout\,
	sload => \rs232|transceiver|enable16_counter[5]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|enable16_counter\(14));

-- Location: LCCOMB_X79_Y69_N30
\rs232|transceiver|enable16_counter[15]~47\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|enable16_counter[15]~47_combout\ = \rs232|transceiver|enable16_counter\(15) $ (!\rs232|transceiver|enable16_counter[14]~46\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \rs232|transceiver|enable16_counter\(15),
	cin => \rs232|transceiver|enable16_counter[14]~46\,
	combout => \rs232|transceiver|enable16_counter[15]~47_combout\);

-- Location: FF_X79_Y69_N31
\rs232|transceiver|enable16_counter[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \rs232|transceiver|enable16_counter[15]~47_combout\,
	asdata => \~GND~combout\,
	sload => \rs232|transceiver|enable16_counter[5]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|enable16_counter\(15));

-- Location: LCCOMB_X80_Y69_N30
\rs232|transceiver|Equal0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|Equal0~3_combout\ = (\rs232|transceiver|enable16_counter\(12)) # ((\rs232|transceiver|enable16_counter\(15)) # ((\rs232|transceiver|enable16_counter\(13)) # (\rs232|transceiver|enable16_counter\(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs232|transceiver|enable16_counter\(12),
	datab => \rs232|transceiver|enable16_counter\(15),
	datac => \rs232|transceiver|enable16_counter\(13),
	datad => \rs232|transceiver|enable16_counter\(14),
	combout => \rs232|transceiver|Equal0~3_combout\);

-- Location: LCCOMB_X80_Y69_N4
\rs232|transceiver|Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|Equal0~2_combout\ = (\rs232|transceiver|enable16_counter\(8)) # ((\rs232|transceiver|enable16_counter\(9)) # ((\rs232|transceiver|enable16_counter\(11)) # (\rs232|transceiver|enable16_counter\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs232|transceiver|enable16_counter\(8),
	datab => \rs232|transceiver|enable16_counter\(9),
	datac => \rs232|transceiver|enable16_counter\(11),
	datad => \rs232|transceiver|enable16_counter\(10),
	combout => \rs232|transceiver|Equal0~2_combout\);

-- Location: LCCOMB_X80_Y69_N22
\rs232|transceiver|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|Equal0~1_combout\ = (\rs232|transceiver|enable16_counter\(7)) # ((\rs232|transceiver|enable16_counter\(6)) # ((\rs232|transceiver|enable16_counter\(4)) # (\rs232|transceiver|enable16_counter\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs232|transceiver|enable16_counter\(7),
	datab => \rs232|transceiver|enable16_counter\(6),
	datac => \rs232|transceiver|enable16_counter\(4),
	datad => \rs232|transceiver|enable16_counter\(5),
	combout => \rs232|transceiver|Equal0~1_combout\);

-- Location: LCCOMB_X80_Y69_N16
\rs232|transceiver|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|Equal0~0_combout\ = (\rs232|transceiver|enable16_counter\(0)) # ((\rs232|transceiver|enable16_counter\(3)) # ((\rs232|transceiver|enable16_counter\(2)) # (\rs232|transceiver|enable16_counter\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs232|transceiver|enable16_counter\(0),
	datab => \rs232|transceiver|enable16_counter\(3),
	datac => \rs232|transceiver|enable16_counter\(2),
	datad => \rs232|transceiver|enable16_counter\(1),
	combout => \rs232|transceiver|Equal0~0_combout\);

-- Location: LCCOMB_X80_Y69_N20
\rs232|transceiver|Equal0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|Equal0~4_combout\ = (\rs232|transceiver|Equal0~3_combout\) # ((\rs232|transceiver|Equal0~2_combout\) # ((\rs232|transceiver|Equal0~1_combout\) # (\rs232|transceiver|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs232|transceiver|Equal0~3_combout\,
	datab => \rs232|transceiver|Equal0~2_combout\,
	datac => \rs232|transceiver|Equal0~1_combout\,
	datad => \rs232|transceiver|Equal0~0_combout\,
	combout => \rs232|transceiver|Equal0~4_combout\);

-- Location: LCCOMB_X77_Y69_N12
\rs232|transceiver|rx_count16~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|rx_count16~3_combout\ = (\KEY[1]~input_o\ & ((!\rs232|transceiver|rx_count16\(0)) # (!\rs232|transceiver|rx_busy~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101000101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[1]~input_o\,
	datab => \rs232|transceiver|rx_busy~q\,
	datac => \rs232|transceiver|rx_count16\(0),
	combout => \rs232|transceiver|rx_count16~3_combout\);

-- Location: LCCOMB_X77_Y69_N8
\rs232|transceiver|rx_count16[0]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|rx_count16[0]~4_combout\ = ((!\rs232|transceiver|Equal0~4_combout\ & ((\rs232|transceiver|rx_busy~q\) # (!\rs232|transceiver|uart_rx2~q\)))) # (!\KEY[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111101010111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[1]~input_o\,
	datab => \rs232|transceiver|uart_rx2~q\,
	datac => \rs232|transceiver|Equal0~4_combout\,
	datad => \rs232|transceiver|rx_busy~q\,
	combout => \rs232|transceiver|rx_count16[0]~4_combout\);

-- Location: FF_X77_Y69_N13
\rs232|transceiver|rx_count16[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \rs232|transceiver|rx_count16~3_combout\,
	ena => \rs232|transceiver|rx_count16[0]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|rx_count16\(0));

-- Location: LCCOMB_X77_Y69_N18
\rs232|transceiver|rx_count16~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|rx_count16~5_combout\ = (\KEY[1]~input_o\ & ((\rs232|transceiver|rx_count16\(1) $ (\rs232|transceiver|rx_count16\(0))) # (!\rs232|transceiver|rx_busy~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[1]~input_o\,
	datab => \rs232|transceiver|rx_busy~q\,
	datac => \rs232|transceiver|rx_count16\(1),
	datad => \rs232|transceiver|rx_count16\(0),
	combout => \rs232|transceiver|rx_count16~5_combout\);

-- Location: FF_X77_Y69_N19
\rs232|transceiver|rx_count16[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \rs232|transceiver|rx_count16~5_combout\,
	ena => \rs232|transceiver|rx_count16[0]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|rx_count16\(1));

-- Location: LCCOMB_X76_Y69_N8
\rs232|transceiver|Add2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|Add2~0_combout\ = (\rs232|transceiver|rx_count16\(1) & \rs232|transceiver|rx_count16\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rs232|transceiver|rx_count16\(1),
	datac => \rs232|transceiver|rx_count16\(0),
	combout => \rs232|transceiver|Add2~0_combout\);

-- Location: LCCOMB_X77_Y69_N28
\rs232|transceiver|rx_count16~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|rx_count16~7_combout\ = (\KEY[1]~input_o\ & ((\rs232|transceiver|rx_count16\(2) $ (\rs232|transceiver|Add2~0_combout\)) # (!\rs232|transceiver|rx_busy~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[1]~input_o\,
	datab => \rs232|transceiver|rx_busy~q\,
	datac => \rs232|transceiver|rx_count16\(2),
	datad => \rs232|transceiver|Add2~0_combout\,
	combout => \rs232|transceiver|rx_count16~7_combout\);

-- Location: FF_X77_Y69_N29
\rs232|transceiver|rx_count16[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \rs232|transceiver|rx_count16~7_combout\,
	ena => \rs232|transceiver|rx_count16[0]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|rx_count16\(2));

-- Location: LCCOMB_X80_Y69_N12
\rs232|transceiver|rx_count16[0]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|rx_count16[0]~2_combout\ = (\rs232|transceiver|rx_busy~q\ & \KEY[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rs232|transceiver|rx_busy~q\,
	datad => \KEY[1]~input_o\,
	combout => \rs232|transceiver|rx_count16[0]~2_combout\);

-- Location: LCCOMB_X77_Y69_N6
\rs232|transceiver|rx_count16~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|rx_count16~6_combout\ = (\rs232|transceiver|rx_count16[0]~2_combout\ & (\rs232|transceiver|rx_count16\(3) $ (((\rs232|transceiver|Add2~0_combout\ & \rs232|transceiver|rx_count16\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs232|transceiver|Add2~0_combout\,
	datab => \rs232|transceiver|rx_count16\(2),
	datac => \rs232|transceiver|rx_count16\(3),
	datad => \rs232|transceiver|rx_count16[0]~2_combout\,
	combout => \rs232|transceiver|rx_count16~6_combout\);

-- Location: FF_X77_Y69_N7
\rs232|transceiver|rx_count16[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \rs232|transceiver|rx_count16~6_combout\,
	ena => \rs232|transceiver|rx_count16[0]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|rx_count16\(3));

-- Location: LCCOMB_X77_Y69_N0
\rs232|transceiver|Equal1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|Equal1~0_combout\ = (\rs232|transceiver|rx_count16\(0)) # ((\rs232|transceiver|rx_count16\(1)) # ((\rs232|transceiver|rx_count16\(3)) # (\rs232|transceiver|rx_count16\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs232|transceiver|rx_count16\(0),
	datab => \rs232|transceiver|rx_count16\(1),
	datac => \rs232|transceiver|rx_count16\(3),
	datad => \rs232|transceiver|rx_count16\(2),
	combout => \rs232|transceiver|Equal1~0_combout\);

-- Location: LCCOMB_X80_Y69_N18
\rs232|transceiver|rx_busy~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|rx_busy~0_combout\ = (!\rs232|transceiver|Equal0~4_combout\ & !\rs232|transceiver|Equal1~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rs232|transceiver|Equal0~4_combout\,
	datad => \rs232|transceiver|Equal1~0_combout\,
	combout => \rs232|transceiver|rx_busy~0_combout\);

-- Location: LCCOMB_X77_Y69_N16
\rs232|transceiver|rx_bitcount~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|rx_bitcount~5_combout\ = (\rs232|transceiver|rx_count16[0]~2_combout\ & (\rs232|transceiver|rx_bitcount\(2) $ (((\rs232|transceiver|rx_bitcount\(0) & \rs232|transceiver|rx_bitcount\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs232|transceiver|rx_bitcount\(0),
	datab => \rs232|transceiver|rx_bitcount\(1),
	datac => \rs232|transceiver|rx_bitcount\(2),
	datad => \rs232|transceiver|rx_count16[0]~2_combout\,
	combout => \rs232|transceiver|rx_bitcount~5_combout\);

-- Location: LCCOMB_X77_Y69_N10
\rs232|transceiver|rx_bitcount[0]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|rx_bitcount[0]~3_combout\ = (\rs232|transceiver|Equal0~4_combout\) # ((\rs232|transceiver|rx_busy~q\ & (\rs232|transceiver|Equal1~0_combout\)) # (!\rs232|transceiver|rx_busy~q\ & ((\rs232|transceiver|uart_rx2~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs232|transceiver|Equal0~4_combout\,
	datab => \rs232|transceiver|Equal1~0_combout\,
	datac => \rs232|transceiver|uart_rx2~q\,
	datad => \rs232|transceiver|rx_busy~q\,
	combout => \rs232|transceiver|rx_bitcount[0]~3_combout\);

-- Location: LCCOMB_X77_Y69_N20
\rs232|transceiver|rx_bitcount[0]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|rx_bitcount[0]~4_combout\ = (!\rs232|transceiver|rx_bitcount[0]~3_combout\) # (!\KEY[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \KEY[1]~input_o\,
	datad => \rs232|transceiver|rx_bitcount[0]~3_combout\,
	combout => \rs232|transceiver|rx_bitcount[0]~4_combout\);

-- Location: FF_X77_Y69_N17
\rs232|transceiver|rx_bitcount[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \rs232|transceiver|rx_bitcount~5_combout\,
	ena => \rs232|transceiver|rx_bitcount[0]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|rx_bitcount\(2));

-- Location: LCCOMB_X77_Y69_N2
\rs232|transceiver|Add3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|Add3~0_combout\ = \rs232|transceiver|rx_bitcount\(3) $ (((\rs232|transceiver|rx_bitcount\(1) & (\rs232|transceiver|rx_bitcount\(0) & \rs232|transceiver|rx_bitcount\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs232|transceiver|rx_bitcount\(1),
	datab => \rs232|transceiver|rx_bitcount\(3),
	datac => \rs232|transceiver|rx_bitcount\(0),
	datad => \rs232|transceiver|rx_bitcount\(2),
	combout => \rs232|transceiver|Add3~0_combout\);

-- Location: LCCOMB_X77_Y69_N4
\rs232|transceiver|rx_bitcount~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|rx_bitcount~7_combout\ = (\KEY[1]~input_o\ & (\rs232|transceiver|rx_busy~q\ & \rs232|transceiver|Add3~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[1]~input_o\,
	datab => \rs232|transceiver|rx_busy~q\,
	datad => \rs232|transceiver|Add3~0_combout\,
	combout => \rs232|transceiver|rx_bitcount~7_combout\);

-- Location: FF_X77_Y69_N5
\rs232|transceiver|rx_bitcount[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \rs232|transceiver|rx_bitcount~7_combout\,
	ena => \rs232|transceiver|rx_bitcount[0]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|rx_bitcount\(3));

-- Location: LCCOMB_X77_Y69_N22
\rs232|transceiver|Equal2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|Equal2~0_combout\ = (!\rs232|transceiver|rx_bitcount\(1) & (!\rs232|transceiver|rx_bitcount\(3) & (!\rs232|transceiver|rx_bitcount\(0) & !\rs232|transceiver|rx_bitcount\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs232|transceiver|rx_bitcount\(1),
	datab => \rs232|transceiver|rx_bitcount\(3),
	datac => \rs232|transceiver|rx_bitcount\(0),
	datad => \rs232|transceiver|rx_bitcount\(2),
	combout => \rs232|transceiver|Equal2~0_combout\);

-- Location: LCCOMB_X80_Y69_N6
\rs232|transceiver|rx_busy~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|rx_busy~1_combout\ = (!\rs232|transceiver|Equal0~4_combout\ & (!\rs232|transceiver|uart_rx2~q\ & ((\rs232|transceiver|Equal2~0_combout\) # (!\rs232|transceiver|rx_busy~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs232|transceiver|Equal2~0_combout\,
	datab => \rs232|transceiver|rx_busy~q\,
	datac => \rs232|transceiver|Equal0~4_combout\,
	datad => \rs232|transceiver|uart_rx2~q\,
	combout => \rs232|transceiver|rx_busy~1_combout\);

-- Location: LCCOMB_X84_Y69_N24
\rs232|transceiver|rx_busy~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|rx_busy~2_combout\ = (\rs232|transceiver|rx_busy~1_combout\) # ((\rs232|transceiver|rx_busy~q\ & ((\rs232|transceiver|rx_reg[0]~0_combout\) # (!\rs232|transceiver|rx_busy~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs232|transceiver|rx_reg[0]~0_combout\,
	datab => \rs232|transceiver|rx_busy~0_combout\,
	datac => \rs232|transceiver|rx_busy~q\,
	datad => \rs232|transceiver|rx_busy~1_combout\,
	combout => \rs232|transceiver|rx_busy~2_combout\);

-- Location: FF_X84_Y69_N25
\rs232|transceiver|rx_busy\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \rs232|transceiver|rx_busy~2_combout\,
	sclr => \ALT_INV_KEY[1]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|rx_busy~q\);

-- Location: LCCOMB_X77_Y69_N30
\rs232|transceiver|rx_bitcount~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|rx_bitcount~6_combout\ = (\KEY[1]~input_o\ & (\rs232|transceiver|rx_busy~q\ & !\rs232|transceiver|rx_bitcount\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[1]~input_o\,
	datab => \rs232|transceiver|rx_busy~q\,
	datac => \rs232|transceiver|rx_bitcount\(0),
	combout => \rs232|transceiver|rx_bitcount~6_combout\);

-- Location: FF_X77_Y69_N31
\rs232|transceiver|rx_bitcount[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \rs232|transceiver|rx_bitcount~6_combout\,
	ena => \rs232|transceiver|rx_bitcount[0]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|rx_bitcount\(0));

-- Location: LCCOMB_X77_Y69_N26
\rs232|transceiver|rx_bitcount~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|rx_bitcount~2_combout\ = (\KEY[1]~input_o\ & (\rs232|transceiver|rx_busy~q\ & (\rs232|transceiver|rx_bitcount\(0) $ (\rs232|transceiver|rx_bitcount\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs232|transceiver|rx_bitcount\(0),
	datab => \KEY[1]~input_o\,
	datac => \rs232|transceiver|rx_bitcount\(1),
	datad => \rs232|transceiver|rx_busy~q\,
	combout => \rs232|transceiver|rx_bitcount~2_combout\);

-- Location: FF_X77_Y69_N27
\rs232|transceiver|rx_bitcount[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \rs232|transceiver|rx_bitcount~2_combout\,
	ena => \rs232|transceiver|rx_bitcount[0]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|rx_bitcount\(1));

-- Location: LCCOMB_X77_Y69_N24
\rs232|transceiver|rx_reg[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|rx_reg[0]~0_combout\ = (\rs232|transceiver|rx_bitcount\(1)) # ((\rs232|transceiver|rx_bitcount\(2)) # (\rs232|transceiver|rx_bitcount\(3) $ (\rs232|transceiver|rx_bitcount\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs232|transceiver|rx_bitcount\(1),
	datab => \rs232|transceiver|rx_bitcount\(3),
	datac => \rs232|transceiver|rx_bitcount\(0),
	datad => \rs232|transceiver|rx_bitcount\(2),
	combout => \rs232|transceiver|rx_reg[0]~0_combout\);

-- Location: LCCOMB_X82_Y69_N14
\rs232|transceiver|rx_reg[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|rx_reg[0]~1_combout\ = (\rs232|transceiver|rx_reg[0]~0_combout\ & (!\rs232|transceiver|Equal1~0_combout\ & (!\rs232|transceiver|Equal0~4_combout\ & \rs232|transceiver|rx_count16[0]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs232|transceiver|rx_reg[0]~0_combout\,
	datab => \rs232|transceiver|Equal1~0_combout\,
	datac => \rs232|transceiver|Equal0~4_combout\,
	datad => \rs232|transceiver|rx_count16[0]~2_combout\,
	combout => \rs232|transceiver|rx_reg[0]~1_combout\);

-- Location: FF_X82_Y69_N23
\rs232|transceiver|rx_reg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \rs232|transceiver|rx_reg[7]~feeder_combout\,
	ena => \rs232|transceiver|rx_reg[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|rx_reg\(7));

-- Location: LCCOMB_X82_Y69_N28
\rs232|transceiver|rx_reg[6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|rx_reg[6]~feeder_combout\ = \rs232|transceiver|rx_reg\(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rs232|transceiver|rx_reg\(7),
	combout => \rs232|transceiver|rx_reg[6]~feeder_combout\);

-- Location: FF_X82_Y69_N29
\rs232|transceiver|rx_reg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \rs232|transceiver|rx_reg[6]~feeder_combout\,
	ena => \rs232|transceiver|rx_reg[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|rx_reg\(6));

-- Location: LCCOMB_X82_Y69_N26
\rs232|transceiver|rx_reg[5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|rx_reg[5]~feeder_combout\ = \rs232|transceiver|rx_reg\(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rs232|transceiver|rx_reg\(6),
	combout => \rs232|transceiver|rx_reg[5]~feeder_combout\);

-- Location: FF_X82_Y69_N27
\rs232|transceiver|rx_reg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \rs232|transceiver|rx_reg[5]~feeder_combout\,
	ena => \rs232|transceiver|rx_reg[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|rx_reg\(5));

-- Location: FF_X83_Y69_N31
\rs232|transceiver|rx_reg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \rs232|transceiver|rx_reg\(5),
	sload => VCC,
	ena => \rs232|transceiver|rx_reg[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|rx_reg\(4));

-- Location: FF_X83_Y69_N9
\rs232|transceiver|rx_reg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \rs232|transceiver|rx_reg\(4),
	sload => VCC,
	ena => \rs232|transceiver|rx_reg[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|rx_reg\(3));

-- Location: FF_X83_Y69_N23
\rs232|transceiver|rx_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \rs232|transceiver|rx_reg\(3),
	sload => VCC,
	ena => \rs232|transceiver|rx_reg[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|rx_reg\(2));

-- Location: FF_X83_Y69_N5
\rs232|transceiver|rx_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \rs232|transceiver|rx_reg\(2),
	sload => VCC,
	ena => \rs232|transceiver|rx_reg[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|rx_reg\(1));

-- Location: FF_X83_Y69_N7
\rs232|transceiver|rx_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \rs232|transceiver|rx_reg\(1),
	sload => VCC,
	ena => \rs232|transceiver|rx_reg[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|rx_reg\(0));

-- Location: LCCOMB_X77_Y69_N14
\rs232|transceiver|Equal3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|Equal3~0_combout\ = (\rs232|transceiver|rx_bitcount\(1)) # (((\rs232|transceiver|rx_bitcount\(2)) # (!\rs232|transceiver|rx_bitcount\(0))) # (!\rs232|transceiver|rx_bitcount\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs232|transceiver|rx_bitcount\(1),
	datab => \rs232|transceiver|rx_bitcount\(3),
	datac => \rs232|transceiver|rx_bitcount\(0),
	datad => \rs232|transceiver|rx_bitcount\(2),
	combout => \rs232|transceiver|Equal3~0_combout\);

-- Location: LCCOMB_X80_Y69_N0
\rs232|transceiver|rx_data[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|rx_data[0]~0_combout\ = (\rs232|transceiver|rx_count16[0]~2_combout\ & (\rs232|transceiver|uart_rx2~q\ & (!\rs232|transceiver|Equal3~0_combout\ & \rs232|transceiver|rx_busy~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs232|transceiver|rx_count16[0]~2_combout\,
	datab => \rs232|transceiver|uart_rx2~q\,
	datac => \rs232|transceiver|Equal3~0_combout\,
	datad => \rs232|transceiver|rx_busy~0_combout\,
	combout => \rs232|transceiver|rx_data[0]~0_combout\);

-- Location: FF_X80_Y69_N29
\rs232|transceiver|rx_data[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \rs232|transceiver|rx_reg\(0),
	sload => VCC,
	ena => \rs232|transceiver|rx_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|rx_data\(0));

-- Location: LCCOMB_X80_Y69_N28
\rs232|csr_do~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|csr_do~0_combout\ = (\rs232|transceiver|rx_data\(0) & \KEY[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rs232|transceiver|rx_data\(0),
	datad => \KEY[1]~input_o\,
	combout => \rs232|csr_do~0_combout\);

-- Location: DDIOOUTCELL_X69_Y73_N18
\rs232|csr_do[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \rs232|csr_do~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|csr_do\(0));

-- Location: FF_X83_Y69_N25
\rs232|transceiver|rx_data[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \rs232|transceiver|rx_reg\(1),
	sload => VCC,
	ena => \rs232|transceiver|rx_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|rx_data\(1));

-- Location: LCCOMB_X83_Y69_N24
\rs232|csr_do~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|csr_do~1_combout\ = (\KEY[1]~input_o\ & \rs232|transceiver|rx_data\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[1]~input_o\,
	datac => \rs232|transceiver|rx_data\(1),
	combout => \rs232|csr_do~1_combout\);

-- Location: DDIOOUTCELL_X94_Y73_N4
\rs232|csr_do[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \rs232|csr_do~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|csr_do\(1));

-- Location: FF_X83_Y69_N27
\rs232|transceiver|rx_data[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \rs232|transceiver|rx_reg\(2),
	sload => VCC,
	ena => \rs232|transceiver|rx_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|rx_data\(2));

-- Location: LCCOMB_X83_Y69_N26
\rs232|csr_do~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|csr_do~2_combout\ = (\KEY[1]~input_o\ & \rs232|transceiver|rx_data\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[1]~input_o\,
	datac => \rs232|transceiver|rx_data\(2),
	combout => \rs232|csr_do~2_combout\);

-- Location: DDIOOUTCELL_X94_Y73_N11
\rs232|csr_do[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \rs232|csr_do~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|csr_do\(2));

-- Location: FF_X83_Y69_N17
\rs232|transceiver|rx_data[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \rs232|transceiver|rx_reg\(3),
	sload => VCC,
	ena => \rs232|transceiver|rx_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|rx_data\(3));

-- Location: LCCOMB_X83_Y69_N16
\rs232|csr_do~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|csr_do~3_combout\ = (\KEY[1]~input_o\ & \rs232|transceiver|rx_data\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[1]~input_o\,
	datac => \rs232|transceiver|rx_data\(3),
	combout => \rs232|csr_do~3_combout\);

-- Location: DDIOOUTCELL_X107_Y73_N18
\rs232|csr_do[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \rs232|csr_do~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|csr_do\(3));

-- Location: FF_X83_Y69_N3
\rs232|transceiver|rx_data[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \rs232|transceiver|rx_reg\(4),
	sload => VCC,
	ena => \rs232|transceiver|rx_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|rx_data\(4));

-- Location: LCCOMB_X83_Y69_N2
\rs232|csr_do~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|csr_do~4_combout\ = (\KEY[1]~input_o\ & \rs232|transceiver|rx_data\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[1]~input_o\,
	datac => \rs232|transceiver|rx_data\(4),
	combout => \rs232|csr_do~4_combout\);

-- Location: DDIOOUTCELL_X87_Y73_N18
\rs232|csr_do[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \rs232|csr_do~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|csr_do\(4));

-- Location: FF_X83_Y69_N13
\rs232|transceiver|rx_data[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \rs232|transceiver|rx_reg\(5),
	sload => VCC,
	ena => \rs232|transceiver|rx_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|rx_data\(5));

-- Location: LCCOMB_X83_Y69_N12
\rs232|csr_do~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|csr_do~5_combout\ = (\KEY[1]~input_o\ & \rs232|transceiver|rx_data\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[1]~input_o\,
	datac => \rs232|transceiver|rx_data\(5),
	combout => \rs232|csr_do~5_combout\);

-- Location: DDIOOUTCELL_X87_Y73_N11
\rs232|csr_do[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \rs232|csr_do~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|csr_do\(5));

-- Location: FF_X80_Y69_N3
\rs232|transceiver|rx_data[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \rs232|transceiver|rx_reg\(6),
	sload => VCC,
	ena => \rs232|transceiver|rx_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|rx_data\(6));

-- Location: LCCOMB_X80_Y69_N2
\rs232|csr_do~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|csr_do~6_combout\ = (\rs232|transceiver|rx_data\(6) & \KEY[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rs232|transceiver|rx_data\(6),
	datad => \KEY[1]~input_o\,
	combout => \rs232|csr_do~6_combout\);

-- Location: DDIOOUTCELL_X72_Y73_N11
\rs232|csr_do[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \rs232|csr_do~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|csr_do\(6));

-- Location: FF_X80_Y69_N9
\rs232|transceiver|rx_data[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \rs232|transceiver|rx_reg\(7),
	sload => VCC,
	ena => \rs232|transceiver|rx_data[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|rx_data\(7));

-- Location: LCCOMB_X80_Y69_N8
\rs232|csr_do~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|csr_do~7_combout\ = (\rs232|transceiver|rx_data\(7) & \KEY[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rs232|transceiver|rx_data\(7),
	datad => \KEY[1]~input_o\,
	combout => \rs232|csr_do~7_combout\);

-- Location: DDIOOUTCELL_X72_Y73_N4
\rs232|csr_do[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \rs232|csr_do~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|csr_do\(7));

-- Location: IOIBUF_X115_Y40_N8
\KEY[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(0),
	o => \KEY[0]~input_o\);

-- Location: LCCOMB_X81_Y69_N22
\rs232|transceiver|tx_bitcount~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|tx_bitcount~0_combout\ = (\KEY[0]~input_o\ & !\rs232|transceiver|tx_bitcount\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \KEY[0]~input_o\,
	datac => \rs232|transceiver|tx_bitcount\(0),
	combout => \rs232|transceiver|tx_bitcount~0_combout\);

-- Location: LCCOMB_X81_Y69_N10
\rs232|transceiver|tx_count16~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|tx_count16~0_combout\ = (!\rs232|transceiver|tx_count16\(0)) # (!\KEY[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \KEY[0]~input_o\,
	datac => \rs232|transceiver|tx_count16\(0),
	combout => \rs232|transceiver|tx_count16~0_combout\);

-- Location: LCCOMB_X81_Y69_N24
\rs232|transceiver|Add5~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|Add5~2_combout\ = \rs232|transceiver|tx_bitcount\(2) $ (((\rs232|transceiver|tx_bitcount\(0) & \rs232|transceiver|tx_bitcount\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs232|transceiver|tx_bitcount\(0),
	datac => \rs232|transceiver|tx_bitcount\(2),
	datad => \rs232|transceiver|tx_bitcount\(1),
	combout => \rs232|transceiver|Add5~2_combout\);

-- Location: FF_X81_Y69_N25
\rs232|transceiver|tx_bitcount[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \rs232|transceiver|Add5~2_combout\,
	sclr => \ALT_INV_KEY[0]~input_o\,
	ena => \rs232|transceiver|tx_reg[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|tx_bitcount\(2));

-- Location: LCCOMB_X81_Y69_N20
\rs232|transceiver|Add5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|Add5~0_combout\ = \rs232|transceiver|tx_bitcount\(3) $ (((\rs232|transceiver|tx_bitcount\(0) & (\rs232|transceiver|tx_bitcount\(2) & \rs232|transceiver|tx_bitcount\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs232|transceiver|tx_bitcount\(0),
	datab => \rs232|transceiver|tx_bitcount\(2),
	datac => \rs232|transceiver|tx_bitcount\(3),
	datad => \rs232|transceiver|tx_bitcount\(1),
	combout => \rs232|transceiver|Add5~0_combout\);

-- Location: FF_X81_Y69_N21
\rs232|transceiver|tx_bitcount[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \rs232|transceiver|Add5~0_combout\,
	sclr => \ALT_INV_KEY[0]~input_o\,
	ena => \rs232|transceiver|tx_reg[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|tx_bitcount\(3));

-- Location: LCCOMB_X81_Y69_N12
\rs232|transceiver|Equal6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|Equal6~0_combout\ = (!\rs232|transceiver|tx_bitcount\(1) & (\rs232|transceiver|tx_bitcount\(3) & (\rs232|transceiver|tx_bitcount\(0) & !\rs232|transceiver|tx_bitcount\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs232|transceiver|tx_bitcount\(1),
	datab => \rs232|transceiver|tx_bitcount\(3),
	datac => \rs232|transceiver|tx_bitcount\(0),
	datad => \rs232|transceiver|tx_bitcount\(2),
	combout => \rs232|transceiver|Equal6~0_combout\);

-- Location: LCCOMB_X82_Y69_N12
\rs232|transceiver|tx_busy~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|tx_busy~0_combout\ = (\rs232|transceiver|tx_busy~q\ & ((\rs232|transceiver|Equal0~4_combout\) # ((!\rs232|transceiver|Equal6~0_combout\) # (!\rs232|transceiver|tx_reg~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs232|transceiver|Equal0~4_combout\,
	datab => \rs232|transceiver|tx_reg~0_combout\,
	datac => \rs232|transceiver|tx_busy~q\,
	datad => \rs232|transceiver|Equal6~0_combout\,
	combout => \rs232|transceiver|tx_busy~0_combout\);

-- Location: FF_X82_Y69_N13
\rs232|transceiver|tx_busy\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \rs232|transceiver|tx_busy~0_combout\,
	asdata => VCC,
	sclr => \ALT_INV_KEY[1]~input_o\,
	sload => \ALT_INV_KEY[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|tx_busy~q\);

-- Location: LCCOMB_X82_Y69_N24
\rs232|transceiver|tx_count16[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|tx_count16[0]~1_combout\ = (\KEY[1]~input_o\ & (((\rs232|transceiver|tx_busy~q\ & !\rs232|transceiver|Equal0~4_combout\)) # (!\KEY[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011101100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs232|transceiver|tx_busy~q\,
	datab => \KEY[0]~input_o\,
	datac => \rs232|transceiver|Equal0~4_combout\,
	datad => \KEY[1]~input_o\,
	combout => \rs232|transceiver|tx_count16[0]~1_combout\);

-- Location: FF_X81_Y69_N11
\rs232|transceiver|tx_count16[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \rs232|transceiver|tx_count16~0_combout\,
	ena => \rs232|transceiver|tx_count16[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|tx_count16\(0));

-- Location: LCCOMB_X81_Y69_N14
\rs232|transceiver|Add4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|Add4~0_combout\ = \rs232|transceiver|tx_count16\(1) $ (\rs232|transceiver|tx_count16\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rs232|transceiver|tx_count16\(1),
	datad => \rs232|transceiver|tx_count16\(0),
	combout => \rs232|transceiver|Add4~0_combout\);

-- Location: FF_X81_Y69_N15
\rs232|transceiver|tx_count16[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \rs232|transceiver|Add4~0_combout\,
	sclr => \ALT_INV_KEY[0]~input_o\,
	ena => \rs232|transceiver|tx_count16[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|tx_count16\(1));

-- Location: LCCOMB_X81_Y69_N28
\rs232|transceiver|Add4~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|Add4~1_combout\ = \rs232|transceiver|tx_count16\(2) $ (((\rs232|transceiver|tx_count16\(0) & \rs232|transceiver|tx_count16\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs232|transceiver|tx_count16\(0),
	datab => \rs232|transceiver|tx_count16\(1),
	datac => \rs232|transceiver|tx_count16\(2),
	combout => \rs232|transceiver|Add4~1_combout\);

-- Location: FF_X81_Y69_N29
\rs232|transceiver|tx_count16[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \rs232|transceiver|Add4~1_combout\,
	sclr => \ALT_INV_KEY[0]~input_o\,
	ena => \rs232|transceiver|tx_count16[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|tx_count16\(2));

-- Location: LCCOMB_X81_Y69_N30
\rs232|transceiver|Add4~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|Add4~2_combout\ = \rs232|transceiver|tx_count16\(3) $ (((\rs232|transceiver|tx_count16\(0) & (\rs232|transceiver|tx_count16\(1) & \rs232|transceiver|tx_count16\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs232|transceiver|tx_count16\(0),
	datab => \rs232|transceiver|tx_count16\(1),
	datac => \rs232|transceiver|tx_count16\(3),
	datad => \rs232|transceiver|tx_count16\(2),
	combout => \rs232|transceiver|Add4~2_combout\);

-- Location: FF_X81_Y69_N31
\rs232|transceiver|tx_count16[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \rs232|transceiver|Add4~2_combout\,
	sclr => \ALT_INV_KEY[0]~input_o\,
	ena => \rs232|transceiver|tx_count16[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|tx_count16\(3));

-- Location: LCCOMB_X81_Y69_N8
\rs232|transceiver|tx_reg~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|tx_reg~0_combout\ = (!\rs232|transceiver|tx_count16\(3) & (!\rs232|transceiver|tx_count16\(2) & (!\rs232|transceiver|tx_count16\(1) & !\rs232|transceiver|tx_count16\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs232|transceiver|tx_count16\(3),
	datab => \rs232|transceiver|tx_count16\(2),
	datac => \rs232|transceiver|tx_count16\(1),
	datad => \rs232|transceiver|tx_count16\(0),
	combout => \rs232|transceiver|tx_reg~0_combout\);

-- Location: LCCOMB_X82_Y69_N16
\rs232|transceiver|tx_reg[0]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|tx_reg[0]~4_combout\ = (\KEY[1]~input_o\ & ((\rs232|transceiver|tx_busy~q\) # (!\KEY[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs232|transceiver|tx_busy~q\,
	datac => \KEY[0]~input_o\,
	datad => \KEY[1]~input_o\,
	combout => \rs232|transceiver|tx_reg[0]~4_combout\);

-- Location: LCCOMB_X82_Y69_N6
\rs232|transceiver|tx_reg[0]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|tx_reg[0]~5_combout\ = (\rs232|transceiver|tx_reg[0]~4_combout\ & (((!\rs232|transceiver|Equal0~4_combout\ & \rs232|transceiver|tx_reg~0_combout\)) # (!\KEY[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs232|transceiver|Equal0~4_combout\,
	datab => \rs232|transceiver|tx_reg~0_combout\,
	datac => \KEY[0]~input_o\,
	datad => \rs232|transceiver|tx_reg[0]~4_combout\,
	combout => \rs232|transceiver|tx_reg[0]~5_combout\);

-- Location: FF_X81_Y69_N23
\rs232|transceiver|tx_bitcount[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \rs232|transceiver|tx_bitcount~0_combout\,
	ena => \rs232|transceiver|tx_reg[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|tx_bitcount\(0));

-- Location: LCCOMB_X81_Y69_N6
\rs232|transceiver|Add5~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|Add5~1_combout\ = \rs232|transceiver|tx_bitcount\(0) $ (\rs232|transceiver|tx_bitcount\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs232|transceiver|tx_bitcount\(0),
	datac => \rs232|transceiver|tx_bitcount\(1),
	combout => \rs232|transceiver|Add5~1_combout\);

-- Location: FF_X81_Y69_N7
\rs232|transceiver|tx_bitcount[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \rs232|transceiver|Add5~1_combout\,
	sclr => \ALT_INV_KEY[0]~input_o\,
	ena => \rs232|transceiver|tx_reg[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|tx_bitcount\(1));

-- Location: IOIBUF_X115_Y17_N1
\SW[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(0),
	o => \SW[0]~input_o\);

-- Location: IOIBUF_X115_Y14_N1
\SW[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(1),
	o => \SW[1]~input_o\);

-- Location: IOIBUF_X115_Y18_N8
\SW[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(4),
	o => \SW[4]~input_o\);

-- Location: IOIBUF_X115_Y11_N8
\SW[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(5),
	o => \SW[5]~input_o\);

-- Location: IOIBUF_X115_Y10_N1
\SW[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(6),
	o => \SW[6]~input_o\);

-- Location: LCCOMB_X80_Y69_N26
\rs232|transceiver|Equal5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|Equal5~0_combout\ = (\rs232|transceiver|tx_bitcount\(3) & (!\rs232|transceiver|tx_bitcount\(2) & !\rs232|transceiver|tx_bitcount\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs232|transceiver|tx_bitcount\(3),
	datab => \rs232|transceiver|tx_bitcount\(2),
	datad => \rs232|transceiver|tx_bitcount\(1),
	combout => \rs232|transceiver|Equal5~0_combout\);

-- Location: LCCOMB_X80_Y69_N14
\rs232|transceiver|tx_reg~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|tx_reg~1_combout\ = (\rs232|transceiver|tx_busy~q\ & (\rs232|transceiver|tx_reg~0_combout\ & !\rs232|transceiver|Equal0~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs232|transceiver|tx_busy~q\,
	datac => \rs232|transceiver|tx_reg~0_combout\,
	datad => \rs232|transceiver|Equal0~4_combout\,
	combout => \rs232|transceiver|tx_reg~1_combout\);

-- Location: LCCOMB_X81_Y65_N4
\rs232|transceiver|tx_reg~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|tx_reg~12_combout\ = (\rs232|transceiver|tx_reg\(7) & ((\rs232|transceiver|Equal5~0_combout\) # (!\rs232|transceiver|tx_reg~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rs232|transceiver|Equal5~0_combout\,
	datac => \rs232|transceiver|tx_reg\(7),
	datad => \rs232|transceiver|tx_reg~1_combout\,
	combout => \rs232|transceiver|tx_reg~12_combout\);

-- Location: IOIBUF_X115_Y15_N1
\SW[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(7),
	o => \SW[7]~input_o\);

-- Location: FF_X81_Y65_N5
\rs232|transceiver|tx_reg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \rs232|transceiver|tx_reg~12_combout\,
	asdata => \SW[7]~input_o\,
	sload => \ALT_INV_KEY[0]~input_o\,
	ena => \KEY[1]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|tx_reg\(7));

-- Location: LCCOMB_X81_Y65_N26
\rs232|transceiver|tx_reg~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|tx_reg~11_combout\ = (\KEY[0]~input_o\ & ((\rs232|transceiver|tx_reg\(7)))) # (!\KEY[0]~input_o\ & (\SW[6]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[6]~input_o\,
	datac => \rs232|transceiver|tx_reg\(7),
	datad => \KEY[0]~input_o\,
	combout => \rs232|transceiver|tx_reg~11_combout\);

-- Location: LCCOMB_X80_Y69_N10
\rs232|transceiver|tx_reg[0]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|tx_reg[0]~3_combout\ = (\KEY[1]~input_o\ & (((!\rs232|transceiver|Equal5~0_combout\ & \rs232|transceiver|tx_reg~1_combout\)) # (!\KEY[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs232|transceiver|Equal5~0_combout\,
	datab => \KEY[0]~input_o\,
	datac => \rs232|transceiver|tx_reg~1_combout\,
	datad => \KEY[1]~input_o\,
	combout => \rs232|transceiver|tx_reg[0]~3_combout\);

-- Location: FF_X81_Y65_N27
\rs232|transceiver|tx_reg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \rs232|transceiver|tx_reg~11_combout\,
	ena => \rs232|transceiver|tx_reg[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|tx_reg\(6));

-- Location: LCCOMB_X81_Y65_N8
\rs232|transceiver|tx_reg~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|tx_reg~10_combout\ = (\KEY[0]~input_o\ & ((\rs232|transceiver|tx_reg\(6)))) # (!\KEY[0]~input_o\ & (\SW[5]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[5]~input_o\,
	datac => \rs232|transceiver|tx_reg\(6),
	datad => \KEY[0]~input_o\,
	combout => \rs232|transceiver|tx_reg~10_combout\);

-- Location: FF_X81_Y65_N9
\rs232|transceiver|tx_reg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \rs232|transceiver|tx_reg~10_combout\,
	ena => \rs232|transceiver|tx_reg[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|tx_reg\(5));

-- Location: LCCOMB_X81_Y65_N10
\rs232|transceiver|tx_reg~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|tx_reg~9_combout\ = (\KEY[0]~input_o\ & ((\rs232|transceiver|tx_reg\(5)))) # (!\KEY[0]~input_o\ & (\SW[4]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \SW[4]~input_o\,
	datac => \rs232|transceiver|tx_reg\(5),
	datad => \KEY[0]~input_o\,
	combout => \rs232|transceiver|tx_reg~9_combout\);

-- Location: FF_X81_Y65_N11
\rs232|transceiver|tx_reg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \rs232|transceiver|tx_reg~9_combout\,
	ena => \rs232|transceiver|tx_reg[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|tx_reg\(4));

-- Location: IOIBUF_X115_Y13_N8
\SW[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(3),
	o => \SW[3]~input_o\);

-- Location: LCCOMB_X81_Y65_N20
\rs232|transceiver|tx_reg~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|tx_reg~8_combout\ = (\KEY[0]~input_o\ & (\rs232|transceiver|tx_reg\(4))) # (!\KEY[0]~input_o\ & ((\SW[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs232|transceiver|tx_reg\(4),
	datac => \SW[3]~input_o\,
	datad => \KEY[0]~input_o\,
	combout => \rs232|transceiver|tx_reg~8_combout\);

-- Location: FF_X81_Y65_N21
\rs232|transceiver|tx_reg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \rs232|transceiver|tx_reg~8_combout\,
	ena => \rs232|transceiver|tx_reg[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|tx_reg\(3));

-- Location: IOIBUF_X115_Y15_N8
\SW[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(2),
	o => \SW[2]~input_o\);

-- Location: LCCOMB_X81_Y65_N18
\rs232|transceiver|tx_reg~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|tx_reg~7_combout\ = (\KEY[0]~input_o\ & (\rs232|transceiver|tx_reg\(3))) # (!\KEY[0]~input_o\ & ((\SW[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rs232|transceiver|tx_reg\(3),
	datac => \SW[2]~input_o\,
	datad => \KEY[0]~input_o\,
	combout => \rs232|transceiver|tx_reg~7_combout\);

-- Location: FF_X81_Y65_N19
\rs232|transceiver|tx_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \rs232|transceiver|tx_reg~7_combout\,
	ena => \rs232|transceiver|tx_reg[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|tx_reg\(2));

-- Location: LCCOMB_X81_Y65_N30
\rs232|transceiver|tx_reg~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|tx_reg~6_combout\ = (\KEY[0]~input_o\ & ((\rs232|transceiver|tx_reg\(2)))) # (!\KEY[0]~input_o\ & (\SW[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[1]~input_o\,
	datab => \rs232|transceiver|tx_reg\(2),
	datad => \KEY[0]~input_o\,
	combout => \rs232|transceiver|tx_reg~6_combout\);

-- Location: FF_X81_Y65_N31
\rs232|transceiver|tx_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \rs232|transceiver|tx_reg~6_combout\,
	ena => \rs232|transceiver|tx_reg[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|tx_reg\(1));

-- Location: LCCOMB_X81_Y65_N12
\rs232|transceiver|tx_reg~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|tx_reg~2_combout\ = (\KEY[0]~input_o\ & ((\rs232|transceiver|tx_reg\(1)))) # (!\KEY[0]~input_o\ & (\SW[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datac => \rs232|transceiver|tx_reg\(1),
	datad => \KEY[0]~input_o\,
	combout => \rs232|transceiver|tx_reg~2_combout\);

-- Location: FF_X80_Y69_N27
\rs232|transceiver|tx_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \rs232|transceiver|tx_reg~2_combout\,
	sload => VCC,
	ena => \rs232|transceiver|tx_reg[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|tx_reg\(0));

-- Location: LCCOMB_X81_Y69_N16
\rs232|transceiver|uart_tx~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|uart_tx~0_combout\ = (\rs232|transceiver|tx_reg\(0)) # ((!\rs232|transceiver|tx_bitcount\(1) & (\rs232|transceiver|tx_bitcount\(3) & !\rs232|transceiver|tx_bitcount\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rs232|transceiver|tx_bitcount\(1),
	datab => \rs232|transceiver|tx_bitcount\(3),
	datac => \rs232|transceiver|tx_reg\(0),
	datad => \rs232|transceiver|tx_bitcount\(2),
	combout => \rs232|transceiver|uart_tx~0_combout\);

-- Location: FF_X12_Y72_N1
\rs232|transceiver|uart_tx~_Duplicate_1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \rs232|transceiver|uart_tx~1_combout\,
	asdata => VCC,
	sload => \ALT_INV_KEY[1]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|uart_tx~_Duplicate_1_q\);

-- Location: LCCOMB_X12_Y72_N0
\rs232|transceiver|uart_tx~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \rs232|transceiver|uart_tx~1_combout\ = (\KEY[0]~input_o\ & ((\rs232|transceiver|tx_reg~1_combout\ & (\rs232|transceiver|uart_tx~0_combout\)) # (!\rs232|transceiver|tx_reg~1_combout\ & ((\rs232|transceiver|uart_tx~_Duplicate_1_q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[0]~input_o\,
	datab => \rs232|transceiver|uart_tx~0_combout\,
	datac => \rs232|transceiver|uart_tx~_Duplicate_1_q\,
	datad => \rs232|transceiver|tx_reg~1_combout\,
	combout => \rs232|transceiver|uart_tx~1_combout\);

-- Location: DDIOOUTCELL_X13_Y73_N25
\rs232|transceiver|uart_tx\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \rs232|transceiver|uart_tx~1_combout\,
	asdata => VCC,
	sload => \ALT_INV_KEY[1]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rs232|transceiver|uart_tx~q\);

-- Location: IOIBUF_X115_Y42_N15
\KEY[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(2),
	o => \KEY[2]~input_o\);

-- Location: IOIBUF_X115_Y35_N22
\KEY[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(3),
	o => \KEY[3]~input_o\);

-- Location: IOIBUF_X115_Y4_N22
\SW[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(8),
	o => \SW[8]~input_o\);

-- Location: IOIBUF_X115_Y16_N8
\SW[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(9),
	o => \SW[9]~input_o\);

-- Location: IOIBUF_X115_Y4_N15
\SW[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(10),
	o => \SW[10]~input_o\);

-- Location: IOIBUF_X115_Y5_N15
\SW[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(11),
	o => \SW[11]~input_o\);

-- Location: IOIBUF_X115_Y7_N15
\SW[12]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(12),
	o => \SW[12]~input_o\);

-- Location: IOIBUF_X115_Y9_N22
\SW[13]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(13),
	o => \SW[13]~input_o\);

-- Location: IOIBUF_X115_Y10_N8
\SW[14]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(14),
	o => \SW[14]~input_o\);

-- Location: IOIBUF_X115_Y6_N15
\SW[15]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(15),
	o => \SW[15]~input_o\);

-- Location: IOIBUF_X115_Y13_N1
\SW[16]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(16),
	o => \SW[16]~input_o\);

-- Location: IOIBUF_X115_Y14_N8
\SW[17]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(17),
	o => \SW[17]~input_o\);

ww_LEDR(0) <= \LEDR[0]~output_o\;

ww_LEDR(1) <= \LEDR[1]~output_o\;

ww_LEDR(2) <= \LEDR[2]~output_o\;

ww_LEDR(3) <= \LEDR[3]~output_o\;

ww_LEDR(4) <= \LEDR[4]~output_o\;

ww_LEDR(5) <= \LEDR[5]~output_o\;

ww_LEDR(6) <= \LEDR[6]~output_o\;

ww_LEDR(7) <= \LEDR[7]~output_o\;

ww_LEDR(8) <= \LEDR[8]~output_o\;

ww_LEDR(9) <= \LEDR[9]~output_o\;

ww_LEDR(10) <= \LEDR[10]~output_o\;

ww_LEDR(11) <= \LEDR[11]~output_o\;

ww_LEDR(12) <= \LEDR[12]~output_o\;

ww_LEDR(13) <= \LEDR[13]~output_o\;

ww_LEDR(14) <= \LEDR[14]~output_o\;

ww_LEDR(15) <= \LEDR[15]~output_o\;

ww_LEDR(16) <= \LEDR[16]~output_o\;

ww_LEDR(17) <= \LEDR[17]~output_o\;

ww_UART_TXD <= \UART_TXD~output_o\;
END structure;


