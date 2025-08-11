#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include "hwlib.h"
#include "socal/socal.h"
#include "socal/hps.h"
#include "socal/alt_gpio.h"
#include <time.h>
#include "fpga_only_master.h"

#define HW_REGS_BASE ( ALT_STM_OFST )
#define HW_REGS_SPAN ( 0x04000000 )
#define HW_REGS_MASK ( HW_REGS_SPAN - 1 )

#define USER_IO_DIR     (0x01000000)
#define BIT_LED         (0x01000000)
#define BUTTON_MASK     (0x02000000)

int main(int argc, char **argv) {



        void *virtual_base;
        int fd;
        uint32_t  scan_input;
        int i;
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
	


	time_t rawtime;
	struct tm * timeinfo;

        while(1){
		if (~alt_read_word((virtual_base+((uint32_t)( ALT_GPIO1_EXT_PORTA_ADDR )&(uint32_t)(HW_REGS_MASK))))&BUTTON_MASK) {
			break;
		}
	   
		time ( &rawtime );
	   
		timeinfo = localtime ( &rawtime );
  	        
		scan_input = 0;
		scan_input += (( timeinfo->tm_sec % 10 ) << 0  ) ; 
		scan_input += (( timeinfo->tm_sec / 10 ) << 4  ) ; 

		scan_input += (( timeinfo->tm_min % 10 ) << 8  ) ; 
		scan_input += (( timeinfo->tm_min / 10 ) << 12 ) ; 
		

		scan_input += (( timeinfo->tm_hour % 10 ) << 16 ) ; 
		scan_input += (( timeinfo->tm_hour / 10 ) << 20 ) ; 

		usleep(1000*1000);
                alt_write_word( ( virtual_base + ( ( uint32_t )( ALT_LWFPGASLVS_ADDR + HEX_PIO_BASE ) & ( uint32_t )( HW_REGS_MASK ) ) ), scan_input );
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



