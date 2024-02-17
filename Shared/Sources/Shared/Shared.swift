// The Swift Programming Language
// https://docs.swift.org/swift-book
import SwiftUI

public struct Shared<Content: View>: View {
    
    @ViewBuilder let content: Content
    
    public init(view: Content) {
        content = view
    }
    
    public var body: some View {
        content
    }
}
