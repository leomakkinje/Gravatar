//
// GravatarImageStyleTests.swift
// Part of Gravatar, a package for requesting Gravatar avatars.
// https://github.com/leomakkinje/Gravatar
//
// This file contains unit tests for source file GravatarImageStyle.
//
// Copyright (c) 2024 Leo Makkinje.
// See LICENSE for license information.
//

import XCTest
@testable import Gravatar

final class GravatarImageStyleTests: XCTestCase {

    // MARK: - Tests for property 'style'
    @MainActor
    func test_GravatarImageStyle_givenStyleSquare_returnsStyle_Square() {
        let sut = GravatarImageStyle(.square)
        let sutResult = sut.style
        let expectedResult = Style.square
        XCTAssertEqual(sutResult, expectedResult)
    }

    // MARK: - Tests for property 'cornerRadius'
    @MainActor
    func test_GravatarImageStyle_hasCornerRadius_Fifteen() {
        let sut = GravatarImageStyle(.square)
        let sutResult = sut.cornerRadius
        let expectedResult: Double = 15
        XCTAssertEqual(sutResult, expectedResult)
    }

    // MARK: - Tests for property 'strokeLineWidth'
    @MainActor
    func test_GravatarImageStyle_hasStrokeLineWidth_One() {
        let sut = GravatarImageStyle(.square)
        let sutResult = sut.strokeLineWidth
        let expectedResult: Double = 1
        XCTAssertEqual(sutResult, expectedResult)
    }

}
