.model small
.stack 100h
.data 
A db 10 
B db 3
result db 0
msg db 'Result: $' 

.code
main proc 
    
    mov ax,@data ;initialize the data segment
    mov ds,ax                   
    
    ;perform calculation A-2B
    mov al,B
    mov bl,A
    sub bl,al 
    sub bl,al  
    
    ;display the message 'result'
    lea dx, msg         ; Load address of the message
    mov ah, 09h         ; DOS interrupt to display a string
    int 21h
     
     ;display the result of A-2B        
     mov result,bl
     add result,48   ;convert numerci result to ASCII
     mov dl,result
     mov ah,2 
     int 21h    
     
    
    
    
    exit: 
    mov ah,4ch
    int 21h
    main endp
end main
