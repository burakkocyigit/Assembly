TITLE Program homework5     (homework5.asm)

; Program Description:
; Author:
; Date Created:
; Last Modification Date:

INCLUDE Irvine32.inc

; (insert symbol definitions here)

.data

numbers dword 10 dup(0),0

; (insert variables here)

.code
main PROC

mov edi,0



push eax
mov eax,white
call settextcolor
pop eax
call randomize
mov eax,1000
call randomrange
mov numbers[edi], eax
mov eax,numbers[edi]
inc edi
push eax
mov ecx,1
outerloop1:
	mov eax,32
	call writechar
	loop outerloop1
pop eax
call writehex
call crlf

push eax
mov eax,green
call settextcolor
pop eax
call randomize
mov eax,1000
call randomrange
mov numbers[edi], eax
mov eax,numbers[edi]
inc edi
push eax
mov ecx,2
outerloop2:
	mov eax,32
	call writechar
	loop outerloop2
pop eax
call writehex
call crlf

push eax
mov eax,red
call settextcolor
pop eax
call randomize
mov eax,1000
call randomrange
mov numbers[edi], eax
mov eax,numbers[edi]
inc edi
push eax
mov ecx,3
outerloop3:
	mov eax,32
	call writechar
	loop outerloop3
pop eax
call writehex
call crlf

push eax
mov eax,blue
call settextcolor
pop eax
call randomize
mov eax,1000
call randomrange
mov numbers[edi], eax
mov eax,numbers[edi]
inc edi
push eax
mov ecx,4
outerloop4:
	mov eax,32
	call writechar
	loop outerloop4
pop eax
call writehex
call crlf

push eax
mov eax,brown
call settextcolor
pop eax
call randomize
mov eax,1000
call randomrange
mov numbers[edi], eax
mov eax,numbers[edi]
inc edi
push eax
mov ecx,5
outerloop5:
	mov eax,32
	call writechar
	loop outerloop5
pop eax
call writehex
call crlf

push eax
mov eax,yellow
call settextcolor
pop eax
call randomize
mov eax,1000
call randomrange
mov numbers[edi], eax
mov eax,numbers[edi]
inc edi
push eax
mov ecx,6
outerloop6:
	mov eax,32
	call writechar
	loop outerloop6
pop eax
call writehex
call crlf

push eax
mov eax,blue
call settextcolor
pop eax
call randomize
mov eax,1000
call randomrange
mov numbers[edi], eax
mov eax,numbers[edi]
inc edi
push eax
mov ecx,7
outerloop7:
	mov eax,32
	call writechar
	loop outerloop7
pop eax
call writehex
call crlf

push eax
mov eax,yellow
call settextcolor
pop eax
call randomize
mov eax,1000
call randomrange
mov numbers[edi], eax
mov eax,numbers[edi]
inc edi
push eax
mov ecx,8
outerloop8:
	mov eax,32
	call writechar
	loop outerloop8
pop eax
call writehex
call crlf

push eax
mov eax,white
call settextcolor
pop eax
call randomize
mov eax,1000
call randomrange
mov numbers[edi], eax
mov eax,numbers[edi]
inc edi
push eax
mov ecx,9
outerloop9:
	mov eax,32
	call writechar
	loop outerloop9
pop eax
call writehex
call crlf

push eax
mov eax,red
call settextcolor
pop eax
call randomize
mov eax,1000
call randomrange
mov numbers[edi], eax
mov eax,numbers[edi]
push eax
mov ecx,10
outerloop10:
	mov eax,32
	call writechar
	loop outerloop10
pop eax
call writehex
call crlf






;call DumpRegs





; (insert executable instructions here)

	exit	; exit to operating system
main ENDP

; (insert additional procedures here)

END main