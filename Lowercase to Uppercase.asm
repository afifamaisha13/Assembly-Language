.model small
.stack 100h
.data
A db ? 
msg db 0ah,0dh,'Input:$'
msg1 db 0ah,0dh,'Output:$'
.code

main proc 
    mov ax,@data ;initialize the data segment
    mov ds,ax 
    
    ;for printing msg
    lea dx,msg
    mov ah,09h
    int 21h
    
  ;input lowercase
  mov ah,1
  int 21h
  mov A,al
  sub A,32 ;for converting to upper case
  
  
  ;for printing msg1
  lea dx,msg1
  mov ah,09h
  int 21h
  
  
  ;output uppercase
  mov dl,A
  mov ah,2
  int 21h
  
  exit:
  mov ah,4ch
  int 21h
  main endp
end main
