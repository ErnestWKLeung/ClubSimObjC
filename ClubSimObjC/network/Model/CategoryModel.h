//
//  CategoryModel.h
//  ClubSimObjC
//
//  Created by Ernest Leung on 13/3/2018.
//  Copyright © 2018 ernestleung. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol CategoryModel
@end

@interface CategoryModel :JSONModel
@property (nonatomic, strong) NSString *img;
@property (nonatomic, strong) NSString *priceimg;
@property (nonatomic, strong) NSString *color;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *avatar;
@property (nonatomic, strong) NSString *desc;
@end
