# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    ft_read.s                                          :+:    :+:             #
#                                                      +:+                     #
#    By: robijnvanhouts <robijnvanhouts@student.      +#+                      #
#                                                    +#+                       #
#    Created: 2020/03/15 14:27:26 by robijnvanho    #+#    #+#                 #
#    Updated: 2020/03/15 14:27:59 by robijnvanho   ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

 global _ft_read
 
 section .text

 _ft_read:                                 ;fd = rdi, buffer = rsi, bytes = rdx 
            mov     rax, 0x200003
            syscall
            ret