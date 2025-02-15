//  Converted with Swiftify v1.0.6292 - https://objectivec2swift.com/
/*
 *  Copyright (c) 2014, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the BSD-style license found in the
 *  LICENSE file in the root directory of this source tree. An additional grant
 *  of patent rights can be found in the PATENTS file in the same directory.
 *
 */
import Foundation

/*!
 Implement this protocol to provide an alternate strategy for resolving
 App Links that may include pre-fetching, caching, or querying for App Link
 data from an index provided by a service provider.
 */
protocol BFAppLinkResolving: NSObjectProtocol {
    /*!
     Asynchronously resolves App Link data for a given URL.
    
     @param url The URL to resolve into an App Link.
     @returns A BFTask that will return a BFAppLink for the given URL.
     */
    func appLinkFromURL(inBackground url: URL) -> BFTask
}