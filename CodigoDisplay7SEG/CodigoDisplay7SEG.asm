
_main:

;CodigoDisplay7SEG.c,8 :: 		void main() {
;CodigoDisplay7SEG.c,9 :: 		porta_b_output = 0x00;  // Inicialmente, todos os pinos B0-B6 estão desligados
	CLRF       _porta_b_output+0
;CodigoDisplay7SEG.c,10 :: 		TRISB = 0x00;           // Configura todos os pinos B como saída
	CLRF       TRISB+0
;CodigoDisplay7SEG.c,12 :: 		while (1) {
L_main0:
;CodigoDisplay7SEG.c,13 :: 		for(i = tamanho -1; i >=0; i--){
	MOVLW      1
	SUBWF      _tamanho+0, 0
	MOVWF      _i+0
	MOVLW      0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      _tamanho+1, 0
	MOVWF      _i+1
L_main2:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main7
	MOVLW      0
	SUBWF      _i+0, 0
L__main7:
	BTFSS      STATUS+0, 0
	GOTO       L_main3
;CodigoDisplay7SEG.c,14 :: 		porta_b_output = vetor[i];  // Liga todos os pinos B0-B6 (nível lógico alto)
	MOVF       _i+0, 0
	MOVWF      R0+0
	MOVF       _i+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _vetor+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      _porta_b_output+0
;CodigoDisplay7SEG.c,15 :: 		PORTB = porta_b_output;
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;CodigoDisplay7SEG.c,16 :: 		Delay_ms(1000);         // Espera 1 segundo
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
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
;CodigoDisplay7SEG.c,13 :: 		for(i = tamanho -1; i >=0; i--){
	MOVLW      1
	SUBWF      _i+0, 1
	BTFSS      STATUS+0, 0
	DECF       _i+1, 1
;CodigoDisplay7SEG.c,18 :: 		}
	GOTO       L_main2
L_main3:
;CodigoDisplay7SEG.c,19 :: 		}
	GOTO       L_main0
;CodigoDisplay7SEG.c,20 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
