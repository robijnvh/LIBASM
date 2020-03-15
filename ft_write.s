# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    ft_write.s                                         :+:    :+:             #
#                                                      +:+                     #
#    By: robijnvanhouts <robijnvanhouts@student.      +#+                      #
#                                                    +#+                       #
#    Created: 2020/03/15 14:11:52 by robijnvanho    #+#    #+#                 #
#    Updated: 2020/03/15 14:25:10 by robijnvanho   ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

 global _ft_write
 
 section .text

 _ft_write:                                 ;fd = rdi, buffer = rsi, bytes = rdx
                cmp     rdx, 0              ;check size
                je      size_error          ;no size given
                cmp     rdi, 0              ;check fd
                jl      write_error         ;fd < 1
                cmp     rsi, 0              ;check buffer
                je      write_error         ;buffer == 0

                push    rdx                 ;save bytes
                push    rsi                 ;save buffer
                xor     rsi, rsi            ;set to zero
                mov     esi, 1              ;
                mov     rax, 0x200005c      ;set to syscall fcntl
                syscall                     ;ask for service
                pop     rsi                 ;get value from stack
                pop     rdx                 ;get value from stack
                cmp     eax, 0              ;
                jne     write_error         ;not true
                
                mov     rax, 0x2000004      ;set to syscall write
                syscall                     ;ask for service
                ret

size_error:
                mov     rax, 0
                ret

write_error:
                move    rax, -1
                ret                