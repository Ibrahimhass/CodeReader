# CodeReader

A simple macOs app to read code form images, written purely in SWIFT using Vision Framework.

# Usage
1) Drag an image
![Drag an image](https://imgur.com/m3IOAdU.png)
2) Click the convert button
![Click Convert](https://i.imgur.com/QLAW0UE.png)

# Result
extension SwitchBuilder {
private func introspectablePropertiesDict() -> [String: String] {
let uiKitExclusiveProperties = [
"thumbTintColor": toggle?. thumbTintColor?.uiColor,
"preferredStyle": toggle?.getPrefferedStyle(),
"isHighlighted": toggle?. isHighlighted? description,
"isSelected": toggle?.isSelected?.description
l. compactMap Values { $0 }
let optionalProperties = [
"clipsToBounds": toggle?.clipsSubviews?. description,
"isEnabled": toggle?.isEnabled?.description
]. compactMap Values { $0 }
if !uiKitExclusiveProperties. isEmpty {
return uiKitExclusiveProperties. merge (dict: optionalProperties)
} else {
return uiKitExclusiveProperties
}

# Build Requirements

## macOs
macOS Catalina

## Author

Md Ibrahim Hassan, mdibrahimhassan@gmail.com

## License

CodeReader is available under the MIT license. See the LICENSE file for more info.
