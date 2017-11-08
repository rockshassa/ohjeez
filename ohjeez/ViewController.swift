//
//  ViewController.swift
//  ohjeez
//
//  Created by Nick Galasso on 11/9/17.
//  Copyright © 2017 Nick Galasso. All rights reserved.
//

import GLKit

class ViewController: GLKViewController {

    var cc:[Float] = [1,1,0,1]
    
    var glkView:GLKView {
        get {
            return self.view as! GLKView
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let ctx = EAGLContext(api: .openGLES2) {
            self.glkView.context = ctx
        }
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(onTap(sender:)))
        tap.numberOfTapsRequired = 1;
        self.view.addGestureRecognizer(tap)
    }
    
    //selectors are an obj-c thing, so expose this function using @objc
    @objc func onTap(sender:UITapGestureRecognizer){
        if 0.0 == cc[0] {
            cc[0] = 1.0
            cc[2] = 0.0
        } else {
            cc[0] = 0.0
            cc[2] = 1.0
        }
    }
    
    override func glkView(_ view: GLKView, drawIn rect: CGRect) {
        glClearColor(cc[0], cc[1], cc[2], cc[3])
        glClear(GLbitfield(GL_COLOR_BUFFER_BIT)) 
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

