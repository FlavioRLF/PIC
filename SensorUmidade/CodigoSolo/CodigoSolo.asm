
_Inicia:

;CodigoSolo.c,21 :: 		void Inicia(){
;CodigoSolo.c,23 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;CodigoSolo.c,24 :: 		TRISA.F0 = 1;     // Entrada Analogica
	BSF        TRISA+0, 0
;CodigoSolo.c,27 :: 		ADC_Init();
	CALL       _ADC_Init+0
;CodigoSolo.c,30 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;CodigoSolo.c,31 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;CodigoSolo.c,32 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;CodigoSolo.c,34 :: 		}
L_end_Inicia:
	RETURN
; end of _Inicia

_main:

;CodigoSolo.c,36 :: 		void main() {
;CodigoSolo.c,38 :: 		Inicia();
	CALL       _Inicia+0
;CodigoSolo.c,40 :: 		Lcd_Out(1, 1, "-Sensor Umidade-");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_CodigoSolo+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;CodigoSolo.c,41 :: 		Lcd_Out(2, 1, "Umidade: ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_CodigoSolo+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;CodigoSolo.c,42 :: 		Lcd_Out(2, 14, "%");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      14
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_CodigoSolo+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;CodigoSolo.c,44 :: 		while (1) {
L_main0:
;CodigoSolo.c,46 :: 		adc_valor = ADC_Read(0);  // Lê o valor analógico no pino A0
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _word2double+0
	MOVF       R0+0, 0
	MOVWF      _adc_valor+0
	MOVF       R0+1, 0
	MOVWF      _adc_valor+1
	MOVF       R0+2, 0
	MOVWF      _adc_valor+2
	MOVF       R0+3, 0
	MOVWF      _adc_valor+3
;CodigoSolo.c,47 :: 		prc = (adc_valor/1023)*100;
	MOVLW      0
	MOVWF      R4+0
	MOVLW      192
	MOVWF      R4+1
	MOVLW      127
	MOVWF      R4+2
	MOVLW      136
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      72
	MOVWF      R4+2
	MOVLW      133
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _prc+0
	MOVF       R0+1, 0
	MOVWF      _prc+1
	MOVF       R0+2, 0
	MOVWF      _prc+2
	MOVF       R0+3, 0
	MOVWF      _prc+3
;CodigoSolo.c,50 :: 		FloatToStr_FixLen(prc, txt, 4);
	MOVF       R0+0, 0
	MOVWF      FARG_FloatToStr_FixLen_fnum+0
	MOVF       R0+1, 0
	MOVWF      FARG_FloatToStr_FixLen_fnum+1
	MOVF       R0+2, 0
	MOVWF      FARG_FloatToStr_FixLen_fnum+2
	MOVF       R0+3, 0
	MOVWF      FARG_FloatToStr_FixLen_fnum+3
	MOVLW      _txt+0
	MOVWF      FARG_FloatToStr_FixLen_str+0
	MOVLW      4
	MOVWF      FARG_FloatToStr_FixLen_len+0
	CALL       _FloatToStr_FixLen+0
;CodigoSolo.c,53 :: 		Lcd_Out(2, 10, txt);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;CodigoSolo.c,55 :: 		Delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	NOP
	NOP
;CodigoSolo.c,56 :: 		}
	GOTO       L_main0
;CodigoSolo.c,58 :: 		Delay_ms(100); // Delay para evitar sobrecarga da CPU
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	NOP
	NOP
;CodigoSolo.c,60 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
