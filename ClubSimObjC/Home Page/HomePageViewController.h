//
//  HomePageViewController.h
//  ClubSimObjC
//
//  Created by Ernest Leung on 9/3/2018.
//  Copyright © 2018 ernestleung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomePageViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UILabel *textLbl;
@property (weak, nonatomic) IBOutlet UIImageView *bgIV;

- (UITableViewCell *)imageScrollView;

@end

