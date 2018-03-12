//
//  HomeModel.h
//  ClubSimObjC
//
//  Created by Ernest Leung on 11/3/2018.
//  Copyright © 2018 ernestleung. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface CategoryModel :JSONModel

@property (nonatomic) NSString *img;
@property (nonatomic) NSString *priceimg;
@property (nonatomic) NSString *color;
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *id;
@property (nonatomic) NSString *avatar;
@property (nonatomic) NSString *desc;
@end

@interface HomeModel : JSONModel

@property (nonatomic) NSString *result;
@property (nonatomic) NSInteger code;
@property (nonatomic) NSInteger lastupdatetime;
@property (nonatomic) NSString *description;
@property (nonatomic) NSArray<CategoryModel *> *category;
@end
