# IdxCtvSdk

## Integration DmpCtv example

```swift
import IdxCtvSdk

class ViewController: UIViewController {
    var dmpCtv: DmpCtv?
    
    ...

    override func viewDidLoad() {
        super.viewDidLoad()

        self.dmpCtv = DmpCtv(providerId: "Your-provider-ID", appName: "My app name", appVersion: "1.0.0")
        
        let requestProps = IdxCtvSdk.EventRequestPropertiesStruct(
            url: "",
            title: "",
            domain: "",
            author: "",
            category: "",
            description: "",
            tags: []
        )

        self.dmpCtv?.sendPageViewEvent(properties: requestProps) { error in
            print("CTV EVENTS: \(String(describing: self.dmpCtv?.getDefinitionIdsAsString()))")
        }
    }
}
```

## Author

IDX LTD, https://www.id-x.co.il/

## License

IdxDmpSdk is available under the MIT license. See the LICENSE file for more info.
