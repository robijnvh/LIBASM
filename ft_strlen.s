# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    ft_strlen.s                                        :+:    :+:             #
#                                                      +:+                     #
#    By: robijnvanhouts <robijnvanhouts@student.      +#+                      #
#                                                    +#+                       #
#    Created: 2020/03/15 12:37:36 by robijnvanho    #+#    #+#                 #
#    Updated: 2020/03/16 11:35:36 by robijnvanho   ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

 section .text

 global _ft_strlen

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
