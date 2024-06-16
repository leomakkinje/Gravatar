//
// Rating.swift
// Part of Gravatar, a package for requesting Gravatar avatars.
// https://github.com/leomakkinje/Gravatar
//
// This file contains the Rating enum,
// which defines abbreviations of rating levels.
//
// Copyright (c) 2024 Leo Makkinje.
// See LICENSE for license information.
//

import Foundation

/// The rating level.
///
/// `Rating` defines the rating level that indicates which kind of avatar is appropriate to be displayed.
///
/// Gravatar.com allows users to self-rate their avatar so that they can indicate if their avatar is appropriate for a certain audience.
///
/// The preferred rating level can be specified during the initialization of a ``Gravatar`` instance.
///
/// - Note: The default avatar will be displayed if the avatar for the specified email address does not meet the requested rating level.
///
public enum Rating {

    /// The avatar is suitable for all audience types.
    case g

    /// The avatar may contain rude gestures, provocatively dressed individuals, the lesser swear words, or mild violence.
    case pg

    /// The avatar may contain such things as harsh profanity, intense violence, nudity, or hard drug use.
    case r

    /// The avatar may contain sexual imagery or extremely disturbing violence.
    case x

}
