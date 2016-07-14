#include "wolf3d.h"

int		main(void)
{
	void	*mlx;
	void	*win;

	mlx = mlx_init();
	win = mlx_new_window(mlx, W_WIDTH, W_HEIGHT, "wold3d");
	mlx_loop(mlx);
}
