//
// XCTestCaseExtensions.swift
// Part of Gravatar, a package for requesting Gravatar avatars.
// https://github.com/leomakkinje/Gravatar
//
// This file contains default properties for unit tests.
//
// Copyright (c) 2024 Leo Makkinje.
// See LICENSE for license information.
//

import XCTest

extension XCTestCase {

    var testBaseURL: String {
        "https://gravatar.com"
    }

    var testDefaultURLOptions: String {
        "?size=80&rating=g&default=mp&forcedefault=n"
    }

    var testEmailAddress: String {
        "john.doe@example.com"
    }

    // emailHash for email address 'john.doe@example.com'
    var testEmailHash: String {
        "836f82db99121b3481011f16b49dfa5fbc714a0d1b1b9f784a1ebbbf5b39577f"
    }

    // emailHash for empty email address
    var testEmptyEmailHash: String {
        "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
    }

}
