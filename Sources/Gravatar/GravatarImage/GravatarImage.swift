//
// GravatarImage.swift
// Part of Gravatar, a package for requesting Gravatar avatars.
// https://github.com/leomakkinje/Gravatar
//
// This file contains the GravatarImage SwiftUI view,
// which returns an avatar with optional custom styling.
//
// Copyright (c) 2024 Leo Makkinje.
// See LICENSE for license information.
//

import SwiftUI

/// A `View` that displays a Gravatar avatar with optional custom styling.
///
/// The `GravatarImage` view uses the `avatarURL` property of the `Gravatar` instance
/// to request the avatar's PNG image from Gravatar.com.
///
/// The view is displayed at the size that is specified in the `size` property of the `Gravatar` instance,
/// and the view's shape and border are modified according to the defined `Style`.
///
/// ## Initialization
///
/// The view is initialized with a ``Gravatar`` instance and a ``Style`` definition for the avatar's shape and border.
///
/// ```swift
/// // Initialization with default styling
/// GravatarImage(gravatar)
/// ```
///
/// ```swift
/// // Initialization with custom styling
/// GravatarImage(gravatar, style: .square)
/// ```
///
/// ## Usage
///
/// ```swift
/// import Gravatar
/// import SwiftUI
///
/// struct ContentView: View {
///     let gravatar = Gravatar("john.doe@example.com")
///
///     var body: some View {
///         GravatarImage(gravatar, style: .square)
///     }
/// }
/// ```
///
public struct GravatarImage: View {

    /// A `Gravatar` instance.
    public let gravatar: Gravatar

    /// The styling of the avatar's shape and border.
    public let style: Style

    /// Initialize a `GravatarImage` view with a ``Gravatar`` instance and a ``Style`` definition.
    ///
    /// - Parameters:
    ///   - gravatar: A `Gravatar` instance.
    ///   - style: The styling of the avatar's shape and border.
    ///
    /// - Note: The ``Gravatar`` instance must be specified.
    ///         The ``Style`` definition has a default value unless a custom value is specified.
    ///
    public init(
        _ gravatar: Gravatar,
        style: Style = .square
    ) {
        self.gravatar = gravatar
        self.style = style
    }

    public var body: some View {
        AsyncImage(
            url: gravatar.avatarURL,
            transaction: Transaction(animation: .default)
        ) { phase in
            switch phase {
            case .empty:
                EmptyView()
            case .success(let image):
                image
                    .gravatarImageStyle(style)
                    .transition(.opacity)
            case .failure(_):
                Image(systemName: "network.slash")
                    .resizable()
                    .scaledToFit()
                    .gravatarImageStyle(style)
                    .transition(.opacity)
            default:
                EmptyView()
            }
        }
        .frame(width: Double(gravatar.size), height: Double(gravatar.size))
    }

}
