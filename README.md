# DCFilterView

A Stack View friendly filter view with a tab look and feel.

![filter view demo](https://media.giphy.com/media/2UFU3FZOgZnnOmYtMz/giphy.gif)

This component is intendent to cover filter like solutions, not exactly View Controller (VC) changing type but content changing type in the same VC.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first. UI test are included so in order to see it working without throwing a line of code just run the UI test.

## Installation

DCFilterView is not available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'DCFilterView', :git => 'https://github.com/vberihuete/DCFilterView.git'
```

## How to

After you have your cocoapods set up done and already added the pod for DCFilterView from git, you just need to import in the View Controller you will like to use the Filter View.

```swift
import DCFilterView
```

Then add a Stack View to your View Controller, this being the one that will hold your content and the DCFilterView.

```swift
@IBOutlet weak var containerSV: UIStackView!
```

You can declare a variable of type DCFilterView that will an instance of the Filter View (or do as you like!)

```swift
var filterView: DCFilterView!
```

Then to give some structure to your DCFilterView you have the init

```swift
filterView = DCFilterView(items: ["Popular", "Related", "Oldest"], color: .black, selectedColor: .red, selectedIndex: 1)
```

Constructor properties go as follows:

* **items**: The String array of filters
* **color**: The color for the unselected filters
* **selectedColor**: The color for the selectedFilter
* **selectedIndex**: The initial selected index (based on the items given in the items property)

Go and add your recently created DCFilterView instance to your container stack view. 

```swift 
self.containerSV.insertArrangedSubview(filterView, at: 0)
```
And give to it some restrictions in height. e.g 40

```swift
self.containerSV.addConstraint(NSLayoutConstraint(item: self.filterView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40))
```
That's it to make your Filter View visible.

Note: In my case here I'm setting the filter view in the first position making it visible as a top filter view, but you can place it as you like.

![filter view demo](https://media.giphy.com/media/2UFU3FZOgZnnOmYtMz/giphy.gif)

### Giving it interaction

In order to react to filter change actions you need to implement the procotol **DCFilterViewDelegate** e.g.

```swift
extension ViewController: DCFilterViewDelegate{
    
    func dcFilterView(selected index: Int) {
        print("filter selected at index \(index)")
    }
    
}
```

You can as well now call a direct selection to an item using the utility method
```swift
filterView.markSelected(at: 2)
```
Also consulting which index or item is selected, using read-only computed properties
```swift
filterView.selected
filterView.selectedFilterViewItem
```

And as with all the delegation you are used to deal you will have to let your DCFilterView know that you want to be its delegate

```swift 
filterView.delegate = self
```

PD: Pull request are welcome, so feel free to download this and play with it.

## Author

Vincent Berihuete, vberihuete@gmail.com

## License

DCFilterView is available under the MIT license. See the LICENSE file for more info.
