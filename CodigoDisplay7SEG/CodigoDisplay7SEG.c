
// Configuração dos pinos
unsigned char porta_b_output;
int i;
int vetor[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F};
int tamanho = sizeof(vetor)/sizeof(vetor[0]);

void main() {
    porta_b_output = 0x00;  // Inicialmente, todos os pinos B0-B6 estão desligados
    TRISB = 0x00;           // Configura todos os pinos B como saída

    while (1) {
        for(i = tamanho -1; i >=0; i--){
              porta_b_output = vetor[i];  // Liga todos os pinos B0-B6 (nível lógico alto)
              PORTB = porta_b_output;
              Delay_ms(1000);         // Espera 1 segundo

        }
    }
}
