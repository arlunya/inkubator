#line 1 "F:/Artem/Progects_MC/Inkubator.c"
short count100ms,seconds,minutes,houers,days;

void dig_out(short pos,short number,short point)
 {
 switch(pos)
 {
 case 1: PORTC.F5=0;PORTC.F6=0;PORTC.F4=1;break;
 case 2: PORTC.F4=0;PORTC.F6=0;PORTC.F5=1;break;
 case 3: PORTC.F4=0;PORTC.F5=0;PORTC.F6=1;break;
 }
 switch(number)
 {
 case 0: PORTB=192;break;
 case 1: PORTB=249;break;
 case 2: PORTB=164;break;
 case 3: PORTB=176;break;
 case 4: PORTB=153;break;
 case 5: PORTB=146;break;
 case 6: PORTB=130;break;
 case 7: PORTB=248;break;
 case 8: PORTB=128;break;
 case 9: PORTB=144;break;
 }
 if((point==1)&(number==2))
 switch(number)
 {
 case 0: PORTB=64;break;
 case 1: PORTB=121;break;
 case 2: PORTB=36;break;
 case 3: PORTB=48;break;
 case 4: PORTB=25;break;
 case 5: PORTB=18;break;
 case 6: PORTB=2;break;
 case 7: PORTB=120;break;
 case 8: PORTB=0;break;
 case 9: PORTB=16;break;
 }
 Delay_ms(3);
 }

double menu_temp(double sp)
 {
 double f_temp,f_temp1;
 unsigned int i_temp1,i_temp2,i_temp3;

 PORTC.F5=0;
 PORTC.F6=0;
 PORTC.F4=1;
 PORTB=248;
 Delay_ms(3);
 PORTC.F4=0;
 PORTC.F6=0;
 PORTC.F5=1;
 PORTB=206;
 Delay_ms(3);

 while(1)
 {
 if (Button(&PORTA, 1, 1, 1))
 {
 while(1)
 {
 f_temp=sp;
 f_temp1=floor(sp);
 i_temp1=(unsigned int)f_temp1;

 i_temp2=i_temp1/10;
 i_temp3=i_temp1%10;
 i_temp1=(f_temp-f_temp1)*10;

 dig_out(1,i_temp2,0);
 dig_out(2,i_temp3,1);
 dig_out(3,i_temp1,0);
 if (Button(&PORTA, 2, 1, 1))
 sp=sp+0.1;
 if (Button(&PORTA, 3, 1, 1))
 sp=sp-0.1;
 if (sp>=50) sp=20;
 if (sp<=19) sp=49;
 if (Button(&PORTA, 1, 1, 1)) return (sp); }
 }
 }
 }

short menu_moisure(short sp)
{
 short i_temp1,i_temp2;

 PORTC.F5=0;
 PORTC.F6=0;
 PORTC.F4=1;
 PORTB=128;
 Delay_ms(3);
 PORTC.F4=0;
 PORTC.F6=0;
 PORTC.F5=1;
 PORTB=200;
 Delay_ms(3);
 PORTC.F4=0;
 PORTC.F5=0;
 PORTC.F6=1;
 PORTB=136;
 Delay_ms(3);

 while(1)
 {
 if (Button(&PORTA, 1, 1, 1))
 {
 while(1)
 {
 i_temp1=floor(sp/10);
 i_temp2=sp%10;
 dig_out(1,i_temp1,0);
 dig_out(2,i_temp2,0);
 if (Button(&PORTA, 2, 1, 1))
 sp=sp+1;
 if (Button(&PORTA, 3, 1, 1))
 sp=sp-1;
 if (sp>=99) sp=30;
 if (sp<=29) sp=98;
 if (Button(&PORTA, 1, 1, 1))
 {
 return (sp);
 }
 }
 }
 }
}

 short menu_povorot(short sp)
{
 short i_temp1,i_temp2;

 PORTC.F5=0;
 PORTC.F6=0;
 PORTC.F4=1;
 PORTB=200;
 Delay_ms(3);
 PORTC.F4=0;
 PORTC.F6=0;
 PORTC.F5=1;
 PORTB=192;
 Delay_ms(3);
 PORTC.F4=0;
 PORTC.F5=0;
 PORTC.F6=1;
 PORTB=128;
 Delay_ms(3);

 while(1)
 {
 if (Button(&PORTA, 1, 1, 1))
 {
 while(1)
 {
 i_temp1=floor(sp/10);
 i_temp2=sp%10;
 dig_out(1,i_temp1,0);
 dig_out(2,i_temp2,0);
 if (Button(&PORTA, 2, 1, 1))
 sp=sp+1;
 if (Button(&PORTA, 3, 1, 1))
 sp=sp-1;
 if (sp>=40) sp=0;
 if (sp<=-1) sp=39;
 if (Button(&PORTA, 1, 1, 1))
 {
 return (sp);
 }
 }
 }
 }
}



void InitTimer1(){
 T1CON = 0x31;
 TMR1IF_bit = 0;
 TMR1H = 0x0B;
 TMR1L = 0xDC;
 TMR1IE_bit = 1;
 INTCON = 0xC0;
}

void Interrupt(){
 if (TMR1IF_bit){
 TMR1IF_bit = 0;
 TMR1H = 0x0B;
 TMR1L = 0xDC;
 count100ms++;
 if (count100ms>=10)
 {count100ms=0;
 seconds++;
 }
 if(seconds>=60)
 {seconds=0;
 minutes++;
 }
 if(minutes>=60)
 {minutes=0;
 houers++;
 }
 if(houers>=24)
 {count100ms=0;
 seconds=0;
 minutes=0;
 houers=0;
 days++;
 }
 }
 }

void main()
{
 short punkt_menu=1,spmoisure,sppovorot,temp1,temp2;
 short mois_integer,temp_integer,temp_decimal;
 double sptemp,f_temp;
 TRISA=0xFF;
 TRISB=0;
 TRISC=0;
 InitTimer1();
 count100ms=seconds=minutes=houers=days=0;






 while(1)
 {

 if (Button(&PORTA, 1, 1, 1)&(punkt_menu==1))
 {
 sptemp=menu_temp(sptemp);
 punkt_menu=2;
 }
 if (Button(&PORTA, 1, 1, 1)&(punkt_menu==2))
 {
 spmoisure=menu_moisure(spmoisure);
 punkt_menu=3;
 }
 if (Button(&PORTA, 1, 1, 1)&(punkt_menu==3))
 {
 sppovorot=menu_povorot(sppovorot);
 punkt_menu=1;
 }

 Ow_Reset(&PORTA, 0);
 mois_integer = Ow_Read(&PORTA, 0);
 Ow_Read(&PORTA, 0);
 temp_integer = Ow_Read(&PORTA, 0);
 temp_decimal = Ow_Read(&PORTA, 0);

 if((seconds>=0)&(seconds<20))
 {dig_out(1,floor(temp_integer/10),0);
 dig_out(2,temp_integer%10,1);
 if((temp_decimal>=10)&(temp_decimal<100)) temp_decimal=temp_decimal*10;
 if(temp_decimal<10) temp_decimal=temp_decimal*100;
 temp_decimal=floor(temp_decimal/100);
 dig_out(3,temp_decimal,0);
 }
 if((seconds>=20)&(seconds<40))
 {
 dig_out(1,floor(mois_integer/10),0);
 dig_out(2,mois_integer%10,0);
 }
 if(seconds>=40)
 {
 dig_out(1,floor(days/10),0);
 dig_out(2,days%10,0);
 }



 }
}
