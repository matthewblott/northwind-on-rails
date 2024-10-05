import HotwireNative
import WebKit

extension WKWebViewConfiguration {
  static var appConfiguration: WKWebViewConfiguration {
    let stradaSubstring = Hotwire.config.userAgent
    let userAgent = "Turbo Native iOS \(stradaSubstring)"
    let configuration = WKWebViewConfiguration()
    
    configuration.applicationNameForUserAgent = userAgent

    return configuration
  }
}
