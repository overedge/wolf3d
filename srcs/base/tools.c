#include "wolf3d.h"

void	mlx_put_pixel_image(t_env *e, int x, int y, int color)
{
	char	*y_pos;

	y_pos = e->img.data + (e->img.size_line * (y));
	y_pos += ((e->img.bpp / 8) * (x));
	*y_pos = color;
	y_pos += 1;
	*y_pos = (color >> 8);
	y_pos += 1;
	*y_pos = (color >> 16);
}

void	ft_exit(char *str)
{
	perror(str);
	exit(EXIT_FAILURE);
}
