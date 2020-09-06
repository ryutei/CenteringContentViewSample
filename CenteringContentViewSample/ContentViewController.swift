//
//  ContentViewController.swift
//  CenteringContentViewSample
//
//  Created by nikyo on 2020/09/06.
//

import Cocoa

class ContentViewController: NSViewController {

    @IBOutlet var scroll: NSScrollView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        let tap = NSClickGestureRecognizer(target: self, action: #selector(zoomIn(_:)))
        self.view.addGestureRecognizer(tap)
        
        self.scroll?.documentView?.frame.origin = .zero
    }
    
    @objc
    func zoomIn(_ gesture: NSClickGestureRecognizer) {
        let bounds = self.scroll!.documentVisibleRect
        var center = NSPoint(x: NSMidX(bounds), y: NSMidY(bounds))
        center = self.scroll!.contentView.convert(center, from: self.scroll!.documentView!)
        
        let mag = scroll!.magnification > 1.0 ? 1.0 : 2.0 as CGFloat
        
        NSAnimationContext.runAnimationGroup { (_) in
            scroll!.animator().setMagnification(mag, centeredAt: center)
        } completionHandler: {
            self.scroll!.setMagnification(mag, centeredAt: center)
        }
    }
}
