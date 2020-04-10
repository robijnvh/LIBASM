# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: robijnvanhouts <robijnvanhouts@student.      +#+                      #
#                                                    +#+                       #
#    Created: 2020/03/18 15:14:28 by robijnvanho   #+#    #+#                  #
#    Updated: 2020/04/07 12:34:20 by robijnvanho   ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

NAME = libasm.a

NFLAGS = nasm -f macho64

SRC = 	ft_strlen.s ft_strcmp.s ft_strcpy.s ft_strdup.s \
		ft_read.s ft_write.s \

OBJ = $(SRC:.s=.o)

all: $(NAME)

$(NAME): $(OBJ)
	ar rcs $(NAME) $^
	ranlib $(NAME)

%.o: %.s
	$(NA) $(NFLAGS) $<

clean:
	rm -f $(OBJ)
	rm -f ./exec

fclean: clean
	rm -f $(NAME)

re: fclean all
