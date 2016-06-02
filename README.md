##iOS项目使用说明
*编译环境:XCode 7.**

### 项目运行
Clone 代码后，初次执行前，需要打开`Terminal`并切换至项目根目录下。

安装`CocoaPods`(http://code4app.com/article/cocoapods-install-usage)

```
sudo gem install cocoapods
```

然后使用CocoaPods安装项目依赖
```
cocoapod install
```

项目运行

点击图标进入项目

![图片1][1]


**Tip：由于用到了 cocoapod进行第三方包管理，首次运行需要下载相关的包依赖，可能会有点久，需耐心等待**


### 项目结构

    .
    ├── iOS项目
    │   ├── Sections：各个功能模块的视图与控制器
    │   ├── General：通用类
    │   │   ├── Views：通用的视图
    │   │   └── Categories：category扩展
    │   ├── Macro：环境变量
    │   │   ├── AppMacro：app本地配置
    │   │   ├── Constants：各个接口地址配置
    │   │   ├── UtilsMacro：工具宏
    │   │   └── VendorMacro：第三方账号配置
    │   ├── Resources：资源文件
    │   ├── Helpers：一些封装好的管理组件
    │   └── Vendor：用到的一些第三方类库，一般都有改动
    └── Pods：项目使用了[CocoaPods](http://code4app.com/article/cocoapods-install-usage)这个类库管理工具

[1]:080A016E-5FD4-4941-A857-572C44C293E4.png
