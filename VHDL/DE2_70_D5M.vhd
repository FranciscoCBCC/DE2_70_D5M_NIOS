LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.ALL;

ENTITY DE2_70_D5M IS
	PORT (
			CLOCK_50 						: IN    STD_LOGIC; 													     --clk
			
			GPIO_1							: INOUT STD_LOGIC_VECTOR(15 DOWNTO 0);                        
			
			IO_CLKOUTn1                : OUT   STD_LOGIC; 														  --XCLKIN
			KEY                        : IN 	  STD_LOGIC_VECTOR(1 DOWNTO 0);
			
			DE2_70_AV_CONFIG_SDAT          : inout std_logic                     := 'X';             -- SDAT
			DE2_70_AV_CONFIG_SCLK          : out   std_logic;                                        -- SCLK
			
			DE2_70_VIDEOIN_PIXEL_CLK       : in    std_logic                     := 'X';             -- PIXEL_CLK
			DE2_70_VIDEOIN_LINE_VALID      : in    std_logic                     := 'X';             -- LINE_VALID
			DE2_70_VIDEOIN_FRAME_VALID     : in    std_logic                     := 'X';             -- FRAME_VALID
			DE2_70_VIDEOIN_PIXEL_CLK_RESET : in    std_logic                     := 'X';             -- PIXEL_CLK_RESET			
			DE2_70_VIDEOIN_PIXEL_DATA      : in    std_logic_vector(11 downto 0) := (others => 'X'); -- PIXEL_DATA
			
			--DE2_70_VIDEOIN_RESET           : in    std_logic; --reset
			
			DE2_70_SRAM_DQ                 : inout std_logic_vector(31 downto 0) := (others => 'X'); -- DQ
			DE2_70_SRAM_DPA                : inout std_logic_vector(3 downto 0)  := (others => 'X'); -- DPA
			DE2_70_SRAM_ADDR               : out   std_logic_vector(18 downto 0);                    -- ADDR
			DE2_70_SRAM_ADSC_N             : out   std_logic;                                        -- ADSC_N
			DE2_70_SRAM_ADSP_N             : out   std_logic;                                        -- ADSP_N
			DE2_70_SRAM_ADV_N              : out   std_logic;                                        -- ADV_N
			DE2_70_SRAM_BE_N               : out   std_logic_vector(3 downto 0);                     -- BE_N
			DE2_70_SRAM_CE1_N              : out   std_logic;                                        -- CE1_N
			DE2_70_SRAM_CE2                : out   std_logic;                                        -- CE2
			DE2_70_SRAM_CE3_N              : out   std_logic;                                        -- CE3_N
			DE2_70_SRAM_GW_N               : out   std_logic;                                        -- GW_N
			DE2_70_SRAM_OE_N               : out   std_logic;                                        -- OE_N           
			DE2_70_SRAM_WE_N               : out   std_logic;                                        -- WE_N           
			DE2_70_SRAM_CLK                : out   std_logic;                                        -- CLK           
			DE2_70_VGA_OUT_CLK             : out   std_logic;                                        -- CLK   
			DE2_70_VGA_OUT_HS              : out   std_logic;                                        -- HS           
			DE2_70_VGA_OUT_VS              : out   std_logic;                                        -- VS           
			DE2_70_VGA_OUT_BLANK           : out   std_logic;                                        -- BLANK           
			DE2_70_VGA_OUT_SYNC            : out   std_logic;                                        -- SYNC           
			DE2_70_VGA_OUT_R               : out   std_logic_vector(9 downto 0);                     -- R           
			DE2_70_VGA_OUT_G               : out   std_logic_vector(9 downto 0);                     -- G           
			DE2_70_VGA_OUT_B               : out   std_logic_vector(9 downto 0)                      -- B          

	);
END DE2_70_D5M;

ARCHITECTURE Structure OF DE2_70_D5M IS
	
    component de2_70 is
        port (
				clk_clk                 : in    std_logic                     := 'X';             -- clk
				
            av_config_SDAT          : inout std_logic                     := 'X';				 -- SDAT
            av_config_SCLK          : out   std_logic;                                        -- SCLK
				
            videoin_PIXEL_CLK       : in    std_logic                     := 'X';             -- PIXEL_CLK
            videoin_LINE_VALID      : in    std_logic                     := 'X';             -- LINE_VALID
            videoin_FRAME_VALID     : in    std_logic                     := 'X';             -- FRAME_VALID
            videoin_PIXEL_DATA      : in    std_logic_vector(11 downto 0) := (others => 'X'); -- PIXEL_DATA
				
				--videoin_pixel_clk_reset : in    std_logic                     := '1'; 
				
            sram_DQ                 : inout std_logic_vector(31 downto 0) := (others => 'X'); -- DQ
            sram_DPA                : inout std_logic_vector(3 downto 0)  := (others => 'X'); -- DPA
            sram_ADDR               : out   std_logic_vector(18 downto 0);                    -- ADDR
            sram_ADSC_N             : out   std_logic;                                        -- ADSC_N
            sram_ADSP_N             : out   std_logic;                                        -- ADSP_N
            sram_ADV_N              : out   std_logic;                                        -- ADV_N
            sram_BE_N               : out   std_logic_vector(3 downto 0);                     -- BE_N
            sram_CE1_N              : out   std_logic;                                        -- CE1_N
            sram_CE2                : out   std_logic;                                        -- CE2
            sram_CE3_N              : out   std_logic;                                        -- CE3_N
            sram_GW_N               : out   std_logic;                                        -- GW_N
            sram_OE_N               : out   std_logic;                                        -- OE_N
            sram_WE_N               : out   std_logic;                                        -- WE_N
            sram_CLK                : out   std_logic;                                        -- CLK
            vga_out_CLK             : out   std_logic;                                        -- CLK
            vga_out_HS              : out   std_logic;                                        -- HS
            vga_out_VS              : out   std_logic;                                        -- VS
            vga_out_BLANK           : out   std_logic;                                        -- BLANK
            vga_out_SYNC            : out   std_logic;                                        -- SYNC
            vga_out_R               : out   std_logic_vector(9 downto 0);                     -- R
            vga_out_G               : out   std_logic_vector(9 downto 0);                     -- G
            vga_out_B               : out   std_logic_vector(9 downto 0);                     -- B
            camera_clk_clk          : out   std_logic                                         -- clk
        );
    end component;

		  BEGIN
				
		  GPIO_1(15) <= KEY(1);  --TRIGGER
		  GPIO_1(14) <= KEY(0);  --RESET	 
				
		  NiosII : de2_70
		  		  
        port map (
            clk_clk                 => CLOCK_50,                 		  --        clk.clk
				
            av_config_SDAT          => DE2_70_AV_CONFIG_SDAT,          --  av_config.SDAT
            av_config_SCLK          => DE2_70_AV_CONFIG_SCLK,          --           .SCLK
				
				videoin_PIXEL_CLK       => DE2_70_VIDEOIN_PIXEL_CLK,       --    videoin.PIXEL_CLK
            videoin_LINE_VALID      => DE2_70_VIDEOIN_LINE_VALID,      --           .LINE_VALID
            videoin_FRAME_VALID     => DE2_70_VIDEOIN_FRAME_VALID,     --           .FRAME_VALID
            videoin_PIXEL_DATA      => DE2_70_VIDEOIN_PIXEL_DATA,      --           .PIXEL_DATA
				
				--videoin_pixel_clk_reset => DE2_70_VIDEOIN_RESET,
				
            sram_DQ                 => DE2_70_SRAM_DQ,                 --       sram.DQ
            sram_DPA                => DE2_70_SRAM_DPA,                --           .DPA
            sram_ADDR               => DE2_70_SRAM_ADDR,               --           .ADDR
            sram_ADSC_N             => DE2_70_SRAM_ADSC_N,             --           .ADSC_N
            sram_ADSP_N             => DE2_70_SRAM_ADSP_N,             --           .ADSP_N
            sram_ADV_N              => DE2_70_SRAM_ADV_N,              --           .ADV_N
            sram_BE_N               => DE2_70_SRAM_BE_N,               --           .BE_N
            sram_CE1_N              => DE2_70_SRAM_CE1_N,              --           .CE1_N
            sram_CE2                => DE2_70_SRAM_CE2,                --           .CE2
            sram_CE3_N              => DE2_70_SRAM_CE3_N,              --           .CE3_N
            sram_GW_N               => DE2_70_SRAM_GW_N,               --           .GW_N
            sram_OE_N               => DE2_70_SRAM_OE_N,               --           .OE_N
            sram_WE_N               => DE2_70_SRAM_WE_N,               --           .WE_N
            sram_CLK                => DE2_70_SRAM_CLK,                --           .CLK
            vga_out_CLK             => DE2_70_VGA_OUT_CLK,             --    vga_out.CLK
            vga_out_HS              => DE2_70_VGA_OUT_HS,              --           .HS
            vga_out_VS              => DE2_70_VGA_OUT_VS,              --           .VS
            vga_out_BLANK           => DE2_70_VGA_OUT_BLANK,           --           .BLANK
            vga_out_SYNC            => DE2_70_VGA_OUT_SYNC,            --           .SYNC
            vga_out_R               => DE2_70_VGA_OUT_R,               --           .R
            vga_out_G               => DE2_70_VGA_OUT_G,               --           .G
            vga_out_B               => DE2_70_VGA_OUT_B,               --           .B	
            camera_clk_clk          => IO_CLKOUTn1          			  -- camera_clk.clk
        );
END Structure;