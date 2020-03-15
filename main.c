/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   main.c                                             :+:    :+:            */
/*                                                     +:+                    */
/*   By: robijnvanhouts <robijnvanhouts@student.      +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/03/15 12:51:58 by robijnvanho    #+#    #+#                */
/*   Updated: 2020/03/15 12:58:10 by robijnvanho   ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

 #include <unistd.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
 
/*
** prototypes
*/
int     ft_strlen(char const *str);
int		ft_strcmp(char const *s1, char const *s2);
char	*ft_strcpy(char *dst, char const *src);
ssize_t	ft_write(int fd, void const *buf, size_t nbyte);
ssize_t	ft_read(int fd, void *buf, size_t nbyte);
char	*ft_strdup(char const *s1);

int     main(void)
{
    char    *x;

    x = "hallo";
    printf("`%s` = %d\n", x, ft_strlen(x));
    
    return (0);
}