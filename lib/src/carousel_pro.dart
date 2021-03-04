import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

enum DotPosition {
  topLeft,
  topCenter,
  topRight,
  bottomLeft,
  bottomCenter,
  bottomRight
}

class Carousel extends StatefulWidget {
  //All the images on this Carousel.
  final List? images;

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
  final Color? dotBgColor;

  // The Color of each increased dot. Default is Colors.white
  final Color dotIncreasedColor;

  // Enable or Disable the indicator (dots). Default is true
  final bool showIndicator;

  //Padding Size of the background Indicator. Default is 20.0
  final double indicatorBgPadding;

  //How to show the images in the box. Default is cover
  final BoxFit boxFit;

  //Enable/Disable radius Border for the images. Default is false
  final bool borderRadius;

  //Border Radius of the images. Default is [Radius.circular(8.0)]
  final Radius? radius;

  //Indicator position. Default bottomCenter
  final DotPosition dotPosition;

  //Move the Indicator Horizontally relative to the dot position
  final double dotHorizontalPadding;

  //Move the Indicator Vertically relative to the dot position
  final double dotVerticalPadding;

  //Move the Indicator From the Bottom
  final double moveIndicatorFromBottom;

  //Remove the radius bottom from the indicator background. Default false
  final bool noRadiusForIndicator;

  //Enable/Disable Image Overlay Shadow. Default false
  final bool overlayShadow;

  //Choose the color of the overlay Shadow color. Default Colors.grey[800]
  final Color? overlayShadowColors;

  //Choose the size of the Overlay Shadow, from 0.0 to 1.0. Default 0.5
  final double overlayShadowSize;

  //Enable/Disable the auto play of the slider. Default true
  final bool autoplay;

  //Duration of the Auto play slider by seconds. Default 3 seconds
  final Duration autoplayDuration;

  //On image tap event, passes current image index as an argument
  final void Function(int)? onImageTap;

  //On image change event, passes previous image index and current image index as arguments
  final void Function(int, int)? onImageChange;

  Carousel({
    this.images,
    this.animationCurve = Curves.ease,
    this.animationDuration = const Duration(milliseconds: 300),
    this.dotSize = 8.0,
    this.dotSpacing = 25.0,
    this.dotIncreaseSize = 2.0,
    this.dotColor = Colors.white,
    this.dotBgColor,
    this.dotIncreasedColor = Colors.white,
    this.showIndicator = true,
    this.indicatorBgPadding = 20.0,
    this.boxFit = BoxFit.cover,
    this.borderRadius = false,
    this.radius,
    this.dotPosition = DotPosition.bottomCenter,
    this.dotHorizontalPadding = 0.0,
    this.dotVerticalPadding = 0.0,
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
  });

  @override
  State createState() => CarouselState();
}

class CarouselState extends State<Carousel> {
  Timer? timer;
  int _currentImageIndex = 0;
  PageController? _controller = PageController();

  @override
  void initState() {
    super.initState();

    if (widget.images != null && widget.images!.isNotEmpty) {
      if (widget.autoplay) {
        timer = Timer.periodic(widget.autoplayDuration, (_) {
          if (_controller!.hasClients) {
            if (_controller!.page!.round() == widget.images!.length - 1) {
              _controller!.animateToPage(
                0,
                duration: widget.animationDuration,
                curve: widget.animationCurve,
              );
            } else {
              _controller!.nextPage(
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
    _controller!.dispose();
    _controller = null;
    timer?.cancel();
    timer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget?> listImages = (widget.images != null &&
            widget.images!.isNotEmpty)
        ? widget.images!.map<Widget>(
            (netImage) {
              if (netImage is ImageProvider) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: widget.borderRadius
                        ? BorderRadius.all(widget.radius != null
                            ? widget.radius!
                            : Radius.circular(8.0))
                        : null,
                    image: DecorationImage(
                      //colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
                      image: netImage,
                      fit: widget.boxFit,
                    ),
                  ),
                  child: widget.overlayShadow
                      ? Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.center,
                              stops: [0.0, widget.overlayShadowSize],
                              colors: [
                                widget.overlayShadowColors != null
                                    ? widget.overlayShadowColors!
                                        .withOpacity(1.0)
                                    : Colors.grey[800]!.withOpacity(1.0),
                                widget.overlayShadowColors != null
                                    ? widget.overlayShadowColors!
                                        .withOpacity(0.0)
                                    : Colors.grey[800]!.withOpacity(0.0)
                              ],
                            ),
                          ),
                        )
                      : Container(),
                );
              } else if (netImage is FadeInImage) {
                return ClipRRect(
                  borderRadius: widget.borderRadius
                      ? BorderRadius.all(widget.radius != null
                          ? widget.radius!
                          : Radius.circular(8.0))
                      : null,
                  child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.center,
                          stops: [0.0, widget.overlayShadowSize],
                          colors: [
                            widget.overlayShadowColors != null
                                ? widget.overlayShadowColors!.withOpacity(1.0)
                                : Colors.grey[800]!.withOpacity(1.0),
                            widget.overlayShadowColors != null
                                ? widget.overlayShadowColors!.withOpacity(0.0)
                                : Colors.grey[800]!.withOpacity(0.0)
                          ],
                        ),
                      ),
                      child: netImage),
                );
              } else {
                return netImage;
              }
            },
          ).toList()
        : [
            widget.defaultImage is ImageProvider
                ? Container(
                    decoration: BoxDecoration(
                      borderRadius: widget.borderRadius
                          ? BorderRadius.all(widget.radius != null
                              ? widget.radius!
                              : Radius.circular(8.0))
                          : null,
                      image: DecorationImage(
                        //colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
                        image: widget.defaultImage,
                        fit: widget.boxFit,
                      ),
                    ),
                    child: widget.overlayShadow
                        ? Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.center,
                                stops: [0.0, widget.overlayShadowSize],
                                colors: [
                                  widget.overlayShadowColors != null
                                      ? widget.overlayShadowColors!
                                          .withOpacity(1.0)
                                      : Colors.grey[800]!.withOpacity(1.0),
                                  widget.overlayShadowColors != null
                                      ? widget.overlayShadowColors!
                                          .withOpacity(0.0)
                                      : Colors.grey[800]!.withOpacity(0.0)
                                ],
                              ),
                            ),
                          )
                        : Container(),
                  )
                : widget.defaultImage,
          ];

    final bottom = [
      DotPosition.bottomLeft,
      DotPosition.bottomCenter,
      DotPosition.bottomRight
    ].contains(widget.dotPosition)
        ? widget.dotVerticalPadding
        : null;
    final top = [
      DotPosition.topLeft,
      DotPosition.topCenter,
      DotPosition.topRight
    ].contains(widget.dotPosition)
        ? widget.dotVerticalPadding
        : null;
    double? left = [DotPosition.topLeft, DotPosition.bottomLeft]
            .contains(widget.dotPosition)
        ? widget.dotHorizontalPadding
        : null;
    double? right = [DotPosition.topRight, DotPosition.bottomRight]
            .contains(widget.dotPosition)
        ? widget.dotHorizontalPadding
        : null;

    if (left == null && right == null) {
      left = right = 0.0;
    }

    return Stack(
      children: <Widget>[
        Container(
          child: Builder(
            builder: (_) {
              Widget pageView = PageView(
                physics: AlwaysScrollableScrollPhysics(),
                controller: _controller,
                children: listImages as List<Widget>,
                onPageChanged: (currentPage) {
                  if (widget.onImageChange != null) {
                    widget.onImageChange!(_currentImageIndex, currentPage);
                  }

                  _currentImageIndex = currentPage;
                },
              );

              if (widget.onImageTap == null) {
                return pageView;
              }

              return GestureDetector(
                child: pageView,
                onTap: () => widget.onImageTap!(_currentImageIndex),
              );
            },
          ),
        ),
        widget.showIndicator
            ? Positioned(
                bottom: bottom,
                top: top,
                left: left,
                right: right,
                child: Container(
                  decoration: BoxDecoration(
                    color: widget.dotBgColor == null
                        ? Colors.grey[800]!.withOpacity(0.5)
                        : widget.dotBgColor,
                    borderRadius: widget.borderRadius
                        ? (widget.noRadiusForIndicator
                            ? null
                            : BorderRadius.only(
                                bottomLeft: widget.radius != null
                                    ? widget.radius!
                                    : Radius.circular(8.0),
                                bottomRight: widget.radius != null
                                    ? widget.radius!
                                    : Radius.circular(8.0)))
                        : null,
                  ),
                  padding: EdgeInsets.all(widget.indicatorBgPadding),
                  child: Center(
                    child: DotsIndicator(
                      controller: _controller!,
                      itemCount: listImages.length,
                      color: widget.dotColor,
                      increasedColor: widget.dotIncreasedColor,
                      dotSize: widget.dotSize,
                      dotSpacing: widget.dotSpacing,
                      dotIncreaseSize: widget.dotIncreaseSize,
                      onPageSelected: (int page) {
                        _controller!.animateToPage(
                          page,
                          duration: widget.animationDuration,
                          curve: widget.animationCurve,
                        );
                      },
                    ),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}

/// An indicator showing the currently selected page of a PageController
class DotsIndicator extends AnimatedWidget {
  DotsIndicator(
      {required this.controller,
      this.itemCount,
      this.onPageSelected,
      this.color,
      this.increasedColor,
      this.dotSize,
      this.dotIncreaseSize,
      this.dotSpacing})
      : super(listenable: controller);

  // The PageController that this DotsIndicator is representing.
  final PageController controller;

  // The number of items managed by the PageController
  final int? itemCount;

  // Called when a dot is tapped
  final ValueChanged<int>? onPageSelected;

  // The color of the dots.
  final Color? color;

  // The color of the increased dot.
  final Color? increasedColor;

  // The base size of the dots
  final double? dotSize;

  // The increase in the size of the selected dot
  final double? dotIncreaseSize;

  // The distance between the center of each dot
  final double? dotSpacing;

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((controller.page ?? controller.initialPage) - index).abs(),
      ),
    );
    double zoom = 1.0 + (dotIncreaseSize! - 1.0) * selectedness;
    final dotColor = zoom > 1.0 ? increasedColor : color;
    return Container(
      width: dotSpacing,
      child: Center(
        child: Material(
          color: dotColor,
          type: MaterialType.circle,
          child: Container(
            width: dotSize! * zoom,
            height: dotSize! * zoom,
            child: InkWell(
              onTap: () => onPageSelected!(index),
            ),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(itemCount!, _buildDot),
    );
  }
}
