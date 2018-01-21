TITLE Program homework1     (homework1.asm)


INCLUDE Irvine32.inc



.data
string1 byte "How many numbers will you enter:",0
string2 byte "please enter a number:",0
string3 byte "The addition =",0



.code
main PROC
call clrscr


mov ebx, 0
mov edx, offset string1
call writestring
call readint
mov ecx,eax

start:
	mov edx, offset string2
	call writestring
	call readint
	add ebx,eax
	loop start
	
	mov edx, offset string3
	call writestring
	mov eax,ebx
	call writeint

	exit
main ENDP


END main