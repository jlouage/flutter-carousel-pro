# Carousel Pro [![pub package](https://img.shields.io/pub/v/carousel_pro.svg)](https://pub.dartlang.org/packages/carousel_pro)

A Flutter Carousel widget.

## Usage

As simple as using any flutter Widget.

**Example:**
Add the module to your project ``pubspec.yaml``:
```yaml
...
dependencies:
 ...
 carousel_pro: ^1.0.0
...
```
And install it using ``flutter packages get`` on your project folder. After that, just import the module and use it:
```dart
import 'package:carousel_pro/carousel_pro.dart';

//...
SizedBox(
  height: 150.0,
  width: 300.0,
  child: Carousel(
    images: [
      NetworkImage('https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg'),
      NetworkImage('https://cdn-images-1.medium.com/max/2000/1*wnIEgP1gNMrK5gZU7QS0-A.jpeg'),
      ExactAssetImage("assets/images/LaunchImage.jpg")
    ],
  )
),

```
![ScreenShot 01](https://github.com/jlouage/flutter-carousel-pro/blob/master/screenshots/screenshot01.png?raw=true "ScreenShot 01")

```dart
import 'package:carousel_pro/carousel_pro.dart';

//...
SizedBox(
  height: 200.0,
  width: 350.0,
  child: Carousel(
    images: [
      NetworkImage('https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg'),
      NetworkImage('https://cdn-images-1.medium.com/max/2000/1*wnIEgP1gNMrK5gZU7QS0-A.jpeg'),
      ExactAssetImage("assets/images/LaunchImage.jpg")
    ],
    dotSize: 4.0,
    dotSpacing: 15.0,
    dotColor: Colors.lightGreenAccent,
    indicatorBgPadding: 5.0,
    dotBgColor: Colors.purple.withOpacity(0.5),
    borderRadius: true,
  )
),

```
![ScreenShot 02](https://github.com/jlouage/flutter-carousel-pro/blob/master/screenshots/screenshot02.png?raw=true "ScreenShot 02")


```dart
import 'package:carousel_pro/carousel_pro.dart';

//...
SizedBox(
    height: 200.0,
    width: 350.0,
    child: Carousel(
      images: [
        NetworkImage('https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg'),
        NetworkImage('https://cdn-images-1.medium.com/max/2000/1*wnIEgP1gNMrK5gZU7QS0-A.jpeg'),
        ExactAssetImage("assets/images/LaunchImage.jpg")
      ],
      dotSize: 4.0,
      dotSpacing: 15.0,
      dotColor: Colors.lightGreenAccent,
      indicatorBgPadding: 5.0,
      dotBgColor: Colors.purple.withOpacity(0.5),
      borderRadius: true,
      moveIndicatorFromBottom: 180.0,
      noRadiusForIndicator: true,
    )
),

```
![ScreenShot 03](https://github.com/jlouage/flutter-carousel-pro/blob/master/screenshots/screenshot03.png?raw=true "ScreenShot 03")


```dart
import 'package:carousel_pro/carousel_pro.dart';

//...
SizedBox(
    height: 200.0,
    width: 350.0,
    child: Carousel(
      images: [
        NetworkImage('https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg'),
        NetworkImage('https://cdn-images-1.medium.com/max/2000/1*wnIEgP1gNMrK5gZU7QS0-A.jpeg'),
        ExactAssetImage("assets/images/LaunchImage.jpg")
      ],
      dotSize: 4.0,
      dotSpacing: 15.0,
      dotColor: Colors.lightGreenAccent,
      indicatorBgPadding: 5.0,
      dotBgColor: Colors.purple.withOpacity(0.5),
      borderRadius: false,
      moveIndicatorFromBottom: 180.0,
      noRadiusForIndicator: true,
      overlayShadow: true,
      overlayShadowColors: Colors.white,
      overlayShadowSize: 0.7,
    )
),

```
![ScreenShot 04](https://github.com/jlouage/flutter-carousel-pro/blob/master/screenshots/screenshot04.png?raw=true "ScreenShot 04")


```dart
import 'package:carousel_pro/carousel_pro.dart';

//...
SizedBox(
    height: 200.0,
    width: 350.0,
    child: Carousel(
      images: [
        NetworkImage('https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg'),
        NetworkImage('https://cdn-images-1.medium.com/max/2000/1*wnIEgP1gNMrK5gZU7QS0-A.jpeg'),
        ExactAssetImage("assets/images/LaunchImage.jpg")
      ],
      showIndicator: false,
      borderRadius: false,
      moveIndicatorFromBottom: 180.0,
      noRadiusForIndicator: true,
      overlayShadow: true,
      overlayShadowColors: Colors.white,
      overlayShadowSize: 0.7,
    )
),

```
![ScreenShot 05](https://github.com/jlouage/flutter-carousel-pro/blob/master/screenshots/screenshot05.png?raw=true "ScreenShot 05")

## Parameters and Values

### images
All the images on this Carousel.
**Type:** List

### animationCurve
The transition animation timing curve
**Default value:** Curves.ease
**Type:** Curve
##### Values
* Curves.linear;
* Curves.fastOutSlowIn;
* Curves.ease;
* Curves.bounceOut;
* Curves.bounceIn;
* Curves.bounceInOut;
* Curves.decelerate;
* Curves.ease;
* Curves.easeIn;
* Curves.easeInOut;
* Curves.easeOut;
* Curves.elasticIn;
* Curves.elasticInOut;
* Curves.elasticOut;

### animationDuration
The transition animation duration
**Type:** Duration 
**Default value:** 300ms.

### dotSize
The base size of the dots
**Type:** double
**Default value:** 8.0

### dotIncreaseSize
The increase in the size of the selected dot
**Type:** double
**Default value:** 2.0


### dotSpacing
The distance between the center of each dot
**Type:** double
**Default value:** 25.0

### dotColor
The Color of each dot
**Type:** Color
**Default value:** Colors.white

### dotBgColor
The background Color of the dots
**Type:** Color
**Default value:** Colors.grey[800].withOpacity(0.5)

### showIndicator
Enable or Disable the indicator (dots)
**Type:** bool
**Default value:** true

### indicatorBgPadding
Padding Size of the background Indicator
**Type:** double
**Default value:** 20.0

### boxFit
How to show the images in the box
**Type:** BoxFit
**Default value:** cover
##### Values
* BoxFit.cover;
* BoxFit.fitWidth;
* BoxFit.fitHeight;
* BoxFit.scaleDown;
* BoxFit.fill;
* BoxFit.contain;
* BoxFit.none;

### borderRadius
Enable/Disable radius Border for the images
**Type:** bool
**Default value:** false

### radius
Border Radius of the images
**Type:** Radius
**Default value:** Radius.circular(8.0)

### moveIndicatorFromBottom
Move the Indicator From the Bottom
**Type:** double
**Default value:** 0.0

### noRadiusForIndicator
Remove the radius bottom from the indicator background
**Type:** bool
**Default value:** false

### overlayShadow
Enable/Disable Image Overlay Shadow
**Type:** bool
**Default value:** false

### overlayShadowColors
Choose the color of the overlay Shadow color
**Type:** Color
**Default value:** Colors.grey[800]

### overlayShadowSize
Choose the size of the Overlay Shadow, from 0.0 to 1.0
**Type:** double
**Default value:** 0.5

### autoplay
Enable/Disable autoplay carousel
**Type:** bool
**Default value:** true

### autoplayDuration
The autoplay transition duration
**Type:** Duration 
**Default value:** 3s
  
## Credits

Developed by [JLouage (Julien Louage)](http://www.jlouage.com) <info@jlouage.com>

## Contributing

Feel free to help!
