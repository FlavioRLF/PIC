#define Vermelho RB0_bit
#define Amarelo RB2_bit
#define Verde RB3_bit

char x;

void Inicia(){

     TRISB = 0x00; // Configura o RB0 como saída
     PORTB = 0x00;

     UART1_Init(9600);
}

void main() {
     Inicia();
     
     UART1_Write_Text("__Liga Led__");
     UART1_Write(13);   // Salta uma linha no terminal
     UART1_Write_Text("Digite r para ligar o LED Vermelho");
     UART1_Write(13);   // Salta uma linha no terminal
     UART1_Write_Text("Digite y para ligar o LED Amarelo");
     UART1_Write(13);   // Salta uma linha no terminal
     UART1_Write_Text("Digite g para ligar o LED Verde");
     UART1_Write(13);   // Salta uma linha no terminal
     
     while(1){
              if(UART1_Data_Ready() == 1){
                                    x = UART1_Read();  
                                    UART1_Write(x);
                                    if(x == 'r'){
                                         Vermelho = 1;
                                         delay_ms(1000);
                                         Vermelho = 0;
                                         delay_ms(10);
                                    }
                                    if(x == 'y'){
                                         Amarelo = 1;
                                         delay_ms(1000);
                                         Amarelo = 0;
                                         delay_ms(10);
                                    }
                                    if(x == 'g'){
                                         Verde = 1;
                                         delay_ms(1000);
                                         Verde = 0;
                                         delay_ms(10);
                                    }

              }
     }

}
