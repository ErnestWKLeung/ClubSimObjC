//
//  HomePageTableViewCell.h
//  ClubSimObjC
//
//  Created by Ernest Leung on 12/3/2018.
//  Copyright © 2018 ernestleung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomePageTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imgIV;
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
@property (weak, nonatomic) IBOutlet UILabel *descLbl;

@end
