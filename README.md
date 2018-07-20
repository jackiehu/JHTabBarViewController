# JHTabBarViewController
抄袭自LCTabBarController 添加动画效果等等


## 使用方法
 
```objc
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    ViewController *vc1 =[ViewController new];
    vc1.tabBarItem.image = [UIImage imageNamed:@"tab_icon_home_line"];
    vc1.tabBarItem.selectedImage = [UIImage imageNamed:@"tab_icon_home_sel"];
    
    ViewController *vc2 = [ViewController new];
    vc2.tabBarItem.image = [UIImage imageNamed:@"tab_icon_follow_line"];
    vc2.tabBarItem.selectedImage = [UIImage imageNamed:@"tab_icon_follow_sel"];
    
    UINavigationController *navC1 = [[UINavigationController alloc] initWithRootViewController:vc1];
    UINavigationController *navC2 = [[UINavigationController alloc] initWithRootViewController:vc2];
    
    JHTabBarViewController *tabBarController = [[JHTabBarViewController alloc] init];
    
    [tabBarController addChildViewController:navC1];
    [tabBarController addChildViewController:navC2];
      没有文字图片居中请设置itemImageRatio为 1
    tabBarController.itemImageRatio         = 1.0f;
    self.window.rootViewController =tabBarController;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
```
iOS11重影
```
[self.tabBarController removeOriginControls];
``` 
切换
``` 
[(JHTabBarViewController *)[UIApplication sharedApplication].keyWindow.rootViewController setSelectedIndex:3]; 
``` 
##  安装
### 1.手动添加:<br>
*   1.将 JHTabBarViewController 文件夹添加到工程目录中<br>
*   2.导入 JHTabBarViewController.h

### 2.CocoaPods:<br>
*   1.在 Podfile 中添加 pod 'JHTabBarViewController'<br>
*   2.执行 pod install 或 pod update<br>
*   3.导入 JHTabBarViewController.h



##  许可证
JHTabBarViewController 使用 MIT 许可证，详情见 LICENSE 文件
