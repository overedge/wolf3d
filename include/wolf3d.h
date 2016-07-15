#ifndef WOLD3D_H
# define WOLD3D_H

# include "../libft/includes/libft.h"
# include "mlx.h"
# include <stdlib.h>
# include <stdio.h>
# include <fcntl.h>
# include <unistd.h>
# define W_HEIGHT 500
# define W_WIDTH 500


typedef struct	s_img
{
	char		*data;
	int			bpp;
	int			size_line;
	int			edian;
	void		*ptr;
}				t_img;

typedef struct	s_env
{
	int			**map;
	int			map_h;
	int			map_w;
	void		*mlx;
	void		*win;
	t_img		img;
}				t_env;

void		parse_map(t_env *e, int fd);
void		mlx_put_pixel_image(t_env *e, int x, int y, int color);
void		ft_exit(char *str);
#endif
