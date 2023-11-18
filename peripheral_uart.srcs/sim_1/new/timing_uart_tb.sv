`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/17/2023 12:38:34 AM
// Design Name: 
// Module Name: timing_uart_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module timing_uart_tb;
    parameter INTERNAL_CLOCK        = 115200 * 100;
    parameter DATA_WIDTH            = 8;
    
    reg clk;
    
    wire RX_1;
    wire TX_1;
    
    reg [DATA_WIDTH - 1:0]    RX_config_register;
    reg [DATA_WIDTH - 1:0]    TX_config_register;
    
    
    wire RX_2;
    wire TX_2;
    
    
    reg TX_use_2;
    wire TX_flag_2;
    wire TX_complete_2;
    wire TX_available_2;
    
    reg RX_use_2;
    wire RX_flag_2;
    wire RX_available_2;
    
    reg  [DATA_WIDTH - 1:0]    data_in_2;
    wire [DATA_WIDTH - 1:0]    data_out_2;
    
    reg rst_n;
    
    assign RX_1 = TX_2;
    assign RX_2 = TX_1;
    
    timing_uart_peripheral_file 
        #(
        .INTERNAL_CLOCK(INTERNAL_CLOCK)
        )timing_uart_peripheral_file_1(
        .clk(clk),
        
        .RX(RX_1),
        .TX(TX_1),
        
        .rst(~rst_n)
        );
        
    uart_peripheral 
        #(
        .INTERNAL_CLOCK(INTERNAL_CLOCK),
        .RX_FLAG_TYPE(1'b0)
        )uart_peripheral_2(
        .clk(clk),
        .RX(RX_2),
        .TX(TX_2),
        .RX_config_register(TX_config_register),
        .TX_config_register(RX_config_register),
        // TX interface 
        .data_in(data_in_2),
        .TX_use(TX_use_2),
        .TX_flag(TX_flag_2),
        .TX_complete(TX_complete_2),
        .TX_available(TX_available_2),
        // RX interface
        .data_out(data_out_2),
        .RX_use(RX_use_2),
        .RX_flag(RX_flag_2),
        .RX_available(RX_available_2),
        
        .rst_n(rst_n)
        );
        
    initial begin
        clk <= 0;
        RX_config_register <= 8'b11100011;  // 115200   -   8N1
        TX_config_register <= 8'b11100011;  // 115200   -   8N1
//        TX_use_1 <= 0;
//        data_in_1 <= 8'h00;
        TX_use_2 <= 0;
        data_in_2 <= 8'h00;
//        RX_use_1 <= 0;
        RX_use_2 <= 0;
        rst_n <= 1;
        #1 rst_n <= 0;
        #9 rst_n <= 1;
    end       
    initial begin
        forever #1 clk <= ~clk;
    end 
    initial begin
        #11;
        for(int i = 0; i < 31; i = i + 1) begin
        #1;    
        data_in_2 <= 8'hff - i;
        #1 TX_use_2 <= 1;
        #2 TX_use_2 <= 0;
        end
        
        #70000;
        #11;
        for(int i = 0; i < 31; i = i + 1) begin
        #1;    
        data_in_2 <= 8'hff - i;
        #1 TX_use_2 <= 1;
        #2 TX_use_2 <= 0;
        end
        #70000;
        #11;
        for(int i = 0; i < 31; i = i + 1) begin
        #1;    
        data_in_2 <= 8'hff - i;
        #1 TX_use_2 <= 1;
        #2 TX_use_2 <= 0;
        end
        #70000;
        #11;
        for(int i = 0; i < 31; i = i + 1) begin
        #1;    
        data_in_2 <= 8'hff - i;
        #1 TX_use_2 <= 1;
        #2 TX_use_2 <= 0;
        end
        #70000;
        #11;
        for(int i = 0; i < 31; i = i + 1) begin
        #1;    
        data_in_2 <= 8'hff - i;
        #1 TX_use_2 <= 1;
        #2 TX_use_2 <= 0;
        end
        #70000;
        #11;
        for(int i = 0; i < 31; i = i + 1) begin
        #1;    
        data_in_2 <= 8'hff - i;
        #1 TX_use_2 <= 1;
        #2 TX_use_2 <= 0;
        end
        #70000;
        #11;
        for(int i = 0; i < 31; i = i + 1) begin
        #1;    
        data_in_2 <= 8'hff - i;
        #1 TX_use_2 <= 1;
        #2 TX_use_2 <= 0;
        end
        #70000;
        #11;
        for(int i = 0; i < 31; i = i + 1) begin
        #1;    
        data_in_2 <= 8'hff - i;
        #1 TX_use_2 <= 1;
        #2 TX_use_2 <= 0;
        end
    end
    initial begin
        #100000;
        #100000;
        #100000;
        #100000;
        #100000;
        #100000;
        #100000;
        #100000;
        $stop;
    end 
endmodule
