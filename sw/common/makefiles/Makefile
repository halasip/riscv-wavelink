#
TARGET = hps
ALT_DEVICE_FAMILY ?= soc_cv_av
SOCEDS_ROOT ?= $(SOCEDS_DEST_ROOT)
#HWLIB For local compilation on SOC
HWLIBS_ROOT = /home/root/hwlib
CROSS_COMPILE = arm-linux-gnueabihf-
CFLAGS = -static -g -Wall   -D$(ALT_DEVICE_FAMILY) -I$(HWLIBS_ROOT)/include/   -I$(HWLIBS_ROOT)/include/
LDFLAGS =  -g -Wall
CC = $(CROSS_COMPILE)gcc
ARCH= arm

IP = 172.16.220.97


build: $(TARGET)


$(TARGET): main.o   \


	$(CC) $(LDFLAGS)   $^ -o $@   -lrt -lm
%.o : %.c
	$(CC) $(CFLAGS) -c $< -o $@

.PHONY: clean
clean:
	rm -f $(TARGET) *.a *.o *~ *.bmp *.log


.PHONY: test
test: clean
	ssh root@${IP} "rm -rf test_sandbox/ ; mkdir test_sandbox"
	scp -rp . root@${IP}:~/test_sandbox/

	# Adding a - prefix to continue on errors
	-@ssh root@${IP} "         \
		cd ~/test_sandbox/    ;\
		make > build.log     &&\
		./$(TARGET) 2>&1 | tee run.log\
		echo Finished \
		" 2>&1 >  local.log

	scp -rp  root@${IP}:~/test_sandbox/*.log ./






