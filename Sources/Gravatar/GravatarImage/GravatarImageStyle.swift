//
// GravatarImageStyle.swift
// Part of Gravatar, a package for requesting Gravatar avatars.
// https://github.com/leomakkinje/Gravatar
//
// This file contains the GravatarImageStyle SwiftUI view modifier,
// which applies shape and border styling to GravatarImage views.
//
// Copyright (c) 2024 Leo Makkinje.
// See LICENSE for license information.
//

import SwiftUI

/// A `ViewModifier` that applies a clipping shape and a border.
///
/// - Parameters:
///   - style: The `Style` of the avatar's shape and border.
///
/// - Returns:
/// The `View` content that was passed in, with its shape and border modified according to the defined ``Style``.
///
/// - Note: Use modifier shortcut `.gravatarImageStyle(Style)` instead of `.modifier(GravatarImageStyle(Style))`.
///
struct GravatarImageStyle: ViewModifier {
    let style: Style
    let cornerRadius: Double = 15
    let strokeColor: HierarchicalShapeStyle = .tertiary
    let strokeLineWidth: Double = 1

    init(_ style: Style) {
        self.style = style
    }

    func body(content: Content) -> some View {
        switch style {
        case .circle:
            content
                .clipShape(.circle)
        case .roundedSquare:
            content
                .clipShape(.rect(cornerRadius: cornerRadius))
        case .square:
            content
                .clipShape(.rect)
        case .borderedCircle:
            content
                .clipShape(.circle)
                .overlay(
                    Circle()
                        .stroke(strokeColor, lineWidth: strokeLineWidth)
                )
        case .borderedRoundedSquare:
            content
                .clipShape(.rect(cornerRadius: cornerRadius))
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(strokeColor, lineWidth: strokeLineWidth)
                )
        case .borderedSquare:
            content
                .clipShape(.rect)
                .overlay(
                    Rectangle()
                        .stroke(strokeColor, lineWidth: strokeLineWidth)
                )
        }
    }

}

extension View {

    /// A `ViewModifier` that applies a clipping shape and a border.
    ///
    /// - Parameters:
    ///   - style: The `Style` of the avatar's shape and border.
    ///
    /// - Returns:
    /// The `View` content that was passed in, with its shape and border modified according to the defined `Style`.
    ///
    /// ## Initialization
    ///
    /// ```swift
    /// .gravatarImageStyle(Style)
    /// ```
    ///
    /// ## Usage
    ///
    /// ```swift
    /// // Apply a square clipping shape without a border
    /// .gravatarImageStyle(.square)
    ///
    /// // Apply a square clipping shape with a border
    /// .gravatarImageStyle(.borderedSquare)
    /// ```
    func gravatarImageStyle(_ style: Style) -> some View {
        modifier(GravatarImageStyle(style))
    }

}
