//
//  HomeModel.h
//  ClubSimObjC
//
//  Created by Ernest Leung on 11/3/2018.
//  Copyright © 2018 ernestleung. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "CategoryModel.h"


@interface HomeModel : JSONModel

@property (nonatomic, strong) NSString *result;
@property (nonatomic, assign) NSInteger code;
@property (nonatomic, assign) NSInteger lastupdatetime;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSArray<CategoryModel> *category;
@end
