#include "wolf3d.h"

int		main(void)
{
	t_env	e;
	int		fd;

	ft_bzero(&e, sizeof(t_env));
	if ((fd = open("map.txt", O_RDWR)) == -1)
		ft_exit("Map: Open");
	parse_map(&e, fd);
	close(fd);
}
