//
//  ViewController.swift
//  SeemuSwiftiAd


import UIKit
import iAd

class ViewController: UIViewController, ADBannerViewDelegate {

    var UIiAd: ADBannerView = ADBannerView()
    
    func appdelegate() -> AppDelegate {
        return UIApplication.sharedApplication().delegate as AppDelegate
    }
    
    override func viewWillAppear(animated: Bool) {
        var SH = UIScreen.mainScreen().bounds.height
        
        UIiAd.delegate = self
        UIiAd = self.appdelegate().UIiAd
        UIiAd.frame = CGRectMake(0, SH - 50, 0, 0)
        self.view.addSubview(UIiAd)
    }
    
    override func viewWillDisappear(animated: Bool) {
        UIiAd.delegate = nil
        //UIiAd = nil
        UIiAd.removeFromSuperview()
    }
    
    func bannerViewDidLoadAd(banner: ADBannerView!) {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(1)
        UIiAd.alpha = 1
        UIView.commitAnimations()
    }
    
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(0)
        UIiAd.alpha = 1
        UIView.commitAnimations()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

