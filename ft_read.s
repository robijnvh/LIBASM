# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    ft_read.s                                          :+:    :+:             #
#                                                      +:+                     #
#    By: robijnvanhouts <robijnvanhouts@student.      +#+                      #
#                                                    +#+                       #
#    Created: 2020/03/15 14:27:26 by robijnvanho    #+#    #+#                 #
#    Updated: 2020/03/19 13:07:42 by robijnvanho   ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

 section .text
 
 global _ft_read

 _ft_read:                                 ; fd = rdi, buffer = rsi, bytes = rdx 
            mov     rax, 0x2000003         ; code for read
            syscall                        ; call for read
            jc      error                  ; check if read error
            ret

error:
            mov      rax, -1               ; return -1 if read error
            ret