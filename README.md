# DFree App Prototype

This is a prototype for the DFree app using the Punchthrough [LightBlue Bean](https://punchthrough.com/bean/) microcontroller.

### App Installation

Clone this repo

`git clone https://github.com/khirakawa/dfree-prototype.git`

Then pod install dependencies

```
cd dfree-prototype
pod install
```

Finally, open the workspace `DFreePrototype.xcworkspace` in Xcode.  Compile and run on iPhone.

### Bean Communication

The app will automatically find the nearest bean and connect with it.  It expects the bean to send data over a serial bus.

Here's an accompanying sample code I ran to test the prototype.  Its a simple Arduino program that sends and increments an integer every 500 ms.  Once it reaches 100, it starts over at 0.

```
int i = 0;

// the setup routine runs once when you press reset:
void setup() {
  // initialize serial communication at 9600 bits per second:
  Serial.begin(9600);
}

// the loop routine runs over and over again forever:
void loop() {
  Serial.println(i);
  if (i >= 100) {
    i = 0; 
  } else {
    i = i + 1;
  }
  Bean.sleep(500);
}
```

The DFree App will read the data and display a progress bar.
