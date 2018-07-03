//
//  AudiobooksTableViewController.swift
//  Buka3
//
//  Created by mzk on 28/05/2017.
//
//

import UIKit

class AudiobooksTableViewController: UITableViewController, UISplitViewControllerDelegate {
    
    private let cellReuseIdentifier = "AudiobookCell"
    private let showDetailSegueIdentifier = "ShowAudiobook"
    private let sectionHeaderReuseIdentifier = "HeaderView"
    
    var audiobooks = AudiobooksDataSource()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.splitViewController?.delegate = self
    }
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        if primaryViewController.contents == self {
            if let avc = secondaryViewController.contents as? AudiobookDetailViewController, avc.audiobook == nil {
                return true
            }
        }
        return false
    }
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return audiobooks.numberOfCategories()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return audiobooks.numberOfAudiobooks(inCategory: section)!
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! AudiobookTableViewCell
        
        if let audiobook = audiobooks.getAudiobook(inCategory: indexPath.section, atIndex: indexPath.row) {
            cell.coverImageView.image = audiobook.cover
            cell.titleLabel.text = audiobook.title
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: showDetailSegueIdentifier, sender: nil)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return audiobooks.getCategory(atIndex: section)
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var destinationViewController = segue.destination
        if let navigationViewController = destinationViewController as? UINavigationController {
            destinationViewController = navigationViewController.visibleViewController ?? destinationViewController
        }
        if segue.identifier == showDetailSegueIdentifier,
            let audiobookDetailView = destinationViewController as? AudiobookDetailViewController,
            let indexPath = tableView.indexPathForSelectedRow,
            let audiobook = audiobooks.getAudiobook(inCategory: indexPath.section, atIndex: indexPath.row) {
            audiobookDetailView.audiobook = audiobook
            audiobookDetailView.navigationItem.title = audiobook.title
        }
    }
}

extension UIViewController
{
    var contents: UIViewController {
        if let navcon = self as? UINavigationController {
            return navcon.visibleViewController ?? self
        } else {
            return self
        }
    }
}
