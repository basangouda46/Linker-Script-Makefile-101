CC:=arm-none-eabi-gcc
CCFLAGS:= -nostdlib -r -o
LDFLAGS:= -T
LINKER:= linker.ld
OBJECTS:= main.o

main.elf : $(LINKER) $(OBJECTS) 
	$(CC) $(CCFLAGS) $@ $(OBJECTS) $(LDFLAGS) $(LINKER)

main.o : main.c
	$(CC) $(CCFLAGS) $@ $^

clean:
	rm -rf *.o 
	rm -rf *.elf

