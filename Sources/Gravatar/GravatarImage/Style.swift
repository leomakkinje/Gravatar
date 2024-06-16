//
// Style.swift
// Part of Gravatar, a package for requesting Gravatar avatars.
// https://github.com/leomakkinje/Gravatar
//
// This file contains the Style enum,
// which defines styling options for avatars.
//
// Copyright (c) 2024 Leo Makkinje.
// See LICENSE for license information.
//

import Foundation

/// The styling of the avatar's shape and border.
///
/// `Style` defines the clipping shape for a `GravatarImage` view.
/// Additionally, a border can be applied to the clipping shape.
///
/// The preferred styling can be specified during the initialization of a ``GravatarImage`` instance.
///
public enum Style {

    /// A circle without a border.
    case circle

    /// A rounded-square without a border.
    case roundedSquare

    /// A square without a border.
    case square

    /// A circle with a border.
    case borderedCircle

    /// A rounded-square with a border.
    case borderedRoundedSquare

    /// A square with a border.
    case borderedSquare

}
