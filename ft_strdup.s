# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    ft_strdup.s                                        :+:    :+:             #
#                                                      +:+                     #
#    By: robijnvanhouts <robijnvanhouts@student.      +#+                      #
#                                                    +#+                       #
#    Created: 2020/03/15 13:10:12 by robijnvanho    #+#    #+#                 #
#    Updated: 2020/03/15 13:31:49 by robijnvanho   ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

 global _ft_strdup

 section .text

 _ft_strdup:
                cmp     rdi, 0              ;check if src != 0
                jz      error               ;return if true
                
get_length:
                xor     rcx, rcx            ;set to zero
                jmp     compare_length      ;start counting length

increment_length:
                inc     rcx                 ;increment variable

compare_length:
                cmp     BYTE[rdi + rcx], 0  ;check if zero
                jne     increment_length    ;if not, increment variable

start_malloc:
                inc     rcx                 ;allocate 1 extra for \0
                
                push    rdi                 ;writing value to stack to save increment
                mov     rdi, rcx            ;rdi becomes value rcx
                call    _malloc             ;malloc length and saved in rax
                pop     rdi                 ;restore first thing on stack, so rdi
                cmp     rax, 0              ;check if new str/rax is 0
                jz      error               ;check for malloc fail

start_copy:
                xor     rcx, rcx            ;set to zero
                xor     rdx, rdx            ;set to zero
                jmp     while_copy          ;start copying src in new str

increment_copy:
                inc     rcx                 ;increment value to loop through str

while_copy:
                mov     dl, BYTE[rdi + rcx] ;move char src in dl
                mov     BYTE[rax + rcx], dl ;move dl to char dst
                cmp     dl, 0               ;check if end of str
                jnz     increment_copy      ;increment to go to next char if zero not yet reached
                jmp     return              ;zero is reached so return

error:
                xor     rax, rax            ;return 0

return:
                ret                         ;return rax
                