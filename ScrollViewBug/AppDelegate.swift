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
    }

    //============================================================================================================================================

    func applicationWillTerminate(aNotification: NSNotification)
    {
        // Insert code here to tear down your application
        
        onZoom_FIT(self)
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
        var box: NSRect = NSRect(x:0, y:0, width: 0, height: 0)
        if let img = imageView.image
        {
            var w = max(img.size.width,  imageView.bounds.size.width)
            var h = max(img.size.height, imageView.bounds.size.height)
            
            let v: CGFloat = max(w,h)
            
            w = v;  h = v
            
            box = NSRect(x:0, y:0, width: w, height: h)
            
            Swift.print("    imgView.image: \(img.size)")
            Swift.print("              BOX: \(box)")

            let mv: CGFloat = min(imageView.bounds.size.width, imageView.bounds.size.height)
            let mi: CGFloat = min(img.size.width, img.size.height)
            
            scrollView.magnification =  CGFloat( mv / mi)
            clipView.constrainBoundsRect(imageView.bounds)
        }
   
      //  scrollView.magnifyToFitRect(scrollView.bounds)
        
        scrollView.magnifyToFitRect(box)
    }

    //============================================================================================================================================
}

