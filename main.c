#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <errno.h>

#define MG "\e[0;35m"
#define BL "\e[0;34m"
#define R  "\e[0m"

size_t  ft_strlen(const char * str);
char *  ft_strcpy(char * dest, const char * src);
ssize_t ft_write(int fd, const void * buf, size_t count);
int     ft_strcmp(const char *s1, const char *s2);

int main() {
	char bjr[9] = {0};
	char ft_bjr[9] = {0};

	printf("%s/////   ft_strcpy   /////%s\n", MG, R);
	strcpy(bjr, "bonjour\n");
	printf("%s", bjr);
	ft_strcpy(ft_bjr, "bonjour\n");
	printf("%s", ft_bjr);

	printf("%s/////   ft_strlen   /////%s\n", MG, R);
	printf("strlen: %lu\n", strlen(bjr));
	printf("ft_strlen: %lu\n", ft_strlen(bjr));

	printf("%s/////   ft_write   /////%s\n", MG, R);
	printf("%swrite%s\n", BL, R);
	printf("return: %ld\n", write(0, bjr, strlen(bjr)));
	//printf("errno: %d\n", errno);
	printf("%sft_write%s\n", BL, R);
	printf("return: %ld\n", ft_write(0, bjr, strlen(bjr)));
	//printf("errno: %d\n", errno);
	
	printf("%s/////   ft_strcmp   /////%s\n", MG, R);
	char a[] = "aaa";
	char b[] = "bbb";
	printf("strcmp: %d\n", strcmp(a, b));
	printf("ft_strcmp: %d\n", ft_strcmp(a, b));

	return 0;
}
