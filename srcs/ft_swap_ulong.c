/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_swap_ulong.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ggroener <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/06/22 09:13:01 by ggroener          #+#    #+#             */
/*   Updated: 2017/06/22 09:13:03 by ggroener         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

unsigned long long	ft_swap_ulong(unsigned long long l)
{
	return (((l >> 56) & 0xff) | ((l >> 40) & 0xff00) | ((l >> 24) & 0xff0000)
			| ((l >> 8) & 0xff000000) | ((l & 0xff000000) << 8)
			| ((l & 0xff0000) << 24) | ((l & 0xff00) << 40)
			| ((l & 0xff) << 56));
}
