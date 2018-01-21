TITLE Program FindingWord     (FindingWord.asm)

; Program Description:
; Author:
; Date Created:
; Last Modification Date:

INCLUDE Irvine32.inc
INCLUDE Macros.inc


.data

girilen byte 50 dup (0),0
lgirilen dword ?
sakla byte 400 dup (0),0
lsakla dword 20
lword dword 10
answer byte 1 dup (0),0
saveletters byte 10 dup (0),0
resultmatris byte 400 dup ('b'),0

.code




matris MACRO dongu

push ebx
push ecx
mov ebx,0
mov ecx,20
dongu1:
	push ecx
	mov ecx,20
	dongu2:
		mov al,sakla[ebx]
		call writechar
		mov al,' '
		call writechar
		inc ebx
		loop dongu2
	pop ecx
	call crlf
	loop dongu1
pop ecx
pop ebx

ENDM



convert MACRO convertsmall

push edi
push ecx
push eax
mov ecx,eax
mov edi,0
convertsmall:
	or girilen[edi],00100000b
	inc edi
	loop convertsmall
pop eax
pop ecx
pop edi

ENDM




convertanswer MACRO convertsmall

push edi
push ecx
push eax
mov ecx,eax
mov edi,0
convertsmall:
	or answer[edi],00100000b
	inc edi
	loop convertsmall
pop eax
pop ecx
pop edi

ENDM



main PROC

refresh:

push eax
push ecx
push ebx
mov al,'b'
mov ecx,400
mov ebx,0
fill:
	mov resultmatris[ebx],al
	inc ebx
	loop fill
pop ebx	
pop ecx
pop eax	


mov eax,white
call settextcolor

call clrscr

call randomize

mov ebx,0
mov ecx,20
outerloop:
	push ecx
	mov ecx,20
	innerloop:
		mov eax,26
		call randomrange
		add eax,97
		call writechar
		mov sakla[ebx],al
		mov al,' '
		call writechar
		inc ebx
		loop innerloop
	pop ecx
	call crlf
	loop outerloop

jmp first




appropriate:

mov ecx,3
mov al,7h
start1:
	call writechar
	loop start1

again:

call clrscr
matris loop



first:
mwrite "Enter the string:"
mov edx,offset girilen
mov ecx,lengthof girilen-1
call readstring
mov lgirilen,eax

cmp lword,eax
jb appropriate



;-------------------------------------------------------------------------
push eax
push ebx
push esi
push ecx
mov ebx,0
mov esi,0
mov ecx,eax
savegirilen:
	mov al,girilen[ebx]
	mov saveletters[esi],al
	inc ebx
	inc esi
	loop savegirilen
pop ecx
pop esi
pop ebx
pop eax
;----------------------------------------------------------------------------
convert l1
;----------------------------------------------------------------------------
push eax
push ebx
push ecx
mov ebx,0
mov ecx,eax

checkcharacters:
	mov al,girilen[ebx]
	cmp al,61h
	jb appropriate
	cmp al,7Ah
	ja appropriate
	inc ebx
	loop checkcharacters
pop ecx
pop ebx
pop eax
;-----------------------------------------------------------------------------


mov ebp,0
mov ebx,0
mov ecx,20

row:
	push ecx
	mov ecx,lsakla
	sub ecx,lgirilen
	inc ecx
	push ebx
	router:
		push ebx
		mov esi,0
		push ecx
		mov ecx,lgirilen
		rinner:
			mov al,sakla[ebx]
			cmp al,girilen[esi]
			jne rnotequal
			inc ebx
			inc esi
			loop rinner
		;------------------------------------------------
		push ebx
		push ecx
		sub ebx,lgirilen
		mov ecx,lgirilen
		rwrite:
			mov al,'a'
			mov resultmatris[ebx],al
			inc ebx
			loop rwrite
		pop ecx
		pop ebx
		;------------------------------------------------
		inc ebp
		pop ecx
		pop ebx
		jmp finishrow
		rnotequal:

		pop ecx
		pop ebx
		inc ebx
		loop router
	finishrow:
	pop ebx
	add ebx,20
	pop ecx
	loop row






mov ebx,0
mov ecx,20

column:
	push ecx
	mov ecx,lsakla
	sub ecx,lgirilen
	inc ecx
	push ebx
	couter:
		push ebx
		mov esi,0
		push ecx
		mov ecx,lgirilen
		cinner:
			mov al,sakla[ebx]
			cmp al,girilen[esi]
			jne cnotequal
			add ebx,20
			inc esi
			loop cinner
		;----------------------------------------------------------
		push ebx
		push ecx
		mov ecx,20
		csub:
			sub ebx,lgirilen
			loop csub
		mov ecx,lgirilen
		cwrite:
			mov al,'a'
			mov resultmatris[ebx],al
			add ebx,20
			loop cwrite
		pop ecx
		pop ebx
		;----------------------------------------------------------
		inc ebp
		pop ecx
		pop ebx
		jmp finishcolumn
		cnotequal:

		pop ecx
		pop ebx
		add ebx,20
		loop couter
	finishcolumn:
	pop ebx
	inc ebx
	pop ecx
	loop column




mov ebx,0
mov eax,20
mov ecx,20

crosswise:
	push eax
	push ecx
	mov ecx,eax
	sub ecx,lgirilen
	cmp ecx,-1
	je gocrosswise
	inc ecx
	push ebx
	crouter:
		push ebx
		mov esi,0
		push ecx
		mov ecx,lgirilen
		crinner:
			mov al,sakla[ebx]
			cmp al,girilen[esi]
			jne crnotequal
			add ebx,21
			inc esi
			loop crinner
		;----------------------------------------------------------
		push ebx
		push ecx
		mov ecx,21
		crsub:
			sub ebx,lgirilen
			loop crsub
		mov ecx,lgirilen
		crwrite:
			mov al,'a'
			mov resultmatris[ebx],al
			add ebx,21
			loop crwrite
		pop ecx
		pop ebx
		;----------------------------------------------------------
		inc ebp
		pop ecx
		pop ebx
		jmp finishcrosswise
		crnotequal:

		pop ecx
		pop ebx
		add ebx,21
		loop crouter
	finishcrosswise:
	pop ebx
	inc ebx
	pop ecx
	pop eax
	dec eax
	loop crosswise
gocrosswise:


;---------------------------------------------------------------------------------------------------

mov ebx,0
mov eax,20
mov ecx,20

crosswise2:
	push eax
	push ecx
	mov ecx,eax
	sub ecx,lgirilen
	cmp ecx,-1
	je gocrosswise2
	inc ecx
	push ebx
	crouter2:
		push ebx
		mov esi,0
		push ecx
		mov ecx,lgirilen
		crinner2:
			mov al,sakla[ebx]
			cmp al,girilen[esi]
			jne crnotequal2
			add ebx,21
			inc esi
			loop crinner2
		;----------------------------------------------------------
		push ebx
		push ecx
		mov ecx,21
		crsub2:
			sub ebx,lgirilen
			loop crsub2
		mov ecx,lgirilen
		crwrite2:
			mov al,'a'
			mov resultmatris[ebx],al
			add ebx,21
			loop crwrite2
		pop ecx
		pop ebx
		;----------------------------------------------------------
		inc ebp
		pop ecx
		pop ebx
		jmp finishcrosswise2
		crnotequal2:

		pop ecx
		pop ebx
		add ebx,21
		loop crouter2
	finishcrosswise2:
	pop ebx
	add ebx,20
	pop ecx
	pop eax
	dec eax
	loop crosswise2
gocrosswise2:






;----------------------------------------------------------------------------------------------------------------
	
	
mov eax,0
cmp eax,ebp
jne finish

jmp firstfinish






askagain:


call clrscr

push ebx
push ecx
mov ebx,0
mov ecx,20
loop3:
	push ecx
	mov ecx,20
	loop4:
		mov al,sakla[ebx]
		call writechar
		mov al,' '
		call writechar
		inc ebx
		loop loop4
	pop ecx
	call crlf
	loop loop3
pop ecx
pop ebx

mwrite "Enter the string:"

push edx
mov edx,offset saveletters
call writestring
pop edx

call crlf


firstfinish:




mov ebx,0
mwrite "The word is not in matrix, do you want to continue (y/n)? :"
mov edx,offset answer
mov ecx,lengthof answer-1
call readstring


convertanswer l2


mov al,'y'
mov ah,'n'
cmp answer[ebx],al
je again
cmp answer[ebx],ah
je cikis
jne askagain

finish:


call clrscr

push eax
push edi
push ecx
mov ebx,0
mov ecx,20
son1:
	push ebx
	push ecx
	mov ecx,20
	son2:
		mov ah,'b'
		cmp ah,resultmatris[ebx]
		je norm
		mov eax,lightred;+(white*16)
		call settextcolor
		mov al,sakla[ebx]
		call writechar
		mov al,' '
		call writechar
		inc ebx
		loop son2
		jmp zipla
		norm:
		mov eax,white
		call settextcolor
		mov al,sakla[ebx]
		call writechar
		mov al,' '
		call writechar
		inc ebx
		loop son2
	zipla:	
	call crlf
	pop ecx
	pop ebx
	add ebx,20
	loop son1
pop ecx
pop ebx
pop eax


mov eax,white
call settextcolor



mov ebx,0
mwrite "The word is found, do you want to continue (y/n)? :"
mov edx,offset answer
mov ecx,lengthof answer-1
call readstring


push edi
push ecx
push eax
mov ecx,eax
mov edi,0
bidaha:
	or answer[edi],00100000b
	inc edi
	loop bidaha
pop eax
pop ecx
pop edi

mov al,'y'
mov ah,'n'
cmp answer[ebx],al
je refresh
cmp answer[ebx],ah
je cikis
jne finish





mov eax,white
call settextcolor




cikis:




	exit	; exit to operating system
main ENDP

;insert another procedure

END main