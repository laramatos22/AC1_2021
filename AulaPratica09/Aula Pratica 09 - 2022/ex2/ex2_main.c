void main (void)
{
	double f;
	print_string("Introduzir um Valor em Fahrenheit: ");
	f = read_double();
	print_string("\nTemperatura em Celsius: ");
	print_double(f2c(f));
}