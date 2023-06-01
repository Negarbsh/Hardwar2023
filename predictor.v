module predictor(input wire request, result, clk, taken, output reg prediction);

reg [1:0] counter;
counter = 2'b00;
always @ (posedge clk)
    begin
        if (request)
            prediction <= counter[1];

        else if (result)
            begin
                if (taken == 1'b1)
                    if (counter != 2'b11)
                        counter <= counter + 1;
                else 
                    if (counter != 2'b00)
                        counter <= counter - 1;
            end

    end

endmodule