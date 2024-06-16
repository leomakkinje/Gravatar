//
// Gravatar.swift
// Part of Gravatar, a package for requesting Gravatar avatars.
// https://github.com/leomakkinje/Gravatar
//
// This file contains the Gravatar struct,
// which stores properties of a Gravatar avatar.
//
// Copyright (c) 2024 Leo Makkinje.
// See LICENSE for license information.
//

import CryptoKit
import Foundation

/// An object that stores the properties of a Gravatar avatar.
///
/// `Gravatar` stores the properties of a Gravatar avatar.
///
/// After initialization, the instance provides a `URL` property for requesting the avatar:
/// - `avatarURL`: the URL of the avatar's PNG image
///
/// ## Initialization
///
/// The instance is initialized with an email address and display options for the avatar.
///
/// ```swift
/// // Initialization with default values
/// let gravatar = Gravatar("john.doe@example.com")
/// ```
///
/// ```swift
/// // Initialization with custom display options
/// let gravatar = Gravatar("john.doe@example.com", size: 80, rating: .g, defaultAvatar: .mp, forceDefaultAvatar: false)
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
///
///         // Using GravatarImage
///         GravatarImage(gravatar, style: .square)
///
///         // Using AsyncImage
///         AsyncImage(url: gravatar.avatarURL)
///             .frame(width: Double(gravatar.size), height: Double(gravatar.size))
///
///     }
/// }
/// ```
///
public struct Gravatar {

    /// The email address of a Gravatar account.
    public let emailAddress: String

    /// The size of the avatar, in pixels. This must be a value between `1` and `2048`.
    public let size: Int

    /// The rating level that indicates which kind of avatar is appropriate to be displayed.
    public let rating: Rating

    /// The avatar that will be displayed when an avatar for the specified email address does not exist.
    public let defaultAvatar: DefaultAvatar

    /// Force the default avatar to be displayed, even if an avatar for the specified email address exists.
    public let forceDefaultAvatar: Bool

    /// The hash value, derived from the email address, that is used to identify an account at Gravatar.com.
    var emailHash: String {
        let data = Data(emailAddress.utf8)
        let digest = SHA256.hash(data: data)
        let hash = digest.compactMap { String(format: "%02x", $0) }.joined()
        return hash
    }

    /// The URL of the avatar's PNG image.
    public var avatarURL: URL {
        URL(string: "https://gravatar.com/avatar/\(emailHash)?size=\(size)&rating=\(rating)&default=\(defaultAvatar)&forcedefault=\(forceDefaultAvatar ? "y" : "n")")!
    }

    /// Initialize a `Gravatar` instance with an email address and display options.
    ///
    /// - Parameters:
    ///
    ///   - emailAddress:
    ///     The email address of a Gravatar account.
    ///
    ///   - size:
    ///     The size of the avatar, in pixels. This must be a value between `1` and `2048`.
    ///
    ///   - rating:
    ///     The rating level that indicates which kind of avatar is appropriate to be displayed.
    ///
    ///   - defaultAvatar:
    ///     The avatar that will be displayed when an avatar for the specified email address does not exist.
    ///
    ///   - forceDefaultAvatar:
    ///     Force the default avatar to be displayed, even if an avatar for the specified email address exists.
    ///
    /// - Note: The `emailAddress` must be specified.
    ///         All other parameters have a default value unless a custom value is specified.
    ///
    public init(
        _ emailAddress: String,
        size: Int = 80,
        rating: Rating = .g,
        defaultAvatar: DefaultAvatar = .mp,
        forceDefaultAvatar: Bool = false
    ) {
        // Convert the email address to lowercase and trim whitespace,
        // as specified in Gravatar's API documentation.
        self.emailAddress = emailAddress.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)

        // Use the default size if the provided size is out of bounds,
        // as specified in Gravatar's API documentation.
        if size < 1 || size > 2048 {
            self.size = 80
        } else {
            self.size = size
        }

        self.rating = rating
        self.defaultAvatar = defaultAvatar
        self.forceDefaultAvatar = forceDefaultAvatar
    }

}
