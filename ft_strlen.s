# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    ft_strlen.s                                        :+:    :+:             #
#                                                      +:+                     #
#    By: robijnvanhouts <robijnvanhouts@student.      +#+                      #
#                                                    +#+                       #
#    Created: 2020/03/15 12:37:36 by robijnvanho    #+#    #+#                 #
#    Updated: 2020/03/15 12:55:54 by robijnvanho   ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

 global _ft_strlen

 section .text

 _ft_strlen:
                xor     rax, rax            ; i = 0
                jmp     compare

increment:      
                inc     rax                 ; i++

compare:
                cmp     BYTE[rdi + rax], 0  ; str[i] == 0
                jne     increment           ; jump to i++

done:
                ret                         ; return i
