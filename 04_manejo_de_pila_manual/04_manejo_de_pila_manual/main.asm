; Materia: Lenguajes de Interfaz 
; Alumna: Ilse Marianne Castillo Pimienta - 23170117
; Horario: 8:00-9:00am
; Docente: Dr. José Luis Medina Jiménez 
; Unidad: 3
; Práctica: 04 - Manejo de pila manual
; Descripción: Practica que realiza un manejo manual de la pila al pasar 2 argumentos con push, acceder a ellos mediante 
;              un punto fijo en la pila, realizar una multiplicación y después limpiar automáticamente los argumentos con
;              ret 8. Al ejecutarla comprobé mediante esp el cómo se limpia la pila después del ret 8 y la forma en la que
;              es posible fijar ebp como base en la pila y acceder a valores de la misma de forma más intuitiva.

INCLUDE Irvine32.inc

.code
main PROC
	mov ebx, 999

	push 3 ;metemos el 3 a la pila
	push 25 ;metemos el 25 a la pila

	call multiplicarPila
	call WriteDec ;regreso del call sumarPila. Imprime el valor que se encuentre en eax, en este caso, el resultado
	call crlf
	nop 

	exit
main ENDP

;procedimiento que accede a valores de la pila, los mueve a registros y realiza una multiplicacion entre ambos
multiplicarPila PROC
	;cima de la pila
	push ebp ;checkpoint en la pila, todo lo que esté para arriba de ebp está en una posicion negativa pero ebp sí puede 
			 ;acceder a ellos y lo que está abajo se queda en las mismas posiciones, esto nos sirve para tener un punto
			 ;de referencia que nos permita acceder a posiciones de la pila.

	mov ebp, esp ;establece ebp como el punto de referencia al tomar el valor de esp

	push ebx ;guardamos el valor que se encuentre en ebx porque el prodecimiento lo modifica

	mov eax, [ebp+8] ;accedemos al valor que se encuentre 8 bytes abajo de ebp (25)
	mov ebx, [ebp+12] ;accedemos al valor que se encuentre 12 bytes abajo de ebp (3)

	imul eax, ebx ;multiplicamos eax * ebx y el resultado se guarda en eax

	pop ebx ;recuperamos el valor de ebx
	pop ebp ;recuperamos el valor de ebp

	ret 8 ;recupera la direccion de retorno mas aparte limpia 8 bytes de argumentos de la pila, los dos push que fueron agregados anteriormente
multiplicarPila ENDP
END main