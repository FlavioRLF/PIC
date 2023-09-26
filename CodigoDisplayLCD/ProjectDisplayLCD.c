// Keypad + LCD + P26F877A code

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


char keypadPort at PORTD;


void Inicia(){

     TRISB = 0x00;
     TRISD = 0xFF;

     // Funcao Teclado
     Keypad_Init();

     // Funcoes Lcd
     Lcd_Init();
     Lcd_Cmd(_LCD_CLEAR);

}

char key;
char i = 0;
char val1, val2 = 0;

void main() {
     char key = Keypad_Key_Press();

     Inicia();
     
     Lcd_Out(1, 1, "Digite:");

      while (1) {
        // Verifica se uma tecla foi pressionada no teclado
        key = Keypad_Key_Click();
        
        switch (key) {
          case  1: key = 55; break; // 7
          case  2: key = 52; break; // 4
          case  3: key = 49; break; // 1
          case  4: key = 127; break; // ON/C
          case  5: key = 56; break; // 8
          case  6: key = 53; break; // 5
          case  7: key = 50; break; // 2
          case  8: key = 48; break; // 0
          case  9: key = 57; break; // 9
          case 10: key = 54; break; // 6
          case 11: key = 51; break; // 3
          case 12: key = 61; break; // =
          case 13: key = 47; break; // /
          case 14: key = 42; break; // *
          case 15: key = 45; break; // -
          case 16: key = 43; break; // +
        }
        
        if (key != 0) {
            if(key == 127){
                Lcd_Cmd(_LCD_CLEAR);
                Lcd_Out(1, 1, "Digite:");
                i=0;
            }
            else if (i < 16) {
                // Exibe o caractere no LCD na posição atual
                Lcd_Chr(2, i + 1, key);
                i++;
            }
        }
        Delay_ms(100); // Delay para evitar sobrecarga da CPU
      }
}

     
