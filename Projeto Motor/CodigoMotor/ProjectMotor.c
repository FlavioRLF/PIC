void Inicia(){
     TRISB = 0x00;
     PORTB = 0x00;
}

void main() {
     Inicia();
     while(1){
              RB3_bit = 1;
              delay_ms(1000);
              RB3_bit = 0;
              delay_ms(1000);
              
              RB4_bit = 1;
              RB5_bit = 1;
              delay_ms(1000);
              RB4_bit = 0;
              RB5_bit = 0;
              delay_ms(1000);
              
              RB6_bit = 1;
              RB7_bit = 1;
              delay_ms(1000);
              RB6_bit = 0;
              RB7_bit = 0;
              delay_ms(1000);
     }
}