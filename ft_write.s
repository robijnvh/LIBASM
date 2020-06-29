# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_write.s                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rvan-hou <rvan-hou@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/15 14:11:52 by robijnvanho       #+#    #+#              #
#    Updated: 2020/06/29 11:50:03 by rvan-hou         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

 section .text
 
 global _ft_write
 extern	___error


 _ft_write:                               ; fd = rdi, buffer = rsi, bytes = rdx 
            mov     rax, 0x2000004        ; code for write
            syscall                       ; call for write
            jc      error                 ; check for write error
            ret

error:
            mov      r10, rax
			call	___error
			mov		[rax], r10
			mov		rax, -1
            ret