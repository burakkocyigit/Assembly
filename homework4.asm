;Burak KOÇYÝÐÝT 150713851
TITLE Program homework4     (homework4.asm)

; Program Description:
; Author:
; Date Created:
; Last Modification Date:

INCLUDE Irvine32.inc

; (insert symbol definitions here)

.data

msg1 byte "PLEASE ENTER A NUMBER WHICH IS BETWEEN 0 AND 100:",0
msg2 byte "THE NUMBER YOU HAVE ENTERED IS BIGGER",0
msg3 byte "THE NUMBER YOU HAVE ENTERED IS SMALLER",0
msg4 byte "THE ANSWER IS TRUE",0
msg5 byte "THE NUMBER YOU HAVE ENTERED IS NEGATÝVE",0
msg6 byte "YOU HAVE TRIED ",0
msg7 byte " TIMES",0

.code

msgyaz MACRO adres

push edx
mov edx,offset adres
call writestring
pop edx

ENDM

main PROC

call clrscr

mov edi,0
call randomize
mov eax,100
call randomrange
mov ebx,eax
jmp start

bigger:
inc edi
call clrscr
msgyaz msg2
call crlf
msgyaz msg1
call readint
sub eax,0
js sign
cmp eax,ebx
je son
ja bigger
jb smaller

smaller:
inc edi
call clrscr
msgyaz msg3
call crlf
msgyaz msg1
call readint
sub eax,0
js sign
cmp eax,ebx
je son
ja bigger
jb smaller

sign:
call clrscr
msgyaz msg5
call crlf

start:
inc edi
msgyaz msg1
call readint
sub eax,0
js sign
cmp eax,ebx
ja bigger
jb smaller

son:
msgyaz msg4
call crlf
msgyaz msg6
mov eax,edi
call writedec
msgyaz msg7

	exit	; exit to operating system
main ENDP

; (insert additional procedures here)

END main
