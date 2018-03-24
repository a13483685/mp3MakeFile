#include<stdio.h>
#include "lcd.h"

int main()
{
    printf("MP3 player init..\n");
    lcd_init();
    init_usb();
    init_media();
    return 0;
}
