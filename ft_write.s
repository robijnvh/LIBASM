# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    ft_write.s                                         :+:    :+:             #
#                                                      +:+                     #
#    By: robijnvanhouts <robijnvanhouts@student.      +#+                      #
#                                                    +#+                       #
#    Created: 2020/03/15 14:11:52 by robijnvanho    #+#    #+#                 #
#    Updated: 2020/03/19 13:07:07 by robijnvanho   ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

 section .text
 
 global _ft_write

 _ft_write:                               ; fd = rdi, buffer = rsi, bytes = rdx 
            mov     rax, 0x2000004        ; code for write
            syscall                       ; call for write
            jc      error                 ; check for write error
            ret

error:
            mov      rax, -1              ; return -1 if write error
            ret