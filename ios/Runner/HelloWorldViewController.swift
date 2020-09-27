import Foundation

/**
 * Helloworldを表示するだけの単純なViewController
 * Flutter画面から非Flutterへ遷移できることを確認するために使用する
 */
class HelloWorldViewController : UIViewController {
    
    override func viewDidLoad() {
        let label = UILabel(frame: CGRect(x: 100, y: 100, width: 200, height: 50))
        label.text = "Hello World!"
        self.title = "none flutter screen"
        let leftbutton = UIBarButtonItem(title: "back", style: UIBarButtonItem.Style.done, target: self, action:"goTop:")

        self.navigationItem.leftBarButtonItem = leftbutton
        self.view.addSubview(label)
        self.view.backgroundColor = UIColor.white
    }
    
    @objc func goTop(_ sender: UIBarButtonItem!) {
        self.dismiss(animated: true, completion: nil)
    }
}
