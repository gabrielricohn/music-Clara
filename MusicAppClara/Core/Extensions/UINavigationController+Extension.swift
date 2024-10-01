//
//  UINavigationController+Extension.swift
//  MusicAppClara
//
//  Created by Gabriel Rico on 1/10/24.
//

import SwiftUI

extension UINavigationController {
    
  open override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
      navigationBar.topItem?.backButtonDisplayMode = .minimal
  }
}
