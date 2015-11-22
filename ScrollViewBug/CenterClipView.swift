//
//  CenterClipView.swift
//
//  Created by Hugh on 11/17/15.
//  Copyright © 2015 Binary Blobs. All rights reserved.
//

import Cocoa

class CenterClipView: NSClipView
{
    var centersDocumentView: Bool = true
    
    //============================================================================================================================================

    required init?(coder: NSCoder)
    {
        super.init(coder: coder)
    }

    //============================================================================================================================================
  
    override func constrainBoundsRect(proposedBounds: NSRect) -> NSRect
    {
        guard let docView = self.documentView else
        {
            return proposedBounds
        }
        
        var constrainedClipViewBoundsRect = super.constrainBoundsRect(proposedBounds)        
        
        // Early out if you want to use the default NSClipView behavior.
        if self.centersDocumentView == false
        {
            return constrainedClipViewBoundsRect;
        }
        
        let documentViewFrameRect = docView.frame
        
        // If proposed clip view bounds width is greater than document view frame width, center it horizontally.
        if proposedBounds.size.width >= documentViewFrameRect.size.width
        {
            // Adjust the proposed origin.x
            constrainedClipViewBoundsRect.origin.x = centerMagic(proposedContentViewBoundsDimension: proposedBounds.size.width,
                                                                         documentViewFrameDimension: documentViewFrameRect.size.width);
        }

        // If proposed clip view bounds is hight is greater than document view frame height, center it vertically.
        if proposedBounds.size.height >= documentViewFrameRect.size.height
        {
            // Adjust the proposed origin.y
            constrainedClipViewBoundsRect.origin.y = centerMagic(proposedContentViewBoundsDimension: proposedBounds.size.height,
                                                                         documentViewFrameDimension: documentViewFrameRect.size.height);
        }
        
       // Swift.print("######## constrainBoundsRect()  \(constrainedClipViewBoundsRect)")
   
        return constrainedClipViewBoundsRect
    }
    //============================================================================================================================================

    // centeredCoordinateUnitWithProposedContentViewBoundsDimensionAndDocumentViewFrameDimension == centerMagic
    
    func centerMagic(proposedContentViewBoundsDimension proposedContentViewBoundsDimension: CGFloat, documentViewFrameDimension: CGFloat) -> CGFloat
    {
        return floor( (proposedContentViewBoundsDimension - documentViewFrameDimension) / CGFloat(-2.0) )
    }

    //============================================================================================================================================

    
}
