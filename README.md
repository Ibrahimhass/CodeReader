# CodeReader

A simple macOS app to read code form images, written purely in SWIFT using Vision Framework.

# Usage
1) Drag an image
![Drag an image](https://i.imgur.com/rYFsVCp.jpg)
2) Click the convert button
![Click Convert](https://i.imgur.com/cFuZG5g.png)

# Result
```
Converted by Storyboard to Swift Converter - https://swiftify.com/converter/storyboard2swiftui
import Swiftul
import Introspect
// TODO: install 'SwiftUI-Introspect package from https://github.com/siteline/SwiftUI-Introspect
// DefaultViewController
1/
struct DefaultView: View {
@State private var fullText: String
var body: some View
Stack( alignment: topLeading)
GeometryReader { geometry
TextField( "Placeholder", text: $fullText)
introspectTextField (customize: { textField in
textField.adjustsFontSizeToFitWidth = true
extField. backgroundColor = UIColor. systemTeal
textField. minimumFontSize = 17. 1
textField. superview?. frame = CGRect(x: DynamicSizeHelper.get0ffsetX(20), y:
DynamicSizeHelper-get0ffsetY(274), width: DynamicSizeHelper. getWidth(280), height:
DynamicSizeHelper.getHeight(18.5))
})
. frame (width: DynamicSizeHelper. getWidth(280), height:
DynamicSizeHelper.getHeight(18.5))
. font (. system(size: , weight: . regular))
.offset(x: DynamicSizeHelper.getoffsetX(20), DynamicSizeHelper.get0ffsetY(274))
TextField( "Placeholder", text: $fullText)
prospectTextField ( customize: t textField in
textField.adjustsFontSizeToFitWidth=true
textField. backgroundColor UIColor. systemRed
textField. clearButtonMode = . whileEditing
textField
mFontSize = 17.0
textField. uperview?. frame = CGRect (x: DynamicSizeHelper. getOffsetX(20), y:
DynamicSizeHelper-get0ffsetY(202), width: DynamicSizeHelper.getWidth(280), height:
DynamicSizeHelper.getHeight(26.5))
}
• frame(width: DynamicSizeHelper-getwidth(280), height :
DynamicSizeHelper.getHeight(2
font (. system(size: 14, weight: . regular))
offset(x: DynamicSizeHelper.get0ffsetX(20), y: DynamicSizeHelper.getOffsetY(202))
TextField("Placeholder", text: $fullText)
introspectTextField( customize: { textField in
textField. adjustsFontSizeToFitwidth = true
textField. backgroundColor: : UIColor. systemPurple
textField.clearButtonMode=.unlessEditing
textField. minimumFontSize = 17. 0
textField. superview?. frame = CGRect (x: DynamicSizeHelper.getOffsetX(20), y:
DynamicSizeHelper-getoffsetY(136), width: DynamicSizeHelper.getWidth(280), height:
DynamicSizeHelper.getHeight(28.5))
F
frame (width: DynamicSizeHelper.getWidth(280), height:
DynamicSizeHelper-getHeight(28.5))
font ( .
(size: 14. weight: .regular))
.offset(x: DynamicSizeHelper.get0ffsetX(20), y: DynamicSizeHelper.getOffsetY(136))
TextField( "Placeholder", text: $fullText)
textFieldStyle(RoundedBorderTextFieldStyle())
introspectTextField(customize: textField in
textField.adjustsFontSizeToFitWidth=true
textField. backgroundColor = UIColor. systemOrange
textField.clearButtonMode= always
textField.minimumFontSize = 17.0
})
frame(width: DynamicsizeHelper-getWidth(280), height:
DynamicSizeHelper.getHeight(34))
font (. system (size: 14, weight: regular))
.offset (x: DynamicSizeHelper.get0ffsetX(20), y: DynamicSizeHelper.getOffsetY(75))
. frame(width: DynamicSizeHelper. getwidth(320), height: DynamicSizeHelper.getHeight(568))
. background( Color (. systemBackground))
dgesIgnoringSafeArea(.all)
struct DefaultView_Previews: PreviewProvider {
static var previews: some View
DefaultView()
Dynamic Size Helper
struct DynamicSizeHelper {
static private let baseViewWidth: CGFloat = 320.0
static private
t baseViewHeight:
GFloat
568.(
static func getHeight (_ height: CGFloat) -> CGFloat
return (height baseViewHeight) * UIScreen. main. bounds. height
static func getWidth(_ width: CGFloat) -> CGFloat
return (width baseViewWidt
UIScreen.
in. bounds. width
static func get0ffsetX(_ x: CGFloat) -> CGFloat
return (x / baseViewWidth) * UIScreen. main. bounds. width
}
static func get0ffsetY(_  y: CGFloat) CGFloat
return ( y / baseViewHeight)
UIScreen.
a. bounds. height
```

# Build Requirements

## macOS
macOS Catalina

## Author

Md Ibrahim Hassan, mdibrahimhassan@gmail.com

## License

CodeReader is available under the MIT license. See the LICENSE file for more info.
