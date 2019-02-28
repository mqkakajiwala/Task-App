//
//  UIView.swift
//  Technology Assessment - Task
//
//  Created by Mustafa on 27/02/2019.
//  Copyright © 2019 Mustafa. All rights reserved.
//

import UIKit

extension UIView {
    
    func setTableHeaderForStretchyView(tableView: UITableView, tableHeaderHeight: CGFloat) {
        tableView.tableHeaderView = nil
        tableView.addSubview(self)
        tableView.contentInset = UIEdgeInsets(top: tableHeaderHeight, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -tableHeaderHeight)
    }
    
    func stretchTableHeaderView(tableView: UITableView, tableHeaderHeight: CGFloat) -> CGRect {
        var headerRect = CGRect(x: 0, y: -tableHeaderHeight, width: UIScreen.main.bounds.width, height: tableHeaderHeight)
        if tableView.contentOffset.y < -tableHeaderHeight {
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -(tableView.contentOffset.y)
        }
        
        return headerRect
    }
}
