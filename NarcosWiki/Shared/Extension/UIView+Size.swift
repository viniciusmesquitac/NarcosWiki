//
//  UIView+Size.swift
//  NarcosWiki
//
//  Created by Vinicius Mesquita on 13/06/21.
//

import UIKit

extension UIView {
  func height(constant: CGFloat) {
    setConstraint(value: constant, attribute: .height)
  }
  
  func width(constant: CGFloat) {
    setConstraint(value: constant, attribute: .width)
  }
  
    private func removeConstraint(attribute: NSLayoutConstraint.Attribute) {
    constraints.forEach {
      if $0.firstAttribute == attribute {
        removeConstraint($0)
      }
    }
  }
  
    private func setConstraint(value: CGFloat, attribute: NSLayoutConstraint.Attribute) {
    removeConstraint(attribute: attribute)
    let constraint =
      NSLayoutConstraint(item: self,
                         attribute: attribute,
                         relatedBy: NSLayoutConstraint.Relation.equal,
                         toItem: nil,
                         attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                         multiplier: 1,
                         constant: value)
    self.addConstraint(constraint)
  }
}
