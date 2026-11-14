; Materia: Lenguajes de Interfaz 
; Alumna: Ilse Marianne Castillo Pimienta - 23170117
; Horario: 8:00-9:00am
; Docente: Dr. José Luis Medina Jiménez 
; Unidad: 3
; Práctica: 01 - Procedimientos
; Descripción: Practica que ayuda a visualizar y entender el proceso de entrada y salida de un procedimiento. 
;			   Al ejecutarlo comprobé como es el orden en el que se ejecuta un programa con procedimientos 
;			   y que pasa despues del ret de un procedimiento

INCLUDE Irvine32.inc

.data
	msgInicio BYTE "Inicio del programa", 0
	msgProcedimiento BYTE "Estoy dentro del procedimiento", 0
	msgFin BYTE "Fin del programa", 0

.code
main PROC
	mov edx, OFFSET msgInicio 
	call WriteString ;imprime la cadena que tiene su direccion indicada en edx
	call crlf

	;primera llamada al procedimiento
	call mostrarAviso

	mov eax, 10 ;cambiamos el valor de eax
	call WriteDec ;imprime eax
	call crlf

	;segunda llamada al procedimiento
	call mostrarAviso

	mov eax, 20 ;volvemos a cambiar el valor de eax
	call WriteDec
	call crlf

	mov edx, OFFSET msgFin
	call WriteString
	call crlf

	exit
main ENDP

;mostrar un mensaje y regresar al punto despues del llamado
mostrarAviso PROC
	mov edx, OFFSET msgProcedimiento ;mensaje que indica que estamos dentro del procedimiento
	call WriteString
	call crlf

	ret ;salimos del procedimiento y volvemos a la instruccion que se encuentra despues de call
mostrarAviso ENDP ;fin del procedimiento
END main