# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_read.s                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rvan-hou <rvan-hou@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/15 14:27:26 by robijnvanho       #+#    #+#              #
#    Updated: 2020/06/29 11:49:33 by rvan-hou         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

 section .text
 
 global _ft_read
 extern	___error

 _ft_read:                                 ; fd = rdi, buffer = rsi, bytes = rdx 
            mov     rax, 0x2000003         ; code for read
            syscall                        ; call for read
            jc      error                  ; check if read error
            ret

error:
            mov      r10, rax
			call	___error
			mov		[rax], r10
			mov		rax, -1
            ret