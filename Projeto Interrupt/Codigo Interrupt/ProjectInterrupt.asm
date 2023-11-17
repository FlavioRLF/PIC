
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;ProjectInterrupt.c,3 :: 		void interrupt() {
;ProjectInterrupt.c,4 :: 		if (INTF_bit) {
	BTFSS      INTF_bit+0, BitPos(INTF_bit+0)
	GOTO       L_interrupt0
;ProjectInterrupt.c,5 :: 		control = ~control;  // Inverte o valor da variável 'control'
	MOVLW
	XORWF      _control+0, 1
;ProjectInterrupt.c,6 :: 		INTF_bit = 0x00;      // Limpa a flag de interrupção externa
	BCF        INTF_bit+0, BitPos(INTF_bit+0)
;ProjectInterrupt.c,8 :: 		if (control) {
	BTFSS      _control+0, BitPos(_control+0)
	GOTO       L_interrupt1
;ProjectInterrupt.c,9 :: 		RB5_bit = 0x01;  // Se 'control' é verdadeiro, define RB5 como 1
	BSF        RB5_bit+0, BitPos(RB5_bit+0)
;ProjectInterrupt.c,10 :: 		} else {
	GOTO       L_interrupt2
L_interrupt1:
;ProjectInterrupt.c,11 :: 		RB5_bit = 0x00;  // Se 'control' é falso, define RB5 como 0
	BCF        RB5_bit+0, BitPos(RB5_bit+0)
;ProjectInterrupt.c,12 :: 		}
L_interrupt2:
;ProjectInterrupt.c,13 :: 		}
L_interrupt0:
;ProjectInterrupt.c,14 :: 		}
L_end_interrupt:
L__interrupt8:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_Inicia:

;ProjectInterrupt.c,16 :: 		void Inicia() {
;ProjectInterrupt.c,20 :: 		GIE_bit = 0x01;    // Habilita interrupções globais
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;ProjectInterrupt.c,21 :: 		PEIE_bit = 0x00;   // Desabilita interrupções periféricas
	BCF        PEIE_bit+0, BitPos(PEIE_bit+0)
;ProjectInterrupt.c,22 :: 		INTE_bit = 0x01;   // Habilita interrupção externa
	BSF        INTE_bit+0, BitPos(INTE_bit+0)
;ProjectInterrupt.c,23 :: 		INTEDG_bit = 0x00; // Configura borda de descida para a interrupção externa
	BCF        INTEDG_bit+0, BitPos(INTEDG_bit+0)
;ProjectInterrupt.c,25 :: 		TRISB0_bit = 0x01; // Configura RB0 como entrada
	BSF        TRISB0_bit+0, BitPos(TRISB0_bit+0)
;ProjectInterrupt.c,26 :: 		TRISB4_bit = 0x00; // Configura RB4 como saída
	BCF        TRISB4_bit+0, BitPos(TRISB4_bit+0)
;ProjectInterrupt.c,27 :: 		TRISB5_bit = 0x00; // Configura RB5 como saída
	BCF        TRISB5_bit+0, BitPos(TRISB5_bit+0)
;ProjectInterrupt.c,28 :: 		PORTB = 0x00;      // Limpa o registrador PORTB
	CLRF       PORTB+0
;ProjectInterrupt.c,30 :: 		control = 0x00;    // Inicializa a variável 'control' com 0
	BCF        _control+0, BitPos(_control+0)
;ProjectInterrupt.c,31 :: 		}
L_end_Inicia:
	RETURN
; end of _Inicia

_main:

;ProjectInterrupt.c,33 :: 		void main() {
;ProjectInterrupt.c,34 :: 		Inicia();  // Chama a função de inicialização
	CALL       _Inicia+0
;ProjectInterrupt.c,36 :: 		while (1) {
L_main3:
;ProjectInterrupt.c,37 :: 		RB4_bit = 1;      // Liga o pino RB4
	BSF        RB4_bit+0, BitPos(RB4_bit+0)
;ProjectInterrupt.c,38 :: 		delay_ms(2000);   // Aguarda 2 segundos
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
	NOP
;ProjectInterrupt.c,39 :: 		RB4_bit = 0;      // Desliga o pino RB4
	BCF        RB4_bit+0, BitPos(RB4_bit+0)
;ProjectInterrupt.c,40 :: 		delay_ms(2000);   // Aguarda novamente 2 segundos
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	DECFSZ     R11+0, 1
	GOTO       L_main6
	NOP
	NOP
;ProjectInterrupt.c,41 :: 		}
	GOTO       L_main3
;ProjectInterrupt.c,42 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
