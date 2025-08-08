#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include "hwlib.h"
#include "socal/socal.h"
#include "socal/hps.h"
#include "socal/alt_gpio.h"
#include "socal/alt_sysmgr.h"

#define HW_REGS_BASE ( ALT_STM_OFST )
#define HW_REGS_SPAN ( 0x04000000 )
#define HW_REGS_MASK ( HW_REGS_SPAN - 1 )

#define USER_IO_DIR     (0x01000000)
#define BIT_LED         (0x01000000)
#define BUTTON_MASK     (0x02000000)

ALT_SYSMGR_HPSINFO_t get_hpsinfo(void *virtual_base) {
	uint32_t raw = alt_read_word( virtual_base + ( (uint32_t)(ALT_SYSMGR_HPSINFO_ADDR ) & (( uint32_t )( HW_REGS_MASK )) ));
	ALT_SYSMGR_HPSINFO_t hpsinfo = {
		ALT_SYSMGR_HPSINFO_DUALCORE_GET(raw),
		ALT_SYSMGR_HPSINFO_CAN_GET(raw)
	};
	return hpsinfo;
}


int main(int argc, char **argv) {

	void *virtual_base;
	int fd;
	uint32_t siliconid1;
	uint16_t sil_id, sil_rev;
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

	siliconid1 = alt_read_word( virtual_base + ( (uint32_t)(ALT_SYSMGR_SILICONID1_ADDR ) & (( uint32_t )( HW_REGS_MASK )) ));
	//printf("Silicon ID raw: %08X \n", siliconid1 );
	sil_rev = (uint16_t) ALT_SYSMGR_SILICONID1_REV_GET(siliconid1);
	sil_id  = (uint16_t) ALT_SYSMGR_SILICONID1_ID_GET(siliconid1);
	printf("Silicon ID: %02X, Silicon Revision: %02X \n", sil_id, sil_rev);

	printf("Testing struct based access... \n");
	ALT_SYSMGR_SILICONID1_t siliconid1_struct = {ALT_SYSMGR_SILICONID1_REV_GET(siliconid1), ALT_SYSMGR_SILICONID1_ID_GET(siliconid1) };
	printf("Silicon ID: %02X, Silicon Revision: %02X \n", siliconid1_struct.id, siliconid1_struct.rev);

	//HPSINFO
	ALT_SYSMGR_HPSINFO_t hpsinfo = get_hpsinfo(virtual_base);
	printf("Dualcore: %08X, CAN: %08X \n", hpsinfo.dualcore, hpsinfo.can);


	//CPU number of cores
	close( fd );
	return( 0 );
}
