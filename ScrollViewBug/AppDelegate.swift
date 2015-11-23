//
//  AppDelegate.swift
//  JunkTestScrollers
//
//  Created by Hugh on 11/16/15.
//  Copyright © 2015 Binary Blobs. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate
{
    @IBOutlet weak var window:     NSWindow!

    @IBOutlet weak var clipView:   CenterClipView!
    @IBOutlet weak var imageView:  NSImageView!
    @IBOutlet weak var scrollView: NSScrollView!
    
    //============================================================================================================================================

    func applicationDidFinishLaunching(aNotification: NSNotification)
    {
        // Insert code here to initialize your application
        
       // onZoom_FIT(self)
    }

    //============================================================================================================================================

    func applicationWillTerminate(aNotification: NSNotification)
    {
        // Insert code here to tear down your application
    }

    //============================================================================================================================================
    @IBAction func checkedCentering(sender: AnyObject)
    {
        let button : NSButton = sender as! NSButton
        
        clipView.centersDocumentView = (button.state == 1)
    }

    @IBAction func onZoom_IN(sender: AnyObject)
    {
        scrollView.magnification *= 1.1
    }
    
    //============================================================================================================================================
    
    @IBAction func onZoom_OUT(sender: AnyObject)
    {
        scrollView.magnification *= 0.9
    }
    
    //============================================================================================================================================
    
    @IBAction func onZoom_ACTUAL(sender: AnyObject)
    {
        scrollView.magnification = 1.0
    }
    
    //============================================================================================================================================
    
    @IBAction func onZoom_FIT(sender: AnyObject)
    {
        if let img = imageView.image
        {
            let max_scale_w = CGFloat(scrollView.bounds.size.width)  / CGFloat(img.size.width)
            let max_scale_h = CGFloat(scrollView.bounds.size.height) / CGFloat(img.size.height)
            
            //Use the smaller of the 2 scales
            let scale = min(max_scale_w, max_scale_h)
            
            scrollView.magnification = scale
            clipView.constrainBoundsRect(imageView.bounds)
        }
    }

    //============================================================================================================================================
}
