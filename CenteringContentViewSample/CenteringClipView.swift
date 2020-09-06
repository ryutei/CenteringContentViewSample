//
//  CenteringClipView.swift
//  CenteringContentViewSample
//
//  Created by nikyo on 2020/09/06.
//

import Cocoa

class CenteringClipView: NSClipView {

    override func constrainBoundsRect(_ proposedBounds: NSRect) -> NSRect {
        let base = super.constrainBoundsRect(proposedBounds)
        
        guard let documentBounds = self.documentView?.bounds
        else {
            return base
        }
        
        let frame = self.frame
        let mag = frame.width / proposedBounds.width
        let insets = self.enclosingScrollView!.contentInsets
        let deltaX = max(frame.width/mag-documentBounds.width, 0.0)
        let deltaY = max(frame.height/mag-insets.top/mag-documentBounds.height, 0.0)
        
        var ret = base
        ret.origin.x -= deltaX/2.0
        ret.origin.y -= deltaY/2.0

        return ret
    }
    
}
