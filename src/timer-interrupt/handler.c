volatile unsigned int * const UART0DR = (unsigned int *)0x101f1000;
volatile unsigned int * const TIMER0X = (unsigned int *)0x101E200c;
volatile unsigned int * const TIMER0V = (unsigned int *)0x301e0054;
volatile unsigned int * const TIMER0Z = (unsigned int *)0x301e001c;

int value = 0;

void print_uart0(const char *s) {
  while(*s != '\0') { /* Loop until end of string */
    *UART0DR = (unsigned int)(*s); /* Transmit char */
    s++; /* Next char */
  }
}

void print_main_message() {
  while(1) {
    print_uart0(" ");
  }
}

void print_handler_message() {
  print_uart0("#");
}

void read_new_port() {
  int *x = *TIMER0Z;
  char arr[2];
  arr[0] = (char) x;
  arr[1] = '\0';
  print_uart0(arr);
}

void handler_timer() {
  *TIMER0X = (unsigned int)(0);
  value = !value;
  *TIMER0V = (unsigned int)(value);
  print_handler_message();
}
