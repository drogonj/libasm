#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <errno.h>
#include <stdlib.h>
#include <fcntl.h>

#define MG "\e[0;35m"
#define BL "\e[0;34m"
#define R  "\e[0m"


// http://6.s081.scripts.mit.edu/sp18/x86-64-architecture-guide.html
// https://cs.brown.edu/courses/cs033/docs/guides/x64_cheatsheet.pdf
// https://chromium.googlesource.com/chromiumos/docs/+/master/constants/syscalls.md#x86_64-64_bit

size_t  ft_strlen(const char * str);
char *  ft_strcpy(char * dest, const char * src);
ssize_t ft_write(int fd, const void * buf, size_t count);
int     ft_strcmp(const char *s1, const char *s2);
char *  ft_strdup(const char *s);
ssize_t ft_read(int fd, void *buf, size_t count);

int main() {
	char bjr[9] = {0};
	char ft_bjr[9] = {0};

	{
		printf("%s/////   ft_strcpy   /////%s\n", MG, R);
		strcpy(bjr, "bonjour");
		printf("%s\n", bjr);
		ft_strcpy(ft_bjr, "bonjour");
		printf("%s\n", ft_bjr);

	}
	{	
		printf("%s/////   ft_strlen   /////%s\n", MG, R);
		printf("strlen: %lu\n", strlen(bjr));
		printf("ft_strlen: %lu\n", ft_strlen(bjr));
	{
	}
		printf("%s/////   ft_write   /////%s\n", MG, R);
		printf("%swrite%s\n", BL, R);
		printf("\nreturn: %ld\n", write(0, bjr, strlen(bjr)));
		perror("errno");
		printf("%sft_write%s\n", BL, R);
		printf("\nreturn: %ld\n", ft_write(0, bjr, strlen(bjr)));
		perror("errno");
	}
	{	
		printf("%s/////   ft_strcmp   /////%s\n", MG, R);
		char a[] = "aaa";
		char b[] = "aab";
		printf("strcmp: %d\n", strcmp(a, b));
		printf("ft_strcmp: %d\n", ft_strcmp(a, b));
	}
	{
		printf("%s/////   ft_strdup   /////%s\n", MG, R);
		printf("%soriginal: %p\n%s", BL, bjr, R);
		char * c = strdup("bonjour");	
		printf("strdup: %s\n", c);
        	printf("%scopy: %p\n%s", BL, c, R);	
		perror("errno");
		char * d = ft_strdup("bonjour");
		printf("ft_strdup: %s\n", d);
		printf("%scopy: %p\n%s", BL, d, R);
		perror("errno");
		free(c);
		free(d);
	}
	{
		printf("%s/////   ft_read   /////%s\n", MG, R);
		int fd = open("./.gitignore", O_RDONLY);
		char abuff[7] = {0};
		printf("%sread\n%s", BL, R);
		printf("%ld\n", read(fd, &abuff, 6));
		printf("%s\n", abuff);
		perror("errno");
		close(fd);
	
		fd = open("./.gitignore", O_RDONLY);
		char bbuff[7] = {0};
        	printf("%sft_read\n%s", BL, R);
        	printf("%ld\n", ft_read(fd, &bbuff, 6));
        	printf("%s\n", bbuff);
        	perror("errno");
	}
	return 0;
}
