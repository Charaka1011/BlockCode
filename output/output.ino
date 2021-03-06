#include "EngduinoLight.h" 
#include "EngduinoThermistor.h" 
#include "EngduinoButton.h" 
#include "EngduinoLEDs.h" 
#include "EngduinoAccelerometer.h" 
#include "Wire.h" 

void setup() {
	EngduinoLight.begin();
	EngduinoThermistor.begin();
	EngduinoButton.begin();
	EngduinoLEDs.begin();
	EngduinoAccelerometer.begin();
}

void loop() {
	for(int b = 0; b <20; b++) {
		EngduinoLEDs.setLED(10, WHITE);
	}
}
