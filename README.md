# Gravatar

<p>
    <img src="https://img.shields.io/badge/Swift-6.0-orange" />
    <img src="https://img.shields.io/badge/Framework-SwiftUI-orange" />
    <img src="https://img.shields.io/badge/Package_Manager-SPM-orange" />
    <img src="https://img.shields.io/badge/Platform-iOS_17%2B_%7C_macOS_14%2B_%7C_tvOS%2017%2B_%7C_visionOS_1%2B_%7C_watchOS_10%2B-orange" />
</p>

Gravatar is a Swift package for requesting avatars from [Gravatar.com](https://gravatar.com/).

The package provides a `GravatarImage` SwiftUI view that enables you to easily display a person's Gravatar avatar in your app.

## Installation

Use Swift Package Manager to add the Gravatar package to your Xcode project:

1. Open your project in Xcode
1. Select option Add Package Dependencies in the File menu
1. Enter package URL `https://github.com/leomakkinje/Gravatar` in the search field
1. Click the Add Package button
1. Select your project in the Add To Target popup menu
1. Click the Add Package button

## Quickstart

1. Import the `Gravatar` package in your Swift file
1. Initialize a `Gravatar` instance with an email address
1. Initialize a `GravatarImage` view with a `Gravatar` instance

This example displays an avatar in an 80-pixel square without a border:

```swift
import Gravatar
import SwiftUI

struct ContentView: View {
    let gravatar = Gravatar("john.doe@example.com")

    var body: some View {
        GravatarImage(gravatar)
    }
}
```

## Usage

### Initialize a Gravatar instance

You initialize a `Gravatar` instance with an email address, and optionally with custom values for the avatar's size, rating and default avatar.

```swift
// With default values
let gravatar = Gravatar("john.doe@example.com")
```

```swift
// With custom values
let gravatar = Gravatar("john.doe@example.com", size: 80, rating: .g, defaultAvatar: .mp, forceDefaultAvatar: false)
```

After initialization, the instance provides an `.avatarURL` property, which is used by the `GravatarImage` view for requesting the avatar's PNG image from Gravatar.com. Alternatively, you can use `gravatar.avatarURL` with `AsyncImage` if you want to create a custom image view.

### Initialize a GravatarImage view

You initialize a `GravatarImage` view with a `Gravatar` instance, and optionally with a custom style for the avatar's shape and border. The view's frame will be set to the size that is specified in the `Gravatar` instance.

```swift
import Gravatar
import SwiftUI

struct ContentView: View {
    let gravatar = Gravatar("john.doe@example.com")

    var body: some View {
        GravatarImage(gravatar, style: .square)
    }
}
```

### Initialize an AsyncImage view

If you require more view customizations than what `GravatarImage` has to offer, you can initialize an `AsyncImage` view with a `gravatar.avatarURL` property and additional view modifiers. The `gravatar.size` property can be used to set the view's frame size.

```swift
import Gravatar
import SwiftUI

struct ContentView: View {
    let gravatar = Gravatar("john.doe@example.com")

    var body: some View {
        AsyncImage(url: gravatar.avatarURL)
            .frame(width: Double(gravatar.size), height: Double(gravatar.size))
            // Add additional modifiers here
    }
}
```

## Examples

```swift
// Display the avatar in a 120-pixel circle with a border

import Gravatar
import SwiftUI

struct ContentView: View {
    let gravatar = Gravatar("john.doe@example.com", size: 120)

    var body: some View {
        GravatarImage(gravatar, style: .borderedCircle)
    }
}
```

```swift
// Display the avatar in an 80-pixel rounded square without a border, and display
// the robohash avatar when an avatar for the specified email address does not exist.

import Gravatar
import SwiftUI

struct ContentView: View {
    let gravatar = Gravatar("john.doe@example.com", defaultAvatar: .robohash)

    var body: some View {
        GravatarImage(gravatar, style: .roundedSquare)
    }
}
```

```swift
// Display the avatar in a 32-pixel square without a border, and always display
// the mystery person avatar, even when an avatar for the specified email address exists.

import Gravatar
import SwiftUI

struct ContentView: View {
    let gravatar = Gravatar("john.doe@example.com", size: 32, forceDefaultAvatar: true)

    var body: some View {
        GravatarImage(gravatar)
    }
}
```

## Documentation

Detailed documentation for `Gravatar` and `GravatarImage` is available in Xcode's Quick Help sidebar and Developer Documentation window, and online in the [Swift Package Index](https://swiftpackageindex.com/leomakkinje/Gravatar/1.0.1/documentation/gravatar).

## License

This repository is open source and available under the MIT license. For more information, see the [LICENSE](https://github.com/leomakkinje/Gravatar/blob/main/LICENSE) file.

## Disclaimer

This repository is not affiliated with, sponsored by, or endorsed by [Gravatar.com](https://gravatar.com/).
