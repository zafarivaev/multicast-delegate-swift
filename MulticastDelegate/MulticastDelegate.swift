//
//  MulticastDelegate.swift
//  MulticastDelegate
//
//  Created by Zafar on 11/10/21.
//

import Foundation

public class MulticastDelegate<T> {
    
    // MARK: - Properties
    private class Wrapper {
        weak var delegate: AnyObject?
        
        init(_ delegate: AnyObject) {
            self.delegate = delegate
        }
    }
    
    private var wrappers: [Wrapper] = []
    public var delegates: [T] {
        return wrappers
            .compactMap{ $0.delegate } as! [T]
    }
    
    // MARK: - Actions
    public func add(delegate: T) {
        let wrapper = Wrapper(delegate as AnyObject)
        wrappers.append(wrapper)
    }
    
    public func remove(delegate: T) {
        guard let index = wrappers.firstIndex(where: {
            $0.delegate === (delegate as AnyObject)
        }) else {
            return
        }
        wrappers.remove(at: index)
    }
    
    public func invokeForEachDelegate(_ handler: (T) -> ()) {
        delegates.forEach { handler($0) }
    }
}
