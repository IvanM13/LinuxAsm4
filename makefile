lin4: lin4.o
	gcc -o lin4 lin4.o -no-pie
lin4.o: lin4.asm
	nasm -f elf64 -g -F dwarf lin4.asm -l lin4.lst