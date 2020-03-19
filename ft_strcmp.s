# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    ft_strcmp.s                                        :+:    :+:             #
#                                                      +:+                     #
#    By: robijnvanhouts <robijnvanhouts@student.      +#+                      #
#                                                    +#+                       #
#    Created: 2020/03/15 13:32:22 by robijnvanho    #+#    #+#                 #
#    Updated: 2020/03/19 13:06:21 by robijnvanho   ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

 section .text

 global _ft_strcmp

_ft_strcmp:                                     ; s1 = rdi, s2 = rsi ; al = s1[i], dl = s2[i], rax = i
            mov         rax, -1                 ; set value to -1
           
strcmp_loop:
            inc         rax                     ; increment to value 0
            cmp         BYTE[rdi + rax], 0      ; check for zero
            jz          before_end              ; check before return
            cmp         BYTE[rsi + rax], 0      ; check for zero
            jz          strcmp_greater          ; s1 is greater, before return
            mov         dl, BYTE[rdi + rax]     ; store value in dl
            cmp         dl, BYTE[rsi + rax]     ; check if chars the same
            jg          strcmp_greater          ; s1 greater
            jb          strcmp_less             ; s1 less
            jmp         strcmp_loop             ; next char
            
before_end:
            cmp         BYTE[rsi + rax], 0      ; check if s2 is zero as well
            jz          strcmp_end              ; both zero
            jmp         strcmp_less             ; s1 less

strcmp_greater:
            mov         rax, 1                  ; s1 greater so 1
            ret
                    
strcmp_less:
            mov         rax, -1                 ; s1 less so -1
            ret

strcmp_end:
            mov         rax, 0                  ; s1 and s2 equal
            ret
