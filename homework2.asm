;Burak KOÇYÝÐÝT 150713851
TITLE Program homework2     (homework2.asm)

; Program Description:
; Author:
; Date Created:
; Last Modification Date:

INCLUDE Irvine32.inc



.data

str1 byte "Please enter firs text:",0
str2 byte "please enter second text:",0
str3 byte "total numbers of the same characters of texts:",0

buffer1 byte 50 dup (?),0
buffer2 byte 50 dup (?),0

.code
main PROC

mov edx,offset str1
call writestring
mov edx,offset buffer1
mov ecx,lengthof buffer1
call readstring
mov ebx,eax


mov edx,offset str2
call writestring
mov edx,offset buffer2
mov ecx,lengthof buffer2
call readstring
mov ecx,eax

cmp ecx,ebx
ja l1
jmp l2
l1:mov ecx,ebx
l2:
mov eax,0
mov edi,0
start:	mov bl,buffer1[edi]
	mov dl,buffer2[edi]
	cmp bl,dl
	jne notcount
	inc eax
	notcount:
	inc edi
	loop start
mov edx,offset str3
call writestring
call writeint	


	exit	; exit to operating system
main ENDP

; (insert additional procedures here)

END main