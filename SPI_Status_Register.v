module SPI_Status_Register (
    input clk, rst,
    input [7:0] SPIDR,          // SPI Data Register (for data transmission/reception)
    input SPTEF,                 // SPI Transmit Empty Flag
    input SPIF,                  // SPI Interrupt Flag
    input MODF,                  // Mode Fault Flag
    input SPISR_read,            // SPI Status Register read signal
    output reg SPTEF_int,        // SPTEF interrupt flag output
    output reg SPIF_int,         // SPIF interrupt flag output
    output reg MODF_int          // MODF interrupt flag output
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            SPTEF_int <= 0;
            SPIF_int <= 0;
            MODF_int <= 0;
        end else begin
            // Handle SPTEF flag (Transmit Empty)
            if (SPTEF) begin
                SPTEF_int <= 1;
            end else if (SPISR_read) begin
                SPTEF_int <= 0;
            end

            // Handle SPIF flag (Data Received)
            if (SPIF) begin
                SPIF_int <= 1;
            end else if (SPISR_read) begin
                SPIF_int <= 0;
            end

            // Handle MODF flag (Mode Fault)
            if (MODF) begin
                MODF_int <= 1;
            end else if (SPISR_read) begin
                MODF_int <= 0;
            end
        end
    end
endmodule
