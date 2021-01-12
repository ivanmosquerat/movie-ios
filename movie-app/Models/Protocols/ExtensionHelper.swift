//
//  MyHelper.swift
//  movie-app
//
//  Created by Ivan Mosquera on 12/1/21.
//  Copyright © 2021 Ivan Mosquera. All rights reserved.
//

import Foundation
import UIKit

public protocol ExtensionHelperCompatible{
    associatedtype someType
    
    var myExtension: someType { get }
}

public extension ExtensionHelperCompatible{
    
    public var myExtension: Extension<Self>{
    
        get{ return Extension(self) }
    }
}

public struct Extension<Base>{
    let base: Base
    init(_ base: Base){
        self.base = base
    }
}

extension UITableView: ExtensionHelperCompatible {}

