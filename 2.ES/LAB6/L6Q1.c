//program to switch on LEDs
#include <LPC17xx.h>
unsigned int i,j;
unsigned long LED;
int main(void){
	SystemInit();	//add these two function for is internal operation
	SystemCoreClockUpdate();
	LPC_PINCON->PINSEL0 &= 0xFF0000FF;	//configure Port0 PINS P0.4-P0.11 as GPIO function
	LPC_GPIO0->FIODIR |= 0x00000FF0;	 	//configure P0.4-P0.11 as output port
	while(1){
		LED=0x00000010;					//initial value on LED
		for (i=1;i<9;i++){				//on the LEDs serially
			LPC_GPIO0->FIOSET=LED;		//turn on LED at LSB(LED connected to P0.4)
		
			for (j=0;j<10000;j++);		//a random delay
			LED<<=1;					//shift the LED to the left by one unit
		}								//loop for 8 times
		LED = 0x00000010;
		for(i=1;i<9;i++){				//off the LEDs serially
			LPC_GPIO0->FIOCLR = LED;	//turn off LED at LSB(LED connected to P0.4)
			for(j=0;j<10000;j++);
			LED <<= 1;
		}
	}
}	
