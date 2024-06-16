//
// DefaultAvatar.swift
// Part of Gravatar, a package for requesting Gravatar avatars.
// https://github.com/leomakkinje/Gravatar
//
// This file contains the DefaultAvatar enum,
// which defines names of default avatars.
//
// Copyright (c) 2024 Leo Makkinje.
// See LICENSE for license information.
//

import Foundation

/// The name of the default avatar.
///
/// `DefaultAvatar` defines the name of the default avatar that will be displayed
/// when an avatar for the specified email address does not exist.
///
/// The preferred default avatar can be specified during the initialization of a ``Gravatar`` instance.
///
public enum DefaultAvatar {

    /// A transparent PNG image.
    case blank

    /// A geometric pattern based on the email hash.
    case identicon

    /// The Gravatar.com company logo.
    case logo

    /// A generated 'monster' with different colors, faces, etc.
    case monsterid

    /// A cartoon-style silhouetted outline of a person, aka 'mystery-person'.
    case mp

    /// An 8-bit arcade-style pixelated face.
    case retro

    /// A generated robot with different colors, faces, etc.
    case robohash

    /// A generated face with differing features and backgrounds.
    case wavatar

}
