# PluginPresenter - iOS
## OVERVIEW

Protocol to allow to present an Applicaster plugin and wait for a response in that plugin.
Using this protocol you can present in your plugin another plugin and take a result from there. This is useful to present modally other plugins, or to insert a screen between the flow of another plugin.

## IMPLEMENTATION EXAMPLE

#### Calling plugin

Here is an example on how to implement the call to present a plugin.

``` swift
import ZappPlugins
import PluginPresenter

// {. . .}

guard let pluginModel = ZPPluginManager.pluginModelById("my_plugin_identifier"),
let classType = ZPPluginManager.adapterClass(pluginModel) as? ZPAdapterProtocol.Type,
let myPlugin = classType.init(configurationJSON:pluginModel.configurationJSON) as? PluginPresenterProtocol else {
   return
}

myPlugin.presentPlugin(parentViewController: self, extraData: myExtraData, completion: { (success, data) in
    //Handle the response
})
```

#### Receiver plugin

Here is an example on how to implement the plugin that will be presented.

``` swift
public class MyPlugin: ZPAdapterProtocol, PluginPresenterProtocol {

    // ZPAdapterProtocol
    // {. . .}

    // PluginPresenterProtocol
    public func presentPlugin(parentViewController: UIViewController, extraData: Any?,
                              completion: PluginPresenterProtocol.Completion?) {
        let myVC = MyViewController(extraData:extraData, completion:completion)
        parentViewController.present(myVC, animated: true)
    }

}
```

And remember to call the completion closure in some point of your code.