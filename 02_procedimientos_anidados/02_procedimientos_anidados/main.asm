; Materia: Lenguajes de Interfaz 
; Alumna: Ilse Marianne Castillo Pimienta - 23170117
; Horario: 8:00-9:00am
; Docente: Dr. José Luis Medina Jiménez 
; Unidad: 3
; Práctica: 02 - Procedimientos anidados
; Descripción: Practica que llama a un procedimiento dentro de otro y permite observar los cambios en el
;			   registro eax, así como en la cima de la pila (el registro esp). Al ejecutarlo comprobé la forma en que
;			   se guarda la dirección de retorno de un procedimiento en la pila y vi cómo disminuye esp cada que se 
;			   llama a un procedimiento nuevo.

INCLUDE Irvine32.inc

.code
main PROC
	mov eax, 10 ;copiamos el valor de 10 en eax
	call WriteDec ;imprimimos eax
	call dumpRegs ;mandamos a llamar la impresion de los registros para observar los cambios en eax y esp

	call cambioValor ;llamamos al procedimiento "cambioValor"

	exit
main ENDP

;procedimiento que le asigna otro valor a eax
cambioValor PROC
	mov eax, 5 ;ahora copiamos el valor de 5 en eax
	call WriteDec
	call dumpRegs

	call otroCambioValor ;llamamos a otro procedimiento desde este procedimiento

	ret ;regresamos a la instruccion después del call del main
cambioValor ENDP ;fin del procedimiento

;procedimiento para cambiar nuevamente el valor de eax
otroCambioValor PROC
	mov eax, 2 ;copiamos el valor de 2
	call WriteDec
	call dumpRegs

	ret ;regresamos a la instruccion después del call de "cambioValor"
otroCambioValor ENDP ;fin del procedimiento

END main