
module soc_system (
	button_pio_export,
	cgm_clk,
	dipsw_pio_export,
	f2sdram_only_master_master_reset_reset,
	hex_pio_export,
	hps_0_f2h_cold_rst_req_n,
	hps_0_f2h_dbg_rst_req_n,
	hps_0_f2h_stm_hwevents,
	hps_0_f2h_warm_rst_req_n,
	hps_0_h2f_AWID,
	hps_0_h2f_AWADDR,
	hps_0_h2f_AWLEN,
	hps_0_h2f_AWSIZE,
	hps_0_h2f_AWBURST,
	hps_0_h2f_AWLOCK,
	hps_0_h2f_AWCACHE,
	hps_0_h2f_AWPROT,
	hps_0_h2f_AWVALID,
	hps_0_h2f_AWREADY,
	hps_0_h2f_WID,
	hps_0_h2f_WDATA,
	hps_0_h2f_WSTRB,
	hps_0_h2f_WLAST,
	hps_0_h2f_WVALID,
	hps_0_h2f_WREADY,
	hps_0_h2f_BID,
	hps_0_h2f_BRESP,
	hps_0_h2f_BVALID,
	hps_0_h2f_BREADY,
	hps_0_h2f_ARID,
	hps_0_h2f_ARADDR,
	hps_0_h2f_ARLEN,
	hps_0_h2f_ARSIZE,
	hps_0_h2f_ARBURST,
	hps_0_h2f_ARLOCK,
	hps_0_h2f_ARCACHE,
	hps_0_h2f_ARPROT,
	hps_0_h2f_ARVALID,
	hps_0_h2f_ARREADY,
	hps_0_h2f_RID,
	hps_0_h2f_RDATA,
	hps_0_h2f_RRESP,
	hps_0_h2f_RLAST,
	hps_0_h2f_RVALID,
	hps_0_h2f_RREADY,
	hps_0_h2f_rst_n,
	hps_0_hps_io_emac1_inst_TX_CLK,
	hps_0_hps_io_emac1_inst_TXD0,
	hps_0_hps_io_emac1_inst_TXD1,
	hps_0_hps_io_emac1_inst_TXD2,
	hps_0_hps_io_emac1_inst_TXD3,
	hps_0_hps_io_emac1_inst_RXD0,
	hps_0_hps_io_emac1_inst_MDIO,
	hps_0_hps_io_emac1_inst_MDC,
	hps_0_hps_io_emac1_inst_RX_CTL,
	hps_0_hps_io_emac1_inst_TX_CTL,
	hps_0_hps_io_emac1_inst_RX_CLK,
	hps_0_hps_io_emac1_inst_RXD1,
	hps_0_hps_io_emac1_inst_RXD2,
	hps_0_hps_io_emac1_inst_RXD3,
	hps_0_hps_io_qspi_inst_IO0,
	hps_0_hps_io_qspi_inst_IO1,
	hps_0_hps_io_qspi_inst_IO2,
	hps_0_hps_io_qspi_inst_IO3,
	hps_0_hps_io_qspi_inst_SS0,
	hps_0_hps_io_qspi_inst_CLK,
	hps_0_hps_io_sdio_inst_CMD,
	hps_0_hps_io_sdio_inst_D0,
	hps_0_hps_io_sdio_inst_D1,
	hps_0_hps_io_sdio_inst_CLK,
	hps_0_hps_io_sdio_inst_D2,
	hps_0_hps_io_sdio_inst_D3,
	hps_0_hps_io_usb1_inst_D0,
	hps_0_hps_io_usb1_inst_D1,
	hps_0_hps_io_usb1_inst_D2,
	hps_0_hps_io_usb1_inst_D3,
	hps_0_hps_io_usb1_inst_D4,
	hps_0_hps_io_usb1_inst_D5,
	hps_0_hps_io_usb1_inst_D6,
	hps_0_hps_io_usb1_inst_D7,
	hps_0_hps_io_usb1_inst_CLK,
	hps_0_hps_io_usb1_inst_STP,
	hps_0_hps_io_usb1_inst_DIR,
	hps_0_hps_io_usb1_inst_NXT,
	hps_0_hps_io_spim0_inst_CLK,
	hps_0_hps_io_spim0_inst_MOSI,
	hps_0_hps_io_spim0_inst_MISO,
	hps_0_hps_io_spim0_inst_SS0,
	hps_0_hps_io_spim1_inst_CLK,
	hps_0_hps_io_spim1_inst_MOSI,
	hps_0_hps_io_spim1_inst_MISO,
	hps_0_hps_io_spim1_inst_SS0,
	hps_0_hps_io_uart0_inst_RX,
	hps_0_hps_io_uart0_inst_TX,
	hps_0_hps_io_i2c0_inst_SDA,
	hps_0_hps_io_i2c0_inst_SCL,
	hps_0_hps_io_i2c1_inst_SDA,
	hps_0_hps_io_i2c1_inst_SCL,
	hps_0_hps_io_gpio_inst_GPIO09,
	hps_0_hps_io_gpio_inst_GPIO35,
	hps_0_hps_io_gpio_inst_GPIO37,
	hps_0_hps_io_gpio_inst_GPIO40,
	hps_0_hps_io_gpio_inst_GPIO41,
	hps_0_hps_io_gpio_inst_GPIO44,
	hps_0_hps_io_gpio_inst_GPIO48,
	hps_0_hps_io_gpio_inst_GPIO53,
	hps_0_hps_io_gpio_inst_GPIO54,
	hps_0_hps_io_gpio_inst_GPIO61,
	hps_0_mem_a,
	hps_0_mem_ba,
	hps_0_mem_ck,
	hps_0_mem_ck_n,
	hps_0_mem_cke,
	hps_0_mem_cs_n,
	hps_0_mem_ras_n,
	hps_0_mem_cas_n,
	hps_0_mem_we_n,
	hps_0_mem_reset_n,
	hps_0_mem_dq,
	hps_0_mem_dqs,
	hps_0_mem_dqs_n,
	hps_0_mem_odt,
	hps_0_mem_dm,
	hps_0_oct_rzqin,
	led_pio_export,
	rgm_reset_n);	

	input	[3:0]	button_pio_export;
	input		cgm_clk;
	input	[9:0]	dipsw_pio_export;
	output		f2sdram_only_master_master_reset_reset;
	output	[23:0]	hex_pio_export;
	input		hps_0_f2h_cold_rst_req_n;
	input		hps_0_f2h_dbg_rst_req_n;
	input	[27:0]	hps_0_f2h_stm_hwevents;
	input		hps_0_f2h_warm_rst_req_n;
	output	[11:0]	hps_0_h2f_AWID;
	output	[29:0]	hps_0_h2f_AWADDR;
	output	[3:0]	hps_0_h2f_AWLEN;
	output	[2:0]	hps_0_h2f_AWSIZE;
	output	[1:0]	hps_0_h2f_AWBURST;
	output	[1:0]	hps_0_h2f_AWLOCK;
	output	[3:0]	hps_0_h2f_AWCACHE;
	output	[2:0]	hps_0_h2f_AWPROT;
	output		hps_0_h2f_AWVALID;
	input		hps_0_h2f_AWREADY;
	output	[11:0]	hps_0_h2f_WID;
	output	[63:0]	hps_0_h2f_WDATA;
	output	[7:0]	hps_0_h2f_WSTRB;
	output		hps_0_h2f_WLAST;
	output		hps_0_h2f_WVALID;
	input		hps_0_h2f_WREADY;
	input	[11:0]	hps_0_h2f_BID;
	input	[1:0]	hps_0_h2f_BRESP;
	input		hps_0_h2f_BVALID;
	output		hps_0_h2f_BREADY;
	output	[11:0]	hps_0_h2f_ARID;
	output	[29:0]	hps_0_h2f_ARADDR;
	output	[3:0]	hps_0_h2f_ARLEN;
	output	[2:0]	hps_0_h2f_ARSIZE;
	output	[1:0]	hps_0_h2f_ARBURST;
	output	[1:0]	hps_0_h2f_ARLOCK;
	output	[3:0]	hps_0_h2f_ARCACHE;
	output	[2:0]	hps_0_h2f_ARPROT;
	output		hps_0_h2f_ARVALID;
	input		hps_0_h2f_ARREADY;
	input	[11:0]	hps_0_h2f_RID;
	input	[63:0]	hps_0_h2f_RDATA;
	input	[1:0]	hps_0_h2f_RRESP;
	input		hps_0_h2f_RLAST;
	input		hps_0_h2f_RVALID;
	output		hps_0_h2f_RREADY;
	output		hps_0_h2f_rst_n;
	output		hps_0_hps_io_emac1_inst_TX_CLK;
	output		hps_0_hps_io_emac1_inst_TXD0;
	output		hps_0_hps_io_emac1_inst_TXD1;
	output		hps_0_hps_io_emac1_inst_TXD2;
	output		hps_0_hps_io_emac1_inst_TXD3;
	input		hps_0_hps_io_emac1_inst_RXD0;
	inout		hps_0_hps_io_emac1_inst_MDIO;
	output		hps_0_hps_io_emac1_inst_MDC;
	input		hps_0_hps_io_emac1_inst_RX_CTL;
	output		hps_0_hps_io_emac1_inst_TX_CTL;
	input		hps_0_hps_io_emac1_inst_RX_CLK;
	input		hps_0_hps_io_emac1_inst_RXD1;
	input		hps_0_hps_io_emac1_inst_RXD2;
	input		hps_0_hps_io_emac1_inst_RXD3;
	inout		hps_0_hps_io_qspi_inst_IO0;
	inout		hps_0_hps_io_qspi_inst_IO1;
	inout		hps_0_hps_io_qspi_inst_IO2;
	inout		hps_0_hps_io_qspi_inst_IO3;
	output		hps_0_hps_io_qspi_inst_SS0;
	output		hps_0_hps_io_qspi_inst_CLK;
	inout		hps_0_hps_io_sdio_inst_CMD;
	inout		hps_0_hps_io_sdio_inst_D0;
	inout		hps_0_hps_io_sdio_inst_D1;
	output		hps_0_hps_io_sdio_inst_CLK;
	inout		hps_0_hps_io_sdio_inst_D2;
	inout		hps_0_hps_io_sdio_inst_D3;
	inout		hps_0_hps_io_usb1_inst_D0;
	inout		hps_0_hps_io_usb1_inst_D1;
	inout		hps_0_hps_io_usb1_inst_D2;
	inout		hps_0_hps_io_usb1_inst_D3;
	inout		hps_0_hps_io_usb1_inst_D4;
	inout		hps_0_hps_io_usb1_inst_D5;
	inout		hps_0_hps_io_usb1_inst_D6;
	inout		hps_0_hps_io_usb1_inst_D7;
	input		hps_0_hps_io_usb1_inst_CLK;
	output		hps_0_hps_io_usb1_inst_STP;
	input		hps_0_hps_io_usb1_inst_DIR;
	input		hps_0_hps_io_usb1_inst_NXT;
	output		hps_0_hps_io_spim0_inst_CLK;
	output		hps_0_hps_io_spim0_inst_MOSI;
	input		hps_0_hps_io_spim0_inst_MISO;
	output		hps_0_hps_io_spim0_inst_SS0;
	output		hps_0_hps_io_spim1_inst_CLK;
	output		hps_0_hps_io_spim1_inst_MOSI;
	input		hps_0_hps_io_spim1_inst_MISO;
	output		hps_0_hps_io_spim1_inst_SS0;
	input		hps_0_hps_io_uart0_inst_RX;
	output		hps_0_hps_io_uart0_inst_TX;
	inout		hps_0_hps_io_i2c0_inst_SDA;
	inout		hps_0_hps_io_i2c0_inst_SCL;
	inout		hps_0_hps_io_i2c1_inst_SDA;
	inout		hps_0_hps_io_i2c1_inst_SCL;
	inout		hps_0_hps_io_gpio_inst_GPIO09;
	inout		hps_0_hps_io_gpio_inst_GPIO35;
	inout		hps_0_hps_io_gpio_inst_GPIO37;
	inout		hps_0_hps_io_gpio_inst_GPIO40;
	inout		hps_0_hps_io_gpio_inst_GPIO41;
	inout		hps_0_hps_io_gpio_inst_GPIO44;
	inout		hps_0_hps_io_gpio_inst_GPIO48;
	inout		hps_0_hps_io_gpio_inst_GPIO53;
	inout		hps_0_hps_io_gpio_inst_GPIO54;
	inout		hps_0_hps_io_gpio_inst_GPIO61;
	output	[14:0]	hps_0_mem_a;
	output	[2:0]	hps_0_mem_ba;
	output		hps_0_mem_ck;
	output		hps_0_mem_ck_n;
	output		hps_0_mem_cke;
	output		hps_0_mem_cs_n;
	output		hps_0_mem_ras_n;
	output		hps_0_mem_cas_n;
	output		hps_0_mem_we_n;
	output		hps_0_mem_reset_n;
	inout	[31:0]	hps_0_mem_dq;
	inout	[3:0]	hps_0_mem_dqs;
	inout	[3:0]	hps_0_mem_dqs_n;
	output		hps_0_mem_odt;
	output	[3:0]	hps_0_mem_dm;
	input		hps_0_oct_rzqin;
	output	[9:0]	led_pio_export;
	input		rgm_reset_n;
endmodule
