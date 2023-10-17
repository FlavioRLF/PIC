// P16F877A
sbit LCD_RS at RB2_bit;
sbit LCD_EN at RB3_bit;
sbit LCD_D4 at RB4_bit;
sbit LCD_D5 at RB5_bit;
sbit LCD_D6 at RB6_bit;
sbit LCD_D7 at RB7_bit;

sbit LCD_RS_Direction at TRISB2_bit;
sbit LCD_EN_Direction at TRISB3_bit;
sbit LCD_D4_Direction at TRISB4_bit;
sbit LCD_D5_Direction at TRISB5_bit;
sbit LCD_D6_Direction at TRISB6_bit;
sbit LCD_D7_Direction at TRISB7_bit;

char txt[16];  // String temporária para armazenar o valor da umidade
char v_txt[16];  // String temporária para armazenar o valor da umidade
float adc_valor; // valor analog p/ digital
float prc;       // valor em porcentagem

void Inicia(){

     TRISB = 0x00;
     TRISA.F0 = 1;     // Entrada Analogica

     // Inicializa ADC
     ADC_Init();

     // Funcoes Lcd
     Lcd_Init();
     Lcd_Cmd(_LCD_CLEAR);
     Lcd_Cmd(_LCD_CURSOR_OFF);

}

void main() {

     Inicia();

     Lcd_Out(1, 1, "-Sensor Umidade-");
     Lcd_Out(2, 1, "Umidade: ");
     Lcd_Out(2, 14, "%");
     
      while (1) {
         // Realiza a leitura do sensor de umidade conectado ao pino A0
         adc_valor = ADC_Read(0);  // Lê o valor analógico no pino A0
         prc = (adc_valor/1023)*100;
         
         // Converte o valor lido para uma string
         FloatToStr_FixLen(prc, txt, 4);

         // Exibe o valor da umidade
         Lcd_Out(2, 10, txt);

         Delay_ms(100);
     }
     
     Delay_ms(100); // Delay para evitar sobrecarga da CPU

}
