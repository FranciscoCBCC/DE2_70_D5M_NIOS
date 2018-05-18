-- de2_70_pixel_buffer_dma_avalon_pixel_dma_master_translator_avalon_universal_master_0_agent.vhd

-- Generated using ACDS version 13.0sp1 232 at 2018.05.18.09:31:32

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity de2_70_pixel_buffer_dma_avalon_pixel_dma_master_translator_avalon_universal_master_0_agent is
	generic (
		PKT_PROTECTION_H          : integer := 80;
		PKT_PROTECTION_L          : integer := 78;
		PKT_BEGIN_BURST           : integer := 69;
		PKT_BURSTWRAP_H           : integer := 61;
		PKT_BURSTWRAP_L           : integer := 59;
		PKT_BURST_SIZE_H          : integer := 64;
		PKT_BURST_SIZE_L          : integer := 62;
		PKT_BURST_TYPE_H          : integer := 66;
		PKT_BURST_TYPE_L          : integer := 65;
		PKT_BYTE_CNT_H            : integer := 58;
		PKT_BYTE_CNT_L            : integer := 56;
		PKT_ADDR_H                : integer := 49;
		PKT_ADDR_L                : integer := 18;
		PKT_TRANS_COMPRESSED_READ : integer := 50;
		PKT_TRANS_POSTED          : integer := 51;
		PKT_TRANS_WRITE           : integer := 52;
		PKT_TRANS_READ            : integer := 53;
		PKT_TRANS_LOCK            : integer := 54;
		PKT_TRANS_EXCLUSIVE       : integer := 55;
		PKT_DATA_H                : integer := 15;
		PKT_DATA_L                : integer := 0;
		PKT_BYTEEN_H              : integer := 17;
		PKT_BYTEEN_L              : integer := 16;
		PKT_SRC_ID_H              : integer := 73;
		PKT_SRC_ID_L              : integer := 71;
		PKT_DEST_ID_H             : integer := 76;
		PKT_DEST_ID_L             : integer := 74;
		PKT_THREAD_ID_H           : integer := 77;
		PKT_THREAD_ID_L           : integer := 77;
		PKT_CACHE_H               : integer := 84;
		PKT_CACHE_L               : integer := 81;
		PKT_DATA_SIDEBAND_H       : integer := 68;
		PKT_DATA_SIDEBAND_L       : integer := 68;
		PKT_QOS_H                 : integer := 70;
		PKT_QOS_L                 : integer := 70;
		PKT_ADDR_SIDEBAND_H       : integer := 67;
		PKT_ADDR_SIDEBAND_L       : integer := 67;
		PKT_RESPONSE_STATUS_H     : integer := 86;
		PKT_RESPONSE_STATUS_L     : integer := 85;
		ST_DATA_W                 : integer := 87;
		ST_CHANNEL_W              : integer := 6;
		AV_BURSTCOUNT_W           : integer := 2;
		SUPPRESS_0_BYTEEN_RSP     : integer := 1;
		ID                        : integer := 0;
		BURSTWRAP_VALUE           : integer := 7;
		CACHE_VALUE               : integer := 0;
		SECURE_ACCESS_BIT         : integer := 1;
		USE_READRESPONSE          : integer := 0;
		USE_WRITERESPONSE         : integer := 0
	);
	port (
		clk                     : in  std_logic                     := '0';             --       clk.clk
		reset                   : in  std_logic                     := '0';             -- clk_reset.reset
		av_address              : in  std_logic_vector(31 downto 0) := (others => '0'); --        av.address
		av_write                : in  std_logic                     := '0';             --          .write
		av_read                 : in  std_logic                     := '0';             --          .read
		av_writedata            : in  std_logic_vector(15 downto 0) := (others => '0'); --          .writedata
		av_readdata             : out std_logic_vector(15 downto 0);                    --          .readdata
		av_waitrequest          : out std_logic;                                        --          .waitrequest
		av_readdatavalid        : out std_logic;                                        --          .readdatavalid
		av_byteenable           : in  std_logic_vector(1 downto 0)  := (others => '0'); --          .byteenable
		av_burstcount           : in  std_logic_vector(1 downto 0)  := (others => '0'); --          .burstcount
		av_debugaccess          : in  std_logic                     := '0';             --          .debugaccess
		av_lock                 : in  std_logic                     := '0';             --          .lock
		cp_valid                : out std_logic;                                        --        cp.valid
		cp_data                 : out std_logic_vector(86 downto 0);                    --          .data
		cp_startofpacket        : out std_logic;                                        --          .startofpacket
		cp_endofpacket          : out std_logic;                                        --          .endofpacket
		cp_ready                : in  std_logic                     := '0';             --          .ready
		rp_valid                : in  std_logic                     := '0';             --        rp.valid
		rp_data                 : in  std_logic_vector(86 downto 0) := (others => '0'); --          .data
		rp_channel              : in  std_logic_vector(5 downto 0)  := (others => '0'); --          .channel
		rp_startofpacket        : in  std_logic                     := '0';             --          .startofpacket
		rp_endofpacket          : in  std_logic                     := '0';             --          .endofpacket
		rp_ready                : out std_logic;                                        --          .ready
		av_response             : out std_logic_vector(1 downto 0);
		av_writeresponserequest : in  std_logic                     := '0';
		av_writeresponsevalid   : out std_logic
	);
end entity de2_70_pixel_buffer_dma_avalon_pixel_dma_master_translator_avalon_universal_master_0_agent;

architecture rtl of de2_70_pixel_buffer_dma_avalon_pixel_dma_master_translator_avalon_universal_master_0_agent is
	component altera_merlin_master_agent is
		generic (
			PKT_PROTECTION_H          : integer := 80;
			PKT_PROTECTION_L          : integer := 80;
			PKT_BEGIN_BURST           : integer := 81;
			PKT_BURSTWRAP_H           : integer := 79;
			PKT_BURSTWRAP_L           : integer := 77;
			PKT_BURST_SIZE_H          : integer := 86;
			PKT_BURST_SIZE_L          : integer := 84;
			PKT_BURST_TYPE_H          : integer := 94;
			PKT_BURST_TYPE_L          : integer := 93;
			PKT_BYTE_CNT_H            : integer := 76;
			PKT_BYTE_CNT_L            : integer := 74;
			PKT_ADDR_H                : integer := 73;
			PKT_ADDR_L                : integer := 42;
			PKT_TRANS_COMPRESSED_READ : integer := 41;
			PKT_TRANS_POSTED          : integer := 40;
			PKT_TRANS_WRITE           : integer := 39;
			PKT_TRANS_READ            : integer := 38;
			PKT_TRANS_LOCK            : integer := 82;
			PKT_TRANS_EXCLUSIVE       : integer := 83;
			PKT_DATA_H                : integer := 37;
			PKT_DATA_L                : integer := 6;
			PKT_BYTEEN_H              : integer := 5;
			PKT_BYTEEN_L              : integer := 2;
			PKT_SRC_ID_H              : integer := 1;
			PKT_SRC_ID_L              : integer := 1;
			PKT_DEST_ID_H             : integer := 0;
			PKT_DEST_ID_L             : integer := 0;
			PKT_THREAD_ID_H           : integer := 88;
			PKT_THREAD_ID_L           : integer := 87;
			PKT_CACHE_H               : integer := 92;
			PKT_CACHE_L               : integer := 89;
			PKT_DATA_SIDEBAND_H       : integer := 105;
			PKT_DATA_SIDEBAND_L       : integer := 98;
			PKT_QOS_H                 : integer := 109;
			PKT_QOS_L                 : integer := 106;
			PKT_ADDR_SIDEBAND_H       : integer := 97;
			PKT_ADDR_SIDEBAND_L       : integer := 93;
			PKT_RESPONSE_STATUS_H     : integer := 111;
			PKT_RESPONSE_STATUS_L     : integer := 110;
			ST_DATA_W                 : integer := 112;
			ST_CHANNEL_W              : integer := 1;
			AV_BURSTCOUNT_W           : integer := 3;
			SUPPRESS_0_BYTEEN_RSP     : integer := 1;
			ID                        : integer := 1;
			BURSTWRAP_VALUE           : integer := 4;
			CACHE_VALUE               : integer := 0;
			SECURE_ACCESS_BIT         : integer := 1;
			USE_READRESPONSE          : integer := 0;
			USE_WRITERESPONSE         : integer := 0
		);
		port (
			clk                     : in  std_logic                     := 'X';             -- clk
			reset                   : in  std_logic                     := 'X';             -- reset
			av_address              : in  std_logic_vector(31 downto 0) := (others => 'X'); -- address
			av_write                : in  std_logic                     := 'X';             -- write
			av_read                 : in  std_logic                     := 'X';             -- read
			av_writedata            : in  std_logic_vector(15 downto 0) := (others => 'X'); -- writedata
			av_readdata             : out std_logic_vector(15 downto 0);                    -- readdata
			av_waitrequest          : out std_logic;                                        -- waitrequest
			av_readdatavalid        : out std_logic;                                        -- readdatavalid
			av_byteenable           : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- byteenable
			av_burstcount           : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- burstcount
			av_debugaccess          : in  std_logic                     := 'X';             -- debugaccess
			av_lock                 : in  std_logic                     := 'X';             -- lock
			cp_valid                : out std_logic;                                        -- valid
			cp_data                 : out std_logic_vector(86 downto 0);                    -- data
			cp_startofpacket        : out std_logic;                                        -- startofpacket
			cp_endofpacket          : out std_logic;                                        -- endofpacket
			cp_ready                : in  std_logic                     := 'X';             -- ready
			rp_valid                : in  std_logic                     := 'X';             -- valid
			rp_data                 : in  std_logic_vector(86 downto 0) := (others => 'X'); -- data
			rp_channel              : in  std_logic_vector(5 downto 0)  := (others => 'X'); -- channel
			rp_startofpacket        : in  std_logic                     := 'X';             -- startofpacket
			rp_endofpacket          : in  std_logic                     := 'X';             -- endofpacket
			rp_ready                : out std_logic;                                        -- ready
			av_response             : out std_logic_vector(1 downto 0);                     -- response
			av_writeresponserequest : in  std_logic                     := 'X';             -- writeresponserequest
			av_writeresponsevalid   : out std_logic                                         -- writeresponsevalid
		);
	end component altera_merlin_master_agent;

begin

	pixel_buffer_dma_avalon_pixel_dma_master_translator_avalon_universal_master_0_agent : component altera_merlin_master_agent
		generic map (
			PKT_PROTECTION_H          => PKT_PROTECTION_H,
			PKT_PROTECTION_L          => PKT_PROTECTION_L,
			PKT_BEGIN_BURST           => PKT_BEGIN_BURST,
			PKT_BURSTWRAP_H           => PKT_BURSTWRAP_H,
			PKT_BURSTWRAP_L           => PKT_BURSTWRAP_L,
			PKT_BURST_SIZE_H          => PKT_BURST_SIZE_H,
			PKT_BURST_SIZE_L          => PKT_BURST_SIZE_L,
			PKT_BURST_TYPE_H          => PKT_BURST_TYPE_H,
			PKT_BURST_TYPE_L          => PKT_BURST_TYPE_L,
			PKT_BYTE_CNT_H            => PKT_BYTE_CNT_H,
			PKT_BYTE_CNT_L            => PKT_BYTE_CNT_L,
			PKT_ADDR_H                => PKT_ADDR_H,
			PKT_ADDR_L                => PKT_ADDR_L,
			PKT_TRANS_COMPRESSED_READ => PKT_TRANS_COMPRESSED_READ,
			PKT_TRANS_POSTED          => PKT_TRANS_POSTED,
			PKT_TRANS_WRITE           => PKT_TRANS_WRITE,
			PKT_TRANS_READ            => PKT_TRANS_READ,
			PKT_TRANS_LOCK            => PKT_TRANS_LOCK,
			PKT_TRANS_EXCLUSIVE       => PKT_TRANS_EXCLUSIVE,
			PKT_DATA_H                => PKT_DATA_H,
			PKT_DATA_L                => PKT_DATA_L,
			PKT_BYTEEN_H              => PKT_BYTEEN_H,
			PKT_BYTEEN_L              => PKT_BYTEEN_L,
			PKT_SRC_ID_H              => PKT_SRC_ID_H,
			PKT_SRC_ID_L              => PKT_SRC_ID_L,
			PKT_DEST_ID_H             => PKT_DEST_ID_H,
			PKT_DEST_ID_L             => PKT_DEST_ID_L,
			PKT_THREAD_ID_H           => PKT_THREAD_ID_H,
			PKT_THREAD_ID_L           => PKT_THREAD_ID_L,
			PKT_CACHE_H               => PKT_CACHE_H,
			PKT_CACHE_L               => PKT_CACHE_L,
			PKT_DATA_SIDEBAND_H       => PKT_DATA_SIDEBAND_H,
			PKT_DATA_SIDEBAND_L       => PKT_DATA_SIDEBAND_L,
			PKT_QOS_H                 => PKT_QOS_H,
			PKT_QOS_L                 => PKT_QOS_L,
			PKT_ADDR_SIDEBAND_H       => PKT_ADDR_SIDEBAND_H,
			PKT_ADDR_SIDEBAND_L       => PKT_ADDR_SIDEBAND_L,
			PKT_RESPONSE_STATUS_H     => PKT_RESPONSE_STATUS_H,
			PKT_RESPONSE_STATUS_L     => PKT_RESPONSE_STATUS_L,
			ST_DATA_W                 => ST_DATA_W,
			ST_CHANNEL_W              => ST_CHANNEL_W,
			AV_BURSTCOUNT_W           => AV_BURSTCOUNT_W,
			SUPPRESS_0_BYTEEN_RSP     => SUPPRESS_0_BYTEEN_RSP,
			ID                        => ID,
			BURSTWRAP_VALUE           => BURSTWRAP_VALUE,
			CACHE_VALUE               => CACHE_VALUE,
			SECURE_ACCESS_BIT         => SECURE_ACCESS_BIT,
			USE_READRESPONSE          => USE_READRESPONSE,
			USE_WRITERESPONSE         => USE_WRITERESPONSE
		)
		port map (
			clk                     => clk,              --       clk.clk
			reset                   => reset,            -- clk_reset.reset
			av_address              => av_address,       --        av.address
			av_write                => av_write,         --          .write
			av_read                 => av_read,          --          .read
			av_writedata            => av_writedata,     --          .writedata
			av_readdata             => av_readdata,      --          .readdata
			av_waitrequest          => av_waitrequest,   --          .waitrequest
			av_readdatavalid        => av_readdatavalid, --          .readdatavalid
			av_byteenable           => av_byteenable,    --          .byteenable
			av_burstcount           => av_burstcount,    --          .burstcount
			av_debugaccess          => av_debugaccess,   --          .debugaccess
			av_lock                 => av_lock,          --          .lock
			cp_valid                => cp_valid,         --        cp.valid
			cp_data                 => cp_data,          --          .data
			cp_startofpacket        => cp_startofpacket, --          .startofpacket
			cp_endofpacket          => cp_endofpacket,   --          .endofpacket
			cp_ready                => cp_ready,         --          .ready
			rp_valid                => rp_valid,         --        rp.valid
			rp_data                 => rp_data,          --          .data
			rp_channel              => rp_channel,       --          .channel
			rp_startofpacket        => rp_startofpacket, --          .startofpacket
			rp_endofpacket          => rp_endofpacket,   --          .endofpacket
			rp_ready                => rp_ready,         --          .ready
			av_response             => open,             -- (terminated)
			av_writeresponserequest => '0',              -- (terminated)
			av_writeresponsevalid   => open              -- (terminated)
		);

end architecture rtl; -- of de2_70_pixel_buffer_dma_avalon_pixel_dma_master_translator_avalon_universal_master_0_agent
