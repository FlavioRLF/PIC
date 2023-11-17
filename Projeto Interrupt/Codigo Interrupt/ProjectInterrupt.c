bit control;  // Declaração de uma variável booleana chamada 'control'

void interrupt() {
    if (INTF_bit) {
        control = ~control;  // Inverte o valor da variável 'control'
        INTF_bit = 0x00;      // Limpa a flag de interrupção externa

        if (control) {
            RB5_bit = 0x01;  // Se 'control' é verdadeiro, define RB5 como 1
        } else {
            RB5_bit = 0x00;  // Se 'control' é falso, define RB5 como 0
        }
    }
}

void Inicia() {
    // Configuração inicial
    // CMCON = 0x00;

    GIE_bit = 0x01;    // Habilita interrupções globais
    PEIE_bit = 0x00;   // Desabilita interrupções periféricas
    INTE_bit = 0x01;   // Habilita interrupção externa
    INTEDG_bit = 0x00; // Configura borda de descida para a interrupção externa

    TRISB0_bit = 0x01; // Configura RB0 como entrada
    TRISB4_bit = 0x00; // Configura RB4 como saída
    TRISB5_bit = 0x00; // Configura RB5 como saída
    PORTB = 0x00;      // Limpa o registrador PORTB

    control = 0x00;    // Inicializa a variável 'control' com 0
}

void main() {
    Inicia();  // Chama a função de inicialização

    while (1) {
        RB4_bit = 1;      // Liga o pino RB4
        delay_ms(2000);   // Aguarda 2 segundos
        RB4_bit = 0;      // Desliga o pino RB4
        delay_ms(2000);   // Aguarda novamente 2 segundos
    }
}