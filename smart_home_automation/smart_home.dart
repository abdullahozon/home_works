/*
 A smart home system controls different devices such as lights, air conditioners, and security
 cameras.
 Each device has an on and off functionality.
 Some devices have additional functionalities, e.g., adjusting temperature or motion detection.
 The system should allow multiple devices to be controlled together.
 Question:
 How would you design a system where different devices share common functionalities but also have
 unique behaviors
*/

void main() {
  var light1 = Lights();
  var airConditioner1 = AirConditioners();
  var camera1 = SecurityCameras();

  var s1 = HomeManege();
  s1.addDevice(light1);
  s1.addDevice(airConditioner1);
  s1.addDevice(camera1);

  print(s1.devices);
  s1.turnOff(light1);

  s1.turndOnAll();

}

class HomeAutomation {
  bool isTurn = true;

  void turnOn() {
    print(isTurn);
    if (isTurn) {
      print('the device is already On');
    } else {
      isTurn = true;
      print('the device is now On');
    }
  }

  void turnOff() {
    if (!isTurn) {
      print('the device is already Off');
    } else {
      isTurn = false;
      print('the device is now Off');
    }
  }

  void doSomethig() {}
}

class Lights extends HomeAutomation {}

class AirConditioners extends HomeAutomation {
  int increase = 24;
  void increaseOneDeg() {
    increase++;
  }

  void reductionOneDeg() {
    increase--;
  }
}

class SecurityCameras extends HomeAutomation {
  bool isMootion = false;
  void turnOnMotion() {
    print(isMootion);
    if (isMootion) {
      print('the Camera is already motioning');
    } else {
      isMootion = true;
      print('the Camera is now motioning');
    }
  }

  void turnOffMotion() {
    if (!isMootion) {
      print('the Camera is already stoped');
    } else {
      isMootion = false;
      print('the Camera is now stoped');
    }

      }

  void printMotionState() {
    print(isMootion);
  }
}

class HomeManege {
  List<HomeAutomation> devices = [];
  void addDevice(HomeAutomation dev) {
    devices.add(dev);
  }

  void turndOnAll() {
    for (var device in devices) {
      device.turnOn();
    }
  }

  void turndOfAll() {
    for (var device in devices) {
      device.turnOff();
    }
  }

  void turnOn(HomeAutomation dev) {
    dev.turnOn();
  }

  void turnOff(HomeAutomation dev) {
    dev.turnOff();
  }

void custom(HomeAutomation dev) {
  if (dev is SecurityCameras) {
    dev.turnOffMotion();
  } else if (dev is AirConditioners) {
    dev.increaseOneDeg();
  }
}
}
