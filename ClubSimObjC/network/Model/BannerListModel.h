//
//  BannerListModel.h
//  ClubSimObjC
//
//  Created by Ernest Leung on 13/3/2018.
//  Copyright © 2018 ernestleung. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "BannerModel.h"

@interface BannerListModel : JSONModel

@property (nonatomic, strong) NSString *result;
@property (nonatomic, strong) NSString *abc_voucher_txn_link;
@property (nonatomic, assign) NSInteger code;
@property (nonatomic, strong) NSString *abc_voucher_status_link;
@property (nonatomic, assign) NSInteger category_file_lastupdate_c;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, assign) NSInteger category_file_lastupdate_e;
@property (nonatomic, strong) NSString *abc_roaming_status_link;
@property (nonatomic, strong) NSArray<BannerModel> *banners;
@end
