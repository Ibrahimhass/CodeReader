//
//  GradientView.swift
//  CodeReader
//
//  Created by Ibrahim Hassan on 28/06/21.
//

import Cocoa

open class NSGradientView: NSView {
    @IBInspectable open var startColor: NSColor = NSColor(red: 0.86, green: 0.25, blue: 0.59, alpha: 1)
    @IBInspectable open var endColor: NSColor = NSColor(red: 0.11, green: 0.14, blue: 0.46, alpha: 0.86)
    @IBInspectable open var rotation: CGFloat = 0.0
    @IBInspectable open var startPosition: CGFloat = 0.0
    @IBInspectable open var endPosition: CGFloat = 1.0
    
    override open func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        let bgGradient = NSGradient.init(colorsAndLocations: (startColor, startPosition), (endColor, endPosition))
        let path = NSBezierPath.init(rect: self.frame)
        bgGradient?.draw(in: path, angle: rotation)
    }
}
