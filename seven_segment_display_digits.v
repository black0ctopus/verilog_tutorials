
//////////////////////////////////////////////////////////////////////////////////
module seven_segment_display_digits #( parameter NUMBER_OF_SEVEN_SEGMENT_LEDS = 4)
// number of seven segment digits available on a display
	(	input [3:0] bcd ,		// binary code to decimal 
		output [NUMBER_OF_SEVEN_SEGMENT_LEDS -1: 0] seven_seg_led_number,
		output reg[7:0] digit_to_display
    );
	 /*active low i.e. segment a,b,c,d,e,f,g 
	 *are on when '0' assertedinstead of '1'
	 *most significant bit DP, g,f,e,d,c,b,a least significant bit
	   a
	   --
	f |  | b
	 g --
	e |  | c
	   --
	   d   .DP
	 */
	 /*PARAMETER WITH DP DIACTIVATED BY DEFAULT*/
	 parameter ZERO = 		8'b11000000;
	 parameter ONE = 		8'b11111001;
	 parameter TWO = 		8'b10100100;
	 parameter THREE = 		8'b10110000;
	 parameter FOUR = 		8'b10011001;
	 parameter FIVE = 		8'b10010010;
	 parameter SIX = 		8'b10000010;
	 parameter SEVEN = 		8'b11111000;
	 parameter EIGHT = 		8'b10000000;
	 parameter NINE = 		8'b10010000;
	 parameter DEFAULT = 		8'b11111111; //disable every segment
	 
	 always@(bcd) begin
		case(bcd)
			0: digit_to_display = ZERO;
			1: digit_to_display = ONE;
			2: digit_to_display = TWO;
			3: digit_to_display = THREE;
			4: digit_to_display = FOUR;
			5: digit_to_display = FIVE;
			6: digit_to_display = SIX;
			7: digit_to_display = SEVEN;
			8: digit_to_display = EIGHT;
			9: digit_to_display = NINE;
			default: digit_to_display = DEFAULT;
		endcase
	 end


endmodule
