
_Inicia:

;TerminalProject.c,7 :: 		void Inicia(){
;TerminalProject.c,9 :: 		TRISB = 0x00; // Configura o RB0 como saída
	CLRF       TRISB+0
;TerminalProject.c,10 :: 		PORTB = 0x00;
	CLRF       PORTB+0
;TerminalProject.c,12 :: 		UART1_Init(9600);
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;TerminalProject.c,13 :: 		}
L_end_Inicia:
	RETURN
; end of _Inicia

_main:

;TerminalProject.c,15 :: 		void main() {
;TerminalProject.c,16 :: 		Inicia();
	CALL       _Inicia+0
;TerminalProject.c,18 :: 		UART1_Write_Text("__Liga Led__");
	MOVLW      ?lstr1_TerminalProject+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;TerminalProject.c,19 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;TerminalProject.c,20 :: 		UART1_Write_Text("Digite r para ligar o LED Vermelho");
	MOVLW      ?lstr2_TerminalProject+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;TerminalProject.c,21 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;TerminalProject.c,22 :: 		UART1_Write_Text("Digite y para ligar o LED Amarelo");
	MOVLW      ?lstr3_TerminalProject+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;TerminalProject.c,23 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;TerminalProject.c,24 :: 		UART1_Write_Text("Digite g para ligar o LED Verde");
	MOVLW      ?lstr4_TerminalProject+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;TerminalProject.c,25 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;TerminalProject.c,27 :: 		while(1){
L_main0:
;TerminalProject.c,28 :: 		if(UART1_Data_Ready() == 1){
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main2
;TerminalProject.c,29 :: 		x = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _x+0
;TerminalProject.c,30 :: 		UART1_Write(x);
	MOVF       R0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;TerminalProject.c,31 :: 		if(x == 'r'){
	MOVF       _x+0, 0
	XORLW      114
	BTFSS      STATUS+0, 2
	GOTO       L_main3
;TerminalProject.c,32 :: 		Vermelho = 1;
	BSF        RB0_bit+0, BitPos(RB0_bit+0)
;TerminalProject.c,33 :: 		delay_ms(1000);
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
;TerminalProject.c,34 :: 		Vermelho = 0;
	BCF        RB0_bit+0, BitPos(RB0_bit+0)
;TerminalProject.c,35 :: 		delay_ms(10);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	NOP
	NOP
;TerminalProject.c,36 :: 		}
L_main3:
;TerminalProject.c,37 :: 		if(x == 'y'){
	MOVF       _x+0, 0
	XORLW      121
	BTFSS      STATUS+0, 2
	GOTO       L_main6
;TerminalProject.c,38 :: 		Amarelo = 1;
	BSF        RB2_bit+0, BitPos(RB2_bit+0)
;TerminalProject.c,39 :: 		delay_ms(1000);
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
;TerminalProject.c,40 :: 		Amarelo = 0;
	BCF        RB2_bit+0, BitPos(RB2_bit+0)
;TerminalProject.c,41 :: 		delay_ms(10);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
	NOP
	NOP
;TerminalProject.c,42 :: 		}
L_main6:
;TerminalProject.c,43 :: 		if(x == 'g'){
	MOVF       _x+0, 0
	XORLW      103
	BTFSS      STATUS+0, 2
	GOTO       L_main9
;TerminalProject.c,44 :: 		Verde = 1;
	BSF        RB3_bit+0, BitPos(RB3_bit+0)
;TerminalProject.c,45 :: 		delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main10:
	DECFSZ     R13+0, 1
	GOTO       L_main10
	DECFSZ     R12+0, 1
	GOTO       L_main10
	DECFSZ     R11+0, 1
	GOTO       L_main10
	NOP
	NOP
;TerminalProject.c,46 :: 		Verde = 0;
	BCF        RB3_bit+0, BitPos(RB3_bit+0)
;TerminalProject.c,47 :: 		delay_ms(10);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_main11:
	DECFSZ     R13+0, 1
	GOTO       L_main11
	DECFSZ     R12+0, 1
	GOTO       L_main11
	NOP
	NOP
;TerminalProject.c,48 :: 		}
L_main9:
;TerminalProject.c,50 :: 		}
L_main2:
;TerminalProject.c,51 :: 		}
	GOTO       L_main0
;TerminalProject.c,53 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
