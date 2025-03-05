module SPI_Control_Registers (
    input wire clk,
    input wire rst,
    input wire [7:0] ctrl_reg1,  // SPI Control Register 1 (SPICR1)
    input wire [7:0] ctrl_reg2,  // SPI Control Register 2 (SPICR2)
    output reg spie, spe, sptie, mstr, cpol, cpha, ssoe, lsbfe, // SPICR1 bits
    output reg modfen, bidiroe, spiswai, spc0  // SPICR2 bits
);
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            // Reset all control bits to their default values
            spie   <= 1'b0;
            spe    <= 1'b0;
            sptie  <= 1'b0;
            mstr   <= 1'b0;
            cpol   <= 1'b0;
            cpha   <= 1'b1; // Default value from SPICR1 diagram
            ssoe   <= 1'b0;
            lsbfe  <= 1'b0;
            modfen <= 1'b0;
            bidiroe<= 1'b0;
            spiswai<= 1'b0;
            spc0   <= 1'b0;
        end 
        else begin
            // Assigning control bits based on the input registers
            spie   <= ctrl_reg1[7]; // SPI Interrupt Enable
            spe    <= ctrl_reg1[6]; // SPI Enable
            sptie  <= ctrl_reg1[5]; // SPI Transmit Interrupt Enable
            mstr   <= ctrl_reg1[4]; // Master/Slave Mode Select
            cpol   <= ctrl_reg1[3]; // Clock Polarity
            cpha   <= ctrl_reg1[2]; // Clock Phase
            ssoe   <= ctrl_reg1[1]; // Slave Select Output Enable
            lsbfe  <= ctrl_reg1[0]; // LSB-First Enable

            modfen <= ctrl_reg2[4]; // Mode Fault Enable
            bidiroe<= ctrl_reg2[3]; // Bidirectional Mode Output Enable
            spiswai<= ctrl_reg2[1]; // SPI Stop in Wait Mode
            spc0   <= ctrl_reg2[0]; // Unused bit (reserved)
        end
    end
endmodule
