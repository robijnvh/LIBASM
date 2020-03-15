# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    ft_strcmp.s                                        :+:    :+:             #
#                                                      +:+                     #
#    By: robijnvanhouts <robijnvanhouts@student.      +#+                      #
#                                                    +#+                       #
#    Created: 2020/03/15 13:32:22 by robijnvanho    #+#    #+#                 #
#    Updated: 2020/03/15 14:02:12 by robijnvanho   ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

; nasm -f macho64 ft_strcmp.s && gcc -o exec main.c ft_strcmp.o && ./exec //

 global _ft_strcmp

 section .text

_ft_strcmp:                                     ;s1 = rdi, s2 = rsi ; al = s1[i], dl = s2[i], r11 = i
            push        r11                     ;save r11
            mov         r11, -1                 ;set value to -1
            cmp         rdi, 0                  ;check if s1 has value
            jz          strcmp_check            ;if equal
            cmp         rsi, 0                  ;check if s2 has value
            jz          strcmp_check            ;if equal

strcmp_check:
            cmp         rsi, rdi                ;check for values
            jz          equal                   ;s1 == s2 (null)
            jg          bigger                  ;s1 == null
            jmp         smaller                 ;s2 == null
           
strcmp_loop:
            inc         r11                     ;increment to value 0
            mov         al, BYTE[rdi + r11]     ;check char s1
            mov         dl, BYTE[rsi + r11]     ;check char s2
            cmp         al, 0                   ;check if end of s1
            je          strcmp_end              ;if equal, end
            cmp         dl, 0                   ;check if end of s2
            je          strcmp_end              ; if equal, end
            cmp         al, dl                  ;check if chars equal
            je          strcmp_loop             ;if equal, next char
            jmp         strcmp_loop             ;done         


bigger:
            mov        rax, 1
            ret

smaller:
            mov         rax, -1
            ret

equal:
            mov         rax, 0                  
            ret
            
strcmp_end:
            pop         r11                     ;get r11 from top of stack
            sub         rax, rbx                ;substract values to get return value
            ret                                 ;return outcome of sub
            