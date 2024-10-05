import Foundation

public struct Spacing {
    /// Single unit spacing (1 pt)
    public static let single: CGFloat = 1

    /// Double unit spacing (2 pt)
    public static let double: CGFloat = 2

    /// Tiny spacing, typically used for very small gaps (4 pt)
    public static let tiny: CGFloat = 4

    /// Small spacing, useful for small gaps between elements (8 pt)
    public static let small: CGFloat = 8

    /// Small to medium spacing, a bit larger than small but not quite medium (12 pt)
    public static let smallMedium: CGFloat = 12

    /// Medium spacing, standard spacing for most elements (16 pt)
    public static let medium: CGFloat = 16

    /// Medium to large spacing, larger than medium for more significant separation (24 pt)
    public static let mediumLarge: CGFloat = 24

    /// Large spacing, used for significant gaps or padding (32 pt)
    public static let large: CGFloat = 32

    /// Large to huge spacing, very large gaps, typically for major section breaks (48 pt)
    public static let largeHuge: CGFloat = 48

    /// Huge spacing, the largest standard spacing, for major layout separations (64 pt)
    public static let huge: CGFloat = 64
}
