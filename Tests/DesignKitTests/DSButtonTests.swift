import XCTest
import SwiftUI
@testable import DesignKit

final class DSButtonTests: XCTestCase {
    func testButtonInitialization() {
        let buttonState = Binding<DSButtonState>(get: { .normal }, set: { _ in })
        let button = DSButton(
            state: buttonState,
            title: "Test Button",
            iconName: "test.icon",
            style: .filled,
            size: .medium,
            action: {}
        )

        XCTAssertEqual(button.title, "Test Button")
        XCTAssertEqual(button.iconName, "test.icon")
        XCTAssertEqual(button.style, .filled)
        XCTAssertEqual(button.size, .medium)
    }

    func testButtonStateChanges() {
        var state: DSButtonState = .normal
        let buttonState = Binding<DSButtonState>(get: { state }, set: { state = $0 })
        let button = DSButton(
            state: buttonState,
            title: "Test Button",
            iconName: "test.icon",
            style: .filled,
            size: .medium,
            action: {}
        )

        state = .loading
        XCTAssertTrue(button.state.isLoading)

        state = .disabled
        XCTAssertTrue(button.state.isDisabled)
    }

    func testButtonAction() {
        var actionCalled = false
        let buttonState = Binding<DSButtonState>(get: { .normal }, set: { _ in })
        let button = DSButton(
            state: buttonState,
            title: "Test Button",
            iconName: "test.icon",
            style: .filled,
            size: .medium,
            action: {
                actionCalled = true
            }
        )

        button.action()
        XCTAssertTrue(actionCalled)
    }

    func testButtonStyleProperties() {
        let buttonState = DSButtonState.normal
        let buttonStyle = DSButtonStyle(
            iconName: "test.icon",
            style: .filled,
            size: .medium,
            state: buttonState
        )

        XCTAssertEqual(buttonStyle.iconName, "test.icon")
        XCTAssertEqual(buttonStyle.style, .filled)
        XCTAssertEqual(buttonStyle.size, .medium)
        XCTAssertEqual(buttonStyle.state, buttonState)
    }

    func testButtonStyleColors() {
        let normalState = DSButtonState.normal
        let disabledState = DSButtonState.disabled

        let normalStyle = DSButtonStyle(iconName: "test.icon", style: .filled, size: .medium, state: normalState)
        let disabledStyle = DSButtonStyle(iconName: "test.icon", style: .filled, size: .medium, state: disabledState)

        XCTAssertEqual(normalStyle.textColor(), .onAccent)
        XCTAssertEqual(disabledStyle.textColor(), .onDisabled)
    }

    func testButtonStyleBackground() {
        let normalState = DSButtonState.normal
        let disabledState = DSButtonState.disabled
        let loadingState = DSButtonState.loading

        let normalStyle = DSButtonStyle(iconName: "test.icon", style: .filled, size: .medium, state: normalState)
        let disabledStyle = DSButtonStyle(iconName: "test.icon", style: .filled, size: .medium, state: disabledState)
        let loadingStyle = DSButtonStyle(iconName: "test.icon", style: .filled, size: .medium, state: loadingState)

        XCTAssertEqual(normalStyle.background(isPressed: false), .accent)
        XCTAssertEqual(disabledStyle.background(isPressed: false), .disabled)
        XCTAssertEqual(loadingStyle.background(isPressed: false), .surface)
    }

    func testButtonStyleBorder() {
        let normalState = DSButtonState.normal
        let disabledState = DSButtonState.disabled
        let loadingState = DSButtonState.loading

        let normalStyle = DSButtonStyle(iconName: "test.icon", style: .outlined, size: .medium, state: normalState)
        let disabledStyle = DSButtonStyle(iconName: "test.icon", style: .outlined, size: .medium, state: disabledState)
        let loadingStyle = DSButtonStyle(iconName: "test.icon", style: .outlined, size: .medium, state: loadingState)

        XCTAssertNotNil(normalStyle.border(isPressed: false))
        XCTAssertNotNil(disabledStyle.border(isPressed: false))
        XCTAssertNotNil(loadingStyle.border(isPressed: false))
    }

    func testButtonStyleCornerRadius() {
        let smallSize = DSButtonSize.small
        let mediumSize = DSButtonSize.medium
        let largeSize = DSButtonSize.large

        let buttonStyleSmall = DSButtonStyle(iconName: "test.icon", style: .filled, size: smallSize, state: .normal)
        let buttonStyleMedium = DSButtonStyle(iconName: "test.icon", style: .filled, size: mediumSize, state: .normal)
        let buttonStyleLarge = DSButtonStyle(iconName: "test.icon", style: .filled, size: largeSize, state: .normal)

        XCTAssertEqual(buttonStyleSmall.cornerRadius(), 8)
        XCTAssertEqual(buttonStyleMedium.cornerRadius(), 12)
        XCTAssertEqual(buttonStyleLarge.cornerRadius(), 16)
    }

    func testButtonStyleHeight() {
        let smallSize = DSButtonSize.small
        let mediumSize = DSButtonSize.medium
        let largeSize = DSButtonSize.large

        let buttonStyleSmall = DSButtonStyle(iconName: "test.icon", style: .filled, size: smallSize, state: .normal)
        let buttonStyleMedium = DSButtonStyle(iconName: "test.icon", style: .filled, size: mediumSize, state: .normal)
        let buttonStyleLarge = DSButtonStyle(iconName: "test.icon", style: .filled, size: largeSize, state: .normal)

        XCTAssertEqual(buttonStyleSmall.height(), 30)
        XCTAssertEqual(buttonStyleMedium.height(), 36)
        XCTAssertEqual(buttonStyleLarge.height(), 56)
    }
}

