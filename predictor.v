module predictor(input wire request, result, clk, taken, output reg prediction);

reg [1:0] counter = 2'b11;

always@(posedge clk)
    begin
        if (request)
            prediction = counter[1];

        if (result)
            begin
                if (taken == 1'b1)
                    begin
                        if (!(counter[0] == 1 && counter[1] == 1))
                            begin
                                counter = counter + 1;
                            end
                    end
                else 
                    begin
                        if (!(counter[0] == 0 && counter[1] == 0))
                            counter = counter - 1;
                    end
            end

    end

endmodule

