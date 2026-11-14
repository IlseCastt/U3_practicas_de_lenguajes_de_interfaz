; Materia: Lenguajes de Interfaz 
; Alumna: Ilse Marianne Castillo Pimienta - 23170117
; Horario: 8:00-9:00am
; Docente: Dr. José Luis Medina Jiménez 
; Unidad: 3
; Práctica: 03 - Validar entrada vacía
; Descripción: Practica que, mediante un procedimiento, valida si una cadena esta vacia o no. Al ejecutarlo comprobé
;			   el funcionamiento de test cuando realiza un and interno de un registro con sí mismo, en el cual, 
;              solo se activa ZF si eax = 0.

INCLUDE Irvine32.inc

.data
	mensaje BYTE "Ingresa una cadena de texto: ", 0
	msgVacia BYTE "La cadena esta vacia.", 0
	msgNoVacia BYTE "La cadena no esta vacia.", 0

	cadena BYTE 30 DUP(0) ;buffer de 30 bytes contando el terminador nulo

.code
main PROC
	mov eax, 0
	mov ecx, 0

	mov edx, OFFSET mensaje
	call WriteString

	;leemos la cadena
	mov edx, OFFSET cadena
	mov ecx, SIZEOF cadena-1 ;en ecx se mandan los caracteres que debe tener la cadena
	call ReadString ;en eax se guardan los caracteres leídos

	;llamamos al procedimiento 
	call validarCadenaVacia ;como eax se conserva, el procedimiento puede evaluar ese valor

	exit
main ENDP

;procedimiento que valida si una cadena está vacía o no
validarCadenaVacia PROC
	test eax, eax ;realizamos la validación, si el and da 0, la cadena está vacía
	jz cadenaVacia ;si está vacía salta, ZF = 1

	;si no está vacía, continua
	mov edx, OFFSET msgNoVacia ;muestra el mensaje de cadena no vacía
	call WriteString
	call crlf

	jmp fin

cadenaVacia:
	mov edx, OFFSET msgVacia ;muestra el mensaje de cadena vacía
	call WriteString
	call crlf

fin:
	ret
validarCadenaVacia ENDP
END main