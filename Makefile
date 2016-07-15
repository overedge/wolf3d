NAME = wolf3d
CC = gcc
INC_DIR = include/
OBJ_DIR = .objects/
OBJS = $(addprefix $(OBJ_DIR), $(SRC:.c=.o))
LIBPATH = libft
LIB = $(LIBPATH)/libft.a
LDFLAGS = -L libft -lft -L mlx -lmlx
VPATH = srcs:srcs/base:srcs/parsing

ifdef FLAGS
	ifeq ($(FLAGS), no)
		CFLAGS=
	endif
	ifeq ($(FLAGS), debug)
		CFLAGS= -Wall -Wextra -Werror -g
	endif
else
	CFLAGS = -Wall -Wextra -Werror
endif

SRC =  tools.c \
	parse_map.c \

MAIN = srcs/main.c

.PHONY: all clean fclean re

default: all

all: $(LIB) $(NAME)
	@echo " # sh : Job done $(shell pwd)/$(NAME)"

$(NAME): $(OBJ_DIR) $(OBJS)
	@$(CC) $(CFLAGS) $(MAIN) $(OBJS) $(LDFLAGS) -framework OpenGL -framework AppKit -I libft/includes/ -I $(INC_DIR) -o $(NAME)

$(LIB):
	@make -C $(LIBPATH)
	@make -C mlx

clean:
	@make -C libft/ clean -s
	@make -C mlx/ clean
	@echo " $(shell\
		if [ -d $(OBJ_DIR) ]; then\
			echo "- sh : Removing $(OBJ_DIR) with";\
			ls $(OBJ_DIR) | wc -w; echo "*.o";\
			rm -Rf $(OBJ_DIR);\
		else\
			echo "# sh : Nothing to clean";\
		fi)"

fclean: clean
	@make -C libft/ fclean -s
	@make -C mlx/ fclean
	@echo " $(shell\
		if [ -f $(NAME) ]; then\
			echo "- sh : Removing $ $(NAME) ";\
			rm -f $(NAME);\
		else\
			echo "# sh : Nothing to fclean";\
		fi)"

re: fclean all

$(addprefix $(OBJ_DIR), %.o): $(addprefix $(SRC_DIR), %.c)
	@echo " + sh : Compiling $(OBJ_DIR) < $^"
	@$(CC) $(CFLAGS) -I $(INC_DIR) -I libft/includes -o $@ -c $<

$(OBJ_DIR):
	@echo " + sh : Creating $(OBJ_DIR)"
	@mkdir -p $(OBJ_DIR)
	@mkdir -p $(OBJ_DIR)/base
