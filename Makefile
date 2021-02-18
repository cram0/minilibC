##
## EPITECH PROJECT, 2021
## B-ASM-400-NCE-4-1-asmminilibc-julien.augugliaro
## File description:
## Makefile
##

NAME	=	libasm.so

SRCS	=	$(shell find . -name '*.asm')

OBJS	=	$(SRCS:.asm=.o)

TEST	=	test.c

TNAME	=	unit_test

all:		$(NAME)

$(NAME)    :    $(OBJS)
				gcc -shared -fPIC -nostdlib $(OBJS) -o $(NAME)

%.o        :    %.asm
				nasm -f elf64 -o $@ $<

launch     :    re
				gcc -o $(TNAME) $(SRC) $(TEST)
				LD_PRELOAD=./libasm.so ./unit_test

clean      :
				rm -f $(OBJS)

fclean     :    clean
				rm -f $(NAME) $(TNAME)

re         :    fclean all

.PHONY:		all clean fclean re