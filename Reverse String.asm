.model small
.stack 100h

.data
    prompt db 'enter a string: $'
    newline db 0dh, 0ah, '$'  ; carriage return + line feed
    max_len equ 100           ; maximum string length to prevent stack overflow

.code
main proc
    mov ax, @data
    mov ds, ax
    
    ; display prompt
    mov ah, 09h
    lea dx, prompt
    int 21h
    
    ; initialize character counter
    xor cx, cx        ; cx will hold our character count
    
    ; read characters and push to stack
read_loop:
    mov ah, 01h       ; read character function
    int 21h           ; character stored in al
    
    cmp al, 0dh       ; check for enter key (carriage return)
    je end_read       ; if enter, stop reading
    
    ; push character onto stack
    push ax
    inc cx            ; increment character count
    
    ; prevent stack overflow
    cmp cx, max_len
    jae end_read      ; if we've reached max length, stop
    
    jmp read_loop
    
end_read:
    ; display newline
    mov ah, 09h
    lea dx, newline
    int 21h
    
    ; check if any characters were entered
    cmp cx, 0
    je exit           ; if no characters, exit
    
    ; pop characters from stack and display (reversed order)
reverse_loop:
    pop dx            ; pop character into dx
    mov ah, 02h       ; display character function
    int 21h
    
    loop reverse_loop ; decrements cx and loops if not zero
    
exit:
    mov ah, 4ch       ; exit program
    int 21h
main endp
end main
