//  Converted with Swiftify v1.0.6292 - https://objectivec2swift.com/
// Copyright (c) 2014-present, Facebook, Inc. All rights reserved.
//
// You are hereby granted a non-exclusive, worldwide, royalty-free license to use,
// copy, modify, and distribute this software in source code or binary form for use
// in connection with the web services and APIs provided by Facebook.
//
// As with any software that integrates with the Facebook platform, your use of
// this software is subject to the Facebook Developer Principles and Policies
// [http://developers.facebook.com/policy/]. This copyright notice shall be
// included in all copies or substantial portions of the software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
// FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
// COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
// IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
import Foundation
import FBSDKCoreKit

/**
  Represents a request to the Facebook Graph API.


 `FBSDKGraphRequest` encapsulates the components of a request (the
 Graph API path, the parameters, error recovery behavior) and should be
 used in conjunction with `FBSDKGraphRequestConnection` to issue the request.

 Nearly all Graph APIs require an access token. Unless specified, the
 `[FBSDKAccessToken currentAccessToken]` is used. Therefore, most requests
 will require login first (see `FBSDKLoginManager` in FBSDKLoginKit.framework).

 A `- start` method is provided for convenience for single requests.

 By default, FBSDKGraphRequest will attempt to recover any errors returned from
 Facebook. You can disable this via `disableErrorRecovery:`.

- See:FBSDKGraphErrorRecoveryProcessor
 */
class FBSDKGraphRequest: NSObject {
    /**
      Initializes a new instance that use use `[FBSDKAccessToken currentAccessToken]`.
     - Parameter graphPath: the graph path (e.g., @"me").
     - Parameter parameters: the optional parameters dictionary.
     */
    init(graphPath: String, parameters: [AnyHashable: Any]) {
    }
    /**
      Initializes a new instance that use use `[FBSDKAccessToken currentAccessToken]`.
     - Parameter graphPath: the graph path (e.g., @"me").
     - Parameter parameters: the optional parameters dictionary.
     - Parameter HTTPMethod: the optional HTTP method. nil defaults to @"GET".
     */

    init(graphPath: String, parameters: [AnyHashable: Any], httpMethod HTTPMethod: String) {
    }
    /**
      Initializes a new instance.
     - Parameter graphPath: the graph path (e.g., @"me").
     - Parameter parameters: the optional parameters dictionary.
     - Parameter tokenString: the token string to use. Specifying nil will cause no token to be used.
     - Parameter version: the optional Graph API version (e.g., @"v2.0"). nil defaults to `[FBSDKSettings graphAPIVersion]`.
     - Parameter HTTPMethod: the optional HTTP method (e.g., @"POST"). nil defaults to @"GET".
     */

    required init(graphPath: String, parameters: [AnyHashable: Any], tokenString: String, version: String, httpMethod HTTPMethod: String) {
    }
    /**
      The request parameters.
     */
    private(set) var parameters = [AnyHashable: Any]()
    /**
      The access token string used by the request.
     */
    private(set) var tokenString: String = ""
    /**
      The Graph API endpoint to use for the request, for example "me".
     */
    private(set) var graphPath: String = ""
    /**
      The HTTPMethod to use for the request, for example "GET" or "POST".
     */
    private(set) var httpMethod: String = ""
    /**
      The Graph API version to use (e.g., "v2.0")
     */
    private(set) var version: String = ""
    /**
      If set, disables the automatic error recovery mechanism.
     - Parameter disable: whether to disable the automatic error recovery mechanism
    
     By default, non-batched FBSDKGraphRequest instances will automatically try to recover
     from errors by constructing a `FBSDKGraphErrorRecoveryProcessor` instance that
     re-issues the request on successful recoveries. The re-issued request will call the same
     handler as the receiver but may occur with a different `FBSDKGraphRequestConnection` instance.
    
     This will override [FBSDKSettings setGraphErrorRecoveryDisabled:].
     */

    func setGraphErrorRecoveryDisabled(_ disable: Bool) {
    }
    /**
      Starts a connection to the Graph API.
     - Parameter handler: The handler block to call when the request completes.
     */

    func start(withCompletionHandler handler: FBSDKGraphRequestHandler) -> FBSDKGraphRequestConnection {
    }
}