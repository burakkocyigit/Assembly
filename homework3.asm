;Burak KOÇYÝÐÝT 150713851
TITLE Program Template     (template.asm)

; Program Description:
; Author:
; Date Created:
; Last Modification Date:

INCLUDE Irvine32.inc

; (insert symbol definitions here)

.data

money dword 200,100,50,20,10,5,1
money2 dword 0,0,0,0,0,0,0.0,0
str8 byte "The total:",0
str9 byte "The number you have entered is negative",0
var dword 0

.code
main PROC

call clrscr

mov ecx,lengthof money
mov ebx,0
mov edx,0
jmp start

again:

mov edi,0
push ecx
mov eax,7
sub eax,ecx
mov ecx,eax
call clrscr
mov edx,offset str9
call writestring
call crlf
cmp ecx,var
je order

write:
	
	mov eax,money[edi]
	call writedec
	mov al,'x'
	call writechar
	mov eax,money2[edi]
	call writedec
	call crlf
	add edi,4
	loop write
	pop ecx

start:
	mov eax,money[ebx]
	call writedec
	mov al,'x'
	call writechar
		call readint
		sub eax,0
		js again
	mov money2[ebx],eax
	mul money[ebx]
	add esi,eax
	add ebx,4

	loop start
mov eax,esi
mov edx,offset str8
call writestring
call writedec

cmp ecx,var
je finish
order:
pop ecx
jmp start
finish:




	exit	; exit to operating system
main ENDP

; (insert additional procedures here)

END main