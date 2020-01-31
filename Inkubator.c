short count100ms,seconds,minutes,houers,days;
//Подпрограмма вывода на экран символа
void dig_out(short pos,short number,short point)//1-знакоместо(1,2,3),2-цифра,3-есть десятичная часть
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
//Подпрограмма установки температуры--------------------------------------------
double menu_temp(double sp)
 {
  double f_temp,f_temp1;
  unsigned int i_temp1,i_temp2,i_temp3;
  //Вывод буквы Т
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
  //Вывод значения уставки температуры
  while(1)
  {
  if (Button(&PORTA, 1, 1, 1)) // Если нажата кнопка Меню
    {
     while(1)
      {
       f_temp=sp;
       f_temp1=floor(sp); //откидываем дробную часть
       i_temp1=(unsigned int)f_temp1;//перевод из вещественного в целое
       //EEprom_Write(0x00,(short)i_temp1);//запись целой части уставки температуры в память
       i_temp2=i_temp1/10;    //первая цифра
       i_temp3=i_temp1%10; //вторая цифра
       i_temp1=(f_temp-f_temp1)*10;//третья цифра: обнуляем целую часть, умножаем на 10
       //EEprom_Write(0x01,(short)i_temp1);//запись дробной части уставки температуры в память
       dig_out(1,i_temp2,0); //первая цифра
       dig_out(2,i_temp3,1); //вторая цифра
       dig_out(3,i_temp1,0); //третья цифра
       if (Button(&PORTA, 2, 1, 1)) // Если нажата кнопка Вверх
        sp=sp+0.1;
       if (Button(&PORTA, 3, 1, 1)) // Если нажата кнопка Вниз
        sp=sp-0.1;
       if (sp>=50) sp=20; //выход за верхнюю границу
       if (sp<=19) sp=49; //выход за нижнюю границу
       if (Button(&PORTA, 1, 1, 1))  return (sp);      }
    }
   }
 }
//Подпрограмма установки влажности----------------------------------------------
short menu_moisure(short sp)
{
 short i_temp1,i_temp2;
 //Вывод надписи ВЛА
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
  if (Button(&PORTA, 1, 1, 1)) // Если нажата кнопка Меню
    {
     while(1)
      {
       i_temp1=floor(sp/10); //первая цифра
       i_temp2=sp%10;        //вторая цифра
       dig_out(1,i_temp1,0); //первая цифра
       dig_out(2,i_temp2,0); //вторая цифра
       if (Button(&PORTA, 2, 1, 1)) // Если нажата кнопка Вверх
        sp=sp+1;
       if (Button(&PORTA, 3, 1, 1)) // Если нажата кнопка Вниз
        sp=sp-1;
       if (sp>=99) sp=30; //выход за верхнюю границу
       if (sp<=29) sp=98; //выход за нижнюю границу
       if (Button(&PORTA, 1, 1, 1))
        { //EEprom_Write(0x02,sp);
          return (sp);
        }
      }
    }
   }
}
//Подпрограмма установк интервала поворота--------------------------------------
 short menu_povorot(short sp)
{
 short i_temp1,i_temp2;
 //Вывод надписи ПОВ
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
  if (Button(&PORTA, 1, 1, 1)) // Если нажата кнопка Меню
    {
     while(1)
      {
       i_temp1=floor(sp/10); //первая цифра
       i_temp2=sp%10;        //вторая цифра
       dig_out(1,i_temp1,0); //первая цифра
       dig_out(2,i_temp2,0); //вторая цифра
       if (Button(&PORTA, 2, 1, 1)) // Если нажата кнопка Вверх
        sp=sp+1;
       if (Button(&PORTA, 3, 1, 1)) // Если нажата кнопка Вниз
        sp=sp-1;
       if (sp>=40) sp=0; //выход за верхнюю границу
       if (sp<=-1) sp=39; //выход за нижнюю границу
       if (Button(&PORTA, 1, 1, 1))
       { //EEprom_Write(0x03, sp);
          return (sp);
        }
      }
    }
   }
}
//Timer1------------------------------------------------------------------------
//Prescaler 1:8; TMR1 Preload = 3036; Actual Interrupt Time : 100 ms
void InitTimer1(){
  T1CON	 = 0x31;
  TMR1IF_bit	 = 0;
  TMR1H	 = 0x0B;
  TMR1L	 = 0xDC;
  TMR1IE_bit	 = 1;
  INTCON	 = 0xC0;
}
//------------------------------------------------------------------------------
void Interrupt(){
  if (TMR1IF_bit){   //вызываем каждые 100 мс
    TMR1IF_bit = 0;
    TMR1H	 = 0x0B;
    TMR1L	 = 0xDC;
    count100ms++;
    if (count100ms>=10) // 1 секунда
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
//Основная программа------------------------------------------------------------
void main()
{
 short punkt_menu=1,spmoisure,sppovorot,temp1,temp2;
 short mois_integer,temp_integer,temp_decimal;
 double sptemp,f_temp;
 TRISA=0xFF;//Вход
 TRISB=0;   //Выход
 TRISC=0;   //Выход
 InitTimer1();
 count100ms=seconds=minutes=houers=days=0;
 //temp1= Eeprom_Read(0x00);//уставка температуры целая часть чтение из памяти
 //temp2= Eeprom_Read(0x01);//уставка температуры дробная часть чтение из памяти
 //f_temp=(double)(temp2/10);
 //sptemp=(double)(temp1+f_temp);//уставка температуры
 //spmoisure=Eeprom_Read(0x02); // уставка влажности чтение из памяти
 //sppovorot=Eeprom_Read(0x03); // уставка интервала поворота чтение из памяти
 while(1)
 {
 //меню--------------------------------------------------------------------------
   if (Button(&PORTA, 1, 1, 1)&(punkt_menu==1)) // Если нажата кнопка Меню
    {//Подпрограмма установки температуры
     sptemp=menu_temp(sptemp); //уставка по температуре
     punkt_menu=2;
    }
   if (Button(&PORTA, 1, 1, 1)&(punkt_menu==2)) // Если нажата кнопка Меню
      {//Подпрограмма установки влажности
       spmoisure=menu_moisure(spmoisure);//уставка по влажности
       punkt_menu=3;
      }
   if (Button(&PORTA, 1, 1, 1)&(punkt_menu==3)) // Если нажата кнопка Меню
      {//Подпрограмма установки времени поворота
       sppovorot=menu_povorot(sppovorot);//уставка по интервалу
       punkt_menu=1;
      }
 //опрос датчика----------------------------------------------------------------
   Ow_Reset(&PORTA, 0);
   mois_integer = Ow_Read(&PORTA, 0);
   Ow_Read(&PORTA, 0);
   temp_integer = Ow_Read(&PORTA, 0);
   temp_decimal = Ow_Read(&PORTA, 0);
//вывод на экран----------------------------------------------------------------
   if((seconds>=0)&(seconds<20)) //вывод на экран температуры
   {dig_out(1,floor(temp_integer/10),0);
    dig_out(2,temp_integer%10,1);
    if((temp_decimal>=10)&(temp_decimal<100)) temp_decimal=temp_decimal*10;
    if(temp_decimal<10) temp_decimal=temp_decimal*100;
    temp_decimal=floor(temp_decimal/100);
    dig_out(3,temp_decimal,0);
   }
  if((seconds>=20)&(seconds<40)) //вывод на экран влажности
   {
    dig_out(1,floor(mois_integer/10),0);
    dig_out(2,mois_integer%10,0);
   }
  if(seconds>=40)//вывод на экран прошедьших дней
   {
    dig_out(1,floor(days/10),0);
    dig_out(2,days%10,0);
   }


      
  }
}