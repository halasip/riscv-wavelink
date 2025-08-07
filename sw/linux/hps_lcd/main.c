// ============================================================================
// Copyright (c) 2013 by Terasic Technologies Inc.
// ============================================================================
//
// Permission:
//
//   Terasic grants permission to use and modify this code for use
//   in synthesis for all Terasic Development Boards and Altera Development 
//   Kits made by Terasic.  Other use of this code, including the selling 
//   ,duplication, or modification of any portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL/Verilog or C/C++ source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Terasic provides no warranty regarding the use 
//   or functionality of this code.
//
// ============================================================================
//           
//  Terasic Technologies Inc
//  9F., No.176, Sec.2, Gongdao 5th Rd, East Dist, Hsinchu City, 30070. Taiwan
//  
//  
//                     web: http://www.terasic.com/  
//                     email: support@terasic.com
//
// ============================================================================

#include "terasic_os_includes.h"
#include "LCD_Lib.h"
#include "lcd_graphic.h"
#include "font.h"


#define HW_REGS_BASE ( ALT_STM_OFST )
#define HW_REGS_SPAN ( 0x04000000 )
#define HW_REGS_MASK ( HW_REGS_SPAN - 1 )

uint8_t flip_binary(uint8_t in) {
    uint8_t left1 = in << 1;
    uint8_t left3 = in << 3;
    uint8_t left5 = in << 5;
    uint8_t left7 = in << 7;
    uint8_t right1 = in >> 1;
    uint8_t right3 = in >> 3;
    uint8_t right5 = in >> 5;
    uint8_t right7 = in >> 7;
    uint8_t flipped =  (128 & left7) | (64 & left5) | (32 & left3) |  (16 & left1) |
                       (  8 & right1)| ( 4 & right3)| ( 2 & right5)|  ( 1 & right7);
    return flipped;
}    

void flip_content_vert(LCD_CANVAS *canvas) {
    uint8_t *pFrame_old = canvas->pFrame;
    //uint8_t *pFrame_new = (void *)malloc(canvas->FrameSize);
    uint8_t *pFrame_new = (uint8_t *)malloc(canvas->FrameSize);
    int i, j;
    int old_byte_pos, new_byte_pos;
    
    int width = canvas->Width;
    int height = canvas->Height;
    int framesize = canvas->FrameSize;
    uint8_t flipped_byte;
    
    printf("width: %d, height: %d, framesize: %d\n",width,height,framesize);
    printf("i upper bound: %d \n", (framesize/width)/2);
    
    /*
    for (i = 0; i < canvas->FrameSize; i = i+1 ) {
        //pFrame_new[(canvas->FrameSize)-i-1] = (pFrame_old)[i];
        pFrame_new[i] = pFrame_old[i];
        flipped_byte = flip_binary(pFrame_new[i]);
        printf("byte: 0x%02x\n, flipped: 0x%02x\n", pFrame_new[i], flipped_byte);
    }
    */
    
    
    for (i = 0; i < (framesize/width); i++) {
        for (j = 0; j < width; j++) { //iterate bytes
        /*
            pFrame_new[i] = pFrame_old[i];
            flipped_byte = flip_binary(pFrame_new[i]);
            printf("byte: 0x%02x, flipped: 0x%02x\n", pFrame_new[i], flipped_byte);
        */
        old_byte_pos =  (i * width) + j;
        new_byte_pos = framesize - (width*(i+1) ) + (width-1-j);
        flipped_byte = flip_binary(pFrame_old[old_byte_pos]);
        pFrame_new[new_byte_pos] = flipped_byte;
        //pFrame_new[old_byte_pos] = flipped_byte;
        
        printf("i:%d, j:%d, old_byte_pos:%d, new_byte_pos:%d \n", i, j, old_byte_pos, new_byte_pos);
        }
    }
    
    
    canvas->pFrame = pFrame_new;  
    free(pFrame_old); /* Free old frame, replaced by new one */
}    
int main() {

	void *virtual_base;
	int fd;

	
	LCD_CANVAS LcdCanvas;

		
	// map the address space for the LED registers into user space so we can interact with them.
	// we'll actually map in the entire CSR span of the HPS since we want to access various registers within that span
	if( ( fd = open( "/dev/mem", ( O_RDWR | O_SYNC ) ) ) == -1 ) {
		printf( "ERROR: could not open \"/dev/mem\"...\n" );
		return( 1 );
	}

	virtual_base = mmap( NULL, HW_REGS_SPAN, ( PROT_READ | PROT_WRITE ), MAP_SHARED, fd, HW_REGS_BASE );



	if( virtual_base == MAP_FAILED ) {
		printf( "ERROR: mmap() failed...\n" );
		close( fd );
		return( 1 );
	}


		
	//printf("Can you see LCD?(CTRL+C to terminate this program)\r\n");
	printf("Graphic LCD Demo\r\n");
		
		LcdCanvas.Width = LCD_WIDTH;
		LcdCanvas.Height = LCD_HEIGHT;
		LcdCanvas.BitPerPixel = 1;
		LcdCanvas.FrameSize = LcdCanvas.Width * LcdCanvas.Height / 8;
		LcdCanvas.pFrame = (void *)malloc(LcdCanvas.FrameSize);
		
	if (LcdCanvas.pFrame == NULL){
			printf("failed to allocate lcd frame buffer\r\n");
	}else{			
		
	
		LCDHW_Init(virtual_base);
		LCDHW_BackLight(true); // turn on LCD backlight
		
    LCD_Init();
   
    // clear screen
    DRAW_Clear(&LcdCanvas, LCD_WHITE);

		// demo grphic api    
    //DRAW_Rect(&LcdCanvas, 0,0, LcdCanvas.Width-1, LcdCanvas.Height-1, LCD_BLACK); // retangle
    //DRAW_Circle(&LcdCanvas, 10, 10, 6, LCD_BLACK);
    //DRAW_Circle(&LcdCanvas, LcdCanvas.Width-10, 10, 6, LCD_BLACK);
    //DRAW_Circle(&LcdCanvas, LcdCanvas.Width-10, LcdCanvas.Height-10, 6, LCD_BLACK);
    //DRAW_Circle(&LcdCanvas, 10, LcdCanvas.Height-10, 6, LCD_BLACK);
    //experiment
    //DRAW_Rect(&LcdCanvas, 10,10, LcdCanvas.Width-10, LcdCanvas.Height-10, LCD_BLACK); // retangle
    //DRAW_Rect(&LcdCanvas, 20,20, LcdCanvas.Width-20, LcdCanvas.Height-20, LCD_BLACK); // retangle
    //DRAW_Rect(&LcdCanvas, 30,30, LcdCanvas.Width-30, LcdCanvas.Height-30, LCD_BLACK); // retangle
    
    // demo font
    DRAW_PrintString(&LcdCanvas, 40, 5, "ALMA", LCD_BLACK, &font_16x16);
    DRAW_PrintString(&LcdCanvas, 40, 5+16, "BLMA", LCD_BLACK, &font_16x16);
	DRAW_PrintString(&LcdCanvas, 40, 5+32, "CLMA", LCD_BLACK, &font_16x16);
     
     // Vertica line from (0,0)
     DRAW_Pixel(&LcdCanvas, 0, 0, LCD_BLACK);
     DRAW_Pixel(&LcdCanvas, 0, 1, LCD_BLACK);
     DRAW_Pixel(&LcdCanvas, 0, 2, LCD_BLACK);
     DRAW_Pixel(&LcdCanvas, 0, 3, LCD_BLACK);
     DRAW_Pixel(&LcdCanvas, 0, 4, LCD_BLACK);
     DRAW_Pixel(&LcdCanvas, 0, 5, LCD_BLACK);
     DRAW_Pixel(&LcdCanvas, 0, 6, LCD_BLACK);
     DRAW_Pixel(&LcdCanvas, 0, 7, LCD_BLACK);
     
     //Horizonatl line at the end of first row
     DRAW_Pixel(&LcdCanvas, 100, 0, LCD_BLACK);
     DRAW_Pixel(&LcdCanvas, 101, 0, LCD_BLACK);
     DRAW_Pixel(&LcdCanvas, 102, 0, LCD_BLACK);
     DRAW_Pixel(&LcdCanvas, 103, 0, LCD_BLACK);
     DRAW_Pixel(&LcdCanvas, 104, 0, LCD_BLACK);
     DRAW_Pixel(&LcdCanvas, 105, 0, LCD_BLACK);
     DRAW_Pixel(&LcdCanvas, 106, 0, LCD_BLACK);
     DRAW_Pixel(&LcdCanvas, 107, 0, LCD_BLACK);
     
    flip_content_vert(&LcdCanvas); // experiment
    DRAW_Refresh(&LcdCanvas);
    
    
    free(LcdCanvas.pFrame);
	}    
  
	// clean up our memory mapping and exit
	
	if( munmap( virtual_base, HW_REGS_SPAN ) != 0 ) {
		printf( "ERROR: munmap() failed...\n" );
		close( fd );
		return( 1 );
	}

	close( fd );

	return( 0 );
}
