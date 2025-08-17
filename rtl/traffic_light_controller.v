// Traffic Light Controller FSM
// CMPEN 270 Project - Sadid Hassan
// States cycle through G -> Y -> R with override for car detection
// Using 3-bit state register (Q2 Q1 Q0)

module traffic_light_controller(
    input clk,          // clock input
    input reset,        // async reset
    input car_detect,   // input = 1 when a car is waiting
    output reg green,   // green light output
    output reg yellow,  // yellow light output
    output reg red      // red light output
);

    // state register (3 bits)
    reg [2:0] state, next_state;

    // State encoding (just keeping it simple binary)
    parameter S0 = 3'b000; // start green
    parameter S1 = 3'b001;
    parameter S2 = 3'b010;
    parameter S3 = 3'b011; // yellow
    parameter S4 = 3'b100; // red1
    parameter S5 = 3'b101; // red2
    parameter S6 = 3'b110;
    parameter S7 = 3'b111;

    // sequential (update state each clock cycle)
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= S0;
        else
            state <= next_state;
    end

    // next state logic
    always @(*) begin
        case(state)
            // green states (S0-S2) normally go to next green,
            // but if car_detect = 1, jump to yellow
            S0: next_state = car_detect ? S3 : S1;
            S1: next_state = car_detect ? S3 : S2;
            S2: next_state = car_detect ? S3 : S3; // either way, go yellow
            // yellow goes to red
            S3: next_state = S4;
            // red holds for two cycles
            S4: next_state = S5;
            S5: next_state = S0; // back to green
            // unused states (just reset them)
            S6: next_state = S0;
            S7: next_state = S0;
            default: next_state = S0;
        endcase
    end

    // output logic (Moore FSM, depends only on state)
    always @(*) begin
        // default off
        green  = 0;
        yellow = 0;
        red    = 0;
        case(state)
            S0, S1, S2: green  = 1; // green is majority of cycle
            S3: yellow = 1;
            S4, S5: red = 1;
        endcase
    end

endmodule
