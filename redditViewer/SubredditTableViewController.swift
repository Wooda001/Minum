//
//  SubredditTableViewController.swift
//  redditViewer
//
//  Created by Andy Woodard on 9/28/16.
//  Copyright © 2016 Andy Woodard. All rights reserved.
//

import UIKit

class SubredditTableViewController: UITableViewController {
    
    @IBAction func backButton(sender: AnyObject) {
        performSegueWithIdentifier("subSegue", sender: SubredditTableViewController.self)
    }
    var subredditList = [
    "Front Page",
    "/r/all",
    "/r/announcements",
    "/r/AdviceAnimals",
    "/r/Art",
    "/r/AskReddit",
    "/r/askscience",
    "/r/aww",
    "/r/bestof",
    "/r/blog",
    "/r/books",
    "/r/carporn",
    "/r/crazyideas",
    "/r/creepy",
    "/r/dataisbeautiful",
    "/r/DIY",
    "/r/Documentaries",
    "/r/EarthPorn",
    "/r/explainlikeimfive",
    "/r/food",
    "/r/funny",
    "/r/Futurology",
    "/r/gadgets",
    "/r/gaming",
    "/r/GetMotivated",
    "/r/gifs",
    "/r/history",
    "/r/houseporn",
    "/r/IAmA",
    "/r/InternetIsBeautiful",
    "/r/Jokes",
    "/r/LifeProTips",
    "/r/listentothis",
    "/r/mildlyinteresting",
    "/r/movies",
    "/r/Music",
    "/r/news",
    "/r/nosleep",
    "/r/nottheonion",
    "/r/OldSchoolCool",
    "/r/personalfinance",
    "/r/philosophy",
    "/r/photoshopbattles",
    "/r/pics",
    "/r/politics",
    "/r/programming",
    "/r/roomporn",
    "/r/science",
    "/r/Showerthoughts",
    "/r/space",
    "/r/sports",
    "/r/technology",
    "/r/television",
    "/r/tifu",
    "/r/todayilearned",
    "/r/trees",
    "/r/TwoXChromosomes",
    "/r/UpliftingNews",
    "/r/videos",
    "/r/wallpapers",
    "/r/worldnews",
    "/r/WritingPrompts" ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

   

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return subredditList.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("SubCell")
        cell?.textLabel?.text = subredditList[indexPath.row]
        
        return cell!
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let subString = subredditList[indexPath.row]
        
        suffix = ""
        
        if subString == "Front Page"{
            sub = ""
        }else{
            sub = subString
        }
        
        
        
        
        //performSegueWithIdentifier("subSegue", sender: SubredditTableViewController.self)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationVC = segue.destinationViewController as! UINavigationController
        objects.removeAll()
        destinationVC.title = sub
        
        self.navigationController?.popViewControllerAnimated(true)
    }
   
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
