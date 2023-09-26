#line 1 "D:/SE_Projeto/Projeto Display7SEG/CodigoDisplay7SEG/CodigoDisplay7SEG.c"


unsigned char porta_b_output;
int i;
int vetor[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F};
int tamanho = sizeof(vetor)/sizeof(vetor[0]);

void main() {
 porta_b_output = 0x00;
 TRISB = 0x00;

 while (1) {
 for(i = tamanho -1; i >=0; i--){
 porta_b_output = vetor[i];
 PORTB = porta_b_output;
 Delay_ms(1000);

 }
 }
}
