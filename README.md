# Carousel Pro

A Flutter Carousel widget.

## Usage

As simple as using any flutter Widget.

<b>Example:</b>
Add the module to your project ``pubspec.yaml``:
```yaml
...
dependencies:
 ...
 carousel_pro: ^0.0.1
...
```
And install it using ``flutter packages get`` on your project folder. After that, just import the module and use it:
```dart
import 'package:carousel_pro/carousel_pro.dart';

//...
new SizedBox(
  height: 150.0,
  width: 300.0,
  child: new Carousel(
    images: [
      new NetworkImage('https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg'),
      new NetworkImage('https://cdn-images-1.medium.com/max/2000/1*wnIEgP1gNMrK5gZU7QS0-A.jpeg'),
      new ExactAssetImage("assets/images/LaunchImage.jpg")
    ],
  )
),

```

## Parameters and Values

<h3>images</h3>
All the images on this Carousel.
<br/><b>Type:</b> List

<h3>animationCurve</h3>
The transition animation timing curve
<br /><b>Default value:</b> Curves.ease
<br/><b>Type:</b> Curve
<h5>Values</h5>
Curves.linear;
<br/>Curves.fastOutSlowIn;
<br/>Curves.ease;
<br/>Curves.bounceOut;
<br/>Curves.bounceIn;
<br/>Curves.bounceInOut;
<br/>Curves.decelerate;
<br/>Curves.ease;
<br/>Curves.easeIn;
<br/>Curves.easeInOut;
<br/>Curves.easeOut;
<br/>Curves.elasticIn;
<br/>Curves.elasticInOut;
<br/>Curves.elasticOut;

<h3>animationDuration</h3>
The transition animation duration
<br /><b>Type:</b> Duration 
<br /><b>Default value:</b> 300ms.

<h3>dotSize</h3>
The base size of the dots
<br /><b>Type:</b> double
<br /><b>Default value:</b> 8.0

<h3>dotIncreaseSize</h3>
The increase in the size of the selected dot
<br /><b>Type:</b> double
<br /><b>Default value:</b> 2.0


<h3>dotSpacing</h3>
The distance between the center of each dot
<br /><b>Type:</b> double
<br /><b>Default value:</b> 25.0

<h3>dotColor</h3>
The Color of each dot
<br /><b>Type:</b> Color
<br /><b>Default value:</b> Colors.white

<h3>dotBgColor</h3>
The background Color of the dots
<br /><b>Type:</b> Color
<br /><b>Default value:</b> Colors.grey[800].withOpacity(0.5)

<h3>showIndicator</h3>
Enable or Disable the indicator (dots)
<br /><b>Type:</b> bool
<br /><b>Default value:</b> true

<h3>indicatorBgPadding</h3>
Padding Size of the background Indicator
<br /><b>Type:</b> double
<br /><b>Default value:</b> 20.0

<h3>boxFit</h3>
How to show the images in the box
<br /><b>Type:</b> BoxFit
<br /><b>Default value:</b> cover
<h5>Values</h5>
BoxFit.cover;
<br />BoxFit.fitWidth;
<br />BoxFit.fitHeight;
<br />BoxFit.scaleDown;
<br />BoxFit.fill;
<br />BoxFit.contain;
<br />BoxFit.none;

<h3>borderRadius</h3>
Enable/Disable radius Border for the images
<br /><b>Type:</b> bool
<br /><b>Default value:</b> false

<h3>radius</h3>
Border Radius of the images
<br /><b>Type:</b> Radius
<br /><b>Default value:</b> Radius.circular(8.0)

<h3>moveIndicatorFromBottom</h3>
Move the Indicator From the Bottom
<br /><b>Type:</b> double
<br /><b>Default value:</b> 0.0

<h3>noRadiusForIndicator</h3>
Remove the radius bottom from the indicator background
<br /><b>Type:</b> bool
<br /><b>Default value:</b> false

<h3>overlayShadow</h3>
Enable/Disable Image Overlay Shadow
<br /><b>Type:</b> bool
<br /><b>Default value:</b> false

<h3>overlayShadowColors</h3>
Choose the color of the overlay Shadow color
<br /><b>Type:</b> Color
<br /><b>Default value:</b> Colors.grey[800]

<h3>overlayShadowSize</h3>
Choose the size of the Overlay Shadow, from 0.0 to 1.0
<br /><b>Type:</b> double
<br /><b>Default value:</b> 0.5
  
## Credits

Developed by [JLouage (Julien Louage)](http://www.jlouage.com) <info@jlouage.com>

## Contributing

Feel free to help!
