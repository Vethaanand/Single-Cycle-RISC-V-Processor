module register_file(
    input  logic [4:0]  rs1_sel,
    input  logic [4:0]  rs2_sel,
    input  logic        reg_write,
    input  logic        clk,
    input  logic        reset,
    input  logic [31:0] wd_data,
    input  logic [4:0]  rd_sel,
    output logic [31:0] rs1_data,
    output logic [31:0] rs2_data
);

logic [31:0] registers [31:1];

// Combinational read
always_comb begin
    if (rs1_sel == 0)
        rs1_data = 32'b0;
    else
        rs1_data = registers[rs1_sel];

    if (rs2_sel == 0)
        rs2_data = 32'b0;
    else
        rs2_data = registers[rs2_sel];
end

// Asynchronous reset and synchronous write
always_ff @(posedge clk or posedge reset) begin
    if (reset) begin
        registers[1]  <= 32'b0;
        registers[2]  <= 32'b0;
        registers[3]  <= 32'b0;
        registers[4]  <= 32'b0;
        registers[5]  <= 32'b0;
        registers[6]  <= 32'b0;
        registers[7]  <= 32'b0;
        registers[8]  <= 32'b0;
        registers[9]  <= 32'b0;
        registers[10] <= 32'b0;
        registers[11] <= 32'b0;
        registers[12] <= 32'b0;
        registers[13] <= 32'b0;
        registers[14] <= 32'b0;
        registers[15] <= 32'b0;
        registers[16] <= 32'b0;
        registers[17] <= 32'b0;
        registers[18] <= 32'b0;
        registers[19] <= 32'b0;
        registers[20] <= 32'b0;
        registers[21] <= 32'b0;
        registers[22] <= 32'b0;
        registers[23] <= 32'b0;
        registers[24] <= 32'b0;
        registers[25] <= 32'b0;
        registers[26] <= 32'b0;
        registers[27] <= 32'b0;
        registers[28] <= 32'b0;
        registers[29] <= 32'b0;
        registers[30] <= 32'b0;
        registers[31] <= 32'b0;
    end
    else if (reg_write && rd_sel != 0) begin
        registers[rd_sel] <= wd_data;
    end
end

endmodule
