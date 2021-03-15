//
//  ViewController.swift
//  SampleApp
//
//  Created by Ryota on 2020/12/15.
//

import UIKit

class ViewController: UIViewController {
    
    var seniURL = ""
    var seniTitle = ""
    
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate var articles: [Article] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setToolbarHidden(true, animated: true)
        fetchArticles()
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        self.navigationController?.navigationBar.titleTextAttributes = AppCongig.Navigation.titleTextAttributesWithSize17
    }
    
    //画面遷移した時に読み込まれるメソッド
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecond" {
            let nextView = segue.destination as! SecondViewController
            nextView.argTitle = seniTitle
            nextView.argURL = seniURL
        }
    }
    
    //遷移画面から戻った時に読み込まれるメソッド
    override func viewDidAppear(_ animated: Bool) {
        super .viewDidAppear(animated)
        if let indexPatth = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPatth, animated: true)
        }
        tableView.allowsSelection = true
    }
    
    private func fetchArticles() {
        guard let url = URL(string: "https://qiita.com/api/v2/items?page=1&per_page=20") else { return }
        let task: URLSessionTask  = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            do {
                guard let data = data else { return }
                guard let jsonArray = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as? [Any] else { return }
                let articlesJson = jsonArray.compactMap { (json: Any) -> [String: Any]? in
                    return json as? [String: Any]
                }
                let articles = articlesJson.map { (articleJson: [String: Any]) -> Article in
                    return Article(json: articleJson)
                }
                DispatchQueue.main.async() {
                    self.articles = articles
                }
            } catch {
                print(error)
            }
        })
        task.resume()
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        let article = articles[indexPath.row]
        cell.bindData(article: article)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = articles[indexPath.row]
        seniURL =  article.urlString
        seniTitle = article.title
        //tableView.deselectRow(at: indexPath, animated: true) //何を見ていたのかすぐに分かるように今回は残しておくことにしました。
        self.performSegue(withIdentifier: "toSecond", sender: nil)
        tableView.allowsSelection = false //遷移直前に他のセルをタップすると遷移先が変わってしまうのを防ぐため、1度セルをタップしてから戻ってくるまでタップを受け付けないようにしました。
    }
}

struct AppCongig {
    struct Navigation {

        static let fontWithSize13 = UIFont(name: "Helvetica Neue", size: 13)!
        static let titleTextAttributesWithSize13: [NSAttributedString.Key : Any] = [NSAttributedString.Key.font: AppCongig.Navigation.fontWithSize13]
        
        static let fontWithSize17 = UIFont(name: "Helvetica Neue", size: 17)!
        static let titleTextAttributesWithSize17: [NSAttributedString.Key : Any] = [NSAttributedString.Key.font: AppCongig.Navigation.fontWithSize17]
    }
}
