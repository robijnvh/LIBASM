/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   main.c                                             :+:    :+:            */
/*                                                     +:+                    */
/*   By: robijnvanhouts <robijnvanhouts@student.      +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/03/15 12:51:58 by robijnvanho    #+#    #+#                */
/*   Updated: 2020/03/19 13:43:34 by robijnvanho   ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>

#define STRLEN(s)              printf("[%s]: %d, (%d)\n", s, ft_strlen(s), (int)strlen(s));
#define STRDUP(s1)             printf("[%s] ([%s])\n", ft_strdup(s1), s1);
#define STRCMP(s1, s2)         printf("[%s]:[%s] = %d (%d)\n", s1, s2, ft_strcmp(s1, s2), strcmp(s1, s2));
#define WRITE(s, x)            printf("%ld ([%s] :%ld)\n", ft_write(STDOUT_FILENO, s, x), s, x);

/*
** prototypes
*/
int     ft_strlen(char const *str);
int     ft_strcmp(char const *s1, char const *s2);
char*   ft_strcpy(char *dst, char const *src);
ssize_t ft_write(int fd, void const *buf, size_t nbyte);
ssize_t ft_read(int fd, void *buf, size_t nbyte);
char*   ft_strdup(char const *s1);
/*
**
*/

void    test_str_functions(char *buffer)
{
  printf("\n---strlen:\n");
  STRLEN("just put something");
  printf("---end strlen:\n\n");

  printf("\n---strcmp:\n");
  STRCMP("just put something", "something");
  printf("---end strcmp:\n\n");

	printf("\n---strcpy:\n");
	printf("[%s] ([something])\n", ft_strcpy(buffer, "something"));
	printf("---end strcpy:\n");

  printf("\n---strdup:\n");
  STRDUP("just put something");
  printf("---end strdup:\n\n");
}

void    test_read_write(char *buffer2)
{
  int fd;
  int ret;
  
  fd = open("test.txt", O_RDWR);
  printf("\n---write:\n");
  WRITE("just put something", 4L)
  printf("%ld ([%s] :%d)\n", ft_write(fd, "random message", 14), "random message", 14);
  printf("---end write:\n\n");

  close(fd);
  fd = open("test.txt", O_RDWR);  
	printf("\n---read: \n");
  ret = ft_read(fd, buffer2, 6);
  printf("ret: %d\n", ret);
  printf("read: %s\n", buffer2);
	printf("---end read:\n");
}

int     main(void)
{
	char	  buffer[100];
	char	  buffer2[100];
  int     i;

	i = 0;
	while (i < 100)
  {
		buffer[i] = 0;
    i++;
  }
  i = 0;
	while (i < 100)
  {
		buffer2[i] = 0;
    i++;
  }
  test_str_functions(buffer);
  test_read_write(buffer2);
  return (0);
}
