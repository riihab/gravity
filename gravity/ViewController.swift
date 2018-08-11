//
//  ViewController.swift
//  gravity
//
//  Created by Rihab Mehboob on 06/07/2018.
//  Copyright © 2018 Rihab Mehboob. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Add pause button which allows you to restart
    
    // Gradient stuff
    
    // Fix bugs lol
    
    var animator:UIDynamicAnimator? = nil;
    let gravity = UIGravityBehavior()
    let collision = UICollisionBehavior()
    var square = UIView()
    var left = UIButton()
    var right = UIButton()
    var middle = UIButton()
    var counterUp = false
    var counterRight = false
    var gravLabel = UILabel()
    var direction = "Zero"
    var friend = UIView()
    var target = UIView()
    var pointsLabel = UILabel()
    var points = 0
    var instructions = UILabel()
    var counter = 0
    var time = UILabel()
    var timer : Timer? = nil
    var check : Timer? = nil
    var tapToPlay = UILabel()
    var tapToPlay2 = UILabel()
    var playing = false
    var score = UILabel()
    var restart = UIButton()
    var playAgain = UILabel()
    var option = 0
    var one = UILabel()
    var five = UILabel()
    var ten = UILabel()
    var shadowS = UIView()
    var shadowF = UIView()
    var shadowT = UIView()
    var bugCount = 0
    var pause = UIButton()
    var pause2 = UIButton()
    var isPaused = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        
        self.tapToPlay.frame = CGRect(x:15, y:-200, width: self.view.bounds.width - 30, height: 300)
        self.tapToPlay2.frame = CGRect(x:0, y:1000, width: self.view.bounds.width, height: 300)
        
        self.tapToPlay.numberOfLines = 0
        self.tapToPlay.text = "Unite The Red And Grey Box To Gain A Point - How Many Points Are You Aiming For?"
        self.tapToPlay.textAlignment = .center
        self.tapToPlay.textColor = UIColor.black
        self.tapToPlay.font = UIFont.italicSystemFont(ofSize: self.view.bounds.height/30)
        self.tapToPlay.alpha = 0.5
        
        self.tapToPlay2.text = "Easy     Medium     Hard"
        self.tapToPlay2.textAlignment = .center
        self.tapToPlay2.textColor = UIColor.black
        self.tapToPlay2.font = UIFont.italicSystemFont(ofSize: self.view.bounds.height/25)
        self.tapToPlay2.alpha = 0.5
        self.tapToPlay2.numberOfLines = 0
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 2, initialSpringVelocity: 2, options: .beginFromCurrentState, animations: {
            self.tapToPlay.frame = CGRect(x:15, y:self.view.bounds.height/2 - 300, width: self.view.bounds.width - 30, height: 300)
        }, completion: nil)
        
        UIView.animate(withDuration: 2, delay: 0.5, usingSpringWithDamping: 5, initialSpringVelocity: 5, options: .beginFromCurrentState, animations: {
            self.tapToPlay2.frame = CGRect(x:0, y:self.view.bounds.height/2 - 50, width: self.view.bounds.width, height: 300)
        }, completion: nil)
        
        self.one.frame = CGRect(x:self.view.bounds.width/40, y:self.view.bounds.height/2 - (self.view.bounds.width/5)/2, width: 100, height: 100)
        self.one.backgroundColor = UIColor.clear
        self.one.text = "1"
        self.one.textAlignment = .center
        self.one.textColor = UIColor.red
        self.one.font = UIFont.boldSystemFont(ofSize: self.view.bounds.width/5)
        self.one.alpha = 0.3
        
        self.five.frame = CGRect(x:(self.view.bounds.width/80)*28, y:self.view.bounds.height/2 - (self.view.bounds.width/5)/2, width: 100, height: 100)
        self.five.backgroundColor = UIColor.clear
        self.five.text = "5"
        self.five.textAlignment = .center
        self.five.textColor = UIColor.red
        self.five.font = UIFont.boldSystemFont(ofSize: self.view.bounds.width/5)
        self.five.alpha = 0.3
        
        self.ten.frame = CGRect(x:(self.view.bounds.width/48)*33, y:self.view.bounds.height/2 - (self.view.bounds.width/5)/2, width: 100, height: 100)
        self.ten.backgroundColor = UIColor.clear
        self.ten.text = "10"
        self.ten.textAlignment = .center
        self.ten.textColor = UIColor.red
        self.ten.font = UIFont.boldSystemFont(ofSize: self.view.bounds.width/5)
        self.ten.alpha = 0.3
        
        var timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.update), userInfo: nil, repeats: false)
        counter -= 1
        var check = Timer.scheduledTimer(timeInterval: 0.005, target: self, selector: #selector(self.hit), userInfo: nil, repeats: true)
        
        self.playAgain.frame = CGRect(x: 25, y: self.view.bounds.height - 125, width: self.view.bounds.width - 50, height: 100)
        self.playAgain.backgroundColor = UIColor.clear
        self.playAgain.text = "RESTART"
        self.playAgain.textAlignment = .center
        self.playAgain.textColor = UIColor.white
        self.playAgain.font = UIFont.italicSystemFont(ofSize: 35)
        self.playAgain.alpha = 0
        
        self.time.frame = CGRect(x:0, y:self.view.bounds.height/2 - 275, width: self.view.bounds.width, height: 100)
        self.time.backgroundColor = UIColor.clear
        self.time.textAlignment = .center
        self.time.textColor = UIColor.white
        self.time.font = UIFont.boldSystemFont(ofSize: self.view.bounds.height/8)
        self.time.alpha = 0
        self.time.numberOfLines = 0
        
        self.score.frame = CGRect(x:0, y:self.view.bounds.height/2 + self.view.bounds.height/100, width: self.view.bounds.width, height: 100)
        self.score.backgroundColor = UIColor.clear
        self.score.text = "score"
        self.score.textAlignment = .center
        self.score.textColor = UIColor.white
        self.score.font = UIFont.italicSystemFont(ofSize: self.view.bounds.height/30)
        self.score.alpha = 0
        
        self.gravLabel.frame = CGRect(x:0, y:self.view.bounds.height/2 - 114, width: self.view.bounds.width, height: 100)
        self.gravLabel.backgroundColor = UIColor.clear
        self.gravLabel.text = "Gravity \(direction)"
        self.gravLabel.textAlignment = .center
        self.gravLabel.textColor = UIColor.white
        self.gravLabel.font = UIFont.italicSystemFont(ofSize: self.view.bounds.width/9)
        self.gravLabel.alpha = 0
        
        self.pointsLabel.frame = CGRect(x:0, y:self.view.bounds.height/2 - 42, width: self.view.bounds.width, height: 100)
        self.pointsLabel.backgroundColor = UIColor.clear
        self.pointsLabel.text = "\(self.points)"
        self.pointsLabel.textAlignment = .center
        self.pointsLabel.textColor = UIColor.white
        self.pointsLabel.font = UIFont.italicSystemFont(ofSize: self.view.bounds.width/4)
        self.pointsLabel.alpha = 0
        
        self.shadowS.frame.size.width = (self.view.bounds.width/25)*4
        self.shadowS.frame.size.height = (self.view.bounds.width/25)*4
        self.shadowS.backgroundColor = UIColor.clear
        self.shadowS.layer.cornerRadius = 8
        
        self.square.frame.size.width = (self.view.bounds.width/25)*4
        self.square.frame.size.height = (self.view.bounds.width/25)*4
        self.square.backgroundColor = UIColor.clear
        var c = Int(arc4random_uniform(UInt32(self.view.bounds.width)))
        var d = Int(arc4random_uniform(UInt32(self.view.bounds.height)))
        self.square.center = CGPoint(x: c, y: d)
        self.square.layer.cornerRadius = 8
        
        self.shadowF.frame.size.width = self.view.bounds.width/4
        self.shadowF.frame.size.height = self.view.bounds.width/4
        self.shadowF.backgroundColor = UIColor.clear
        self.shadowF.layer.cornerRadius = 9
        
        self.friend.frame.size.width = self.view.bounds.width/4
        self.friend.frame.size.height = self.view.bounds.width/4
        self.friend.backgroundColor = UIColor.clear
        self.friend.layer.cornerRadius = 9
        var e = Int(arc4random_uniform(UInt32(self.view.bounds.width)))
        var f = Int(arc4random_uniform(UInt32(self.view.bounds.height)))
        self.friend.center = CGPoint(x: e, y: f)
        
        self.shadowT.frame.size.height = self.view.bounds.width/10
        self.shadowT.frame.size.width = self.view.bounds.width/10
        self.shadowT.backgroundColor = UIColor.clear
        self.shadowT.layer.cornerRadius = 4
        
        var a = Int(arc4random_uniform(UInt32(self.view.bounds.width)))
        var b = Int(arc4random_uniform(UInt32(self.view.bounds.height)))
        self.target.center = CGPoint(x: a, y: b)
        self.target.frame.size.height = self.view.bounds.width/10
        self.target.frame.size.width = self.view.bounds.width/10
        self.target.backgroundColor = UIColor.clear
        self.target.layer.cornerRadius = 4
        
        self.middle.frame = CGRect(x:(self.view.frame.width/3) + 5, y:10, width: (self.view.bounds.width/3) - 10, height: (self.view.bounds.height) - 20)
        self.middle.layer.cornerRadius = 8
        self.middle.backgroundColor = UIColor(displayP3Red: 1, green: 1, blue: 1, alpha: 0)
        self.middle.addTarget(self, action: #selector(self.midTap), for: .touchUpInside)
        
        self.left.frame = CGRect(x:10, y:10, width: (self.view.bounds.width/3) - 15, height: (self.view.bounds.height) - 20)
        self.left.layer.cornerRadius = 8
        self.left.backgroundColor = UIColor(displayP3Red: 1, green: 1, blue: 1, alpha: 0)
        self.left.addTarget(self, action: #selector(self.leftTap), for: .touchUpInside)
        
        self.right.frame = CGRect(x:((self.view.frame.width/3)*2) + 5, y:10, width: (self.view.bounds.width/3) - 20, height: (self.view.bounds.height) - 20)
        self.right.layer.cornerRadius = 8
        self.right.backgroundColor = UIColor(displayP3Red: 1, green: 1, blue: 1, alpha: 0)
        self.right.addTarget(self, action: #selector(self.rightTap), for: .touchUpInside)
        
        self.restart.frame = CGRect(x: self.view.bounds.width/14, y: self.view.bounds.height - 125, width: self.view.bounds.width - 50, height: 100)
        self.restart.addTarget(self, action: #selector(self.new), for: .touchUpInside)
        self.restart.backgroundColor = UIColor(displayP3Red: 0.3, green: 0.3, blue: 0.9, alpha: 0.5)
        self.restart.layer.cornerRadius = 10
        self.restart.alpha = 0
        
        self.pause.frame = CGRect(x: 20, y: self.view.bounds.height/20, width: self.view.bounds.width/20, height: self.view.bounds.width/6)
        self.pause.layer.cornerRadius = 1
        self.pause.backgroundColor = UIColor(displayP3Red: 1, green: 1, blue: 1, alpha: 0.9)
        self.pause.addTarget(self, action: #selector(self.pauseGame), for: .touchUpInside)
        
        self.pause2.frame = CGRect(x: 45, y: self.view.bounds.height/20, width: self.view.bounds.width/20, height: self.view.bounds.width/6)
        self.pause2.layer.cornerRadius = 1
        self.pause2.backgroundColor = UIColor(displayP3Red: 1, green: 1, blue: 1, alpha: 0.9)
        self.pause2.addTarget(self, action: #selector(self.pauseGame), for: .touchUpInside)
        
        func addGradient(){
            
            let gradient:CAGradientLayer = CAGradientLayer()
            gradient.frame.size = self.view.frame.size
            gradient.colors = [UIColor(displayP3Red: 1, green: 0.9, blue: 0.9, alpha: 1).cgColor,UIColor(displayP3Red: 1, green: 0.5, blue: 0.5, alpha: 1).cgColor]
            self.view.layer.addSublayer(gradient)
            
        }
        
        addGradient()
        
        self.view.backgroundColor = UIColor(displayP3Red: 1, green: 0.9, blue: 0.9, alpha: 1)
        
        self.view.addSubview(self.tapToPlay)
        self.view.addSubview(self.tapToPlay2)
        
        self.view.addSubview(self.one)
        self.view.addSubview(self.five)
        self.view.addSubview(self.ten)
        
        self.view.addSubview(self.target)
        self.view.addSubview(self.friend)
        self.view.addSubview(self.square)
        self.view.addSubview(self.shadowS)
        self.view.addSubview(self.shadowF)
        self.view.addSubview(self.shadowT)
        
        self.view.addSubview(time)
        self.view.addSubview(self.pointsLabel)
        self.view.addSubview(self.gravLabel)
        self.view.addSubview(self.score)
        
        self.view.addSubview(self.middle)
        self.view.addSubview(self.right)
        self.view.addSubview(self.left)
        self.view.addSubview(restart)
        self.view.addSubview(playAgain)
        self.view.addSubview(pause)
        self.view.addSubview(pause2)
        
        self.grav()
        
    }
    
    @objc func pauseGame() {
        
        if isPaused == false {
            isPaused = true
            
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 30, initialSpringVelocity: 30, options: .allowUserInteraction, animations: {
                
                self.pause.frame = CGRect(x: 20, y: self.view.bounds.height/20, width: self.view.bounds.width/10, height: self.view.bounds.width/3)
                self.pause2.frame = CGRect(x: 70, y: self.view.bounds.height/20, width: self.view.bounds.width/10, height: self.view.bounds.width/3)
                
            }, completion: nil)
            
        } else if isPaused == true {
            isPaused = false
            
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 30, initialSpringVelocity: 30, options: .allowUserInteraction, animations: {
                
                self.pause.frame = CGRect(x: 20, y: self.view.bounds.height/20, width: self.view.bounds.width/20, height: self.view.bounds.width/6)
                self.pause2.frame = CGRect(x: 45, y: self.view.bounds.height/20, width: self.view.bounds.width/20, height: self.view.bounds.width/6)
                
            }, completion: nil)
            
            
        }
        
    }
    
    @objc func new() {
        
        counter = -3
        var timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.update), userInfo: nil, repeats: false)
        
        points = 0
        self.pointsLabel.text = "\(self.points)"
        
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 3, initialSpringVelocity: 3, options: .allowAnimatedContent, animations: {
            self.time.frame = CGRect(x:0, y:self.view.bounds.height/2 - 275, width: self.view.bounds.width, height: 100)
            self.restart.alpha = 0
            self.playAgain.alpha = 0
            self.score.alpha = 1
            self.pointsLabel.alpha = 1
            self.time.font = UIFont.systemFont(ofSize: 50)
        }, completion: nil)
        
    }
    
    @objc func update() {
        if points > option {
            
        } else if points < 0 {
            counter = 0
        } else if isPaused == false {
            counter += 1
            time.text = "\(counter)"
        }
    }
    
    @objc func hit() {
        var x = Int(arc4random_uniform(UInt32(self.view.bounds.width)))
        var y = Int(arc4random_uniform(UInt32(self.view.bounds.height)))
        
        if (friend.frame.intersects(target.frame)) && bugCount < 1 {
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 5, initialSpringVelocity: 5, options: .allowAnimatedContent, animations: {
                
                self.collision.removeItem(self.target)
                self.target.backgroundColor = UIColor.clear
                self.target.alpha = 0
                self.target.center = CGPoint(x: x, y: y)
                
            }, completion: nil)
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 5, initialSpringVelocity: 5, options: .allowAnimatedContent, animations: {
                self.target.backgroundColor = UIColor(displayP3Red: 1, green: 0.2, blue: 0.2, alpha: 0.5)
                self.target.alpha = 1
                self.collision.addItem(self.target)
            }, completion: nil)
            
        } else if (friend.frame.intersects(target.frame)) && playing == true && counter > 0 && isPaused == false {
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 5, initialSpringVelocity: 5, options: .allowAnimatedContent, animations: {
                
                self.points += 1
                self.pointsLabel.text = "\(self.points)"
                
                self.collision.removeItem(self.target)
                self.target.backgroundColor = UIColor.clear
                self.target.alpha = 0
                self.target.center = CGPoint(x: x, y: y)
                
            }, completion: nil)
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 5, initialSpringVelocity: 5, options: .allowAnimatedContent, animations: {
                self.target.backgroundColor = UIColor(displayP3Red: 1, green: 0.2, blue: 0.2, alpha: 0.5)
                self.target.alpha = 1
                self.collision.addItem(self.target)
            }, completion: nil)
            
        }
        
        if points > option {
            UIView.animate(withDuration: 5, delay: 0, usingSpringWithDamping: 3, initialSpringVelocity: 3, options: .allowUserInteraction, animations: {
                self.time.frame = CGRect(x:0, y:self.view.bounds.height/2 - 240, width: self.view.bounds.width, height: 500)
                self.time.font = UIFont.systemFont(ofSize: 150)
                self.restart.alpha = 1
                self.playAgain.alpha = 1
                self.score.alpha = 0
                self.pointsLabel.alpha = 0
            }, completion: nil) }
        
        repeat {
            
            UIView.animate(withDuration: 0, delay: 0.05, usingSpringWithDamping: 3, initialSpringVelocity: 3, options: .allowUserInteraction, animations: {
                
                self.shadowS.center = self.square.center
                self.shadowS.transform.a = self.square.transform.a
                self.shadowS.transform.b = self.square.transform.b
                self.shadowS.transform.c = self.square.transform.c
                self.shadowS.transform.d = self.square.transform.d
                
                self.shadowF.center = self.friend.center
                self.shadowF.transform.a = self.friend.transform.a
                self.shadowF.transform.b = self.friend.transform.b
                self.shadowF.transform.c = self.friend.transform.c
                self.shadowF.transform.d = self.friend.transform.d
                
                self.shadowT.center = self.target.center
                self.shadowT.transform.a = self.target.transform.a
                self.shadowT.transform.b = self.target.transform.b
                self.shadowT.transform.c = self.target.transform.c
                self.shadowT.transform.d = self.target.transform.d
                
            }, completion: nil)
            
        } while points < option
        
        if points != 0 && playing == false {
            
        }
        
        if playing == false {
            target.alpha = 0
            playAgain.alpha = 0
            restart.alpha = 0
        }
        
    }
    
    @objc func midTap() {
        
        if playing == true && isPaused == false {
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 5, initialSpringVelocity: 5, options: .allowUserInteraction, animations: {
                self.middle.alpha = 0
                self.middle.alpha = 1
                
                self.bugCount += 1
                
            }, completion: nil) }
        
        if playing == false {
            option = 4
            playing = true
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 3, initialSpringVelocity: 3, options: .allowUserInteraction, animations: {
                self.middle.backgroundColor = UIColor(displayP3Red: 1, green: 1, blue: 1, alpha: 0.2)
                self.left.backgroundColor = UIColor(displayP3Red: 1, green: 1, blue: 1, alpha: 0.2)
                self.right.backgroundColor = UIColor(displayP3Red: 1, green: 1, blue: 1, alpha: 0.2)
                self.one.text = "L"
                self.ten.text = "R"
                self.five.text = ""
                self.tapToPlay.alpha = 0
                self.tapToPlay2.alpha = 0
                self.time.alpha = 0.9
                self.gravLabel.alpha = 0.5
                self.pointsLabel.alpha = 0.9
                self.score.alpha = 0.5
                var timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
                self.friend.backgroundColor = UIColor(displayP3Red: 0.95, green: 0.95, blue: 1, alpha: 0.9)
                self.shadowF.backgroundColor = UIColor(displayP3Red: 0.95, green: 0.95, blue: 1, alpha: 0.6)
                self.target.backgroundColor = UIColor(displayP3Red: 1, green: 0.2, blue: 0.2, alpha: 0.5)
                self.target.alpha = 1
                self.shadowT.backgroundColor = UIColor(displayP3Red: 1, green: 0.2, blue: 0.2, alpha: 0.2)
                self.square.backgroundColor = UIColor(displayP3Red: 0.1, green: 0.3, blue: 1, alpha: 0.5)
                self.shadowS.backgroundColor = UIColor(displayP3Red: 0.1, green: 0.3, blue: 1, alpha: 0.2)
                self.view.backgroundColor = UIColor(displayP3Red: 1, green: 0.9, blue: 0.9, alpha: 1)
                self.view.willRemoveSubview(self.tapToPlay)
            }, completion: nil)
        } else {
            
            if self.counterRight == true && self.counterUp == true && isPaused == false {
                self.direction = "Down"
                UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
                    self.gravLabel.text = "Gravity \(self.direction)"
                    self.gravLabel.alpha = 0.3
                    self.gravLabel.alpha = 0
                }, completion: nil)
                self.counterUp = false
                self.gravity.gravityDirection = CGVector(dx: 0 - 0.5, dy: 0.5)
            } else if self.counterRight == false && self.counterUp == true && isPaused == false {
                self.direction = "Down"
                UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
                    self.gravLabel.text = "Gravity \(self.direction)"
                    self.gravLabel.alpha = 0.3
                    self.gravLabel.alpha = 0
                }, completion: nil)
                self.counterUp = false
                self.gravity.gravityDirection = CGVector(dx: 0.5, dy: 0.5)
            } else if self.counterRight == true && self.counterUp == false && isPaused == false {
                self.direction = "Up"
                UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
                    self.gravLabel.text = "Gravity \(self.direction)"
                    self.gravLabel.alpha = 0.3
                    self.gravLabel.alpha = 0
                }, completion: nil)
                self.counterUp = true
                self.gravity.gravityDirection = CGVector(dx: 0 - 0.5, dy: 0 - 0.5)
            } else if self.counterRight == false && self.counterUp == false && isPaused == false {
                self.direction = "Up"
                UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
                    self.gravLabel.text = "Gravity \(self.direction)"
                    self.gravLabel.alpha = 0.3
                    self.gravLabel.alpha = 0
                }, completion: nil)
                self.counterUp = true
                self.gravity.gravityDirection = CGVector(dx: 0.5, dy: 0 - 0.5)
            }
        }
        
    }
    
    @objc func leftTap() {
        
        if playing == true && isPaused == false {
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 5, initialSpringVelocity: 5, options: .allowUserInteraction, animations: {
                self.left.alpha = 0
                self.left.alpha = 1
                
                self.bugCount += 1
                
            }, completion: nil) }
        
        if playing == false && isPaused == false {
            playing = true
            option = 0
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 3, initialSpringVelocity: 3, options: .allowUserInteraction, animations: {
                self.middle.backgroundColor = UIColor(displayP3Red: 1, green: 1, blue: 1, alpha: 0.2)
                self.left.backgroundColor = UIColor(displayP3Red: 1, green: 1, blue: 1, alpha: 0.2)
                self.right.backgroundColor = UIColor(displayP3Red: 1, green: 1, blue: 1, alpha: 0.2)
                self.one.text = "L"
                self.ten.text = "R"
                self.five.text = ""
                self.tapToPlay.alpha = 0
                self.tapToPlay2.alpha = 0
                self.time.alpha = 0.9
                self.gravLabel.alpha = 0.5
                self.pointsLabel.alpha = 0.9
                self.score.alpha = 0.5
                var timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
                self.friend.backgroundColor = UIColor(displayP3Red: 0.95, green: 0.95, blue: 1, alpha: 0.9)
                self.shadowF.backgroundColor = UIColor(displayP3Red: 0.95, green: 0.95, blue: 1, alpha: 0.6)
                self.target.backgroundColor = UIColor(displayP3Red: 1, green: 0.2, blue: 0.2, alpha: 0.5)
                self.target.alpha = 1
                self.shadowT.backgroundColor = UIColor(displayP3Red: 1, green: 0.2, blue: 0.2, alpha: 0.2)
                self.square.backgroundColor = UIColor(displayP3Red: 0.1, green: 0.3, blue: 1, alpha: 0.5)
                self.shadowS.backgroundColor = UIColor(displayP3Red: 0.1, green: 0.3, blue: 1, alpha: 0.2)
                self.view.backgroundColor = UIColor(displayP3Red: 1, green: 0.9, blue: 0.9, alpha: 1)
                self.view.willRemoveSubview(self.tapToPlay)
            }, completion: nil)
        } else {
            if self.counterRight == false && self.counterUp == false && isPaused == false {
                self.direction = "Up"
                UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
                    self.gravLabel.text = "Gravity \(self.direction)"
                    self.gravLabel.alpha = 0.3
                    self.gravLabel.alpha = 0
                }, completion: nil)
                self.counterRight = true
                self.counterUp = true
                self.gravity.gravityDirection = CGVector(dx: 0 - 0.5, dy: 0 - 0.5)
            } else if self.counterRight == false && self.counterUp == true && isPaused == false {
                self.direction = "Down"
                UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
                    self.gravLabel.text = "Gravity \(self.direction)"
                    self.gravLabel.alpha = 0.3
                    self.gravLabel.alpha = 0
                }, completion: nil)
                self.counterRight = true
                self.counterUp = false
                self.gravity.gravityDirection = CGVector(dx: 0 - 0.5, dy: 0.5)
            }
        }
    }
    @objc func rightTap() {
        
        if playing == true && isPaused == false {
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 5, initialSpringVelocity: 5, options: .allowUserInteraction, animations: {
                self.right.alpha = 0
                self.right.alpha = 1
                
                self.bugCount += 1
                
            }, completion: nil) }
        
        if playing == false {
            playing = true
            option = 9
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 3, initialSpringVelocity: 3, options: .allowUserInteraction, animations: {
                self.middle.backgroundColor = UIColor(displayP3Red: 1, green: 1, blue: 1, alpha: 0.2)
                self.left.backgroundColor = UIColor(displayP3Red: 1, green: 1, blue: 1, alpha: 0.2)
                self.right.backgroundColor = UIColor(displayP3Red: 1, green: 1, blue: 1, alpha: 0.2)
                self.one.text = "L"
                self.ten.text = "R"
                self.five.text = ""
                self.tapToPlay.alpha = 0
                self.tapToPlay2.alpha = 0
                self.time.alpha = 0.9
                self.gravLabel.alpha = 0.5
                self.pointsLabel.alpha = 0.9
                self.score.alpha = 0.5
                var timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
                self.friend.backgroundColor = UIColor(displayP3Red: 0.95, green: 0.95, blue: 1, alpha: 0.9)
                self.shadowF.backgroundColor = UIColor(displayP3Red: 0.95, green: 0.95, blue: 1, alpha: 0.6)
                self.target.backgroundColor = UIColor(displayP3Red: 1, green: 0.2, blue: 0.2, alpha: 0.5)
                self.target.alpha = 1
                self.shadowT.backgroundColor = UIColor(displayP3Red: 1, green: 0.2, blue: 0.2, alpha: 0.2)
                self.square.backgroundColor = UIColor(displayP3Red: 0.1, green: 0.3, blue: 1, alpha: 0.5)
                self.shadowS.backgroundColor = UIColor(displayP3Red: 0.1, green: 0.3, blue: 1, alpha: 0.2)
                self.view.backgroundColor = UIColor(displayP3Red: 1, green: 0.9, blue: 0.9, alpha: 1)
                self.view.willRemoveSubview(self.tapToPlay)
            }, completion: nil)
        } else {
            if self.counterRight == true && self.counterUp == true && isPaused == false {
                self.direction = "Down"
                UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
                    self.gravLabel.text = "Gravity \(self.direction)"
                    self.gravLabel.alpha = 0.3
                    self.gravLabel.alpha = 0
                }, completion: nil)
                self.counterRight = false
                self.counterUp = false
                self.gravity.gravityDirection = CGVector(dx: 0.5, dy: 0.5)
            } else if self.counterRight == true && self.counterUp == false && isPaused == false {
                self.direction = "Up"
                UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
                    self.gravLabel.text = "Gravity \(self.direction)"
                    self.gravLabel.alpha = 0.3
                    self.gravLabel.alpha = 0
                }, completion: nil)
                self.counterRight = false
                self.counterUp = true
                self.gravity.gravityDirection = CGVector(dx: 0.5, dy: 0 - 0.5)
            } else if self.counterRight == false && self.counterUp == false && isPaused == false {
                self.direction = "Up"
                UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
                    self.gravLabel.text = "Gravity \(self.direction)"
                    self.gravLabel.alpha = 0.3
                    self.gravLabel.alpha = 0
                }, completion: nil)
                self.counterUp = true
                self.gravity.gravityDirection = CGVector(dx: 0.5, dy: 0 - 0.5) }
        }
    }
    
    @objc func grav() {
        
        animator = UIDynamicAnimator(referenceView: self.view);
        animator?.addBehavior(collision);
        
        collision.addItem(square)
        collision.addItem(friend)
        collision.addItem(target)
        
        collision.translatesReferenceBoundsIntoBoundary = true
        gravity.addItem(square);
        gravity.gravityDirection = CGVector(dx:0, dy:0)
        animator?.addBehavior(gravity);
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

