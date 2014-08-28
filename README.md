# UIGradientView
A subclass of UIView that supports rendering of gradients. See the following blog post for a detailed explanation of the concepts used in this project.
http://angelorohit.blogspot.sg/2013/07/rendering-ios-gradients-with.html

## What do I need to know?
### Gradient stop
A [Gradient stop](UIGradientView/GradientStop.h) represents both a color and an offset at which the color is to be rendered. We can specify multiple gradient stops for a gradient overlay.
The offset for a gradient stop can range from 0 to 100.

### Gradient overlay
A [Gradient overlay](UIGradientView/GradientOverlay.h) represents the overlay of a Gradient in a UIGradientView. There can be multiple overlays in a gradient.
Each overlay specifies the gradient stops to be rendered. There are two types of Gradient overlays namely; Linear gradient overlay and Radial gradient overlay.
####Linear gradient overlay
A [Linear gradient overlay](UIGradientView/LinearGradientOverlay.h) is used to overlay a linear gradient in a UIGradientView. The user of this overlay can specify the 
direction in which the linear gradient should be rendered. See [LinearGradientDirection](UIGradientView/LinearGradientOverlay.h) for a list of available options. 
Linear gradient overlays are rendered vertically by default.
####Radial gradient overlay
A [Radial gradient overlay](UIGradientView/RadialGradientOverlay.h) is used to overlay a radial gradient in a UIGradientView. Radial gradients are always rendered 
at the center of the view. The user of this overlay can specify a radius for the radial gradient. Radial gradients overlays are
rendered to fill the view by default.

### UIGradientView
[UIGradientView](UIGradientView/UIGradientView.h) is a subclass of UIView. It renders one or more Gradient overlays in its content area.
See [ViewController.m](GradientViewDemo/ViewController.m) in the demo project to understand how a UIGradientView may be setup and used.

###Presets
The project comes with a default set of gradient presets that can be loaded via the UIGradientView(Presets) category class. If you don't wish to use any of the presets, simply exclude the following files from your project:

- UIGradientView+Presets.h
- UIGradientView+Presets.m
- Gradient-Presets.plist.

![Preview image](http://2.bp.blogspot.com/-uW3eHSh6DZ0/UfZ4mDGoa4I/AAAAAAAAAmc/nC9QT6-vOjw/s1600/Screen+Shot+2013-07-29+at+10.07.59+PM.png)
