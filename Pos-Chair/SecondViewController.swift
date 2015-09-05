//
//  SecondViewController.swift
//  Pos-Chair
//
//  Created by Paul MD on 9/4/15.
//  Copyright (c) 2015 Paul MD. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var Image1: UIImageView!
    @IBOutlet weak var Image2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Image1.hidden = false
        Image2.hidden = true
        
        var leftSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipes:"))
        var rightSwipe = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipes:"))
        
        leftSwipe.direction = .Left
        rightSwipe.direction = .Right
        
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
        
        setupGraphDisplay()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handleSwipes(sender:UISwipeGestureRecognizer) {
        if (sender.direction == .Left) {
            if Image1.hidden == false {
                Image2.hidden = false
                Image1.hidden = true
            }
            else {
                Image1.hidden = true
                Image2.hidden = true
            }
            
        }
    }
    
    // Outlets
    
    @IBOutlet weak var ContainerView1: UIView!

    @IBOutlet weak var ContainerView2: UIView!
    
    @IBOutlet weak var GraphView1: GraphView!
    
    @IBOutlet weak var GraphView2: GraphView!
    
    func setupGraphDisplay() {
        
        //Use 7 days for graph - can use any number,
        //but labels and sample data are set up for 7 days
        let noOfDays:Int = 7
        
        //2 - indicate that the graph needs to be redrawn
        GraphView1.setNeedsDisplay()
        GraphView2.setNeedsDisplay()
        
        //set up labels
        //day of week labels are set up in storyboard with tags
        //today is last day of the array need to go backwards
        
        //4 - get today's day number
        let dateFormatter = NSDateFormatter()
        let calendar = NSCalendar.currentCalendar()
        let componentOptions:NSCalendarUnit = .CalendarUnitWeekday
        let components = calendar.components(componentOptions,
            fromDate: NSDate())
        var weekday = components.weekday
        
        let days = ["S", "S", "M", "T", "W", "T", "F"]
        
        //5 - set up the day name labels with correct day
        for i in reverse(1...days.count) {
            if let labelView = GraphView1.viewWithTag(i) as? UILabel {
                if weekday == 7 {
                    weekday = 0
                }
                labelView.text = days[weekday--]
                if weekday < 0 {
                    weekday = days.count - 1
                }
            }
        }
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
