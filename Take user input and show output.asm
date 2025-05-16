.model small
.stack 100h
.data
msg1 db 'Input:$'
A db ?
msg db 0ah,0dh, 'Result:$'
.code
main proc
                                
    mov ax,@data
    mov ds,ax 
    
    lea dx, msg1         ; Load address of the message
    mov ah, 09h         ; DOS interrupt to display a string
    int 21h
    
    mov ah,1
    int 21h
    mov A,al
    
    
    lea dx, msg         ; Load address of the message
    mov ah, 09h         ; DOS interrupt to display a string
    int 21h
    
    mov dl,A
    ;add dl,48
    mov ah,2
    int 21h
    
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main
     
