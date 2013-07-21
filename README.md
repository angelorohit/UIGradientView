# UIGradientView
A subclass of UIView that supports rendering of gradients.

## What do I need to know?
### Gradient stop
A Gradient stop represents both a color and an offset at which the color is to be rendered. We can specify multiple gradient stops for a gradient.
The offset for a gradient stop can range from 0 to 100.

### Gradient overlay
A Gradient overlay represents the overlay of a Gradient in a UIGradientView. There can be multiple overlays in a gradient.
Each overlay specifies the gradient stops to be rendered as well as the direction in which the gradient is to be rendered.

### UIGradientView
UIGradientView is a subclass of UIView. It renders one or more Gradient overlays in its content area.
See ViewController.m in the demo project to understand how UIGradientView can be setup and used.

## Coming soon:
- Support for Radial gradients. Currently only Linear gradients are supported.
- A default set of gradient presets that may optionally be loaded and used.
