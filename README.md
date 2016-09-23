# Swiftex
Swift function extensions for Swift 3

#Installation

```ruby
pod 'Swiftex'
```


###Array

Accessors `second` and `third`

```swift
let array = ["Say", "Hi", "Hello"]
print(array.second) // Optional("Hi")
print(array.third) // Optional("Hello")
```

Check for has Equatable object

```swift
let array = ["Say", "Hi", "Hello"]
if array.has("Hi") {
	// Array has "Hi"
}
```

Check for has non-Equatable object

```swift
let array = [say, hi, hello]
let need = 5
if array.has({ $0.prop == need }) {
	// Array has Hello object with prop 5
}
```

Move objects from index to index

```swift
var array = ["Say", "Hi", "Hello"]
array.move(fromPosition: 0, toPosition: 1)
// "Hi", "Say", "Hello"

```

Remove Equatable object

```swift
var array = ["Say", "Hi", "Hello"]
array.remove("Hi") // return removed index
// "Say", "Hello"
```

Remove duplicates

```swift
let array = ["Say", "Hi", "Say", "Hello"]
let clean = array.removeDuplicates("Hi")
// "Say", "Hi", "Hello"
```

###Dictionary

Remove `nil` values

```swfit
let dict: [String: String?] = [
	"say": "hi"
	"hello": nil
]

removeNilValues(dict)
// ["say": "hi"]
```

### Int, Double, Float

```swift
.toString
```

### String

`Trim` whitespaces

```swift
let str = "Say, hi, hello! "
str.trim // "Say, hi, hello!"
```

Check for `E-mail`

```swift
let str = "nick@example.com"
if str.isEmail {
	// true
}
```

Check for string `contains alphabet` symbols only

```swift
let str = "String"
if str.isAlphabet {
	// true
}
```

`URL encode` string

```swift
"hello, how are you?".URLEncode
```

`URL` value from string

```swift
let str = "http://google.com"
let url = str.URLValue
```

Extract `numbers` only from string

```swift
let str = "Say 123-345 Hello"
str.numbers // returns 123345
```

Extract `letters` only without whitespaces from string

```swift
let str = "Say 123-345 Hello"
str.letters // returns SayHello
```

Extract `letters with whitespaces` from string

```swift
let str = "Say 123-345 Hello"
str.lettersWithSpace // returns Say  Hello
```

`Data` object from string

```swift
let str = "Say Hi, Hello"
str.dataValue // Data object encoded with UTF8
```
And more more see in `String+Extension.swift`

###Data

APNS device token as String without spaces

```swift
let deviceToken: Data = ...
deviceToken.deviceTokenAsString // a3de...
```

###Date

```swift
var ISO8601String: String?
var tomorrow: Date

var seconds: Int
var minutes: Int
var hours: Int
var day: Int
var month: Int
var year: Int

var isToday: Bool

var tomorrow: Date

func isSame(date: Date?) -> Bool
func isSameMonth(date: Date) -> Bool

// Compare

Date == Date
Date < Date
Date <= Date
Date >= Date
Date > Date

```

###NSObject

```swift
class var nameOfClass: String
var nameOfClass: String

func addNotificationObServer(name: Notification.Name, selector: Selector)
func removeNotificationObServer(name: Notification.Name)

func removeNotificationObserver()
```

###Notification Center

Post notification easy

```swift
NotificationCenter.post(name: .NotificationName)
```

###NSNumber

NSNumber from string

```swift
let str = "1234"
NSNumber(string: str) // returns 0 if string incorrect
// automatic detect decimal separtor for all locales
```


###CGSize

Aspect ratio

```swift
func aspectRatio(newWidth: CGFloat) -> CGSize
func aspectRatio(newHeight: CGFloat) -> CGSize
```

### UIColor

```swift
func hexString(prefix: Bool = false) -> String
```

###UIImage

```swift
func resize(newSize: CGSize) -> UIImage
```

###UIViewController

Simple way for keyboard notifications

```swift

// In viewDidLoad:

func addKeyboardWillShowNotification()
func addKeyboardDidShowNotification()

func addKeyboardWillHideNotification()
func addKeyboardDidHideNotification()

// in deinit:

func remove...

// Override

override func keyboardWillShow(frame: CGRect) {
        
}
    
override func keyboardDidShow(frame: CGRect) {
    
}
    
override func keyboardWillHide(frame: CGRect) {
    
}
    
override func keyboardDidHide(frame: CGRect) {
    
}

```

### UIWindow

```swift
let windowSize = UIWindow.size
```