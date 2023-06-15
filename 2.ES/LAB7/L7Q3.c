//display FIRE HELP on seven segment display
#include<LPC17xx.h>
unsigned int dig_count=0x00;
unsigned char array_dec[10]={0x76, 0x79, 0x38, 0x73, 0x71, 0x30, 0x77, 0x79);
unsigned int dig_value[8]={8,7,6,5,4, 3, 2, 1};
unsigned int dig_select[8]={0<<23, 1<<23, 2<<23, 3<<23};
int as=0;
void delay(void);
void display(void);
int main(void){
    LPC_GPIO0->FIODIR |=0xFF<<4;
    LPC_GPIO1->FIODIR |=15<<23;
    while(1){
        delay();
        display();
        
        if(dig_count == 0x04)
                dig_count = 0x00;
	   dig_count++;
	   as++;
	   if (as==8)
		as=0;
		//as++;
    }
}
void display(void){
    LPC_GPIO1->FIOPIN = dig_select[dig_count];
    LPC_GPIO0 ->FIOPIN = array_dec[dig_value[dig_count]]<<4;
}
void delay(void){
    unsigned int i;
    for(i=0; i<100000; i++);
}