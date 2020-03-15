# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    ft_strcpy.s                                        :+:    :+:             #
#                                                      +:+                     #
#    By: robijnvanhouts <robijnvanhouts@student.      +#+                      #
#                                                    +#+                       #
#    Created: 2020/03/15 13:52:40 by robijnvanho    #+#    #+#                 #
#    Updated: 2020/03/15 14:11:28 by robijnvanho   ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

 global ft_strcpy

 section .text
 
 _ft_strcpy:                                    ;src = rsi, dst = rdi
                mov     rax, -1                 ;set value to -1
                cmp     rsi, 0                  ;check is src has value
                jz      end                     ;if true, end

strcpy_loop:                                    
                inc     rax                     ;set rax to 0
                mov     cl, BYTE[rsi + rax]     ;cl = src[i]
                mov     BYTE[rdi + rax], cl     ;dst[i] = cl
                cmp     cl, 0                   ;check if end reached
                je      end                     ;if zero, end
                jmp     strcpy_loop             ;check next



end:
                mov     rax, rdi                ;return dst
                ret
                