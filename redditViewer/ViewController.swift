//
//  ViewController.swift
//  redditViewer
//
//  Created by Andy Woodard on 9/19/16.
//  Copyright © 2016 Andy Woodard. All rights reserved.
//

import UIKit

var objects = [[String: String]]()
let base = "https://www.reddit.com/"
var sub = ""
let format = ".json"
var suffix = ""
var tag = 0

class ViewController: UITableViewController {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    @IBAction func UnwindtoMain(segue: UIStoryboardSegue){
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }
    
   
    
    
    @IBAction func loadMorePressed(sender: AnyObject) {
        setURL()
        
    }
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    
        setURL()
    
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 240
    }
    
    override func viewDidAppear(animated: Bool) {
        self.tableView.reloadData()
    }
    
    func parseJSON(json: JSON) {
        
        
        
        for result in json["data"]["children"].arrayValue {
            let title = result["data"]["title"].stringValue
            let body = result["data"]["selftext"].stringValue
            let score = String(result["data"]["score"].intValue)
            let subreddit = result["data"]["subreddit"].stringValue
            let author = result["data"]["author"].stringValue
            let nextID = result["data"]["name"].stringValue
            let postID = result["data"]["id"].stringValue
            
            
            
            
            var thumbnail = result["data"]["preview"]["images"][0]["source"]["url"].string
            //var thumbnail = result["data"]["preview"]["images"]["thumbnail"].string
            
            if thumbnail == nil{
                thumbnail = "nil"
            }
            if thumbnail!.hasSuffix(".gif?") == true {
                thumbnail = "nil"
            }
            if thumbnail!.rangeOfString("gif") != nil {
                thumbnail = "nil"
            }
            
            
            let dict = ["title": title, "body": body, "score": score, "thumbnail": thumbnail!, "author": author, "subreddit": subreddit, "nextID": nextID, "postID": postID]
            objects.append(dict)
            
        }
        tableView.reloadData()
    }
    
    func setURL(){
        print(base + sub + format + suffix)
        if let url = NSURL(string: base + sub + format + suffix){
            if let data = NSData(contentsOfURL: url){
                
                var json = JSON(data: data)
                
                self.navigationItem.title = sub
                
                parseJSON(json)
            }
        }
    }
    
    


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (objects.count + 1)
    }
    
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! CustomTableViewCell
        
        
        cell.authorLabel.hidden = false
        cell.subredditLabel.hidden = false
        cell.thumbnail.hidden = false
        cell.titleLabel.hidden = false
        cell.loadButton.hidden = true
        

        
        if indexPath.row < (objects.count){
        let object = objects[indexPath.row]
        cell.backgroundSquare.image = UIImage(named: "squareFrame")
        cell.thumbnail.image = UIImage(named: "LogoV1Black")
            
            
        
        if object["thumbnail"] != "nil"{
            if let url = NSURL(string: object["thumbnail"]!){
                if let data = NSData(contentsOfURL: url){
                    
                    cell.thumbnail.image = UIImage(data: data)
                    
                    }
                }
            }
        
        
        cell.thumbnail.layer.cornerRadius = 90
        cell.thumbnail.clipsToBounds = true
        cell.authorLabel.text = object["author"]
        cell.subredditLabel.text = object["subreddit"]
        cell.titleLabel.lineBreakMode = .ByWordWrapping
        cell.titleLabel.numberOfLines = 0
        cell.titleLabel.text = object["title"]
        //cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        } else{
            cell.authorLabel.hidden = true
            cell.subredditLabel.hidden = true
            cell.thumbnail.hidden = true
            cell.titleLabel.hidden = true
            cell.loadButton.hidden = false
            if indexPath.row > 1{
                let lastObject = objects[indexPath.row - 1]
            suffix = "?after=" + lastObject["nextID"]!
            }
        }
        
     return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let object = objects[indexPath.row]
        suffix = object["postID"]!
    }
}





