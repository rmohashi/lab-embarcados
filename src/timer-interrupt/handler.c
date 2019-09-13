volatile unsigned int * const UART0DR = (unsigned int *)0x101f1000;
volatile unsigned int * const TIMER0X = (unsigned int *)0x101E200c;

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

void handler_timer() {
  *TIMER0X = (unsigned int)(0);
  print_handler_message();
}
