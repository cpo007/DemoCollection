//
//  OranizationalTreeView.swift
//  OrganizationalTree
//
//  Created by cpo007@qq.com on 2019/8/1.
//  Copyright © 2019年 cpo007@qq.com. All rights reserved.
//

import UIKit

class OranizationalTreeView: UIView {

    var source: OranizationalNode?
    var nextView: UIView!
    var nextTreeViews = [OranizationalTreeView]()
    
    init(source: OranizationalNode) {
        super.init(frame: CGRect.zero)
        self.source = source
        setup()
        
    }
    
    private func setup(){
        guard let node = source else { return }
        
        let label = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: OranizationalTreeParameter.treeWidth, height: OranizationalTreeParameter.treeHeight))
        label.backgroundColor = ColorUtils.randomColor()
        label.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(labelDidClick(tap:))))
        label.isUserInteractionEnabled = true
        label.text = node.name
        addSubview(label)
        
        let nextView = UIView.init(frame: CGRect.init(x: label.frame.origin.x + 30, y: label.frame.maxY, width: OranizationalTreeParameter.treeWidth - (label.frame.origin.x + 30), height: 0))
        nextView.clipsToBounds = true
        addSubview(nextView)
        self.nextView = nextView
        
        for nextNode in node.next {
            let v = OranizationalTreeView(source: nextNode)
            nextView.addSubview(v)
            nextTreeViews.append(v)
        }
        
        
    }
    
    public func reloadData(method:((_ height: CGFloat) -> Void)) -> CGFloat {
        guard let node = source else { return 0 }
        var maxHeight: CGFloat = 0
        for (index,view) in nextTreeViews.enumerated(){
            let height = view.reloadData(method: method)
            view.frame.size = CGSize.init(width: nextView.frame.width, height: height)
            view.frame.origin = CGPoint.init(x: 0, y: node.isSpread ? maxHeight : 0)
            maxHeight+=(node.isSpread ? height : 0)
        }
        nextView.frame.size = CGSize.init(width: nextView.frame.width, height: node.isSpread ? maxHeight : 0)
        
        maxHeight+=OranizationalTreeParameter.treeHeight
        self.frame.size = CGSize.init(width: superview?.frame.width ?? 0, height: maxHeight)
        method(maxHeight)
        return maxHeight
    }
    
    
    @objc private func labelDidClick(tap: UIGestureRecognizer){
        guard let node = source else { return }
        node.isSpread = !node.isSpread
        NotificationCenter.default.post(name: NSNotification.Name.shouldReload, object: nil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
