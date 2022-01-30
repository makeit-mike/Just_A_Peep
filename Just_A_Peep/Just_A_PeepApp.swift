
import SwiftUI

@main
struct JustAPeep: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    init() {
      AppDelegate.shared = self.appDelegate
    }
    var body: some Scene {
        Settings{
            EmptyView()
        }
    }
}

