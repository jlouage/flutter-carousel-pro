import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  //All the images on this Carousel.
  final List images;

  //All the images on this Carousel.
  final defaultImage;

  //The transition animation timing curve. Default is [Curves.ease]
  final Curve animationCurve;

  //The transition animation duration. Default is 300ms.
  final Duration animationDuration;

  // The base size of the dots. Default is 8.0
  final double dotSize;

  // The increase in the size of the selected dot. Default is 2.0
  final double dotIncreaseSize;

  // The distance between the center of each dot. Default is 25.0
  final double dotSpacing;

  // The Color of each dot. Default is Colors.white
  final Color dotColor;

  // The background Color of the dots. Default is [Colors.grey[800].withOpacity(0.5)]
  final Color dotBgColor;

  // Enable or Disable the indicator (dots). Default is true
  final bool showIndicator;

  //Padding Size of the background Indicator. Default is 20.0
  final double indicatorBgPadding;

  //How to show the images in the box. Default is cover
  final BoxFit boxFit;

  //Enable/Disable radius Border for the images. Default is false
  final bool borderRadius;

  //Border Radius of the images. Default is [Radius.circular(8.0)]
  final Radius radius;

  //Move the Indicator From the Bottom
  final double moveIndicatorFromBottom;

  //Remove the radius bottom from the indicator background. Default false
  final bool noRadiusForIndicator;

  //Enable/Disable Image Overlay Shadow. Default false
  final bool overlayShadow;

  //Choose the color of the overlay Shadow color. Default Colors.grey[800]
  final Color overlayShadowColors;

  //Choose the size of the Overlay Shadow, from 0.0 to 1.0. Default 0.5
  final double overlayShadowSize;

  //Enable/Disable the auto play of the slider. Default true
  final bool autoplay;

  //Duration of the Auto play slider by seconds. Default 3 seconds
  final Duration autoplayDuration;

  //On image tap event, passes current image index as an argument
  final void Function(int) onImageTap;

  //On image change event, passes previous image index and current image index as arguments
  final void Function(int, int) onImageChange;

  Carousel({
    this.images,
    this.animationCurve = Curves.ease,
    this.animationDuration = const Duration(milliseconds: 300),
    this.dotSize = 8.0,
    this.dotSpacing = 25.0,
    this.dotIncreaseSize = 2.0,
    this.dotColor = Colors.white,
    this.dotBgColor,
    this.showIndicator = true,
    this.indicatorBgPadding = 20.0,
    this.boxFit = BoxFit.cover,
    this.borderRadius = false,
    this.radius,
    this.moveIndicatorFromBottom = 0.0,
    this.noRadiusForIndicator = false,
    this.overlayShadow = false,
    this.overlayShadowColors,
    this.overlayShadowSize = 0.5,
    this.autoplay = true,
    this.autoplayDuration = const Duration(seconds: 3),
    this.onImageTap,
    this.onImageChange,
    this.defaultImage,
  })  : assert(images != null || (images == null && defaultImage != null)),
        assert(animationCurve != null),
        assert(animationDuration != null),
        assert(dotSize != null),
        assert(dotSpacing != null),
        assert(dotIncreaseSize != null),
        assert(dotColor != null);

  @override
  State createState() => new CarouselState();
}

class CarouselState extends State<Carousel> {
  Timer timer;
  int _currentImageIndex = 0;
  PageController _controller = new PageController();

  @override
  void initState() {
    super.initState();

    if (widget.images != null && widget.images.isNotEmpty) {
      if (widget.autoplay) {
        timer = new Timer.periodic(widget.autoplayDuration, (_) {
          if (_controller.hasClients) {
            if (_controller.page.round() == widget.images.length - 1) {
              _controller.animateToPage(
                0,
                duration: widget.animationDuration,
                curve: widget.animationCurve,
              );
            } else {
              _controller.nextPage(
                  duration: widget.animationDuration,
                  curve: widget.animationCurve);
            }
          }
        });
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller = null;
    timer?.cancel();
    timer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> listImages =
        (widget.images != null && widget.images.isNotEmpty)
            ? widget.images
                .map<Widget>(
                  (netImage) => netImage is ImageProvider
                      ? new Container(
                          decoration: new BoxDecoration(
                            borderRadius: widget.borderRadius
                                ? new BorderRadius.all(widget.radius != null
                                    ? widget.radius
                                    : new Radius.circular(8.0))
                                : null,
                            image: new DecorationImage(
                              //colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
                              image: netImage,
                              fit: widget.boxFit,
                            ),
                          ),
                          child: widget.overlayShadow
                              ? new Container(
                                  decoration: new BoxDecoration(
                                    gradient: new LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.center,
                                      stops: [0.0, widget.overlayShadowSize],
                                      colors: [
                                        widget.overlayShadowColors != null
                                            ? widget.overlayShadowColors
                                                .withOpacity(1.0)
                                            : Colors.grey[800].withOpacity(1.0),
                                        widget.overlayShadowColors != null
                                            ? widget.overlayShadowColors
                                                .withOpacity(0.0)
                                            : Colors.grey[800].withOpacity(0.0)
                                      ],
                                    ),
                                  ),
                                )
                              : new Container(),
                        )
                      : netImage,
                )
                .toList()
            : [
                widget.defaultImage is ImageProvider
                    ? new Container(
                        decoration: new BoxDecoration(
                          borderRadius: widget.borderRadius
                              ? new BorderRadius.all(widget.radius != null
                                  ? widget.radius
                                  : new Radius.circular(8.0))
                              : null,
                          image: new DecorationImage(
                            //colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
                            image: widget.defaultImage,
                            fit: widget.boxFit,
                          ),
                        ),
                        child: widget.overlayShadow
                            ? new Container(
                                decoration: new BoxDecoration(
                                  gradient: new LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.center,
                                    stops: [0.0, widget.overlayShadowSize],
                                    colors: [
                                      widget.overlayShadowColors != null
                                          ? widget.overlayShadowColors
                                              .withOpacity(1.0)
                                          : Colors.grey[800].withOpacity(1.0),
                                      widget.overlayShadowColors != null
                                          ? widget.overlayShadowColors
                                              .withOpacity(0.0)
                                          : Colors.grey[800].withOpacity(0.0)
                                    ],
                                  ),
                                ),
                              )
                            : new Container(),
                      )
                    : widget.defaultImage,
              ];

    return new Stack(
      children: <Widget>[
        new Container(
          child: new Builder(
            builder: (_) {
              Widget pageView = new PageView(
                physics: new AlwaysScrollableScrollPhysics(),
                controller: _controller,
                children: listImages,
                onPageChanged: (currentPage) {
                  if (widget.onImageChange != null) {
                    widget.onImageChange(_currentImageIndex, currentPage);
                  }

                  _currentImageIndex = currentPage;
                },
              );

              if (widget.onImageTap == null) {
                return pageView;
              }

              return new GestureDetector(
                child: pageView,
                onTap: () => widget.onImageTap(_currentImageIndex),
              );
            },
          ),
        ),
        widget.showIndicator
            ? new Positioned(
                bottom: widget.moveIndicatorFromBottom,
                left: 0.0,
                right: 0.0,
                child: new Container(
                  decoration: new BoxDecoration(
                    color: widget.dotBgColor == null
                        ? Colors.grey[800].withOpacity(0.5)
                        : widget.dotBgColor,
                    borderRadius: widget.borderRadius
                        ? (widget.noRadiusForIndicator
                            ? null
                            : new BorderRadius.only(
                                bottomLeft: widget.radius != null
                                    ? widget.radius
                                    : new Radius.circular(8.0),
                                bottomRight: widget.radius != null
                                    ? widget.radius
                                    : new Radius.circular(8.0)))
                        : null,
                  ),
                  padding: new EdgeInsets.all(widget.indicatorBgPadding),
                  child: new Center(
                    child: new DotsIndicator(
                      controller: _controller,
                      itemCount: listImages.length,
                      color: widget.dotColor,
                      dotSize: widget.dotSize,
                      dotSpacing: widget.dotSpacing,
                      dotIncreaseSize: widget.dotIncreaseSize,
                      onPageSelected: (int page) {
                        _controller.animateToPage(
                          page,
                          duration: widget.animationDuration,
                          curve: widget.animationCurve,
                        );
                      },
                    ),
                  ),
                ),
              )
            : new Container(),
      ],
    );
  }
}

/// An indicator showing the currently selected page of a PageController
class DotsIndicator extends AnimatedWidget {
  DotsIndicator(
      {this.controller,
      this.itemCount,
      this.onPageSelected,
      this.color,
      this.dotSize,
      this.dotIncreaseSize,
      this.dotSpacing})
      : super(listenable: controller);

  // The PageController that this DotsIndicator is representing.
  final PageController controller;

  // The number of items managed by the PageController
  final int itemCount;

  // Called when a dot is tapped
  final ValueChanged<int> onPageSelected;

  // The color of the dots.
  final Color color;

  // The base size of the dots
  final double dotSize;

  // The increase in the size of the selected dot
  final double dotIncreaseSize;

  // The distance between the center of each dot
  final double dotSpacing;

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((controller.page ?? controller.initialPage) - index).abs(),
      ),
    );
    double zoom = 1.0 + (dotIncreaseSize - 1.0) * selectedness;
    return new Container(
      width: dotSpacing,
      child: new Center(
        child: new Material(
          color: color,
          type: MaterialType.circle,
          child: new Container(
            width: dotSize * zoom,
            height: dotSize * zoom,
            child: new InkWell(
              onTap: () => onPageSelected(index),
            ),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: new List<Widget>.generate(itemCount, _buildDot),
    );
  }
}
