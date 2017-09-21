//
//  YSHYWBVisitorView.swift
//  微博
//
//  Created by 杨淑园 on 2017/8/9.
//  Copyright © 2017年 杨淑园. All rights reserved.
//

import UIKit
class YSHYWBVisitorView: UIView {
    
    public  var visitorDicInfo : [String:String]?{
        didSet{
            guard let imageName = visitorDicInfo?["imageName"],
                let message = visitorDicInfo?["message"]
                else{
                return
            }
            tipLab.text = message
            if(imageName == "")
            {
                startAnimation()
                return
            }
            iconView.image = UIImage.init(named: imageName)
            houseIconView.isHidden = true
            coverIconView.isHidden = true
        }
    }
    override init(frame: CGRect) {
        super.init(frame:frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //mark 是有控件
    // 图像视图   小房子 提示标签  注册按钮 登录按钮
    lazy var iconView:UIImageView = UIImageView.init(image: UIImage.init(named: "visitordiscover_feed_image_smallicon"))
    lazy var houseIconView:UIImageView = UIImageView.init(image: UIImage.init(named: "visitordiscover_feed_image_house"))
    lazy var coverIconView :UIImageView = UIImageView.init(image: UIImage.init(named: "visitordiscover_feed_mask_smallicon"))
    
    lazy var tipLab:UILabel = UILabel.init(
        title: "关注一些人,回这里看有什么惊喜",
        fontSize: 14,
        color: UIColor.darkGray)
    
    lazy var registerBtn:UIButton = UIButton.init(
        title: "注册",
        fontSize: 16,
        normalColor: .darkGray,
        highlightedColor: .orange)
    
    lazy var loginBtn:UIButton = UIButton.init(
        title: "登录",
        fontSize: 16,
        normalColor: .darkGray,
        highlightedColor: .orange)
   
}


extension YSHYWBVisitorView{
    func  setupUI() {
        backgroundColor = YSHY_Color_RGBSTR("#F4F4F4")
        addSubview(houseIconView)
        addSubview(iconView)
        addSubview(coverIconView)
        addSubview(tipLab)
        addSubview(registerBtn)
        addSubview(loginBtn)
        
        tipLab.textAlignment = .center
        tipLab.numberOfLines = 0
        registerBtn.backgroundColor = .white
        registerBtn.setTitleColor(.orange, for: .normal)
        loginBtn.backgroundColor = .white
        loginBtn.setTitleColor(.orange, for: .normal)
        
        iconView.snp.makeConstraints { (make) ->Void  in
            make.centerX.equalTo(center.x)
            make.centerY.equalTo(self).offset(-80)
            make.left.equalTo(self).offset(75)
            make.right.equalTo(self).offset(-75)
            make.height.equalTo((CONTEXTWIDTH - 150))
        }
        
        houseIconView.snp.makeConstraints { (make) ->Void  in
            make.center.equalTo(iconView)
            make.width.height.equalTo(100)
        }
        
        coverIconView.snp.makeConstraints { (make) in
            make.bottom.equalTo(iconView)
            make.width.height.equalTo(iconView)
            make.center.equalTo(iconView)
        }
        
        tipLab.snp.makeConstraints { (make) in
            make.top.equalTo(iconView.snp.bottom).offset(10)
            make.left.equalTo(iconView)
            make.right.equalTo(iconView)
            make.height.greaterThanOrEqualTo(30)
        }
        
        registerBtn.snp.makeConstraints { (make) in
            make.top.equalTo(tipLab.snp.bottom).offset(10)
            make.width.equalTo(80)
            make.right.equalTo(self.snp.centerX).offset(-10)
            make.height.equalTo(50)
        }
        
        loginBtn.snp.makeConstraints { (make) in
            make.top.equalTo(registerBtn)
            make.width.equalTo(registerBtn)
            make.left.equalTo(self.snp.centerX).offset(10)
            make.height.equalTo(registerBtn)
        }
    }
    
    func startAnimation()  {
        let anim: CABasicAnimation = CABasicAnimation.init(keyPath:"transform.rotation")
        anim.toValue = 2 * Double.pi
        anim.repeatCount = MAXFLOAT
        anim.duration = 15
        //  完成之后不删除  不加这句话 离开页面在回来动画会停止

        anim.isRemovedOnCompletion =  false
        iconView.layer.add(anim, forKey: nil)
    }

}



