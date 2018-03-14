//
//  HomePageRollerViewCell.h
//  ClubSimObjC
//
//  Created by Ernest Leung on 13/3/2018.
//  Copyright © 2018 ernestleung. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BannerModel.h"

@interface HomePageRollerViewCell : UITableViewCell <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *imageScrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *imagePageControl;

- (void) configureCellWith: (NSArray <BannerModel> *) imageData andSize: (int) size;

@end
