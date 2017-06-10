/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_memmove.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ggroener <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2016/05/12 07:17:12 by ggroener          #+#    #+#             */
/*   Updated: 2016/05/12 07:21:06 by ggroener         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

void	*ft_memmove(void *dst, const void *src, size_t len)
{
	size_t	k;
	char	*d;
	char	*s;

	d = (char *)dst;
	s = (char *)src;
	if (s > d)
	{
		k = -1;
		while (++k < len)
			d[k] = s[k];
	}
	else if (s < d)
	{
		k = len;
		while ((--k) > 0)
			d[k] = s[k];
		d[k] = s[k];
	}
	return (d);
}
