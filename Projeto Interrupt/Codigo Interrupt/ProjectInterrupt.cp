#line 1 "D:/SE_Projeto/Project Interrupt/Codigo Interrupt/ProjectInterrupt.c"
bit control;

void interrupt() {
 if (INTF_bit) {
 control = ~control;
 INTF_bit = 0x00;

 if (control) {
 RB5_bit = 0x01;
 } else {
 RB5_bit = 0x00;
 }
 }
}

void Inicia() {



 GIE_bit = 0x01;
 PEIE_bit = 0x00;
 INTE_bit = 0x01;
 INTEDG_bit = 0x00;

 TRISB0_bit = 0x01;
 TRISB4_bit = 0x00;
 TRISB5_bit = 0x00;
 PORTB = 0x00;

 control = 0x00;
}

void main() {
 Inicia();

 while (1) {
 RB4_bit = 1;
 delay_ms(2000);
 RB4_bit = 0;
 delay_ms(2000);
 }
}
