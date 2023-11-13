
_Inicia:

;ProjectMotor.c,1 :: 		void Inicia(){
;ProjectMotor.c,2 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;ProjectMotor.c,3 :: 		PORTB = 0x00;
	CLRF       PORTB+0
;ProjectMotor.c,4 :: 		}
L_end_Inicia:
	RETURN
; end of _Inicia

_main:

;ProjectMotor.c,6 :: 		void main() {
;ProjectMotor.c,7 :: 		Inicia();
	CALL       _Inicia+0
;ProjectMotor.c,8 :: 		while(1){
L_main0:
;ProjectMotor.c,9 :: 		RB3_bit = 1;
	BSF        RB3_bit+0, BitPos(RB3_bit+0)
;ProjectMotor.c,10 :: 		delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
	NOP
;ProjectMotor.c,11 :: 		RB3_bit = 0;
	BCF        RB3_bit+0, BitPos(RB3_bit+0)
;ProjectMotor.c,12 :: 		delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
	NOP
;ProjectMotor.c,14 :: 		RB4_bit = 1;
	BSF        RB4_bit+0, BitPos(RB4_bit+0)
;ProjectMotor.c,15 :: 		RB5_bit = 1;
	BSF        RB5_bit+0, BitPos(RB5_bit+0)
;ProjectMotor.c,16 :: 		delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
	NOP
	NOP
;ProjectMotor.c,17 :: 		RB4_bit = 0;
	BCF        RB4_bit+0, BitPos(RB4_bit+0)
;ProjectMotor.c,18 :: 		RB5_bit = 0;
	BCF        RB5_bit+0, BitPos(RB5_bit+0)
;ProjectMotor.c,19 :: 		delay_ms(1000);
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
;ProjectMotor.c,21 :: 		RB6_bit = 1;
	BSF        RB6_bit+0, BitPos(RB6_bit+0)
;ProjectMotor.c,22 :: 		RB7_bit = 1;
	BSF        RB7_bit+0, BitPos(RB7_bit+0)
;ProjectMotor.c,23 :: 		delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
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
;ProjectMotor.c,24 :: 		RB6_bit = 0;
	BCF        RB6_bit+0, BitPos(RB6_bit+0)
;ProjectMotor.c,25 :: 		RB7_bit = 0;
	BCF        RB7_bit+0, BitPos(RB7_bit+0)
;ProjectMotor.c,26 :: 		delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	DECFSZ     R11+0, 1
	GOTO       L_main7
	NOP
	NOP
;ProjectMotor.c,27 :: 		}
	GOTO       L_main0
;ProjectMotor.c,28 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
