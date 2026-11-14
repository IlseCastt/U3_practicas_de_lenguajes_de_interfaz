; Materia: Lenguajes de Interfaz 
; Alumna: Ilse Marianne Castillo Pimienta - 23170117
; Horario: 8:00-9:00am
; Docente: Dr. José Luis Medina Jiménez 
; Unidad: 3
; Práctica: 05 - Macros
; Descripción: Practica que implementa macros con parámetros y define actividades específicas para cada una: imprimir 
;              un mensaje y realizar una multiplicación. Al ejecutarla comprobé la diferencia entre una macro y un 
;              procedimiento y la forma en que los parámetros son leídos en una macro.

INCLUDE Irvine32.inc

mostrarMensaje MACRO texto ;definicion de una macro que permite imprimir un mensaje en consola
	mov edx, OFFSET texto ;texto se va a sustituir por el parametro dado al llamar a la macro
	call WriteString
	call crlf
ENDM ;fin de la macro

calcularImporte MACRO precio, cantidad ;macro que realiza una multiplicación entre ellos y después imprime el resultado
	mov eax, precio ;copia en eax el primer parametro dado cuando se llame a la macro
	imul eax, cantidad ;multiplica eax por el segundo parametro dado y el resultado se guarda en eax
	call WriteDec ;imprime eax (el resultado)
	call crlf
ENDM

.data
	mensajeBienvenida BYTE "Bienvenido al sistema de ventas.", 0
	mensajeFin BYTE "Hasta luego, vuelva pronto.", 0

.code
main PROC
	mostrarMensaje mensajeBienvenida ;llamada de la macro "mostrarMensaje", al ensamblarse se realizará aquí una expansión 
									 ;de código de la macro llamada y se reemplazarán los argumentos de la macro con los parámetros dados

	calcularImporte 25, 3 ;llamada de la macro "calcularImporte"
	calcularImporte 40, 2

	mostrarMensaje mensajeFin

	exit
main ENDP
END main