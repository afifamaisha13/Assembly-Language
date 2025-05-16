.model small
.stack 100h
.data 
A db 3 
result db 0
msg db 'Result: $' 

.code
main proc 
    
    mov ax,@data
    mov ds,ax
    
    mov al,A
    mov bl,5
    sub bl,al 
    
    lea dx, msg         ; Load address of the message
    mov ah, 09h         ; DOS interrupt to display a string
    int 21h
             
     mov result,bl
     add result,48
     mov dl,result
     mov ah,2 
     int 21h    
     
    
    
    
    exit: 
    mov ah,4ch
    int 21h
    main endp
end main
