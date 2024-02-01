
CROSS_COMPILE = arm-none-eabi-
CC := $(CROSS_COMPILE)gcc
CCFLAGS = -nostdlib -r -o
LDFLAGS = -T
LINKER = linker.ld
OBJECTS = main.o
LIBS = libadd.a libmultiply.a

VPATH = add:multiply

.DEFAULT_GOAL = main.elf

# the prefix lib needs to be removed when passing for compiling and .a needs to be removed
# example shows linking 2 libraries

a.out : main.c libadd.a libmultiply.a
	gcc main.c -L ./add -l add -L ./multiply -l multiply


main.elf : $(LINKER) $(OBJECTS) $(LIBS)
	$(CC) $(CCFLAGS) $@ $(OBJECTS) -L ./add -l add -L ./multiply -l multiply $(LDFLAGS) $(LINKER)

main.o : main.c
	$(CC) $(CCFLAGS) $@ $^

# need to add -c option to compile non-main containing files

add/add.o : add.c
	gcc -c $^ -o $@

multiply/multiply.o : multiply.c 
	gcc -c $^ -o $@

add/libadd.a : add.o 
	ar rcs $@ $^

multiply/libmultiply.a : multiply.o 
	ar rcs $@ $^

# to-do: clean from subdir

clean:
	rm -rf *.o 
	rm -rf *.elf
	rm -rf *.out
	rm -rf *.a

