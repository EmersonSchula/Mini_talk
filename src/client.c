/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: acesar-m <acesar-m@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/01/07 17:21:10 by acesar-m          #+#    #+#             */
/*   Updated: 2025/01/13 14:20:07 by acesar-m         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

static int	g_reply = 0;

void	signal_reception(int signal)
{
	if (signal == SIGUSR1)
		g_reply = 1;
}

void	send_bits(int pid, char *msg, size_t len)
{
	size_t	i;
	int		bit;

	i = 0;
	while (i < len)
	{
		bit = 0;
		while (bit < 8)
		{
			if ((msg[i] >> (7 - bit)) & 1)
				kill(pid, SIGUSR1);
			else
				kill(pid, SIGUSR2);
			bit++;
			usleep(10000);
			while (!g_reply)
				pause();
			g_reply = 0;
		}
		i++;
	}
}

int	main(int argc, char **argv)
{
	int	pid;

	if (argc != 3)
	{
		ft_printf("Incorrect syntax: ./client <PID> <Message>\n");
		return (1);
	}
	pid = ft_atoi(argv[1]);
	if (pid <= 0)
	{
		ft_printf("Error: Invalid PID.\n");
		return (1);
	}
	signal(SIGUSR1, signal_reception);
	send_bits(pid, argv[2], ft_strlen(argv[2]) + 1);
	return (0);
}
