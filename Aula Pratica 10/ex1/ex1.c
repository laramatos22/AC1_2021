int main (void) {
	float x;
	int y;
	print_string("Introduza a base (float): ");
	x = read_float();
	print_string("\nIntroduza o exponente (int): ");
	y = read_int();
	print_string("\nResultado: ");
	print_float(xtoy(x, y));
	return 0;
}