import Foundation

public enum DSButtonState {
    case normal
    case loading
    case disabled

    var isDisabled: Bool {
        self == .disabled
    }

    var isLoading: Bool {
        self == .loading
    }
}
