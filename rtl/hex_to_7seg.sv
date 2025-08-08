

module hex_to_7seg #(
	parameter int DIGITS = 6
	)(
	input  logic [DIGITS*4 -1:0] hex_vec,
	output logic [DIGITS*7 -1:0] seg_vec
	);
	
	genvar idx;
		generate

			for ( idx = 0; idx < DIGITS; idx++ ) begin : case_generate

	always_comb begin
				case(hex_vec[idx*4 +:   4])
					4'h0: seg_vec[idx*7 +:  7 ] = 7'b0111111;
					4'h1: seg_vec[idx*7 +:  7 ] = 7'b0000110;
					4'h2: seg_vec[idx*7 +:  7 ] = 7'b1011011;
					4'h3: seg_vec[idx*7 +:  7 ] = 7'b1001111;
					4'h4: seg_vec[idx*7 +:  7 ] = 7'b1100110;
					4'h5: seg_vec[idx*7 +:  7 ] = 7'b1101101;
					4'h6: seg_vec[idx*7 +:  7 ] = 7'b1111101;
					4'h7: seg_vec[idx*7 +:  7 ] = 7'b0000111;
					4'h8: seg_vec[idx*7 +:  7 ] = 7'b1111111;
					4'h9: seg_vec[idx*7 +:  7 ] = 7'b1101111;
					4'hA: seg_vec[idx*7 +:  7 ] = 7'b1110111;
					4'hB: seg_vec[idx*7 +:  7 ] = 7'b1111100;
					4'hC: seg_vec[idx*7 +:  7 ] = 7'b1011000;
					4'hD: seg_vec[idx*7 +:  7 ] = 7'b1011110;
					4'hE: seg_vec[idx*7 +:  7 ] = 7'b1111001;
					default : seg_vec[idx*7 +:  7 ] = 7'b1110001; // 4'hF
				endcase
		end
			end
		endgenerate
	
endmodule