//
//  ViewController.swift
//  FirrstAPIAssignemts
//
//  Created by Mac on 08/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var Posttableview: UITableView!
    
    private let reuseidentifiertableviewcell = "PostTableViewCell"
    
    var posts : [Post] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jsonparcing()
        registerwithXIb()
        }
    func jsonparcing(){
        let urlstring = "https://jsonplaceholder.typicode.com/comments"
        
        let url = URL(string: urlstring)
        
        var urlRequst = URLRequest(url: url!)
        urlRequst.httpMethod = "GET"
        
        let urlsession =  URLSession(configuration: .default)
        
        var datatask = urlsession.dataTask(with: urlRequst)
        { data ,response ,error in
            print(data)
            print(response)
            print(error)
            
            let jsonResponse = try! JSONSerialization.jsonObject(with: data!) as! [[String:Any]]
            
            for eachjsonObject in jsonResponse {
                let eachpost  = eachjsonObject
                let eachpostid = eachpost["postId"] as! Int
                let eachid = eachpost ["id"] as! Int
                let eachpostname = eachpost ["name"] as! String
                let eachemail = eachpost ["email" ] as! String
                let eachbody = eachpost ["body"] as! String
                
                let postobject = Post(postid: eachpostid, id: eachid, name: eachpostname, email: eachemail, body: eachbody)
                
                self.posts.append(postobject)
            }
            DispatchQueue.main.async {
                self.Posttableview.reloadData()
                
            }
        }
        datatask.resume()
    }
    
    func registerwithXIb () {
        
        let uinib = UINib(nibName: reuseidentifiertableviewcell, bundle: nil)
        Posttableview.register(uinib, forCellReuseIdentifier: reuseidentifiertableviewcell)
        
    }
    
}
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let posttableviewcell = self.Posttableview.dequeueReusableCell(withIdentifier: reuseidentifiertableviewcell, for: indexPath) as! PostTableViewCell
        
        let eachpostfetchfromarrey = posts[indexPath.row]
        
        posttableviewcell.postidlabel.text = String(eachpostfetchfromarrey.postid)
        posttableviewcell.idlabel.text = String(eachpostfetchfromarrey.id)
        posttableviewcell.postnameLabel.text = eachpostfetchfromarrey.name
        posttableviewcell.postemaillabel.text = eachpostfetchfromarrey.email
        posttableviewcell.postbodyLabel.text = eachpostfetchfromarrey.body
        posttableviewcell.backgroundColor = .darkGray
        return posttableviewcell
    }
}
extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        160
        
        
    }
    
}
