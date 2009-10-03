// Intervaluino.
//
// An intervalometer for Canon EOS cameras built using an Arduino and two reed
// relays.
//
// Author: albertb@gmail.com (Albert Bachand)
//
// Based on original intervaluino by Lord Yo:
// (c) Lord Yo 2008 (intervaluino a_t sporez do:t com)
// Licensed under a Creative Commons (Attribution Non-Commercial Share-Alike)
// license

int shutter_on = 200;    // Time to press shutter, set between 100 and 300.
int shutter_wait = 300;  // Initial time to wait to begin sequence.
int focus_on = 300;      // Time to activate wakeup (focus).
int focus_wait = 200;    // Time between wake and shutter.

long shutter_off = 4000; // Time to wait between shutter releases.

int focus_pin = 11;      // Output for shutter relay from pin 8.
int shutter_pin = 8;     // Output for focus relay from pin 11.

void setup() {
  pinMode(focus_pin, OUTPUT); // Focus pin gives output.
  pinMode(shutter_pin, OUTPUT);  // Shutter pin gives output.
}

void loop() {
  // Trigger the focus.
  digitalWrite(focus_pin, HIGH);
  delay(focus_on);
  digitalWrite(focus_pin, LOW);

  // Wait for lens to focus.
  delay(focus_wait);             

  // Trigger the shutter.
  digitalWrite(shutter_pin, HIGH);
  delay(shutter_on);
  digitalWrite(shutter_pin, LOW);

  // Wait for the next picture.
  delay(shutter_off); 
}
