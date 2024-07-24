module Hex_Keypad_Grayhill_072(
    input [3:0] Row,
    input S_Row,
    input clock,
    input reset,
    output reg [3:0] Code,
    output Valid,
    output reg [3:0] Col
);

    reg [5:0] state, next_state;

    // one-hot encoding for states
    parameter S_0 = 6'b000001, S_1 = 6'b000010, S_2 = 6'b000100;
    parameter S_3 = 6'b001000, S_4 = 6'b010000, S_5 = 6'b100000;

    // valid signal logic
    assign Valid = ((state == S_1) || (state == S_2) || (state == S_3) || (state == S_4)) && Row;

   //decode the asserted row and col
    always @(Row or Col) begin
        case ({Row, Col})
            8'b0001_0001: Code = 4'h0; 
            8'b0001_0010: Code = 4'h1;
            8'b0001_0100: Code = 4'h2; 
            8'b0001_1000: Code = 4'h3;
            8'b0010_0001: Code = 4'h4; 
            8'b0010_0010: Code = 4'h5;
            8'b0010_0100: Code = 4'h6;
            8'b0010_1000: Code = 4'h7;
            8'b0100_0001: Code = 4'h8;
            8'b0100_0010: Code = 4'h9;
            8'b0100_0100: Code = 4'hA; // A
            8'b0100_1000: Code = 4'hB; // B
            8'b1000_0001: Code = 4'hC; // C
            8'b1000_0010: Code = 4'hD; // D
            8'b1000_0100: Code = 4'hE; // E
            8'b1000_1000: Code = 4'hF; // F
            default: Code = 4'h0;       // Default value
        endcase
    end

    // State transition logic
    always @(posedge clock or posedge reset) begin
        if (reset)
            state <= S_0;
        else
            state <= next_state;
    end

    // Next-state logic
    always @(state or S_Row or Row) begin
        next_state = state;
        Col = 4'b0000;
        case (state)
            S_0: begin
                Col = 4'b1111;
                if (S_Row) 
                    next_state = S_1;
            end
            S_1: begin
                Col = 4'b0001;
                if (Row) 
                    next_state = S_5;
                else 
                    next_state = S_2;
            end
            S_2: begin
                Col = 4'b0010;
                if (Row) 
                    next_state = S_5;
                else 
                    next_state = S_3;
            end
            S_3: begin
                Col = 4'b0100;
                if (Row) 
                    next_state = S_5;
                else 
                    next_state = S_4;
            end
            S_4: begin
                Col = 4'b1000;
                if (Row) 
                    next_state = S_5;
                else 
                    next_state = S_0;
            end
            S_5: begin
                Col = 4'b1111;
                if (Row == 4'b0000)
                    next_state = S_0;
            end
        endcase
    end

endmodule
