import Strada
import WebKit

extension WKWebViewConfiguration {
  static var appConfiguration: WKWebViewConfiguration {
    let stradaSubstring = Strada.userAgentSubstring(for: BridgeComponent.allTypes)
    let userAgent = "Turbo Native iOS \(stradaSubstring)"
    let configuration = WKWebViewConfiguration()
    
    configuration.applicationNameForUserAgent = userAgent

    return configuration
  }
}
