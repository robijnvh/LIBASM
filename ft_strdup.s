# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strdup.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rvan-hou <rvan-hou@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/15 13:10:12 by robijnvanho       #+#    #+#              #
#    Updated: 2020/06/29 12:14:15 by rvan-hou         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

 section .text

 global _ft_strdup
 extern _malloc
 extern _ft_strlen
 extern _ft_strcpy

 _ft_strdup:
                push     rdi                ; set to stack
				cmp		 rdi, 0				; check
				je		 error
				mov		 rcx, 0				; index cnt
                call     _ft_strlen         ; get length for malloc
                inc      rax                ; increase once for \0
                mov      rdi, rax           ; store value in rdi
                
				push	rbp					; safe base ptr
				mov		rbp, rsp
				and		rsp, - 16			; allign stack
                call    _malloc             ; malloc rax amount
				mov		rsp, rbp			; reset stack and base ptr
                pop     rbp
                cmp     rax, 0              ; check malloc
                je      error         		; malloc fail

copy:
				pop		rsi					; og str as src
				mov		rdi, rax			; alloc as dst
				call	_ft_strcpy
				ret

error:
                pop		rdi
                ret