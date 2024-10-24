module task_example;

  reg [7:0] a, b, c, result_auto, result_non_auto;

  // Automatic Task
  task automatic automatic_add;
    input [7:0] x, y, z;
    output [7:0] result;
    begin
      result = x + y + z;
    end
  endtask

  // Non-Automatic Task
  task non_auto_add;
    input [7:0] x, y, z;
    output [7:0] result;
    begin
      result = x + y + z;
    end
  endtask

  initial begin
    a = 5; b = 10; c = 15;

    automatic_add(a, b, c, result_auto);
    $display("Automatic Task Result: %d", result_auto);

    non_auto_add(a, b, c, result_non_auto);
    $display("Non-Automatic Task Result: %d", result_non_auto);
  end

endmodule
