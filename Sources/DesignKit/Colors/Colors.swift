import SwiftUI

public extension Color {

    init(named name: String) {
        self = Color(name, bundle: Bundle.mainIfAvailable)
    }

    /// Background color, hex value Light**#FFFFFF** Dark**#1A1A1A**
    static let background = Color("Background", bundle: .module)

    /// Surface color, hex value Light**#F0F0F9** Dark**#313131**
    static let surface = Color("Surface", bundle: .module)

    /// On Surface High color, hex value Light**#101010** Dark**#D1D1D1**
    static let onSurfaceHigh = Color("OnSurfaceHigh", bundle: .module)

    /// On Surface Medium color, hex value Light**#5E5E5E** Dark**#A3A3A3**
    static let onSurfaceMedium = Color("OnSurfaceMedium", bundle: .module)

    /// On Surface Light color, hex value Light**#BCBCBC** Dark**#535353**
    static let onSurfaceLight = Color("OnSurfaceLight", bundle: .module)

    /// Border color, hex value Light**#E5E5E5** Dark**#414141**
    static let border = Color("Border", bundle: .module)

    /// Accent color, hex value is variable
    static let accent = Color("Accent", bundle: .mainIfAvailable)

    /// On Accent color, hex value Light**#FFFFFF** Dark**#FFFFFF**
    static let onAccent = Color("OnAccent", bundle: .module)

    /// Success Light color, hex value Light**#B0F3F5** Dark**#B0F3F5**
    static let successLight = Color("SuccessLight", bundle: .module)

    /// Success High color, hex value Light**#27BAA7** Dark**#27BAA7**
    static let successHigh = Color("SuccessHigh", bundle: .module)

    /// Warning Light color, hex value Light**#FCFBBC** Dark**#FCFBBC**
    static let warningLight = Color("WarningLight", bundle: .module)

    /// Warning High color, hex value Light**#F1DA10** Dark**#F1DA10**
    static let warningHigh = Color("WarningHigh", bundle: .module)

    /// Info Light color, hex value Light**#D7E4EC** Dark**#D7E4EC**
    static let infoLight = Color("InfoLight", bundle: .module)

    /// Info High color, hex value Light**#54AADF** Dark**#54AADF**
    static let infoHigh = Color("InfoHigh", bundle: .module)

    /// Error Light color, hex value Light**#FFB2A3** Dark**#FFB2A3**
    static let errorLight = Color("ErrorLight", bundle: .module)

    /// Error High color, hex value Light**#FF4425** Dark**#FF4425**
    static let errorHigh = Color("ErrorHigh", bundle: .module)

    /// Disabled color, hex value Light**#DCDBDC** Dark**#A4A4A4**
    static let disabled = Color("Disabled", bundle: .module)

    /// On Disabled color, hex value Light**#BCBCBC** Dark**#707070**
    static let onDisabled = Color("OnDisabled", bundle: .module)
}

extension Bundle {
    static var mainIfAvailable: Bundle {
        guard let bundleIdentifier = Bundle.main.bundleIdentifier else {
            return .module
        }

        return !bundleIdentifier.starts(with: "com.apple.dt.PreviewAgent") ? .main : .module
    }
}
