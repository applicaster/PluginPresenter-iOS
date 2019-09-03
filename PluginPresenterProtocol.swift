//
//  PluginPresenterProtocol.swift
//

import Foundation
import UIKit

/// Protocol to allow to present a plugin and wait for a response in that plugin.
/// Using this protocol you can present in your plugin another plugin and take a result from there. This is useful to present modally other plugins, or to insert a screen between the flow of another plugin.
@objc public protocol PluginPresenterProtocol {
    
    /// Completion closure used when the plugin finishes to present.
    ///   - success: true in case the plugin presented with success, false otherwise.
    ///   - data: optional data returned by the plugin.
    typealias Completion = (_ success:Bool, _ data:Any?) -> Void
    
    /// Call this method when you want to present the plugin.
    ///
    /// - Parameters:
    ///   - parentViewController: view controller used to present the plugin.
    ///   - extraData: optional data to pass extra information.
    ///   - completion: completion closure called when the plugin finishes to present.
    func presentPlugin(parentViewController:UIViewController, extraData:Any?, completion:Completion?)
}
