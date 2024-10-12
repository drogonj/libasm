
NAME	= tester

CC	= gcc
ASM	= nasm
CFLAGS  = -fPIE 
LDFLAGS	= -pie
AFLAGS	= -f elf64

CSRCS	= main.c
ASRCS	= ft_write.s \
	  ft_strlen.s \
	  ft_strcpy.s \
	  ft_strcmp.s

COBJS	= $(CSRCS:.c=.o)
AOBJS	= $(ASRCS:.s=.o)

all:	$(NAME)

$(NAME): $(COBJS) $(AOBJS)
	$(CC) $(CFLAGS) $(COBJS) $(AOBJS) -o $(NAME) $(LDFLAGS)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

%.o: %.s
	$(ASM) $(AFLAGS) $< -o $@

clean:
	rm -f $(NAME)

fclean: clean
	rm -f $(COBJS) $(AOBJS)

re:	fclean all

.PHONY: all clean fclean re
