import Foundation

extension HTTPURLResponse {
  var isSuccessful: Bool {
    return (200..<300).contains(statusCode)
  }

  var statusCodeDescription: String {
    return HTTPURLResponse.localizedString(forStatusCode: statusCode)
  }

  var textEncoding: String.Encoding? {
    guard let encodingName = textEncodingName else { return nil }
    #if os(iOS) || os(macOS)
      return String.Encoding(rawValue: CFStringConvertEncodingToNSStringEncoding(
        CFStringConvertIANACharSetNameToEncoding(encodingName as CFString))
      )
    #else
      return String.Encoding.ascii // XXX: or .utf ???
    #endif
  }
}

public protocol Matchable {
  associatedtype Base
  static func ~=(pattern: Self, value: Base) -> Bool
}

