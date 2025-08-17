// Testbench for Traffic Light Controller FSM
// CMPEN 270 Project - Sadid Hassan
// Just runs through a clock, resets, and toggles car_detect

`timescale 1ns/1ps
module tb_traffic_light_controller;

    reg clk;
    reg reset;
    reg car_detect;
    wire green, yellow, red;

    // connect to DUT (device under test)
    traffic_light_controller dut(
        .clk(clk),
        .reset(reset),
        .car_detect(car_detect),
        .green(green),
        .yellow(yellow),
        .red(red)
    );

    // clock gen (10ns period)
    always #5 clk = ~clk;

    initial begin
        // dump waves (if running in EDAPlayground/GTKWave)
        $dumpfile("traffic_light.vcd");
        $dumpvars(0, tb_traffic_light_controller);

        // init
        clk = 0;
        reset = 1;
        car_detect = 0;
        #10;

        reset = 0; // release reset

        // let it run without cars for a while
        #50;

        // simulate car detection
        car_detect = 1;
        #20;
        car_detect = 0;

        // run a few more cycles
        #100;

        $finish;
    end

endmodule
