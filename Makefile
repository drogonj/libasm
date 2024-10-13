NAME    = tester
LIBNAME = libasm.a

CC      = gcc
ASM     = nasm
CFLAGS  = -fPIE
LDFLAGS = -pie
AFLAGS  = -f elf64

CSRCS   = main.c
ASRCS   = ft_write.s \
          ft_strlen.s \
          ft_strcpy.s \
          ft_strcmp.s \
          ft_strdup.s \
          ft_read.s

COBJS   = $(CSRCS:.c=.o)
AOBJS   = $(ASRCS:.s=.o)

OBJ_DIR = objs

# Créer les fichiers objets avec le bon chemin
O_COBJS   = $(addprefix $(OBJ_DIR)/,$(COBJS))
O_AOBJS   = $(addprefix $(OBJ_DIR)/,$(AOBJS))

all:    $(LIBNAME)

$(LIBNAME): $(O_AOBJS)
	ar rcs $(LIBNAME) $(O_AOBJS)

test:   $(LIBNAME) $(NAME)

$(NAME): $(O_COBJS) $(LIBNAME)
	$(CC) $(CFLAGS) $(O_COBJS) -o $(NAME) -L. -lasm $(LDFLAGS)

# Créer le répertoire pour les fichiers objets
$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

# Règle pour compiler les fichiers .c
$(OBJ_DIR)/%.o: %.c | $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

# Règle pour compiler les fichiers .s
$(OBJ_DIR)/%.o: %.s | $(OBJ_DIR)
	$(ASM) $(AFLAGS) $< -o $@

clean:
	rm -f $(NAME) $(LIBNAME)

fclean: clean
	rm -rf $(OBJ_DIR)

re:     fclean all

.PHONY: all clean fclean re test

