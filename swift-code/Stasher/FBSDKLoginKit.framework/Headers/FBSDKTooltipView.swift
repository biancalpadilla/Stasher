//  Converted with Swiftify v1.0.6292 - https://objectivec2swift.com/
// Copyright (c) 2014-present, Facebook, Inc. All rights reserved.
//
// You are hereby granted a non-exclusive, worldwide, royalty-free license to use,
// copy, modify, and distribute this software in source code or binary form for use
// in connection with the web services and APIs provided by Facebook.
//
// As with any software that integrates with the Facebook platform, your use of
// this software is subject to the Facebook Developer Principles and Policies
// [http://developers.facebook.com/policy/]. This copyright notice shall be
// included in all copies or substantial portions of the software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
// FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
// COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
// IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
import UIKit
/**
 FBSDKTooltipViewArrowDirection enum

  Passed on construction to determine arrow orientation.
 */
enum FBSDKTooltipViewArrowDirection : Int {
    /** View is located above given point, arrow is pointing down. */
    case down = 0
    /** View is located below given point, arrow is pointing up. */
    case up = 1
}

/**
 FBSDKTooltipColorStyle enum

  Passed on construction to determine color styling.
 */
enum FBSDKTooltipColorStyle : Int {
    /** Light blue background, white text, faded blue close button. */
    case friendlyBlue = 0
    /** Dark gray background, white text, light gray close button. */
    case neutralGray = 1
}

/**

  Tooltip bubble with text in it used to display tips for UI elements,
 with a pointed arrow (to refer to the UI element).



 The tooltip fades in and will automatically fade out. See `displayDuration`.
 */
class FBSDKTooltipView: UIView {
    /**
      Gets or sets the amount of time in seconds the tooltip should be displayed.
     Set this to zero to make the display permanent until explicitly dismissed.
     Defaults to six seconds.
     */
    var displayDuration = CFTimeInterval()
    /**
      Gets or sets the color style after initialization.
     Defaults to value passed to -initWithTagline:message:colorStyle:.
     */
    var colorStyle = FBSDKTooltipColorStyle(rawValue: 0)
    /**
      Gets or sets the message.
     */
    var message: String = ""
    /**
      Gets or sets the optional phrase that comprises the first part of the label (and is highlighted differently).
     */
    var tagline: String = ""
    /**
      Designated initializer.
    
     - Parameter tagline: First part of the label, that will be highlighted with different color. Can be nil.
    
     - Parameter message: Main message to display.
    
     - Parameter colorStyle: Color style to use for tooltip.
    
    
    
     If you need to show a tooltip for login, consider using the `FBSDKLoginTooltipView` view.
    
    
    - See:FBSDKLoginTooltipView
     */

    init(tagline: String, message: String, colorStyle: FBSDKTooltipColorStyle) {
    }
    /**
      Show tooltip at the top or at the bottom of given view.
     Tooltip will be added to anchorView.window.rootViewController.view
    
     - Parameter anchorView: view to show at, must be already added to window view hierarchy, in order to decide
     where tooltip will be shown. (If there's not enough space at the top of the anchorView in window bounds -
     tooltip will be shown at the bottom of it)
    
    
    
     Use this method to present the tooltip with automatic positioning or
     use -presentInView:withArrowPosition:direction: for manual positioning
     If anchorView is nil or has no window - this method does nothing.
     */

    func present(from anchorView: UIView) {
    }
    /**
      Adds tooltip to given view, with given position and arrow direction.
    
     - Parameter view: View to be used as superview.
    
     - Parameter arrowPosition: Point in view's cordinates, where arrow will be pointing
    
     - Parameter arrowDirection: whenever arrow should be pointing up (message bubble is below the arrow) or
     down (message bubble is above the arrow).
     */

    func present(in view: UIView, withArrowPosition arrowPosition: CGPoint, direction arrowDirection: FBSDKTooltipViewArrowDirection) {
    }
    /**
      Remove tooltip manually.
    
    
    
     Calling this method isn't necessary - tooltip will dismiss itself automatically after the `displayDuration`.
     */

    func dismiss() {
    }
}