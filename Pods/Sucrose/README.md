![](https://github.com/pedrommcarrasco/Sucrose/blob/master/banner.png?raw=true)

> **Sucrose** *(/suː.krəʊz/)*, *noun*
>
> "the type of sugar that exists naturally in most plants that grow on land"

🍬 My everyday sugar. Feel free to use it as a framework or simply add a specific file to your project.

[![CocoaPods](https://img.shields.io/cocoapods/v/Sucrose.svg)](https://cocoapods.org/pods/Sucrose)

## Content

### Extensions

#### Collection

```swift
let array = ["A", "B", "C"]
let item = array[4] // will crash
let item = array[safe: 4] // won't crash & returns nil
```

#### NSObject

```swift
// Similar to `then` by @devxoul
let view: UIView = .create {
    $0.background = .red
    $0.isHidden = true
}
```

#### Optional

```swift
var string: String? 
var isValid: Bool

string = nil
isValid = string.isNilOrEmpty // true

string = ""
isValid = string.isNilOrEmpty // true

string = "ABC"
isValid = string.isNilOrEmpty // false
```

#### UIButton

```swift
let UIButton(image: UIImage(named: "test")) // Sets the image of the UIButton's imageView
```

#### UIStackView

```swift
// Add multiple views to a UIStackView's arragedSubviews. 
// Supports variadic parameters or an array of UIView
stackView.addArrangedSubviews(viewA, viewB, viewC)
stackView.addArrangedSubviews([viewA, viewB, viewC])
```

#### UIView

```swift
// Add multiple views to a UIView's subviews. 
// Supports variadic parameters or an array of UIView
view.addSubviews(viewA, viewB, viewC)
view.addSubviews([viewA, viewB, viewC])

// Optimize (inspired by @hyperoslo)
view.optimize // Sets clipsToBounds and isOpaque to true

// Get the view name to register as an identifier or debug
print(CellExample.name) // String(describing:)
register(CellExample.self, forCellWithReuseIdentifier: CellExample.name)

// Circular View
viewA.asCircle()
```

#### UITableView

```swift
// Register Cell
tableView.register(ExampleCell.self)

// Dequeue Cell
let exampleCell = tableView.dequeueCell(for: indexPath, as: ExampleCell.self)
```

#### UICollectionView

```swift
// Register Cell
collectionView(ExampleCell.self)

// Dequeue Cell
let exampleCell = collectionView(for: indexPath, as: ExampleCell.self)
```

#### UIViewController

```swift
// Add multiple UIViewControllers as children of another. 
// Supports variadic parameters or an array of UIViewController
viewController.addChilds(headerViewController, listViewController)
viewController.addChilds([headerViewController, listViewController])

// Remove an UIViewController from its parent
headerViewController.remove()
```

## Instalation 📦

Sucrose is available through [CocoaPods](https://cocoapods.org/pods/Sucrose). To do so, add the following line to your Podfile:

```swift
pod 'Sucrose'
```
And then run the following command in terminal:

```swift
pod install
```
