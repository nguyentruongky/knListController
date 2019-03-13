//
//  knView.swift
//  Ogenii
//
//  Created by Ky Nguyen on 3/17/17.
//  Copyright © 2017 Ky Nguyen. All rights reserved.
//

import UIKit

class knTableCell : UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        selectionStyle = .none
    }
    static func wrap(view: UIView, space: UIEdgeInsets = .zero) -> knTableCell {
        let cell = knTableCell()
        cell.backgroundColor = .clear
        cell.addSubviews(views: view)
        view.fill(toView: cell, space: space)
        return cell
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    func setupView() { }
}


class UIMaker {
    static func makeLabel(text: String? = nil,
                          font: UIFont = .systemFont(ofSize: 15),
                          color: UIColor = .black,
                          numberOfLines: Int = 1,
                          alignment: NSTextAlignment = .left) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = font
        label.textColor = color
        label.text = text
        label.numberOfLines = numberOfLines
        label.textAlignment = alignment
        return label
    }
}


extension UIView {
    func addSubviews(views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }

    func addFill(_ view: UIView) {
        addSubview(view)
        view.fill(toView: self)
    }

    @discardableResult
    public func left(toView view: UIView, space: CGFloat = 0, isActive: Bool = true) -> NSLayoutConstraint {
        let constraint = leftAnchor.constraint(equalTo: view.leftAnchor, constant: space)
        constraint.isActive = isActive
        return constraint
    }

    @discardableResult
    public func right(toView view: UIView, space: CGFloat = 0, isActive: Bool = true) -> NSLayoutConstraint {
        let constraint = rightAnchor.constraint(equalTo: view.rightAnchor, constant: space)
        constraint.isActive = isActive
        return constraint
    }

    @discardableResult
    public func top(toView view: UIView, space: CGFloat = 0, isActive: Bool = true) -> NSLayoutConstraint {
        let constraint = topAnchor.constraint(equalTo: view.topAnchor, constant: space)
        constraint.isActive = isActive
        return constraint
    }

    @discardableResult
    public func bottom(toView view: UIView, space: CGFloat = 0, isActive: Bool = true) -> NSLayoutConstraint {
        let constraint = bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: space)
        constraint.isActive = isActive
        return constraint
    }

    @discardableResult
    public func bottom(toAnchor anchor: NSLayoutYAxisAnchor, space: CGFloat = 0, isActive: Bool = true) -> NSLayoutConstraint {
        let constraint = bottomAnchor.constraint(equalTo: anchor, constant: space)
        constraint.isActive = isActive
        return constraint
    }

    @discardableResult
    public func verticalSpacing(toView view: UIView, space: CGFloat = 0, isActive: Bool = true) -> NSLayoutConstraint {
        let constraint = topAnchor.constraint(equalTo: view.bottomAnchor, constant: space)
        constraint.isActive = isActive
        return constraint
    }

    @discardableResult
    public func horizontalSpacing(toView view: UIView, space: CGFloat = 0, isActive: Bool = true) -> NSLayoutConstraint {
        let constraint = rightAnchor.constraint(equalTo: view.leftAnchor, constant: -space)
        constraint.isActive = isActive
        return constraint
    }

    @discardableResult
    public func horizontal(toView view: UIView, space: CGFloat = 0, isActive: Bool = true) ->
        (left: NSLayoutConstraint, right: NSLayoutConstraint) {
            let left = leftAnchor.constraint(equalTo: view.leftAnchor, constant: space)
            left.priority = UILayoutPriority(rawValue: 999)
            left.isActive = isActive
            let right = rightAnchor.constraint(equalTo: view.rightAnchor, constant: -space)
            right.isActive = isActive
            return (left, right)
    }

    @discardableResult
    public func fill(toView view: UIView, space: UIEdgeInsets = .zero, isActive: Bool = true)
        -> (left: NSLayoutConstraint, top: NSLayoutConstraint,
        right: NSLayoutConstraint, bottom: NSLayoutConstraint) {
            let leftCons = left(toView: view, space: space.left, isActive: isActive)
            let rightCons = right(toView: view, space: -space.right, isActive: isActive)
            let topCons = top(toView: view, space: space.top, isActive: isActive)
            let bottomCons = bottom(toView: view, space: -space.bottom, isActive: isActive)
            return (leftCons, topCons, rightCons, bottomCons)
    }
}
