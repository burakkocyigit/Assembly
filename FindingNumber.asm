TITLE Program FindingNumber     (FindingNumber.asm)

; Program Description:
; Author:
; Date Created:
; Last Modification Date:

INCLUDE Irvine32.inc
INCLUDE Macros.inc

; (insert symbol definitions here)

.data

random1 dword ?
random2 dword ?		;Random numbers variable
random3 dword ?
random4 dword ?

girilen1 dword ?
girilen2 dword ?
girilen3 dword ?	;Guess numbers variable
girilen4 dword ?

dizin byte 4 dup(0),0
girilendizin byte 4 dup(0),0	;Arrays for numbers
askagain byte 10 dup(0),0

.code
main PROC
call clrscr
mwrite "WELCOME"
call crlf
mov eax, 1000
call delay
mwrite"            by "
mov eax, 1000
call delay
mwrite"A"
mov eax, 1000
call delay
mwrite"Y"
mov eax, 1000
call delay
mwrite"B"
mov eax, 1000
call delay
mwrite"I"
mov eax, 1000
call delay
mwrite"K"
mov eax, 1000
call delay
mwrite"E"
mov eax, 1000
call delay
basadon:
call clrscr
call crlf
call crlf
;------------------------------------------------------------------------
call randomize
mov eax,10 ; 0 to 9	;Genarating Number for first number
call RandomRange
mov random1,eax
;-----------------------------------------------------------------------
belirle2:
	mov eax,10
	call RandomRange  ;Second number generating
	cmp random1,eax
	je belirle2
mov random2,eax
;-----------------------------------------------------------------------
belirle3:
	mov eax,10
	call RandomRange	;Third number generating and comparison
	cmp random1,eax
	je belirle3
	
	
	cmp random2,eax
	je belirle3
mov random3,eax
;--------------------------------------------------------------------------
belirle4:
	mov eax,10
	call RandomRange
	cmp random1,eax
	je belirle4

					;Fourth number generating and comparison
	
	cmp random2,eax
	je belirle4
	

	
	cmp random3,eax
	je belirle4
	
mov random4,eax
;------------------------------------------------------------------------
cmp random1,0
jne digit11
mov dizin[0],48
digit11:
cmp random1,1
jne digit12
mov dizin[0],49
digit12:
cmp random1,2
jne digit13
mov dizin[0],50
digit13:
cmp random1,3
jne digit14
mov dizin[0],51
digit14:
cmp random1,4
jne digit15
mov dizin[0],52
digit15:
cmp random1,5
jne digit16
mov dizin[0],53			;First Numbers converting to ASCII code
digit16:
cmp random1,6
jne digit17
mov dizin[0],54
digit17:
cmp random1,7
jne digit18
mov dizin[0],55
digit18:
cmp random1,8
jne digit19
mov dizin[0],56
digit19:
cmp random1,9
jne digit110
mov dizin[0],57
digit110:


cmp random2,0
jne digit21
mov dizin[1],48
digit21:
cmp random2,1
jne digit22
mov dizin[1],49
digit22:
cmp random2,2
jne digit23
mov dizin[1],50
digit23:				;Second Numbers converting to ASCII code
cmp random2,3
jne digit24
mov dizin[1],51
digit24:
cmp random2,4
jne digit25
mov dizin[1],52
digit25:
cmp random2,5
jne digit26
mov dizin[1],53
digit26:
cmp random2,6
jne digit27
mov dizin[1],54
digit27:
cmp random2,7
jne digit28
mov dizin[1],55
digit28:
cmp random2,8
jne digit29
mov dizin[1],56
digit29:
cmp random2,9
jne digit210
mov dizin[1],57
digit210:


cmp random3,0
jne digit31
mov dizin[2],48
digit31:
cmp random3,1
jne digit32
mov dizin[2],49
digit32:
cmp random3,2
jne digit33			;Third Numbers converting to ASCII code
mov dizin[2],50
digit33:
cmp random3,3
jne digit34
mov dizin[2],51
digit34:
cmp random3,4
jne digit35
mov dizin[2],52
digit35:
cmp random3,5
jne digit36
mov dizin[2],53
digit36:
cmp random3,6
jne digit37
mov dizin[2],54
digit37:
cmp random3,7
jne digit38
mov dizin[2],55
digit38:
cmp random3,8
jne digit39
mov dizin[2],56
digit39:
cmp random3,9
jne digit310
mov dizin[2],57
digit310:

cmp random4,0
jne digit41
mov dizin[3],48
digit41:
cmp random4,1
jne digit42
mov dizin[3],49
digit42:
cmp random4,2
jne digit43
mov dizin[3],50			;Fourth Numbers converting to ASCII code
digit43:
cmp random4,3
jne digit44
mov dizin[3],51
digit44:
cmp random4,4
jne digit45
mov dizin[3],52
digit45:
cmp random4,5
jne digit46
mov dizin[3],53
digit46:
cmp random4,6
jne digit47
mov dizin[3],54
digit47:
cmp random4,7
jne digit48
mov dizin[3],55
digit48:
cmp random4,8
jne digit49
mov dizin[3],56
digit49:
cmp random4,9
jne digit410
mov dizin[3],57
digit410:


mov dl,15
mov dh,15
call gotoxy

mov edx,offset dizin
call writestring

;----------------------------------------------------------------------------------------------------
mov edi,0            ;edi is keeping the number of try that user made

jmp first
;-----------------------------------------------------------------------------------------------------
newgame :
call clrscr
mwrite "CONGRATULATIONS YOU WIN"
call crlf
mwrite "the number of try that user made:"
mov eax,edi
call writeInt
call crlf
mwrite "Do you want to play again?(y/n)"
mov edx,offset askagain				;For only one digit
mov ecx,lengthof askagain-1
call readstring


cmp askagain[1],00000000h
jne newgame




push edi
push ecx
push eax
mov ecx,eax
mov edi,0
bidaha:
	or askagain[edi],00100000b		;upper case and lower case ignoring
	inc edi
	loop bidaha
pop eax
pop ecx
pop edi






mov al,79h
mov ah,6Eh
cmp askagain[0],al
je basadon
cmp askagain[0],ah		;Finishing or contuining game
je finish
jne newgame
;-----------------------------------------------------------------------------------------------------------
beep:
	mov ecx,3
	mov al,7h	;Genetaing beep voice three times
	start1:
	call writechar
	loop start1
;------------------------------------------------------------------------------------------------
first:
;mov dh,10
;mov dl,30
;call gotoxy
mov dh,0	
mov dl,0
call gotoxy
call crlf
call crlf

mwrite "enter the number:"

mov ecx,4
mov dh,1
mov dl,18
call gotoxy
call square			;Desing the inital condition



;mov edx,offset girilendizin
;mov ecx,lengthof girilendizin-1
;call readstring


gerigel1:
mov dh,2
mov dl,19
call gotoxy
call readchar
cmp al,48
jl tekrar1
cmp al,57
jg tekrar1
call writechar
mov girilendizin[0],al


gerigel2:
mov dh,2
mov dl,22			;Entering and showing guessed numbers
call gotoxy
call readchar
cmp al,48
jl tekrar2
cmp al,57
jg tekrar2
call writechar
mov girilendizin[1],al


gerigel3:
mov dh,2
mov dl,25
call gotoxy
call readchar
cmp al,48
jl tekrar3
cmp al,57
jg tekrar3
call writechar
mov girilendizin[2],al



gerigel4:
mov dh,2
mov dl,28
call gotoxy
call readchar
cmp al,48
jl tekrar4
cmp al,57
jg tekrar4
call writechar
mov girilendizin[3],al

jmp devam

tekrar1:
mov al,7h
call writechar
jmp gerigel1

tekrar2:
mov al,7h
call writechar
jmp gerigel2

tekrar3:
mov al,7h
call writechar
jmp gerigel3

tekrar4:
mov al,7h
call writechar
jmp gerigel4

devam:

inc edi
;--------------------------------------------------------------------------------------------------------

mov ecx,3
mov ebx,0
mov esi,1
kilitle:
	push ecx
	push esi
	innerkilitle:
		mov al,girilendizin[esi]
		cmp al,girilendizin[ebx]
		je beep				;Control for not enter same number for each guess
		inc esi
		loop innerkilitle
	inc ebx
	pop esi
	inc esi
	pop ecx
	loop kilitle
;--------------------------------------------------------------------------------------------------------
mov edx,0
mov ebp,0
mov ecx,4
mov ebx,0
karsilastir:
	mov al,dizin[ebx]
	cmp girilendizin[ebx],al
	jne atla
	inc edx				;Same location comparation
	atla:
	inc ebx
	loop karsilastir
				
mov ecx,4
mov ebx,0
mov esi,0
karsilastir2:
	push ecx
	mov ecx,4
	innerloop:
		mov ah,dizin[ebx]
		mov al,girilendizin[esi]
		cmp ah,al
		jne atla2
		dec ebp
		atla2:
		inc esi
		loop innerloop
	inc ebx					;true guess but different location comparation
	mov esi,0
	pop ecx
	loop karsilastir2
;-----------------------------------------------------------------------------------------------
mov ebx,0
mov al,dizin[0]
cmp girilendizin[0],al
jne output
inc ebx

mov al,dizin[1]
cmp girilendizin[1],al
jne output
inc ebx
				;True guess control
mov al,dizin[2]
cmp girilendizin[2],al
jne output
inc ebx

mov al,dizin[3]
cmp girilendizin[3],al
jne output
inc ebx

cmp ebx,4
je newgame
;--------------------------------------------------------------------------------------------------------
output:
call clrscr
mwrite "the result about your guess:"
mov eax,0
mov eax,edx	;-------------True number and true location declaration
call writeInt
add eax,ebp	;-------------true number but wrong location decleration
call writeInt
call crlf
call crlf
jmp first
;-----------------------------------------------------------------------------------------------------------

;-------------------------------------------------------------------------------------------------------------

finish:






;mov edx,offset girilendizin
;call writestring















;mov ecx,4
;mov ebx,0
;diziniyaz:
;	mov eax,dizin[ebx]
;	call writechar
;	inc ebx
;	loop diziniyaz
	








;convert PROC


;ret
;convert ENDP









	
	

	exit	; exit to operating system

main ENDP


; (insert additional procedures here)
	Square PROC ;draw square		;Squara Procedure
cmp ecx,0 ;check counter value
jz L2 ;quit if zero
call gotoxy

mov eax, 10
call delay
mov eax,201
call writechar

inc dl
mov eax, 10
call delay
mov eax,205

call gotoxy
call writechar

inc dl
mov eax, 10
call delay
mov eax,187

call gotoxy
call writechar

inc dh
mov eax, 10
call delay
mov eax,186

call gotoxy
call writechar

inc dh
mov eax, 10
call delay
mov eax,188

call gotoxy
call writechar


dec dl 
mov eax, 10
call delay
mov eax,205

call gotoxy
call writechar

dec dl
mov eax, 10
call delay
mov eax,200

call gotoxy
call writechar

dec dh
mov eax, 10
call delay
mov eax,186

call gotoxy
call writechar
dec dh
add dl,3 ;add dl 3 because of structure

dec ecx;loop contine until 0

call Square


L2: ret

Square ENDP
END main

