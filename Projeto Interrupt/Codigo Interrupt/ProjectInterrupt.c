bit control;  // Declara��o de uma vari�vel booleana chamada 'control'

void interrupt() {
    if (INTF_bit) {
        control = ~control;  // Inverte o valor da vari�vel 'control'
        INTF_bit = 0x00;      // Limpa a flag de interrup��o externa

        if (control) {
            RB5_bit = 0x01;  // Se 'control' � verdadeiro, define RB5 como 1
        } else {
            RB5_bit = 0x00;  // Se 'control' � falso, define RB5 como 0
        }
    }
}

void Inicia() {
    // Configura��o inicial
    // CMCON = 0x00;

    GIE_bit = 0x01;    // Habilita interrup��es globais
    PEIE_bit = 0x00;   // Desabilita interrup��es perif�ricas
    INTE_bit = 0x01;   // Habilita interrup��o externa
    INTEDG_bit = 0x00; // Configura borda de descida para a interrup��o externa

    TRISB0_bit = 0x01; // Configura RB0 como entrada
    TRISB4_bit = 0x00; // Configura RB4 como sa�da
    TRISB5_bit = 0x00; // Configura RB5 como sa�da
    PORTB = 0x00;      // Limpa o registrador PORTB

    control = 0x00;    // Inicializa a vari�vel 'control' com 0
}

void main() {
    Inicia();  // Chama a fun��o de inicializa��o

    while (1) {
        RB4_bit = 1;      // Liga o pino RB4
        delay_ms(2000);   // Aguarda 2 segundos
        RB4_bit = 0;      // Desliga o pino RB4
        delay_ms(2000);   // Aguarda novamente 2 segundos
    }
}