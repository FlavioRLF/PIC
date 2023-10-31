#line 1 "D:/SE_Projeto/Projeto Terminal/CodigoTerminal/TerminalProject.c"




char x;

void Inicia(){

 TRISB = 0x00;
 PORTB = 0x00;

 UART1_Init(9600);
}

void main() {
 Inicia();

 UART1_Write_Text("__Liga Led__");
 UART1_Write(13);
 UART1_Write_Text("Digite r para ligar o LED Vermelho");
 UART1_Write(13);
 UART1_Write_Text("Digite y para ligar o LED Amarelo");
 UART1_Write(13);
 UART1_Write_Text("Digite g para ligar o LED Verde");
 UART1_Write(13);

 while(1){
 if(UART1_Data_Ready() == 1){
 x = UART1_Read();
 UART1_Write(x);
 if(x == 'r'){
  RB0_bit  = 1;
 delay_ms(1000);
  RB0_bit  = 0;
 delay_ms(10);
 }
 if(x == 'y'){
  RB2_bit  = 1;
 delay_ms(1000);
  RB2_bit  = 0;
 delay_ms(10);
 }
 if(x == 'g'){
  RB3_bit  = 1;
 delay_ms(1000);
  RB3_bit  = 0;
 delay_ms(10);
 }

 }
 }

}
