//
// GravatarImageTests.swift
// Part of Gravatar, a package for requesting Gravatar avatars.
// https://github.com/leomakkinje/Gravatar
//
// This file contains unit tests for source file GravatarImage.
//
// Copyright (c) 2024 Leo Makkinje.
// See LICENSE for license information.
//

import XCTest
@testable import Gravatar

final class GravatarImageTests: XCTestCase {

    // MARK: - Tests for property 'gravatar'
    func test_GravatarImage_givenGravatar_canRequestAvatarURL() {
        let sut = GravatarImage(Gravatar(testEmailAddress))
        let sutResult = sut.gravatar.avatarURL
        let expectedResult = URL(string: "\(testBaseURL)/avatar/\(testEmailHash)\(testDefaultURLOptions)")!
        XCTAssertEqual(sutResult, expectedResult)
    }

    func test_GravatarImage_givenAvatarURL_returnsImage() async throws {
        let sut = GravatarImage(Gravatar(testEmailAddress))
        do {
            let (data, _) = try await URLSession.shared.data(from: sut.gravatar.avatarURL)
#if canImport(AppKit)
            let sutResult = NSImage(data: data)
#else
            let sutResult = UIImage(data: data)
#endif
            XCTAssertNotNil(sutResult)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    // MARK: - Tests for property 'style'
    func test_GravatarImage_givenNoStyle_returnsDefaultStyle() {
        let sut = GravatarImage(Gravatar(testEmailAddress))
        let sutResult = sut.style
        let expectedResult = Style.square
        XCTAssertEqual(sutResult, expectedResult)
    }

    func test_GravatarImage_givenCustomStyle_returnsCustomStyle() {
        let sut = GravatarImage(Gravatar(testEmailAddress), style: .circle)
        let sutResult = sut.style
        let expectedResult = Style.circle
        XCTAssertEqual(sutResult, expectedResult)
    }

}
