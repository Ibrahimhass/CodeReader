//   MIT License
//
// Copyright (c) 2021 Md Ibrahim Hassan
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import Cocoa

class NSGradientView: NSView {
    var startPosition: CGFloat = 0.0
    var middlePosition: CGFloat = 1.1
    var endPosition: CGFloat = 1.0
    
    private func getRandomColor() -> [NSColor] {
        var gradientColors: [[NSColor]] = []
        var gradientColor: [NSColor] = []
        
        gradientColor.append(#colorLiteral(red: 0.23, green: 0.11, blue: 0.44, alpha: 1.00))
        gradientColor.append(#colorLiteral(red: 0.84, green: 0.43, blue: 0.47, alpha: 1.00))
        gradientColor.append(#colorLiteral(red: 1.00, green: 0.69, blue: 0.48, alpha: 1.00))
        gradientColors.append(gradientColor)
        gradientColor.removeAll()
        
        gradientColor.append(#colorLiteral(red: 0.50, green: 0.50, blue: 0.84, alpha: 1.00))
        gradientColor.append(#colorLiteral(red: 0.53, green: 0.66, blue: 0.91, alpha: 1.00))
        gradientColor.append(#colorLiteral(red: 0.57, green: 0.92, blue: 0.89, alpha: 1.00))
        gradientColors.append(gradientColor)
        gradientColor.removeAll(keepingCapacity: false)
        
        gradientColor.append(#colorLiteral(red: 0.99, green: 0.36, blue: 0.49, alpha: 1.00))
        gradientColor.append(#colorLiteral(red: 0.42, green: 0.51, blue: 0.98, alpha: 1.00))
        gradientColors.append(gradientColor)
        gradientColor.removeAll()

        gradientColor.append(#colorLiteral(red: 0.40, green: 0.70, blue: 0.44, alpha: 1.00))
        gradientColor.append(#colorLiteral(red: 0.30, green: 0.64, blue: 0.80, alpha: 1.00))
        gradientColors.append(gradientColor)
        gradientColor.removeAll()

        gradientColor.append(#colorLiteral(red: 1.00, green: 0.98, blue: 0.84, alpha: 1.00))
        gradientColor.append(#colorLiteral(red: 0.70, green: 0.04, blue: 0.17, alpha: 1.00))
        gradientColors.append(gradientColor)
        gradientColor.removeAll()

        gradientColor.append(#colorLiteral(red: 0.66, green: 0.75, blue: 1.00, alpha: 1.00))
        gradientColor.append(#colorLiteral(red: 0.25, green: 0.17, blue: 0.59, alpha: 1.00))
        gradientColors.append(gradientColor)
        gradientColor.removeAll()

        gradientColor.append(#colorLiteral(red: 0.66, green: 0.75, blue: 1.00, alpha: 1.00))
        gradientColor.append(#colorLiteral(red: 0.25, green: 0.17, blue: 0.59, alpha: 1.00))
        gradientColors.append(gradientColor)
        gradientColor.removeAll()

        gradientColor.append(#colorLiteral(red: 0.00, green: 0.35, blue: 0.65, alpha: 1.00))
        gradientColor.append(#colorLiteral(red: 1.00, green: 0.99, blue: 0.89, alpha: 1.00))
        gradientColors.append(gradientColor)
        gradientColor.removeAll()
        
        return gradientColors.randomElement()!
    }
    
    
    override open func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        let randomColor = getRandomColor()
        if randomColor.count == 2 {
            let bgGradient = NSGradient(colorsAndLocations: (randomColor[0], startPosition), (randomColor[1], endPosition))
            let path = NSBezierPath(rect: self.frame)
            bgGradient?.draw(in: path, angle: CGFloat(Float(arc4random()) / Float(UINT32_MAX)))
        } else if randomColor.count == 3 {
            let bgGradient = NSGradient(colorsAndLocations: (randomColor[0], startPosition),
                                             (randomColor[1], middlePosition),
                                             (randomColor[2], middlePosition)
            )
            let path = NSBezierPath(rect: self.frame)
            bgGradient?.draw(in: path, angle: 0)
        }
    }
}
