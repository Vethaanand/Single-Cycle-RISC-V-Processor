module wb_stage (
    input  logic [31:0] mem_out,
    input  logic [31:0] alu_out,
    input  logic [31:0] return_addr,
    input  logic [31:0] imm_out,
    input  logic [31:0] pc_signed_offset,
    input  logic [1:0]  memtoreg,
    input  logic [6:0]  opcode,
    output logic [31:0] wd_data
);

    always_comb begin
        case (memtoreg)
            2'b00: wd_data = alu_out;
            2'b01: wd_data = mem_out;

            2'b10: begin
                case (opcode)
                    7'b1101111,
                    7'b1100111: wd_data = return_addr;      // JAL/JALR
                    7'b0110111: wd_data = imm_out;           // LUI
                    7'b0010111: wd_data = pc_signed_offset;  // AUIPC
                    default:    wd_data = alu_out;
                endcase
            end

            2'b11: wd_data = alu_out;
            default: wd_data = alu_out;
        endcase
    end

endmodule
