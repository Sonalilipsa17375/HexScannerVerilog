//Scans for row of the asserted key

module Row_Signal(                                                
    input [15:0] Key,
    input [3:0] Col,
    output reg [3:0] Row
    );

//Combinational logic for key assertion

    always @(Key or Col) begin                                  
    Row[0] =  Key[0] && Col[0] || Key[1] && Col[1] || Key[2] && Col[2] || Key[3] && Col[3];
    Row[1] =  Key[4] && Col[0] || Key[5] && Col[1] || Key[6] && Col[2] || Key[7] && Col[3];
    Row[2] =  Key[8] && Col[0] || Key[9] && Col[1] || Key[10] && Col[2] || Key[11] && Col[3];
    Row[3] =  Key[12] && Col[0] || Key[13] && Col[1] || Key[14] && Col[2] || Key[15] && Col[3];
    end

endmodule
