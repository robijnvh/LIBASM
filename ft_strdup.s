# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    ft_strdup.s                                        :+:    :+:             #
#                                                      +:+                     #
#    By: robijnvanhouts <robijnvanhouts@student.      +#+                      #
#                                                    +#+                       #
#    Created: 2020/03/15 13:10:12 by robijnvanho    #+#    #+#                 #
#    Updated: 2020/03/19 13:13:52 by robijnvanho   ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

 section .text

 global _ft_strdup
 extern _malloc
 extern _ft_strlen
 extern _ft_strcpy

 _ft_strdup:
                push     rdi                ; set to stack
                call     _ft_strlen         ; get length for malloc
                inc      rax                ; increase once for \0
                mov      rdi, rax           ; store value in rdi
                
                call    _malloc             ; malloc rax amount
                pop     rdi                 ; get rdi from stack
                cmp     rax, 0              ; check malloc
                jz      write_error         ; malloc fail
                
                mov     rsi, rdi            ; store value in rsi
                mov     rdi, rax            ; store value in rdi
                call    _ft_strcpy          ; place str in new str
                ret                         ; return

write_error:
                mov     rax, 0              ; return 0 if malloc fail
                ret