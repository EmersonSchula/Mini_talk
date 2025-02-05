# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: acesar-m <acesar-m@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/01/07 17:21:18 by acesar-m          #+#    #+#              #
#    Updated: 2025/01/13 18:48:44 by acesar-m         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SERVER	= server
CLIENT	= client

CC		= cc
CFLAGS	= -Wall -Wextra -Werror

SRCS = src
INCLUDES = -I libft/ -I src/ -I .

SRC_CLIENT = $(SRCS)/client.c
SRC_SERVER = $(SRCS)/server.c
OBJ_CLIENT = $(SRC_CLIENT:.c=.o)
OBJ_SERVER = $(SRC_SERVER:.c=.o)

LIBFT = libft/libft.a

all: $(LIBFT) $(CLIENT) $(SERVER)

$(CLIENT): $(OBJ_CLIENT) $(LIBFT)
	$(CC) $(CFLAGS) $(OBJ_CLIENT) $(LIBFT) -o $(CLIENT)

$(SERVER): $(OBJ_SERVER) $(LIBFT)
	$(CC) $(CFLAGS) $(OBJ_SERVER) $(LIBFT) -o $(SERVER)
	
%.o: %.c
		$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

$(LIBFT):
	@make -C libft
	@echo "Library Compiled."

clean:
	@make -C libft clean
	rm -f $(OBJ_CLIENT) $(OBJ_SERVER)

fclean: clean
	@make -C libft fclean
	rm -f $(CLIENT) $(SERVER)

re:	fclean all

.PHONY: clean fclean all re
