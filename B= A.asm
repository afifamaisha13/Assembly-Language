.model small
.stack 100h
.data 
A db 3 
B db 0
msg db 'B: $' 

.code
main proc 
    
    mov ax,@data
    mov ds,ax
    
    
   
    
    lea dx, msg         ; Load address of the message
    mov ah, 09h         ; DOS interrupt to display a string
    int 21h
     
     mov al,A        
     mov B,al
     add B,48
     mov dl,B
     mov ah,2 
     int 21h    
     
    
    
    
    exit: 
    mov ah,4ch
    int 21h
    main endp
end main
