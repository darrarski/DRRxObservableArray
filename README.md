# DRRxObservableArray

[![Build Status](https://travis-ci.org/darrarski/DRRxObservableArray.svg?branch=master)](https://travis-ci.org/darrarski/DRRxObservableArray)
[![Build Status](https://www.bitrise.io/app/356423c9027ca736.svg?token=WzKYsUY7V8chfcbJ-xAcxw)](https://www.bitrise.io/app/356423c9027ca736)
[![CocoaPods](https://img.shields.io/cocoapods/v/DRRxObservableArray.svg)](https://cocoapods.org/pods/DRRxObservableArray)

Generic observable array for RxSwift. When its content changes (elements are inserted, removed or updated) it emits events from `events` Observable.

## Usage

Example usage:

```swift
import RxSwift
import DRRxObservableArray

let observableArray = ObservableArray(["a", "b", "c"])
let _ = observableArray.events.subscribe(onNext: { event in 
	switch event {
		case .inserted(let indices, let elements):
			print("Inserted elements: \(elements) at indices: \(indices)")
		case .deleted(let indices, let elements):
			print("Removed elements: \(elements) at indices: \(indices)")
		case .updated(let indices, let oldElements, let newElements):
			print("Replaced elements: \(oldElements) at indices: \(indices) with elements: \(newElements)")
	}
})

observableArray.append("d")
// Inserted elements: ["d"] at indices: [3]

observableArray.removeLast()
// Removed elements: ["d"] at indices: [3]

observableArray[1] = "B"
// Replaced elements: ["b"] at indices: [1] with elements: ["B"] 
```

Check out included unit tests for more examples.

## Instalation

You can integrate `DRRxObservableArray` with your project using CocoaPods. To do so, you will need to add following line to your Podfile:

    pod 'DRRxObservableArray', '~> 1.0'

You can also download zip archive of given release from [releases page](https://github.com/darrarski/DRRxObservableArray/releases).

## License

The MIT License (MIT) - check out included [LICENSE](LICENSE) file
