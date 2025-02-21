`timescale 1ns / 1ps



/*module assignmentA31_tb();
    reg [7:0] a = 8'd12;
    reg [7:0] b = 8'd34;
    
    integer c = 67;
    integer d = 255;
   
    time fix_time = 0;
     
    initial begin
    #12
    fix_time = $time();
    $display("A: %0d, B: %0d, C: %0d, D: %0d", a, b, c, d);
    $display("Time: %t", fix_time);
    end
    
endmodule*/


module assignmentA32_tb();

    int i;
    integer arr[10];
    
    initial begin
    for(i=0; i<10; i = i+1)
        begin
            arr[i] = i**2;
            $display("Arr[%0d]: %0d",i, arr[i]);
        end
         $display("Array: %0p", arr);
    end
    
endmodule 

/*module assignmentA33_tb;
    reg arr1[15];
    reg arr2[15];
    
    
    initial begin
    for(int i = 0; i<15; i++) begin
        arr1[i] = $urandom % 100;
        arr2[i] = $urandom %100;
    end 
    $display("Array1: %0p, Size is: %0d", arr1, $size(arr1));
    $display("Array2: %0p", arr2);
    end
    
endmodule*/

/*module assignmentA34;
    int arr[];
    
    initial begin 
    arr = new[7];
    
    foreach(arr[i]) begin
        arr[i] = (i+1)*7;
    end
    
    
    $display("Arr: %0p", arr);    
    #20;    
    arr = new[20](arr);
    
    for(int i = 7; i < 20; i++) begin
        arr[i] = (i-6)*5;
    end  
    
    $display("Arr: %0p", arr);       
    end    
endmodule*/

/*module assignmentA35;
    int fix_array[20];
    int queue_arr[$];
    
    initial begin
        for(int i = 0; i<20; i++) begin
           fix_array[i] = $urandom %100;
        end
        
        for(int i = 0; i<20; i++) begin
            queue_arr.push_front(fix_array[i]);
        end
        $display("Fixed Arr: %0p", fix_array);
        $display("Queue: %0p", queue_arr);      
                
    end    
    
endmodule*/