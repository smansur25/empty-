//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    var businesses: [Business]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        var swipeLeft = UISwipeGestureRecognizer(target: self, action: "swipeLeft:")
        swipeLeft.direction = .Left
        self.view.addGestureRecognizer(swipeLeft)
        
        var swipeRight = UISwipeGestureRecognizer(target: self, action: "swipeRight:")
        swipeRight.direction = .Right
        self.view.addGestureRecognizer(swipeRight)
        
        Business.searchWithTerm("asian", completion: { (businesses: [Business]!, error: NSError!) -> Void in
            self.businesses = businesses
        
            for business in businesses {
                print(business.name!)
                print(business.address!)
            }
        })

/* Example of Yelp search with more search options specified
        Business.searchWithTerm("Restaurants", sort: .Distance, categories: ["asianfusion", "burgers"], deals: true) { (businesses: [Business]!, error: NSError!) -> Void in
            self.businesses = businesses
            
            for business in businesses {
                print(business.name!)
                print(business.address!)
            }
        }
*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func swipeLeft(recognizer: UISwipeGestureRecognizer) {
        self.performSegueWithIdentifier("leftDirection", sender: self)
        print(UIApplication.sharedApplication().keyWindow!.rootViewController)
    }
    
    func swipeRight(recognizer: UISwipeGestureRecognizer) {
        self.performSegueWithIdentifier("rightDirection", sender: self)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
