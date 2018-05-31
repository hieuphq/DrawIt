//
//  ViewController.swift
//  DrawIt
//
//  Created by Hieu Phan on 5/31/18.
//  Copyright © 2018 Hieu Phan. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    var drawView: DrawView!
    var clearBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let drawView = DrawView()
        
        self.view.addSubview(drawView)
        drawView.snp.makeConstraints { (m) in
            m.top.equalToSuperview().offset(20)
            m.left.bottom.right.equalToSuperview()
        }
        self.drawView = drawView
        self.drawView.backgroundColor = UIColor.white
        
        let clearBtn = UIButton()
        clearBtn.setTitle("Clear", for: UIControlState.normal)
        clearBtn.setTitle("Clear", for: UIControlState.focused)
        clearBtn.setTitleColor(UIColor.black, for: UIControlState.normal)
        clearBtn.addTarget(self, action: #selector(clearBtnTapped(_:)), for: UIControlEvents.touchUpInside)
        
        self.view.addSubview(clearBtn)
        clearBtn.snp.makeConstraints { (m) in
            m.centerX.equalToSuperview()
            m.bottom.equalToSuperview()
            m.width.equalToSuperview().multipliedBy(0.8)
            m.height.equalToSuperview().multipliedBy(0.1)
        }
        self.clearBtn = clearBtn
    }
    
    @objc func clearBtnTapped(_ sender: UIButton) {
        self.drawView.clear()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

