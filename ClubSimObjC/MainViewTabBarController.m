//
//  MainViewTabBarController.m
//  ClubSimObjC
//
//  Created by Ernest Leung on 14/3/2018.
//  Copyright © 2018 ernestleung. All rights reserved.
//

#import <FontAwesomeKit/FAKFontAwesome.h>
#import <FontAwesomeKit/FAKIonIcons.h>
#import "MainViewTabBarController.h"

@interface MainViewTabBarController ()

@end

@implementation MainViewTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    //! set profile tab bar icon
    UITabBarItem *profileItem = (UITabBarItem *)[self.tabBar.items objectAtIndex:1];
    
    FAKFontAwesome *profileIcon = [FAKFontAwesome userIconWithSize:26];
    profileItem.image = [profileIcon imageWithSize:CGSizeMake(26,26)];
    profileItem.selectedImage = [profileIcon imageWithSize:CGSizeMake(26,26)];
    
    //! set support tab bar icon
    UITabBarItem *supportItem = (UITabBarItem *)[self.tabBar.items objectAtIndex:2];
    
    FAKIonIcons *supportIcon = [FAKIonIcons chatbubbleWorkingIconWithSize:26];
    supportItem.image = [supportIcon imageWithSize:CGSizeMake(26,26)];
    supportItem.selectedImage = [supportIcon imageWithSize:CGSizeMake(26,26)];
    
    //! set more tab bar icon
    UITabBarItem *moreItem = (UITabBarItem *)[self.tabBar.items objectAtIndex:3];
    
    FAKIonIcons *moreIcon = [FAKIonIcons iosMoreIconWithSize:26];
    moreItem.image = [moreIcon imageWithSize:CGSizeMake(26,26)];
    moreItem.selectedImage = [moreIcon imageWithSize:CGSizeMake(26,26)];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
