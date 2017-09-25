/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.m                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ggroener <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/07/28 09:31:39 by ggroener          #+#    #+#             */
/*   Updated: 2017/07/28 09:31:42 by ggroener         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "includes/libft.h"

#include <stdlib.h>
#include <stdio.h>

#include <sys/types.h>
#include <sys/uio.h>
#include <unistd.h>
#include <fcntl.h>
#include <ctype.h>

void	error_quit(char *msg)
{
	printf("Test Failed: %s\n", msg);
	exit(0);
}

void	test_part1(void)
{
	puts("--- PART1 ---");
	char	pass = 1;
	char	pass2;

	/*test ft_bzero*/ {
		puts("Testing: ft_bzero");
		pass2 = 1;
		char	*str1 = (char *)malloc(10);
		for (int k = 0; k < 5; k++)
			str1[k] = 101;
		ft_bzero(str1, 5);
		for (int k = 0; k < 5; k++)
			if (str1[k] != 0)
				pass = (pass2 = 0);
		ft_bzero(str1, 0);
		free(str1);
		puts((pass2) ? "ft_bzero: PASSED" : "ft_bzero: FAILED");
	}

	/*test ft_strcat*/ {
		puts("Testing: ft_strcat");
		pass2 = 1;

		char	*str = malloc(50);
		char	*str2 = " Look at me!";
		memcpy(str, "Hello World!", 13);
		ft_strcat(str, str2);
		if (strcmp(str, "Hello World! Look at me!"))
			pass = (pass2 = 0);
		str2 = strdup("2");
		memcpy(str, "Test: ", 7);
		if (strcmp(ft_strcat(str, str2), "Test: 2"))
			pass = (pass2 = 0);
		free(str);
		free(str2);
		puts((pass2) ? "ft_strcat: PASSED" : "ft_strcat: FAILED");
	}

	/*test ft_isalpha*/ {
		puts("Testing: ft_isalpha");
		pass2 = 1;

		if (!ft_isalpha('A') || !ft_isalpha('g') || !ft_isalpha('z'))
			pass = (pass2 = 0);
		if (!ft_isalpha('a') || !ft_isalpha('G') || !ft_isalpha('Z'))
			pass = (pass2 = 0);
		if (ft_isalpha('~') || ft_isalpha(' ') || ft_isalpha(']'))
			pass = (pass2 = 0);
		puts((pass2) ? "ft_isalpha: PASSED" : "ft_isalpha: FAILED");
	}

	/*test ft_isdigit*/ {
		puts("Testing: ft_isdigit");
		pass2 = 1;

		if (!ft_isdigit('0') || !ft_isdigit('5') || !ft_isdigit('9'))
			pass = (pass2 = 0);
		if (ft_isdigit('/') || ft_isdigit(':') || ft_isdigit(']'))
			pass = (pass2 = 0);
		puts((pass2) ? "ft_isdigit: PASSED" : "ft_isdigit: FAILED");
	}

	/*test ft_isalnum*/ {
		puts("Testing: ft_isalnum");
		pass2 = 1;

		if (!ft_isalnum('A') || !ft_isalnum('5') || !ft_isalnum('z'))
			pass = (pass2 = 0);
		if (!ft_isalnum('0') || !ft_isalnum('9') || !ft_isalnum('Z'))
			pass = (pass2 = 0);
		if (!ft_isalnum('a') || !ft_isalnum('k') || !ft_isalnum('Q'))
			pass = (pass2 = 0);
		if (ft_isalnum('\'') || ft_isalnum(':') || ft_isalnum(']'))
			pass = (pass2 = 0);
		if (ft_isalnum('}') || ft_isalnum('^') || ft_isalnum('-'))
			pass = (pass2 = 0);
		puts((pass2) ? "ft_isalnum: PASSED" : "ft_isalnum: FAILED");
	}

	/*test ft_isascii*/ {
		puts("Testing: ft_isascii");
		pass2 = 1;

		if (!ft_isascii(0) || !ft_isascii(59) || !ft_isascii(127))
			pass = (pass2 = 0);
		if (ft_isascii(-1) || ft_isascii(23323) || ft_isascii(128))
			pass = (pass2 = 0);
		puts((pass2) ? "ft_isascii: PASSED" : "ft_isascii: FAILED");
	}

	/*test ft_isprint*/ {
		puts("Testing: ft_isprint");
		pass2 = 1;

		if (!ft_isprint(32) || !ft_isprint(67) || !ft_isprint(126))
			pass = (pass2 = 0);
		if (ft_isprint(31) || ft_isprint(323) || ft_isprint(127))
			pass = (pass2 = 0);
		puts((pass2) ? "ft_isprint: PASSED" : "ft_isprint: FAILED");
	}

	/*test ft_toupper*/ {
		puts("Testing: ft_toupper");
		pass2 = 1;

		if (!(ft_toupper('a') == 'A') || !(ft_toupper('z') == 'Z'))
			pass = (pass2 = 0);
		if (!(ft_toupper('g') == 'G') || !(ft_toupper('t') == 'T'))
			pass = (pass2 = 0);
		if (!(ft_toupper('A') == 'A') || !(ft_toupper('Z') == 'Z'))
			pass = (pass2 = 0);
		if (!(ft_toupper('9') == '9') || !(ft_toupper('~') == '~'))
			pass = (pass2 = 0);
		if (!(ft_toupper('{') == '{') || !(ft_toupper('`') == '`'))
			pass = (pass2 = 0);
		puts((pass2) ? "ft_toupper: PASSED" : "ft_toupper: FAILED");
	}

	/*test ft_tolower*/ {
		puts("Testing: ft_tolower");
		pass2 = 1;

		if (!(ft_tolower('A') == 'a') || !(ft_tolower('Z') == 'z'))
			pass = (pass2 = 0);
		if (!(ft_tolower('F') == 'f') || !(ft_tolower('Q') == 'q'))
			pass = (pass2 = 0);
		if (!(ft_tolower('a') == 'a') || !(ft_tolower('z') == 'z'))
			pass = (pass2 = 0);
		if (!(ft_tolower('9') == '9') || !(ft_tolower('~') == '~'))
			pass = (pass2 = 0);
		if (!(ft_tolower('@') == '@') || !(ft_tolower('[') == '['))
			pass = (pass2 = 0);
		puts((pass2) ? "ft_tolower: PASSED" : "ft_tolower: FAILED");
	}

	/*test ft_putendl*/ {
		puts("Testing: ft_putendl");
		ft_putendl("If this is displaying correctly, then ft_putendl is working");
		ft_putendl("This should be on it's own line");
	}

	/*end*/
	if (pass)
		puts("\nPart1: PASSED");
	else
		puts("\nPart1: FAILED");
}

void	test_part2(void)
{
	puts("--- PART2 ---");
	char	pass = 1;
	char	pass2;

	/*test ft_strlen*/ {
		puts("Testing: ft_strlen");
		pass2 = 1;
		char	*str = "Hello worlds!";
		if (ft_strlen(str) != strlen(str))
			pass = (pass2 = 0);
		str = "";
		if (ft_strlen(str) != 0)
			pass = (pass2 = 0);
		puts((pass2) ? "ft_strlen: PASSED" : "ft_strlen: FAILED");
	}

	/*test ft_memset*/ {
		puts("Testing: ft_memset");
		pass2 = 1;
		char	*tmp = (char *)malloc(100);
		memcpy(tmp, "Hello there!", 13);
		ft_memset(tmp, 42, 50);
		for (int k = 0; k < 50; k++)
			if (tmp[k] != 42)
				pass = (pass2 = 0);
		ft_memset(tmp, 'A', 5);
		if (tmp[5] != 42)
			pass = (pass2 = 0);
		ft_memset(tmp, '\0', 5);
		if (!strcmp(tmp, "AAAAA"))
			pass = (pass2 = 0);
		free(tmp);
		puts((pass2) ? "ft_memset: PASSED" : "ft_memset: FAILED");
	}

	/*test ft_memcpy*/ {
		puts("Testing: ft_memcpy");
		pass2 = 1;
		char	*str = (char *)malloc(100);
		char	*s2 = "Hello Worlds!!!";
		ft_memcpy(str, s2, strlen(s2) + 1);
		if (strcmp(str, s2))
			pass = (pass2 = 0);
		free(str);
		puts((pass2) ? "ft_memcpy: PASSED" : "ft_memcpy: FAILED");
	}

	/*test ft_strdup*/ {
		puts("Testing: ft_strdup");
		pass2 = 1;
		char	*str;
		char	*s2 = "Hello Worlds!";
		char	*s3 = (char *)malloc(50);
		if (!(str = ft_strdup(s2)))
			error_quit("ft_strdup failed to malloc memory");
		if (strcmp(str, s2))
			pass = (pass2 = 0);
		free(str);
		s2 = "Hi there!";
		memcpy(s3, s2, strlen(s2) + 1);
		str = ft_strdup(s3);
		if (strcmp(str, s3))
			pass = (pass2 = 0);
		free(str);
		s2 = "";
		str = ft_strdup(s2);
		if (strcmp(str, s2))
			pass = (pass2 = 0);
		free(str);
		free(s3);
		puts((pass2) ? "ft_strdup: PASSED" : "ft_strdup: FAILED");
	}

	/*end*/
	if (pass)
		puts("\nPart2: PASSED");
	else
		puts("\nPart2: FAILED");
}

// void	test_part3(void)
// {
// 	char	buff[2048];
// 	int		fd;

// 	fd = read(0, buff, 2048);
// 	buff[fd - 1] = '\0';
// 	if (*buff && (fd = open(buff, O_RDONLY)) < 0)
// 		error_quit("Can't open file");
// 	ft_cat(fd);
// }

void	test_bonuses(void)
{
	puts("--- BONUSES ---");
	char	pass = 1;
	char	pass2;

	// /*test ft_isupper*/ {
	// 	puts("Testing: ft_isupper");
	// 	pass2 = 1;

	// 	if (!ft_isupper('A') || !ft_isupper('T') || !ft_isupper('Z'))
	// 		pass = (pass2 = 0);
	// 	if (ft_isupper('a') || ft_isupper(' ') || ft_isupper(']'))
	// 		pass = (pass2 = 0);
	// 	puts((pass2) ? "ft_isupper: PASSED" : "ft_isupper: FAILED");
	// }

	// /*test ft_islower*/ {
	// 	puts("Testing: ft_islower");
	// 	pass2 = 1;

	// 	if (!ft_islower('a') || !ft_islower('k') || !ft_islower('z'))
	// 		pass = (pass2 = 0);
	// 	if (ft_islower('A') || ft_islower('~') || ft_islower(']'))
	// 		pass = (pass2 = 0);
	// 	puts((pass2) ? "ft_islower: PASSED" : "ft_islower: FAILED");
	// }

	/*test ft_strcmp*/ {
		puts("Testing: ft_strcmp");
		pass2 = 1;

		if (ft_strcmp("Hello", "Hello"))
			pass = (pass2 = 0);
		if (!ft_strcmp("Hello there", "Hello") || !ft_strcmp("Hello", "Hello there"))
			pass = (pass2 = 0);
		if (strcmp("Hiefe", "Hgwerg") != ft_strcmp("Hiefe", "Hgwerg"))
			pass = (pass2 = 0);
		puts((pass2) ? "ft_strcmp: PASSED" : "ft_strcmp: FAILED");
	}

	/*test ft_strncmp*/ {
		puts("Testing: ft_strncmp");
		pass2 = 1;

		if (ft_strncmp("Hello", "Hello", 5))
			pass = (pass2 = 0);
		if (!ft_strncmp("Hello there", "Hello", 6) || !ft_strncmp("Hello", "Hello there", 6))
			pass = (pass2 = 0);
		if (strncmp("Hiefe", "Hgwerg", 5) != ft_strncmp("Hiefe", "Hgwerg", 5))
			pass = (pass2 = 0);
		if (ft_strncmp("Hello World", "Hello", 5))
			pass = (pass2 = 0);
		puts((pass2) ? "ft_strncmp: PASSED" : "ft_strncmp: FAILED");
	}

	/*test ft_strequ*/ {
		puts("Testing: ft_strequ");
		pass2 = 1;

		if (!ft_strequ("Hello", "Hello"))
			pass = (pass2 = 0);
		if (ft_strequ("Hello there", "Hello") || ft_strequ("Hello", "Hello there"))
			pass = (pass2 = 0);
		puts((pass2) ? "ft_strequ: PASSED" : "ft_strequ: FAILED");
	}

	/*test ft_strnequ*/ {
		puts("Testing: ft_strnequ");
		pass2 = 1;

		if (!ft_strnequ("Hello", "Hello", 5))
			pass = (pass2 = 0);
		if (ft_strnequ("Hello there", "Hello", 6) || ft_strnequ("Hello", "Hello there", 6))
			pass = (pass2 = 0);
		if (!ft_strnequ("Hello there", "Hello", 5) || !ft_strnequ("Hello", "Hello there", 5))
			pass = (pass2 = 0);
		puts((pass2) ? "ft_strnequ: PASSED" : "ft_strnequ: FAILED");
	}

	/*test ft_putschar and ft_putchar_fd*/ {
		puts("Testing: ft_putschar and ft_putchar_fd");
		puts("expected output: 'A zY'");
		ft_putchar('A');
		ft_putchar(' ');
		ft_putchar('z');
		ft_putchar_fd('Y', 1);
		ft_putchar_fd('\n', 1);
	}

	/*test ft_putstr && ft_putstr_fd*/ {
		puts("Testing: ft_putstr && ft_putstr_fd");
		ft_putstr("If this displays, putstr works. ");
		ft_putstr_fd("And if this displays, putstr_fd works.\n", 1);
	}

	/*end*/
	if (pass)
		puts("\nPart2: PASSED");
	else
		puts("\nPart2: FAILED");
}

int		main(void)
{
	test_part1();
	test_part2();
	// test_part3();
	test_bonuses();
	return (0);
}
