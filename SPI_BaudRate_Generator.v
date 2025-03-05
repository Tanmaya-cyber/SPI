module SPI_BaudRate_Generator (
    input wire clk,             // System clock
    input wire rst,             // Reset signal
    input wire [7:0] spibr,     // SPI Baud Rate Register (SPIBR)
    input wire [31:0] bus_clock, // Bus clock frequency (in Hz)
    output reg [31:0] baud_rate // Computed SPI baud rate
);

    wire [2:0] sppr; // SPPR (Serial Clock Prescaler) - Bits 6:4
    wire [2:0] spr;  // SPR (Serial Clock Rate) - Bits 2:0
    reg [31:0] baud_rate_divisor;

    assign sppr = spibr[6:4]; // Extract SPPR from SPIBR
    assign spr  = spibr[2:0]; // Extract SPR from SPIBR

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            baud_rate_divisor <= 32'd2; // Default divisor
            baud_rate <= 32'd0; // Default baud rate
        end
        else begin
            // Compute Baud Rate Divisor: (SPPR + 1) * 2^(SPR + 1)
            baud_rate_divisor <= (sppr + 1) * (2 ** (spr + 1));
            // Compute Baud Rate: BusClock / BaudRateDivisor
            baud_rate <= bus_clock / baud_rate_divisor;
        end
    end
endmodule
