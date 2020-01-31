
_dig_out:

;Inkubator.c,3 :: 		void dig_out(short pos,short number,short point)//1-знакоместо(1,2,3),2-цифра,3-есть десятичная часть
;Inkubator.c,5 :: 		switch(pos)
	GOTO       L_dig_out0
;Inkubator.c,7 :: 		case 1: PORTC.F5=0;PORTC.F6=0;PORTC.F4=1;break;
L_dig_out2:
	BCF        PORTC+0, 5
	BCF        PORTC+0, 6
	BSF        PORTC+0, 4
	GOTO       L_dig_out1
;Inkubator.c,8 :: 		case 2: PORTC.F4=0;PORTC.F6=0;PORTC.F5=1;break;
L_dig_out3:
	BCF        PORTC+0, 4
	BCF        PORTC+0, 6
	BSF        PORTC+0, 5
	GOTO       L_dig_out1
;Inkubator.c,9 :: 		case 3: PORTC.F4=0;PORTC.F5=0;PORTC.F6=1;break;
L_dig_out4:
	BCF        PORTC+0, 4
	BCF        PORTC+0, 5
	BSF        PORTC+0, 6
	GOTO       L_dig_out1
;Inkubator.c,10 :: 		}
L_dig_out0:
	MOVF       FARG_dig_out_pos+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_dig_out2
	MOVF       FARG_dig_out_pos+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_dig_out3
	MOVF       FARG_dig_out_pos+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_dig_out4
L_dig_out1:
;Inkubator.c,11 :: 		switch(number)
	GOTO       L_dig_out5
;Inkubator.c,13 :: 		case 0: PORTB=192;break;
L_dig_out7:
	MOVLW      192
	MOVWF      PORTB+0
	GOTO       L_dig_out6
;Inkubator.c,14 :: 		case 1: PORTB=249;break;
L_dig_out8:
	MOVLW      249
	MOVWF      PORTB+0
	GOTO       L_dig_out6
;Inkubator.c,15 :: 		case 2: PORTB=164;break;
L_dig_out9:
	MOVLW      164
	MOVWF      PORTB+0
	GOTO       L_dig_out6
;Inkubator.c,16 :: 		case 3: PORTB=176;break;
L_dig_out10:
	MOVLW      176
	MOVWF      PORTB+0
	GOTO       L_dig_out6
;Inkubator.c,17 :: 		case 4: PORTB=153;break;
L_dig_out11:
	MOVLW      153
	MOVWF      PORTB+0
	GOTO       L_dig_out6
;Inkubator.c,18 :: 		case 5: PORTB=146;break;
L_dig_out12:
	MOVLW      146
	MOVWF      PORTB+0
	GOTO       L_dig_out6
;Inkubator.c,19 :: 		case 6: PORTB=130;break;
L_dig_out13:
	MOVLW      130
	MOVWF      PORTB+0
	GOTO       L_dig_out6
;Inkubator.c,20 :: 		case 7: PORTB=248;break;
L_dig_out14:
	MOVLW      248
	MOVWF      PORTB+0
	GOTO       L_dig_out6
;Inkubator.c,21 :: 		case 8: PORTB=128;break;
L_dig_out15:
	MOVLW      128
	MOVWF      PORTB+0
	GOTO       L_dig_out6
;Inkubator.c,22 :: 		case 9: PORTB=144;break;
L_dig_out16:
	MOVLW      144
	MOVWF      PORTB+0
	GOTO       L_dig_out6
;Inkubator.c,23 :: 		}
L_dig_out5:
	MOVF       FARG_dig_out_number+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_dig_out7
	MOVF       FARG_dig_out_number+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_dig_out8
	MOVF       FARG_dig_out_number+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_dig_out9
	MOVF       FARG_dig_out_number+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_dig_out10
	MOVF       FARG_dig_out_number+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_dig_out11
	MOVF       FARG_dig_out_number+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_dig_out12
	MOVF       FARG_dig_out_number+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_dig_out13
	MOVF       FARG_dig_out_number+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_dig_out14
	MOVF       FARG_dig_out_number+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_dig_out15
	MOVF       FARG_dig_out_number+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_dig_out16
L_dig_out6:
;Inkubator.c,24 :: 		if((point==1)&(number==2))
	MOVF       FARG_dig_out_point+0, 0
	XORLW      1
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVF       FARG_dig_out_number+0, 0
	XORLW      2
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_dig_out17
;Inkubator.c,25 :: 		switch(number)
	GOTO       L_dig_out18
;Inkubator.c,27 :: 		case 0: PORTB=64;break;
L_dig_out20:
	MOVLW      64
	MOVWF      PORTB+0
	GOTO       L_dig_out19
;Inkubator.c,28 :: 		case 1: PORTB=121;break;
L_dig_out21:
	MOVLW      121
	MOVWF      PORTB+0
	GOTO       L_dig_out19
;Inkubator.c,29 :: 		case 2: PORTB=36;break;
L_dig_out22:
	MOVLW      36
	MOVWF      PORTB+0
	GOTO       L_dig_out19
;Inkubator.c,30 :: 		case 3: PORTB=48;break;
L_dig_out23:
	MOVLW      48
	MOVWF      PORTB+0
	GOTO       L_dig_out19
;Inkubator.c,31 :: 		case 4: PORTB=25;break;
L_dig_out24:
	MOVLW      25
	MOVWF      PORTB+0
	GOTO       L_dig_out19
;Inkubator.c,32 :: 		case 5: PORTB=18;break;
L_dig_out25:
	MOVLW      18
	MOVWF      PORTB+0
	GOTO       L_dig_out19
;Inkubator.c,33 :: 		case 6: PORTB=2;break;
L_dig_out26:
	MOVLW      2
	MOVWF      PORTB+0
	GOTO       L_dig_out19
;Inkubator.c,34 :: 		case 7: PORTB=120;break;
L_dig_out27:
	MOVLW      120
	MOVWF      PORTB+0
	GOTO       L_dig_out19
;Inkubator.c,35 :: 		case 8: PORTB=0;break;
L_dig_out28:
	CLRF       PORTB+0
	GOTO       L_dig_out19
;Inkubator.c,36 :: 		case 9: PORTB=16;break;
L_dig_out29:
	MOVLW      16
	MOVWF      PORTB+0
	GOTO       L_dig_out19
;Inkubator.c,37 :: 		}
L_dig_out18:
	MOVF       FARG_dig_out_number+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_dig_out20
	MOVF       FARG_dig_out_number+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_dig_out21
	MOVF       FARG_dig_out_number+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_dig_out22
	MOVF       FARG_dig_out_number+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_dig_out23
	MOVF       FARG_dig_out_number+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_dig_out24
	MOVF       FARG_dig_out_number+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_dig_out25
	MOVF       FARG_dig_out_number+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_dig_out26
	MOVF       FARG_dig_out_number+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_dig_out27
	MOVF       FARG_dig_out_number+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_dig_out28
	MOVF       FARG_dig_out_number+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_dig_out29
L_dig_out19:
L_dig_out17:
;Inkubator.c,38 :: 		Delay_ms(3);
	MOVLW      8
	MOVWF      R12+0
	MOVLW      201
	MOVWF      R13+0
L_dig_out30:
	DECFSZ     R13+0, 1
	GOTO       L_dig_out30
	DECFSZ     R12+0, 1
	GOTO       L_dig_out30
	NOP
	NOP
;Inkubator.c,39 :: 		}
L_end_dig_out:
	RETURN
; end of _dig_out

_menu_temp:

;Inkubator.c,41 :: 		double menu_temp(double sp)
;Inkubator.c,46 :: 		PORTC.F5=0;
	BCF        PORTC+0, 5
;Inkubator.c,47 :: 		PORTC.F6=0;
	BCF        PORTC+0, 6
;Inkubator.c,48 :: 		PORTC.F4=1;
	BSF        PORTC+0, 4
;Inkubator.c,49 :: 		PORTB=248;
	MOVLW      248
	MOVWF      PORTB+0
;Inkubator.c,50 :: 		Delay_ms(3);
	MOVLW      8
	MOVWF      R12+0
	MOVLW      201
	MOVWF      R13+0
L_menu_temp31:
	DECFSZ     R13+0, 1
	GOTO       L_menu_temp31
	DECFSZ     R12+0, 1
	GOTO       L_menu_temp31
	NOP
	NOP
;Inkubator.c,51 :: 		PORTC.F4=0;
	BCF        PORTC+0, 4
;Inkubator.c,52 :: 		PORTC.F6=0;
	BCF        PORTC+0, 6
;Inkubator.c,53 :: 		PORTC.F5=1;
	BSF        PORTC+0, 5
;Inkubator.c,54 :: 		PORTB=206;
	MOVLW      206
	MOVWF      PORTB+0
;Inkubator.c,55 :: 		Delay_ms(3);
	MOVLW      8
	MOVWF      R12+0
	MOVLW      201
	MOVWF      R13+0
L_menu_temp32:
	DECFSZ     R13+0, 1
	GOTO       L_menu_temp32
	DECFSZ     R12+0, 1
	GOTO       L_menu_temp32
	NOP
	NOP
;Inkubator.c,57 :: 		while(1)
L_menu_temp33:
;Inkubator.c,59 :: 		if (Button(&PORTA, 1, 1, 1)) // Если нажата кнопка Меню
	MOVLW      PORTA+0
	MOVWF      FARG_Button_port+0
	MOVLW      1
	MOVWF      FARG_Button_pin+0
	MOVLW      1
	MOVWF      FARG_Button_time_ms+0
	MOVLW      1
	MOVWF      FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_menu_temp35
;Inkubator.c,61 :: 		while(1)
L_menu_temp36:
;Inkubator.c,63 :: 		f_temp=sp;
	MOVF       FARG_menu_temp_sp+0, 0
	MOVWF      menu_temp_f_temp_L0+0
	MOVF       FARG_menu_temp_sp+1, 0
	MOVWF      menu_temp_f_temp_L0+1
	MOVF       FARG_menu_temp_sp+2, 0
	MOVWF      menu_temp_f_temp_L0+2
	MOVF       FARG_menu_temp_sp+3, 0
	MOVWF      menu_temp_f_temp_L0+3
;Inkubator.c,64 :: 		f_temp1=floor(sp); //откидываем дробную часть
	MOVF       FARG_menu_temp_sp+0, 0
	MOVWF      FARG_floor_x+0
	MOVF       FARG_menu_temp_sp+1, 0
	MOVWF      FARG_floor_x+1
	MOVF       FARG_menu_temp_sp+2, 0
	MOVWF      FARG_floor_x+2
	MOVF       FARG_menu_temp_sp+3, 0
	MOVWF      FARG_floor_x+3
	CALL       _floor+0
	MOVF       R0+0, 0
	MOVWF      menu_temp_f_temp1_L0+0
	MOVF       R0+1, 0
	MOVWF      menu_temp_f_temp1_L0+1
	MOVF       R0+2, 0
	MOVWF      menu_temp_f_temp1_L0+2
	MOVF       R0+3, 0
	MOVWF      menu_temp_f_temp1_L0+3
;Inkubator.c,65 :: 		i_temp1=(unsigned int)f_temp1;//перевод из вещественного в целое
	CALL       _Double2Word+0
	MOVF       R0+0, 0
	MOVWF      menu_temp_i_temp1_L0+0
	MOVF       R0+1, 0
	MOVWF      menu_temp_i_temp1_L0+1
;Inkubator.c,67 :: 		i_temp2=i_temp1/10;    //первая цифра
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      menu_temp_i_temp2_L0+0
	MOVF       R0+1, 0
	MOVWF      menu_temp_i_temp2_L0+1
;Inkubator.c,68 :: 		i_temp3=i_temp1%10; //вторая цифра
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       menu_temp_i_temp1_L0+0, 0
	MOVWF      R0+0
	MOVF       menu_temp_i_temp1_L0+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      menu_temp_i_temp3_L0+0
	MOVF       R0+1, 0
	MOVWF      menu_temp_i_temp3_L0+1
;Inkubator.c,69 :: 		i_temp1=(f_temp-f_temp1)*10;//третья цифра: обнуляем целую часть, умножаем на 10
	MOVF       menu_temp_f_temp1_L0+0, 0
	MOVWF      R4+0
	MOVF       menu_temp_f_temp1_L0+1, 0
	MOVWF      R4+1
	MOVF       menu_temp_f_temp1_L0+2, 0
	MOVWF      R4+2
	MOVF       menu_temp_f_temp1_L0+3, 0
	MOVWF      R4+3
	MOVF       menu_temp_f_temp_L0+0, 0
	MOVWF      R0+0
	MOVF       menu_temp_f_temp_L0+1, 0
	MOVWF      R0+1
	MOVF       menu_temp_f_temp_L0+2, 0
	MOVWF      R0+2
	MOVF       menu_temp_f_temp_L0+3, 0
	MOVWF      R0+3
	CALL       _Sub_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      130
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	CALL       _Double2Word+0
	MOVF       R0+0, 0
	MOVWF      menu_temp_i_temp1_L0+0
	MOVF       R0+1, 0
	MOVWF      menu_temp_i_temp1_L0+1
;Inkubator.c,71 :: 		dig_out(1,i_temp2,0); //первая цифра
	MOVLW      1
	MOVWF      FARG_dig_out_pos+0
	MOVF       menu_temp_i_temp2_L0+0, 0
	MOVWF      FARG_dig_out_number+0
	CLRF       FARG_dig_out_point+0
	CALL       _dig_out+0
;Inkubator.c,72 :: 		dig_out(2,i_temp3,1); //вторая цифра
	MOVLW      2
	MOVWF      FARG_dig_out_pos+0
	MOVF       menu_temp_i_temp3_L0+0, 0
	MOVWF      FARG_dig_out_number+0
	MOVLW      1
	MOVWF      FARG_dig_out_point+0
	CALL       _dig_out+0
;Inkubator.c,73 :: 		dig_out(3,i_temp1,0); //третья цифра
	MOVLW      3
	MOVWF      FARG_dig_out_pos+0
	MOVF       menu_temp_i_temp1_L0+0, 0
	MOVWF      FARG_dig_out_number+0
	CLRF       FARG_dig_out_point+0
	CALL       _dig_out+0
;Inkubator.c,74 :: 		if (Button(&PORTA, 2, 1, 1)) // Если нажата кнопка Вверх
	MOVLW      PORTA+0
	MOVWF      FARG_Button_port+0
	MOVLW      2
	MOVWF      FARG_Button_pin+0
	MOVLW      1
	MOVWF      FARG_Button_time_ms+0
	MOVLW      1
	MOVWF      FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_menu_temp38
;Inkubator.c,75 :: 		sp=sp+0.1;
	MOVF       FARG_menu_temp_sp+0, 0
	MOVWF      R0+0
	MOVF       FARG_menu_temp_sp+1, 0
	MOVWF      R0+1
	MOVF       FARG_menu_temp_sp+2, 0
	MOVWF      R0+2
	MOVF       FARG_menu_temp_sp+3, 0
	MOVWF      R0+3
	MOVLW      205
	MOVWF      R4+0
	MOVLW      204
	MOVWF      R4+1
	MOVLW      76
	MOVWF      R4+2
	MOVLW      123
	MOVWF      R4+3
	CALL       _Add_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      FARG_menu_temp_sp+0
	MOVF       R0+1, 0
	MOVWF      FARG_menu_temp_sp+1
	MOVF       R0+2, 0
	MOVWF      FARG_menu_temp_sp+2
	MOVF       R0+3, 0
	MOVWF      FARG_menu_temp_sp+3
L_menu_temp38:
;Inkubator.c,76 :: 		if (Button(&PORTA, 3, 1, 1)) // Если нажата кнопка Вниз
	MOVLW      PORTA+0
	MOVWF      FARG_Button_port+0
	MOVLW      3
	MOVWF      FARG_Button_pin+0
	MOVLW      1
	MOVWF      FARG_Button_time_ms+0
	MOVLW      1
	MOVWF      FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_menu_temp39
;Inkubator.c,77 :: 		sp=sp-0.1;
	MOVLW      205
	MOVWF      R4+0
	MOVLW      204
	MOVWF      R4+1
	MOVLW      76
	MOVWF      R4+2
	MOVLW      123
	MOVWF      R4+3
	MOVF       FARG_menu_temp_sp+0, 0
	MOVWF      R0+0
	MOVF       FARG_menu_temp_sp+1, 0
	MOVWF      R0+1
	MOVF       FARG_menu_temp_sp+2, 0
	MOVWF      R0+2
	MOVF       FARG_menu_temp_sp+3, 0
	MOVWF      R0+3
	CALL       _Sub_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      FARG_menu_temp_sp+0
	MOVF       R0+1, 0
	MOVWF      FARG_menu_temp_sp+1
	MOVF       R0+2, 0
	MOVWF      FARG_menu_temp_sp+2
	MOVF       R0+3, 0
	MOVWF      FARG_menu_temp_sp+3
L_menu_temp39:
;Inkubator.c,78 :: 		if (sp>=50) sp=20; //выход за верхнюю границу
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      72
	MOVWF      R4+2
	MOVLW      132
	MOVWF      R4+3
	MOVF       FARG_menu_temp_sp+0, 0
	MOVWF      R0+0
	MOVF       FARG_menu_temp_sp+1, 0
	MOVWF      R0+1
	MOVF       FARG_menu_temp_sp+2, 0
	MOVWF      R0+2
	MOVF       FARG_menu_temp_sp+3, 0
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_menu_temp40
	MOVLW      0
	MOVWF      FARG_menu_temp_sp+0
	MOVLW      0
	MOVWF      FARG_menu_temp_sp+1
	MOVLW      32
	MOVWF      FARG_menu_temp_sp+2
	MOVLW      131
	MOVWF      FARG_menu_temp_sp+3
L_menu_temp40:
;Inkubator.c,79 :: 		if (sp<=19) sp=49; //выход за нижнюю границу
	MOVF       FARG_menu_temp_sp+0, 0
	MOVWF      R4+0
	MOVF       FARG_menu_temp_sp+1, 0
	MOVWF      R4+1
	MOVF       FARG_menu_temp_sp+2, 0
	MOVWF      R4+2
	MOVF       FARG_menu_temp_sp+3, 0
	MOVWF      R4+3
	MOVLW      0
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVLW      24
	MOVWF      R0+2
	MOVLW      131
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_menu_temp41
	MOVLW      0
	MOVWF      FARG_menu_temp_sp+0
	MOVLW      0
	MOVWF      FARG_menu_temp_sp+1
	MOVLW      68
	MOVWF      FARG_menu_temp_sp+2
	MOVLW      132
	MOVWF      FARG_menu_temp_sp+3
L_menu_temp41:
;Inkubator.c,80 :: 		if (Button(&PORTA, 1, 1, 1))  return (sp);      }
	MOVLW      PORTA+0
	MOVWF      FARG_Button_port+0
	MOVLW      1
	MOVWF      FARG_Button_pin+0
	MOVLW      1
	MOVWF      FARG_Button_time_ms+0
	MOVLW      1
	MOVWF      FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_menu_temp42
	MOVF       FARG_menu_temp_sp+0, 0
	MOVWF      R0+0
	MOVF       FARG_menu_temp_sp+1, 0
	MOVWF      R0+1
	MOVF       FARG_menu_temp_sp+2, 0
	MOVWF      R0+2
	MOVF       FARG_menu_temp_sp+3, 0
	MOVWF      R0+3
	GOTO       L_end_menu_temp
L_menu_temp42:
	GOTO       L_menu_temp36
;Inkubator.c,81 :: 		}
L_menu_temp35:
;Inkubator.c,82 :: 		}
	GOTO       L_menu_temp33
;Inkubator.c,83 :: 		}
L_end_menu_temp:
	RETURN
; end of _menu_temp

_menu_moisure:

;Inkubator.c,85 :: 		short menu_moisure(short sp)
;Inkubator.c,89 :: 		PORTC.F5=0;
	BCF        PORTC+0, 5
;Inkubator.c,90 :: 		PORTC.F6=0;
	BCF        PORTC+0, 6
;Inkubator.c,91 :: 		PORTC.F4=1;
	BSF        PORTC+0, 4
;Inkubator.c,92 :: 		PORTB=128;
	MOVLW      128
	MOVWF      PORTB+0
;Inkubator.c,93 :: 		Delay_ms(3);
	MOVLW      8
	MOVWF      R12+0
	MOVLW      201
	MOVWF      R13+0
L_menu_moisure43:
	DECFSZ     R13+0, 1
	GOTO       L_menu_moisure43
	DECFSZ     R12+0, 1
	GOTO       L_menu_moisure43
	NOP
	NOP
;Inkubator.c,94 :: 		PORTC.F4=0;
	BCF        PORTC+0, 4
;Inkubator.c,95 :: 		PORTC.F6=0;
	BCF        PORTC+0, 6
;Inkubator.c,96 :: 		PORTC.F5=1;
	BSF        PORTC+0, 5
;Inkubator.c,97 :: 		PORTB=200;
	MOVLW      200
	MOVWF      PORTB+0
;Inkubator.c,98 :: 		Delay_ms(3);
	MOVLW      8
	MOVWF      R12+0
	MOVLW      201
	MOVWF      R13+0
L_menu_moisure44:
	DECFSZ     R13+0, 1
	GOTO       L_menu_moisure44
	DECFSZ     R12+0, 1
	GOTO       L_menu_moisure44
	NOP
	NOP
;Inkubator.c,99 :: 		PORTC.F4=0;
	BCF        PORTC+0, 4
;Inkubator.c,100 :: 		PORTC.F5=0;
	BCF        PORTC+0, 5
;Inkubator.c,101 :: 		PORTC.F6=1;
	BSF        PORTC+0, 6
;Inkubator.c,102 :: 		PORTB=136;
	MOVLW      136
	MOVWF      PORTB+0
;Inkubator.c,103 :: 		Delay_ms(3);
	MOVLW      8
	MOVWF      R12+0
	MOVLW      201
	MOVWF      R13+0
L_menu_moisure45:
	DECFSZ     R13+0, 1
	GOTO       L_menu_moisure45
	DECFSZ     R12+0, 1
	GOTO       L_menu_moisure45
	NOP
	NOP
;Inkubator.c,105 :: 		while(1)
L_menu_moisure46:
;Inkubator.c,107 :: 		if (Button(&PORTA, 1, 1, 1)) // Если нажата кнопка Меню
	MOVLW      PORTA+0
	MOVWF      FARG_Button_port+0
	MOVLW      1
	MOVWF      FARG_Button_pin+0
	MOVLW      1
	MOVWF      FARG_Button_time_ms+0
	MOVLW      1
	MOVWF      FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_menu_moisure48
;Inkubator.c,109 :: 		while(1)
L_menu_moisure49:
;Inkubator.c,111 :: 		i_temp1=floor(sp/10); //первая цифра
	MOVLW      10
	MOVWF      R4+0
	MOVF       FARG_menu_moisure_sp+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_S+0
	MOVLW      0
	BTFSC      R0+0, 7
	MOVLW      255
	MOVWF      R0+1
	CALL       _Int2Double+0
	MOVF       R0+0, 0
	MOVWF      FARG_floor_x+0
	MOVF       R0+1, 0
	MOVWF      FARG_floor_x+1
	MOVF       R0+2, 0
	MOVWF      FARG_floor_x+2
	MOVF       R0+3, 0
	MOVWF      FARG_floor_x+3
	CALL       _floor+0
	CALL       _Double2Int+0
	MOVF       R0+0, 0
	MOVWF      menu_moisure_i_temp1_L0+0
;Inkubator.c,112 :: 		i_temp2=sp%10;        //вторая цифра
	MOVLW      10
	MOVWF      R4+0
	MOVF       FARG_menu_moisure_sp+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      menu_moisure_i_temp2_L0+0
;Inkubator.c,113 :: 		dig_out(1,i_temp1,0); //первая цифра
	MOVLW      1
	MOVWF      FARG_dig_out_pos+0
	MOVF       menu_moisure_i_temp1_L0+0, 0
	MOVWF      FARG_dig_out_number+0
	CLRF       FARG_dig_out_point+0
	CALL       _dig_out+0
;Inkubator.c,114 :: 		dig_out(2,i_temp2,0); //вторая цифра
	MOVLW      2
	MOVWF      FARG_dig_out_pos+0
	MOVF       menu_moisure_i_temp2_L0+0, 0
	MOVWF      FARG_dig_out_number+0
	CLRF       FARG_dig_out_point+0
	CALL       _dig_out+0
;Inkubator.c,115 :: 		if (Button(&PORTA, 2, 1, 1)) // Если нажата кнопка Вверх
	MOVLW      PORTA+0
	MOVWF      FARG_Button_port+0
	MOVLW      2
	MOVWF      FARG_Button_pin+0
	MOVLW      1
	MOVWF      FARG_Button_time_ms+0
	MOVLW      1
	MOVWF      FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_menu_moisure51
;Inkubator.c,116 :: 		sp=sp+1;
	INCF       FARG_menu_moisure_sp+0, 1
L_menu_moisure51:
;Inkubator.c,117 :: 		if (Button(&PORTA, 3, 1, 1)) // Если нажата кнопка Вниз
	MOVLW      PORTA+0
	MOVWF      FARG_Button_port+0
	MOVLW      3
	MOVWF      FARG_Button_pin+0
	MOVLW      1
	MOVWF      FARG_Button_time_ms+0
	MOVLW      1
	MOVWF      FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_menu_moisure52
;Inkubator.c,118 :: 		sp=sp-1;
	DECF       FARG_menu_moisure_sp+0, 1
L_menu_moisure52:
;Inkubator.c,119 :: 		if (sp>=99) sp=30; //выход за верхнюю границу
	MOVLW      128
	XORWF      FARG_menu_moisure_sp+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      99
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_menu_moisure53
	MOVLW      30
	MOVWF      FARG_menu_moisure_sp+0
L_menu_moisure53:
;Inkubator.c,120 :: 		if (sp<=29) sp=98; //выход за нижнюю границу
	MOVLW      128
	XORLW      29
	MOVWF      R0+0
	MOVLW      128
	XORWF      FARG_menu_moisure_sp+0, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_menu_moisure54
	MOVLW      98
	MOVWF      FARG_menu_moisure_sp+0
L_menu_moisure54:
;Inkubator.c,121 :: 		if (Button(&PORTA, 1, 1, 1))
	MOVLW      PORTA+0
	MOVWF      FARG_Button_port+0
	MOVLW      1
	MOVWF      FARG_Button_pin+0
	MOVLW      1
	MOVWF      FARG_Button_time_ms+0
	MOVLW      1
	MOVWF      FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_menu_moisure55
;Inkubator.c,123 :: 		return (sp);
	MOVF       FARG_menu_moisure_sp+0, 0
	MOVWF      R0+0
	GOTO       L_end_menu_moisure
;Inkubator.c,124 :: 		}
L_menu_moisure55:
;Inkubator.c,125 :: 		}
	GOTO       L_menu_moisure49
;Inkubator.c,126 :: 		}
L_menu_moisure48:
;Inkubator.c,127 :: 		}
	GOTO       L_menu_moisure46
;Inkubator.c,128 :: 		}
L_end_menu_moisure:
	RETURN
; end of _menu_moisure

_menu_povorot:

;Inkubator.c,130 :: 		short menu_povorot(short sp)
;Inkubator.c,134 :: 		PORTC.F5=0;
	BCF        PORTC+0, 5
;Inkubator.c,135 :: 		PORTC.F6=0;
	BCF        PORTC+0, 6
;Inkubator.c,136 :: 		PORTC.F4=1;
	BSF        PORTC+0, 4
;Inkubator.c,137 :: 		PORTB=200;
	MOVLW      200
	MOVWF      PORTB+0
;Inkubator.c,138 :: 		Delay_ms(3);
	MOVLW      8
	MOVWF      R12+0
	MOVLW      201
	MOVWF      R13+0
L_menu_povorot56:
	DECFSZ     R13+0, 1
	GOTO       L_menu_povorot56
	DECFSZ     R12+0, 1
	GOTO       L_menu_povorot56
	NOP
	NOP
;Inkubator.c,139 :: 		PORTC.F4=0;
	BCF        PORTC+0, 4
;Inkubator.c,140 :: 		PORTC.F6=0;
	BCF        PORTC+0, 6
;Inkubator.c,141 :: 		PORTC.F5=1;
	BSF        PORTC+0, 5
;Inkubator.c,142 :: 		PORTB=192;
	MOVLW      192
	MOVWF      PORTB+0
;Inkubator.c,143 :: 		Delay_ms(3);
	MOVLW      8
	MOVWF      R12+0
	MOVLW      201
	MOVWF      R13+0
L_menu_povorot57:
	DECFSZ     R13+0, 1
	GOTO       L_menu_povorot57
	DECFSZ     R12+0, 1
	GOTO       L_menu_povorot57
	NOP
	NOP
;Inkubator.c,144 :: 		PORTC.F4=0;
	BCF        PORTC+0, 4
;Inkubator.c,145 :: 		PORTC.F5=0;
	BCF        PORTC+0, 5
;Inkubator.c,146 :: 		PORTC.F6=1;
	BSF        PORTC+0, 6
;Inkubator.c,147 :: 		PORTB=128;
	MOVLW      128
	MOVWF      PORTB+0
;Inkubator.c,148 :: 		Delay_ms(3);
	MOVLW      8
	MOVWF      R12+0
	MOVLW      201
	MOVWF      R13+0
L_menu_povorot58:
	DECFSZ     R13+0, 1
	GOTO       L_menu_povorot58
	DECFSZ     R12+0, 1
	GOTO       L_menu_povorot58
	NOP
	NOP
;Inkubator.c,150 :: 		while(1)
L_menu_povorot59:
;Inkubator.c,152 :: 		if (Button(&PORTA, 1, 1, 1)) // Если нажата кнопка Меню
	MOVLW      PORTA+0
	MOVWF      FARG_Button_port+0
	MOVLW      1
	MOVWF      FARG_Button_pin+0
	MOVLW      1
	MOVWF      FARG_Button_time_ms+0
	MOVLW      1
	MOVWF      FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_menu_povorot61
;Inkubator.c,154 :: 		while(1)
L_menu_povorot62:
;Inkubator.c,156 :: 		i_temp1=floor(sp/10); //первая цифра
	MOVLW      10
	MOVWF      R4+0
	MOVF       FARG_menu_povorot_sp+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_S+0
	MOVLW      0
	BTFSC      R0+0, 7
	MOVLW      255
	MOVWF      R0+1
	CALL       _Int2Double+0
	MOVF       R0+0, 0
	MOVWF      FARG_floor_x+0
	MOVF       R0+1, 0
	MOVWF      FARG_floor_x+1
	MOVF       R0+2, 0
	MOVWF      FARG_floor_x+2
	MOVF       R0+3, 0
	MOVWF      FARG_floor_x+3
	CALL       _floor+0
	CALL       _Double2Int+0
	MOVF       R0+0, 0
	MOVWF      menu_povorot_i_temp1_L0+0
;Inkubator.c,157 :: 		i_temp2=sp%10;        //вторая цифра
	MOVLW      10
	MOVWF      R4+0
	MOVF       FARG_menu_povorot_sp+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      menu_povorot_i_temp2_L0+0
;Inkubator.c,158 :: 		dig_out(1,i_temp1,0); //первая цифра
	MOVLW      1
	MOVWF      FARG_dig_out_pos+0
	MOVF       menu_povorot_i_temp1_L0+0, 0
	MOVWF      FARG_dig_out_number+0
	CLRF       FARG_dig_out_point+0
	CALL       _dig_out+0
;Inkubator.c,159 :: 		dig_out(2,i_temp2,0); //вторая цифра
	MOVLW      2
	MOVWF      FARG_dig_out_pos+0
	MOVF       menu_povorot_i_temp2_L0+0, 0
	MOVWF      FARG_dig_out_number+0
	CLRF       FARG_dig_out_point+0
	CALL       _dig_out+0
;Inkubator.c,160 :: 		if (Button(&PORTA, 2, 1, 1)) // Если нажата кнопка Вверх
	MOVLW      PORTA+0
	MOVWF      FARG_Button_port+0
	MOVLW      2
	MOVWF      FARG_Button_pin+0
	MOVLW      1
	MOVWF      FARG_Button_time_ms+0
	MOVLW      1
	MOVWF      FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_menu_povorot64
;Inkubator.c,161 :: 		sp=sp+1;
	INCF       FARG_menu_povorot_sp+0, 1
L_menu_povorot64:
;Inkubator.c,162 :: 		if (Button(&PORTA, 3, 1, 1)) // Если нажата кнопка Вниз
	MOVLW      PORTA+0
	MOVWF      FARG_Button_port+0
	MOVLW      3
	MOVWF      FARG_Button_pin+0
	MOVLW      1
	MOVWF      FARG_Button_time_ms+0
	MOVLW      1
	MOVWF      FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_menu_povorot65
;Inkubator.c,163 :: 		sp=sp-1;
	DECF       FARG_menu_povorot_sp+0, 1
L_menu_povorot65:
;Inkubator.c,164 :: 		if (sp>=40) sp=0; //выход за верхнюю границу
	MOVLW      128
	XORWF      FARG_menu_povorot_sp+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      40
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_menu_povorot66
	CLRF       FARG_menu_povorot_sp+0
L_menu_povorot66:
;Inkubator.c,165 :: 		if (sp<=-1) sp=39; //выход за нижнюю границу
	MOVLW      128
	XORLW      255
	MOVWF      R0+0
	MOVLW      128
	XORWF      FARG_menu_povorot_sp+0, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_menu_povorot67
	MOVLW      39
	MOVWF      FARG_menu_povorot_sp+0
L_menu_povorot67:
;Inkubator.c,166 :: 		if (Button(&PORTA, 1, 1, 1))
	MOVLW      PORTA+0
	MOVWF      FARG_Button_port+0
	MOVLW      1
	MOVWF      FARG_Button_pin+0
	MOVLW      1
	MOVWF      FARG_Button_time_ms+0
	MOVLW      1
	MOVWF      FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_menu_povorot68
;Inkubator.c,168 :: 		return (sp);
	MOVF       FARG_menu_povorot_sp+0, 0
	MOVWF      R0+0
	GOTO       L_end_menu_povorot
;Inkubator.c,169 :: 		}
L_menu_povorot68:
;Inkubator.c,170 :: 		}
	GOTO       L_menu_povorot62
;Inkubator.c,171 :: 		}
L_menu_povorot61:
;Inkubator.c,172 :: 		}
	GOTO       L_menu_povorot59
;Inkubator.c,173 :: 		}
L_end_menu_povorot:
	RETURN
; end of _menu_povorot

_InitTimer1:

;Inkubator.c,177 :: 		void InitTimer1(){
;Inkubator.c,178 :: 		T1CON	 = 0x31;
	MOVLW      49
	MOVWF      T1CON+0
;Inkubator.c,179 :: 		TMR1IF_bit	 = 0;
	BCF        TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
;Inkubator.c,180 :: 		TMR1H	 = 0x0B;
	MOVLW      11
	MOVWF      TMR1H+0
;Inkubator.c,181 :: 		TMR1L	 = 0xDC;
	MOVLW      220
	MOVWF      TMR1L+0
;Inkubator.c,182 :: 		TMR1IE_bit	 = 1;
	BSF        TMR1IE_bit+0, BitPos(TMR1IE_bit+0)
;Inkubator.c,183 :: 		INTCON	 = 0xC0;
	MOVLW      192
	MOVWF      INTCON+0
;Inkubator.c,184 :: 		}
L_end_InitTimer1:
	RETURN
; end of _InitTimer1

_Interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Inkubator.c,186 :: 		void Interrupt(){
;Inkubator.c,187 :: 		if (TMR1IF_bit){   //вызываем каждые 100 мс
	BTFSS      TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
	GOTO       L_Interrupt69
;Inkubator.c,188 :: 		TMR1IF_bit = 0;
	BCF        TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
;Inkubator.c,189 :: 		TMR1H	 = 0x0B;
	MOVLW      11
	MOVWF      TMR1H+0
;Inkubator.c,190 :: 		TMR1L	 = 0xDC;
	MOVLW      220
	MOVWF      TMR1L+0
;Inkubator.c,191 :: 		count100ms++;
	INCF       _count100ms+0, 1
;Inkubator.c,192 :: 		if (count100ms>=10) // 1 секунда
	MOVLW      128
	XORWF      _count100ms+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      10
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Interrupt70
;Inkubator.c,193 :: 		{count100ms=0;
	CLRF       _count100ms+0
;Inkubator.c,194 :: 		seconds++;
	INCF       _seconds+0, 1
;Inkubator.c,195 :: 		}
L_Interrupt70:
;Inkubator.c,196 :: 		if(seconds>=60)
	MOVLW      128
	XORWF      _seconds+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      60
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Interrupt71
;Inkubator.c,197 :: 		{seconds=0;
	CLRF       _seconds+0
;Inkubator.c,198 :: 		minutes++;
	INCF       _minutes+0, 1
;Inkubator.c,199 :: 		}
L_Interrupt71:
;Inkubator.c,200 :: 		if(minutes>=60)
	MOVLW      128
	XORWF      _minutes+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      60
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Interrupt72
;Inkubator.c,201 :: 		{minutes=0;
	CLRF       _minutes+0
;Inkubator.c,202 :: 		houers++;
	INCF       _houers+0, 1
;Inkubator.c,203 :: 		}
L_Interrupt72:
;Inkubator.c,204 :: 		if(houers>=24)
	MOVLW      128
	XORWF      _houers+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      24
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Interrupt73
;Inkubator.c,205 :: 		{count100ms=0;
	CLRF       _count100ms+0
;Inkubator.c,206 :: 		seconds=0;
	CLRF       _seconds+0
;Inkubator.c,207 :: 		minutes=0;
	CLRF       _minutes+0
;Inkubator.c,208 :: 		houers=0;
	CLRF       _houers+0
;Inkubator.c,209 :: 		days++;
	INCF       _days+0, 1
;Inkubator.c,210 :: 		}
L_Interrupt73:
;Inkubator.c,211 :: 		}
L_Interrupt69:
;Inkubator.c,212 :: 		}
L_end_Interrupt:
L__Interrupt90:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _Interrupt

_main:

;Inkubator.c,214 :: 		void main()
;Inkubator.c,216 :: 		short punkt_menu=1,spmoisure,sppovorot,temp1,temp2;
	MOVLW      1
	MOVWF      main_punkt_menu_L0+0
;Inkubator.c,219 :: 		TRISA=0xFF;//Вход
	MOVLW      255
	MOVWF      TRISA+0
;Inkubator.c,220 :: 		TRISB=0;   //Выход
	CLRF       TRISB+0
;Inkubator.c,221 :: 		TRISC=0;   //Выход
	CLRF       TRISC+0
;Inkubator.c,222 :: 		InitTimer1();
	CALL       _InitTimer1+0
;Inkubator.c,223 :: 		count100ms=seconds=minutes=houers=days=0;
	CLRF       _days+0
	CLRF       _houers+0
	CLRF       _minutes+0
	CLRF       _seconds+0
	CLRF       _count100ms+0
;Inkubator.c,230 :: 		while(1)
L_main74:
;Inkubator.c,233 :: 		if (Button(&PORTA, 1, 1, 1)&(punkt_menu==1)) // Если нажата кнопка Меню
	MOVLW      PORTA+0
	MOVWF      FARG_Button_port+0
	MOVLW      1
	MOVWF      FARG_Button_pin+0
	MOVLW      1
	MOVWF      FARG_Button_time_ms+0
	MOVLW      1
	MOVWF      FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       main_punkt_menu_L0+0, 0
	XORLW      1
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_main76
;Inkubator.c,235 :: 		sptemp=menu_temp(sptemp); //уставка по температуре
	MOVF       main_sptemp_L0+0, 0
	MOVWF      FARG_menu_temp_sp+0
	MOVF       main_sptemp_L0+1, 0
	MOVWF      FARG_menu_temp_sp+1
	MOVF       main_sptemp_L0+2, 0
	MOVWF      FARG_menu_temp_sp+2
	MOVF       main_sptemp_L0+3, 0
	MOVWF      FARG_menu_temp_sp+3
	CALL       _menu_temp+0
	MOVF       R0+0, 0
	MOVWF      main_sptemp_L0+0
	MOVF       R0+1, 0
	MOVWF      main_sptemp_L0+1
	MOVF       R0+2, 0
	MOVWF      main_sptemp_L0+2
	MOVF       R0+3, 0
	MOVWF      main_sptemp_L0+3
;Inkubator.c,236 :: 		punkt_menu=2;
	MOVLW      2
	MOVWF      main_punkt_menu_L0+0
;Inkubator.c,237 :: 		}
L_main76:
;Inkubator.c,238 :: 		if (Button(&PORTA, 1, 1, 1)&(punkt_menu==2)) // Если нажата кнопка Меню
	MOVLW      PORTA+0
	MOVWF      FARG_Button_port+0
	MOVLW      1
	MOVWF      FARG_Button_pin+0
	MOVLW      1
	MOVWF      FARG_Button_time_ms+0
	MOVLW      1
	MOVWF      FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       main_punkt_menu_L0+0, 0
	XORLW      2
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_main77
;Inkubator.c,240 :: 		spmoisure=menu_moisure(spmoisure);//уставка по влажности
	MOVF       main_spmoisure_L0+0, 0
	MOVWF      FARG_menu_moisure_sp+0
	CALL       _menu_moisure+0
	MOVF       R0+0, 0
	MOVWF      main_spmoisure_L0+0
;Inkubator.c,241 :: 		punkt_menu=3;
	MOVLW      3
	MOVWF      main_punkt_menu_L0+0
;Inkubator.c,242 :: 		}
L_main77:
;Inkubator.c,243 :: 		if (Button(&PORTA, 1, 1, 1)&(punkt_menu==3)) // Если нажата кнопка Меню
	MOVLW      PORTA+0
	MOVWF      FARG_Button_port+0
	MOVLW      1
	MOVWF      FARG_Button_pin+0
	MOVLW      1
	MOVWF      FARG_Button_time_ms+0
	MOVLW      1
	MOVWF      FARG_Button_active_state+0
	CALL       _Button+0
	MOVF       main_punkt_menu_L0+0, 0
	XORLW      3
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_main78
;Inkubator.c,245 :: 		sppovorot=menu_povorot(sppovorot);//уставка по интервалу
	MOVF       main_sppovorot_L0+0, 0
	MOVWF      FARG_menu_povorot_sp+0
	CALL       _menu_povorot+0
	MOVF       R0+0, 0
	MOVWF      main_sppovorot_L0+0
;Inkubator.c,246 :: 		punkt_menu=1;
	MOVLW      1
	MOVWF      main_punkt_menu_L0+0
;Inkubator.c,247 :: 		}
L_main78:
;Inkubator.c,249 :: 		Ow_Reset(&PORTA, 0);
	MOVLW      PORTA+0
	MOVWF      FARG_Ow_Reset_port+0
	CLRF       FARG_Ow_Reset_pin+0
	CALL       _Ow_Reset+0
;Inkubator.c,250 :: 		mois_integer = Ow_Read(&PORTA, 0);
	MOVLW      PORTA+0
	MOVWF      FARG_Ow_Read_port+0
	CLRF       FARG_Ow_Read_pin+0
	CALL       _Ow_Read+0
	MOVF       R0+0, 0
	MOVWF      main_mois_integer_L0+0
;Inkubator.c,251 :: 		Ow_Read(&PORTA, 0);
	MOVLW      PORTA+0
	MOVWF      FARG_Ow_Read_port+0
	CLRF       FARG_Ow_Read_pin+0
	CALL       _Ow_Read+0
;Inkubator.c,252 :: 		temp_integer = Ow_Read(&PORTA, 0);
	MOVLW      PORTA+0
	MOVWF      FARG_Ow_Read_port+0
	CLRF       FARG_Ow_Read_pin+0
	CALL       _Ow_Read+0
	MOVF       R0+0, 0
	MOVWF      main_temp_integer_L0+0
;Inkubator.c,253 :: 		temp_decimal = Ow_Read(&PORTA, 0);
	MOVLW      PORTA+0
	MOVWF      FARG_Ow_Read_port+0
	CLRF       FARG_Ow_Read_pin+0
	CALL       _Ow_Read+0
	MOVF       R0+0, 0
	MOVWF      main_temp_decimal_L0+0
;Inkubator.c,255 :: 		if((seconds>=0)&(seconds<20)) //вывод на экран температуры
	MOVLW      128
	XORWF      _seconds+0, 0
	MOVWF      R1+0
	MOVLW      128
	XORLW      0
	SUBWF      R1+0, 0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R1+0
	MOVLW      128
	XORWF      _seconds+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      20
	SUBWF      R0+0, 0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_main79
;Inkubator.c,256 :: 		{dig_out(1,floor(temp_integer/10),0);
	MOVLW      10
	MOVWF      R4+0
	MOVF       main_temp_integer_L0+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_S+0
	MOVLW      0
	BTFSC      R0+0, 7
	MOVLW      255
	MOVWF      R0+1
	CALL       _Int2Double+0
	MOVF       R0+0, 0
	MOVWF      FARG_floor_x+0
	MOVF       R0+1, 0
	MOVWF      FARG_floor_x+1
	MOVF       R0+2, 0
	MOVWF      FARG_floor_x+2
	MOVF       R0+3, 0
	MOVWF      FARG_floor_x+3
	CALL       _floor+0
	CALL       _Double2Int+0
	MOVF       R0+0, 0
	MOVWF      FARG_dig_out_number+0
	MOVLW      1
	MOVWF      FARG_dig_out_pos+0
	CLRF       FARG_dig_out_point+0
	CALL       _dig_out+0
;Inkubator.c,257 :: 		dig_out(2,temp_integer%10,1);
	MOVLW      2
	MOVWF      FARG_dig_out_pos+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       main_temp_integer_L0+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      FARG_dig_out_number+0
	MOVLW      1
	MOVWF      FARG_dig_out_point+0
	CALL       _dig_out+0
;Inkubator.c,258 :: 		if((temp_decimal>=10)&(temp_decimal<100)) temp_decimal=temp_decimal*10;
	MOVLW      128
	XORWF      main_temp_decimal_L0+0, 0
	MOVWF      R1+0
	MOVLW      128
	XORLW      10
	SUBWF      R1+0, 0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R1+0
	MOVLW      128
	XORWF      main_temp_decimal_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      100
	SUBWF      R0+0, 0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_main80
	MOVF       main_temp_decimal_L0+0, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8x8_U+0
	MOVF       R0+0, 0
	MOVWF      main_temp_decimal_L0+0
L_main80:
;Inkubator.c,259 :: 		if(temp_decimal<10) temp_decimal=temp_decimal*100;
	MOVLW      128
	XORWF      main_temp_decimal_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      10
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main81
	MOVF       main_temp_decimal_L0+0, 0
	MOVWF      R0+0
	MOVLW      100
	MOVWF      R4+0
	CALL       _Mul_8x8_U+0
	MOVF       R0+0, 0
	MOVWF      main_temp_decimal_L0+0
L_main81:
;Inkubator.c,260 :: 		temp_decimal=floor(temp_decimal/100);
	MOVLW      100
	MOVWF      R4+0
	MOVF       main_temp_decimal_L0+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_S+0
	MOVLW      0
	BTFSC      R0+0, 7
	MOVLW      255
	MOVWF      R0+1
	CALL       _Int2Double+0
	MOVF       R0+0, 0
	MOVWF      FARG_floor_x+0
	MOVF       R0+1, 0
	MOVWF      FARG_floor_x+1
	MOVF       R0+2, 0
	MOVWF      FARG_floor_x+2
	MOVF       R0+3, 0
	MOVWF      FARG_floor_x+3
	CALL       _floor+0
	CALL       _Double2Int+0
	MOVF       R0+0, 0
	MOVWF      main_temp_decimal_L0+0
;Inkubator.c,261 :: 		dig_out(3,temp_decimal,0);
	MOVLW      3
	MOVWF      FARG_dig_out_pos+0
	MOVF       R0+0, 0
	MOVWF      FARG_dig_out_number+0
	CLRF       FARG_dig_out_point+0
	CALL       _dig_out+0
;Inkubator.c,262 :: 		}
L_main79:
;Inkubator.c,263 :: 		if((seconds>=20)&(seconds<40)) //вывод на экран влажности
	MOVLW      128
	XORWF      _seconds+0, 0
	MOVWF      R1+0
	MOVLW      128
	XORLW      20
	SUBWF      R1+0, 0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R1+0
	MOVLW      128
	XORWF      _seconds+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      40
	SUBWF      R0+0, 0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_main82
;Inkubator.c,265 :: 		dig_out(1,floor(mois_integer/10),0);
	MOVLW      10
	MOVWF      R4+0
	MOVF       main_mois_integer_L0+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_S+0
	MOVLW      0
	BTFSC      R0+0, 7
	MOVLW      255
	MOVWF      R0+1
	CALL       _Int2Double+0
	MOVF       R0+0, 0
	MOVWF      FARG_floor_x+0
	MOVF       R0+1, 0
	MOVWF      FARG_floor_x+1
	MOVF       R0+2, 0
	MOVWF      FARG_floor_x+2
	MOVF       R0+3, 0
	MOVWF      FARG_floor_x+3
	CALL       _floor+0
	CALL       _Double2Int+0
	MOVF       R0+0, 0
	MOVWF      FARG_dig_out_number+0
	MOVLW      1
	MOVWF      FARG_dig_out_pos+0
	CLRF       FARG_dig_out_point+0
	CALL       _dig_out+0
;Inkubator.c,266 :: 		dig_out(2,mois_integer%10,0);
	MOVLW      2
	MOVWF      FARG_dig_out_pos+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       main_mois_integer_L0+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      FARG_dig_out_number+0
	CLRF       FARG_dig_out_point+0
	CALL       _dig_out+0
;Inkubator.c,267 :: 		}
L_main82:
;Inkubator.c,268 :: 		if(seconds>=40)//вывод на экран прошедьших дней
	MOVLW      128
	XORWF      _seconds+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      40
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_main83
;Inkubator.c,270 :: 		dig_out(1,floor(days/10),0);
	MOVLW      10
	MOVWF      R4+0
	MOVF       _days+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_S+0
	MOVLW      0
	BTFSC      R0+0, 7
	MOVLW      255
	MOVWF      R0+1
	CALL       _Int2Double+0
	MOVF       R0+0, 0
	MOVWF      FARG_floor_x+0
	MOVF       R0+1, 0
	MOVWF      FARG_floor_x+1
	MOVF       R0+2, 0
	MOVWF      FARG_floor_x+2
	MOVF       R0+3, 0
	MOVWF      FARG_floor_x+3
	CALL       _floor+0
	CALL       _Double2Int+0
	MOVF       R0+0, 0
	MOVWF      FARG_dig_out_number+0
	MOVLW      1
	MOVWF      FARG_dig_out_pos+0
	CLRF       FARG_dig_out_point+0
	CALL       _dig_out+0
;Inkubator.c,271 :: 		dig_out(2,days%10,0);
	MOVLW      2
	MOVWF      FARG_dig_out_pos+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       _days+0, 0
	MOVWF      R0+0
	CALL       _Div_8x8_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      FARG_dig_out_number+0
	CLRF       FARG_dig_out_point+0
	CALL       _dig_out+0
;Inkubator.c,272 :: 		}
L_main83:
;Inkubator.c,276 :: 		}
	GOTO       L_main74
;Inkubator.c,277 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
