.model small
.stack 100h
.data
A db ?
msg1 db 0ah,0dh, 'Result:$' 
msg2 db 0ah,0dh, '$'
.code
main proc 
    
    mov ax,@data
    mov ds,ax
    
    ;input1
    mov ah,1
    int 21h
    mov A,al
    
    ;for result
    lea dx,msg1
    mov ah,09h
    int 21h
    
    
    ;output1
    mov dl,A
    mov ah,2
    int 21h
    
    ;for printing new line
    lea dx,msg2
    mov ah,9
    int 21h
    
    ;for input 2
    mov ah,1
    int 21h
    mov A,al
     
    ;for result 
    lea dx,msg1
    mov ah,9
    int 21h
    
    ;for output 2
    mov dl,A
    mov ah,2
    int 21h 
    
    mov ah,4ch
    int 21h
    main endp
end main
    
