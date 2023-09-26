
_Inicia:

;ProjectDisplayLCD.c,21 :: 		void Inicia(){
;ProjectDisplayLCD.c,23 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;ProjectDisplayLCD.c,24 :: 		TRISD = 0xFF;
	MOVLW      255
	MOVWF      TRISD+0
;ProjectDisplayLCD.c,27 :: 		Keypad_Init();
	CALL       _Keypad_Init+0
;ProjectDisplayLCD.c,30 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;ProjectDisplayLCD.c,31 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;ProjectDisplayLCD.c,33 :: 		}
L_end_Inicia:
	RETURN
; end of _Inicia

_main:

;ProjectDisplayLCD.c,39 :: 		void main() {
;ProjectDisplayLCD.c,40 :: 		char key = Keypad_Key_Press();
	CALL       _Keypad_Key_Press+0
	MOVF       R0+0, 0
	MOVWF      main_key_L0+0
;ProjectDisplayLCD.c,42 :: 		Inicia();
	CALL       _Inicia+0
;ProjectDisplayLCD.c,44 :: 		Lcd_Out(1, 1, "Digite:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_ProjectDisplayLCD+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ProjectDisplayLCD.c,46 :: 		while (1) {
L_main0:
;ProjectDisplayLCD.c,48 :: 		key = Keypad_Key_Click();
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      main_key_L0+0
;ProjectDisplayLCD.c,50 :: 		switch (key) {
	GOTO       L_main2
;ProjectDisplayLCD.c,51 :: 		case  1: key = 55; break; // 7
L_main4:
	MOVLW      55
	MOVWF      main_key_L0+0
	GOTO       L_main3
;ProjectDisplayLCD.c,52 :: 		case  2: key = 52; break; // 4
L_main5:
	MOVLW      52
	MOVWF      main_key_L0+0
	GOTO       L_main3
;ProjectDisplayLCD.c,53 :: 		case  3: key = 49; break; // 1
L_main6:
	MOVLW      49
	MOVWF      main_key_L0+0
	GOTO       L_main3
;ProjectDisplayLCD.c,54 :: 		case  4: key = 127; break; // ON/C
L_main7:
	MOVLW      127
	MOVWF      main_key_L0+0
	GOTO       L_main3
;ProjectDisplayLCD.c,55 :: 		case  5: key = 56; break; // 8
L_main8:
	MOVLW      56
	MOVWF      main_key_L0+0
	GOTO       L_main3
;ProjectDisplayLCD.c,56 :: 		case  6: key = 53; break; // 5
L_main9:
	MOVLW      53
	MOVWF      main_key_L0+0
	GOTO       L_main3
;ProjectDisplayLCD.c,57 :: 		case  7: key = 50; break; // 2
L_main10:
	MOVLW      50
	MOVWF      main_key_L0+0
	GOTO       L_main3
;ProjectDisplayLCD.c,58 :: 		case  8: key = 48; break; // 0
L_main11:
	MOVLW      48
	MOVWF      main_key_L0+0
	GOTO       L_main3
;ProjectDisplayLCD.c,59 :: 		case  9: key = 57; break; // 9
L_main12:
	MOVLW      57
	MOVWF      main_key_L0+0
	GOTO       L_main3
;ProjectDisplayLCD.c,60 :: 		case 10: key = 54; break; // 6
L_main13:
	MOVLW      54
	MOVWF      main_key_L0+0
	GOTO       L_main3
;ProjectDisplayLCD.c,61 :: 		case 11: key = 51; break; // 3
L_main14:
	MOVLW      51
	MOVWF      main_key_L0+0
	GOTO       L_main3
;ProjectDisplayLCD.c,62 :: 		case 12: key = 61; break; // =
L_main15:
	MOVLW      61
	MOVWF      main_key_L0+0
	GOTO       L_main3
;ProjectDisplayLCD.c,63 :: 		case 13: key = 47; break; // /
L_main16:
	MOVLW      47
	MOVWF      main_key_L0+0
	GOTO       L_main3
;ProjectDisplayLCD.c,64 :: 		case 14: key = 42; break; // *
L_main17:
	MOVLW      42
	MOVWF      main_key_L0+0
	GOTO       L_main3
;ProjectDisplayLCD.c,65 :: 		case 15: key = 45; break; // -
L_main18:
	MOVLW      45
	MOVWF      main_key_L0+0
	GOTO       L_main3
;ProjectDisplayLCD.c,66 :: 		case 16: key = 43; break; // +
L_main19:
	MOVLW      43
	MOVWF      main_key_L0+0
	GOTO       L_main3
;ProjectDisplayLCD.c,67 :: 		}
L_main2:
	MOVF       main_key_L0+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_main4
	MOVF       main_key_L0+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_main5
	MOVF       main_key_L0+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_main6
	MOVF       main_key_L0+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_main7
	MOVF       main_key_L0+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_main8
	MOVF       main_key_L0+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_main9
	MOVF       main_key_L0+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_main10
	MOVF       main_key_L0+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_main11
	MOVF       main_key_L0+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_main12
	MOVF       main_key_L0+0, 0
	XORLW      10
	BTFSC      STATUS+0, 2
	GOTO       L_main13
	MOVF       main_key_L0+0, 0
	XORLW      11
	BTFSC      STATUS+0, 2
	GOTO       L_main14
	MOVF       main_key_L0+0, 0
	XORLW      12
	BTFSC      STATUS+0, 2
	GOTO       L_main15
	MOVF       main_key_L0+0, 0
	XORLW      13
	BTFSC      STATUS+0, 2
	GOTO       L_main16
	MOVF       main_key_L0+0, 0
	XORLW      14
	BTFSC      STATUS+0, 2
	GOTO       L_main17
	MOVF       main_key_L0+0, 0
	XORLW      15
	BTFSC      STATUS+0, 2
	GOTO       L_main18
	MOVF       main_key_L0+0, 0
	XORLW      16
	BTFSC      STATUS+0, 2
	GOTO       L_main19
L_main3:
;ProjectDisplayLCD.c,69 :: 		if (key != 0) {
	MOVF       main_key_L0+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_main20
;ProjectDisplayLCD.c,70 :: 		if(key == 127){
	MOVF       main_key_L0+0, 0
	XORLW      127
	BTFSS      STATUS+0, 2
	GOTO       L_main21
;ProjectDisplayLCD.c,71 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;ProjectDisplayLCD.c,72 :: 		Lcd_Out(1, 1, "Digite:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_ProjectDisplayLCD+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ProjectDisplayLCD.c,73 :: 		i=0;
	CLRF       _i+0
;ProjectDisplayLCD.c,74 :: 		}
	GOTO       L_main22
L_main21:
;ProjectDisplayLCD.c,75 :: 		else if (i < 16) {
	MOVLW      16
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main23
;ProjectDisplayLCD.c,77 :: 		Lcd_Chr(2, i + 1, key);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	INCF       _i+0, 0
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       main_key_L0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;ProjectDisplayLCD.c,78 :: 		i++;
	INCF       _i+0, 1
;ProjectDisplayLCD.c,79 :: 		}
L_main23:
L_main22:
;ProjectDisplayLCD.c,80 :: 		}
L_main20:
;ProjectDisplayLCD.c,81 :: 		Delay_ms(100); // Delay para evitar sobrecarga da CPU
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main24:
	DECFSZ     R13+0, 1
	GOTO       L_main24
	DECFSZ     R12+0, 1
	GOTO       L_main24
	NOP
	NOP
;ProjectDisplayLCD.c,82 :: 		}
	GOTO       L_main0
;ProjectDisplayLCD.c,83 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
