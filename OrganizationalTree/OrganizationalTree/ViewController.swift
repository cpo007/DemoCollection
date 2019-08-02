//
//  ViewController.swift
//  OrganizationalTree
//
//  Created by cpo007@qq.com on 2019/8/1.
//  Copyright © 2019年 cpo007@qq.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var treeView: OranizationalTreeView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let node = OranizationalNode()
        node.name = "王帅"
        
        let node1 = OranizationalNode()
        node1.name = "王帅1"
        let node2 = OranizationalNode()
        node2.name = "王帅2"
        let node3 = OranizationalNode()
        node3.name = "王帅3"
        
        let node4 = OranizationalNode()
        node4.name = "王帅4"
        let node5 = OranizationalNode()
        node5.name = "王帅5"
        let node6 = OranizationalNode()
        node6.name = "王帅6"
        
        node1.next = [node4,node5,node6]
        node.next = [node1,node2,node3]
        
        let v1 = OranizationalTreeView.init(source: node)
        v1.frame.origin = CGPoint.init(x: 0, y: 44)
        
        view.addSubview(v1)
        treeView = v1
        
//        func getHeight(height: CGFloat){
//            print(height)
//        }
        
        
        let height = treeView.reloadData(method: getHeight)
//        treeView.frame.size = CGSize.init(width: OranizationalTreeParameter.treeWidth, height: height)

        registerNotification()
    }

    private func registerNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTreeView), name: NSNotification.Name.shouldReload, object: nil)
        
    }
    
    func getHeight(height: CGFloat){
        print(height)
    }

    @objc private func reloadTreeView(){
        
        let height = treeView.reloadData(method: getHeight)
//        treeView.frame.size = CGSize.init(width: OranizationalTreeParameter.treeWidth, height: height)

        

    }
}



extension Notification.Name {
    
    public static let shouldReload: Notification.Name = Notification.Name.init("shouldReload")

    
}
