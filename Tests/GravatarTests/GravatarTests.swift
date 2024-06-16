//
// GravatarTests.swift
// Part of Gravatar, a package for requesting Gravatar avatars.
// https://github.com/leomakkinje/Gravatar
//
// This file contains unit tests for source file Gravatar.
//
// Copyright (c) 2024 Leo Makkinje.
// See LICENSE for license information.
//

import XCTest
@testable import Gravatar

final class GravatarTests: XCTestCase {

    // MARK: - Tests for property 'emailAddress'
    func test_Gravatar_givenLowercaseTrimmedEmailAddress_setsLowercaseTrimmedEmailAddress() {
        let sut = Gravatar(testEmailAddress)
        let sutResult = sut.emailAddress
        let expectedResult = testEmailAddress
        XCTAssertEqual(sutResult, expectedResult)
    }

    func test_Gravatar_givenUppercaseUntrimmedEmailAddress_setsLowercaseTrimmedEmailAddress() {
        let sut = Gravatar(" \(testEmailAddress.uppercased()) ")
        let sutResult = sut.emailAddress
        let expectedResult = testEmailAddress
        XCTAssertEqual(sutResult, expectedResult)
    }

    // MARK: - Tests for property 'size'
    func test_Gravatar_givenNoSize_returnsDefaultSize() {
        let sut = Gravatar(testEmailAddress)
        let sutResult = sut.size
        let expectedResult = 80
        XCTAssertEqual(sutResult, expectedResult)
    }

    func test_Gravatar_givenCustomSize_returnsCustomSize() {
        let sut = Gravatar(testEmailAddress, size: 160)
        let sutResult = sut.size
        let expectedResult = 160
        XCTAssertEqual(sutResult, expectedResult)
    }

    func test_Gravatar_givenTooSmallSize_returnsDefaultSize() {
        let sut = Gravatar(testEmailAddress, size: 0)
        let sutResult = sut.size
        let expectedResult = 80
        XCTAssertEqual(sutResult, expectedResult)
    }

    func test_Gravatar_givenTooLargeSize_returnsDefaultSize() {
        let sut = Gravatar(testEmailAddress, size: 2049)
        let sutResult = sut.size
        let expectedResult = 80
        XCTAssertEqual(sutResult, expectedResult)
    }

    // MARK: - Tests for property 'rating'
    func test_Gravatar_givenNoRating_returnsDefaultRating() {
        let sut = Gravatar(testEmailAddress)
        let sutResult = sut.rating
        let expectedResult = Rating.g
        XCTAssertEqual(sutResult, expectedResult)
    }

    func test_Gravatar_givenCustomRating_returnsCustomRating() {
        let sut = Gravatar(testEmailAddress, rating: .pg)
        let sutResult = sut.rating
        let expectedResult = Rating.pg
        XCTAssertEqual(sutResult, expectedResult)
    }

    // MARK: - Tests for property 'defaultAvatar'
    func test_Gravatar_givenNoDefaultAvatar_returnsDefaultDefaultAvatar() {
        let sut = Gravatar(testEmailAddress)
        let sutResult = sut.defaultAvatar
        let expectedResult = DefaultAvatar.mp
        XCTAssertEqual(sutResult, expectedResult)
    }

    func test_Gravatar_givenCustomDefaultAvatar_returnsCustomDefaultAvatar() {
        let sut = Gravatar(testEmailAddress, defaultAvatar: .robohash)
        let sutResult = sut.defaultAvatar
        let expectedResult = DefaultAvatar.robohash
        XCTAssertEqual(sutResult, expectedResult)
    }

    // MARK: - Tests for property 'forceDefaultAvatar'
    func test_Gravatar_givenNoForceDefaultAvatar_returnsDefaultForceDefaultAvatar() {
        let sut = Gravatar(testEmailAddress)
        let sutResult = sut.forceDefaultAvatar
        let expectedResult = false
        XCTAssertEqual(sutResult, expectedResult)
    }

    func test_Gravatar_givenCustomForceDefaultAvatar_returnsCustomForceDefaultAvatar() {
        let sut = Gravatar(testEmailAddress, forceDefaultAvatar: true)
        let sutResult = sut.forceDefaultAvatar
        let expectedResult = true
        XCTAssertEqual(sutResult, expectedResult)
    }

    // MARK: - Tests for property 'emailHash'
    func test_Gravatar_givenEmailAddress_returnsEmailHash() {
        let sut = Gravatar(testEmailAddress)
        let sutResult = sut.emailHash
        let expectedResult = testEmailHash
        XCTAssertEqual(sutResult, expectedResult)
    }

    // MARK: - Tests for property 'avatarURL'
    func test_Gravatar_givenEmptyEmailAddress_returnsNotNilAvatarURL() {
        let sut = Gravatar("")
        let sutResult = sut.avatarURL
        let expectedResult = URL(string: "\(testBaseURL)/avatar/\(testEmptyEmailHash)\(testDefaultURLOptions)")!
        XCTAssertEqual(sutResult, expectedResult)
    }

    func test_Gravatar_givenNoCustomParameters_returnsDefaultAvatarURL() {
        let sut = Gravatar(testEmailAddress)
        let sutResult = sut.avatarURL
        let expectedResult = URL(string: "\(testBaseURL)/avatar/\(testEmailHash)\(testDefaultURLOptions)")!
        XCTAssertEqual(sutResult, expectedResult)
    }

    func test_Gravatar_givenCustomParameters_returnsCustomAvatarURL() {
        let sut = Gravatar(testEmailAddress, size: 1024, rating: .r, defaultAvatar: .logo, forceDefaultAvatar: true)
        let sutResult = sut.avatarURL
        let expectedResult = URL(string: "\(testBaseURL)/avatar/\(testEmailHash)?size=1024&rating=r&default=logo&forcedefault=y")!
        XCTAssertEqual(sutResult, expectedResult)
    }

}
