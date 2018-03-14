//
//  BannerModel.h
//  ClubSimObjC
//
//  Created by Ernest Leung on 13/3/2018.
//  Copyright © 2018 ernestleung. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol BannerModel
@end

@interface BannerModel : JSONModel

@property (nonatomic, strong) NSString *bannerid;
@property (nonatomic, strong) NSString *imagelink;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *hreflink;
@end
