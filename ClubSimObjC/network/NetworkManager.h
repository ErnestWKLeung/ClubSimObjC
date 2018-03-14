//
//  NetworkManager.h
//  ClubSimObjC
//
//  Created by Ernest Leung on 9/3/2018.
//  Copyright © 2018 ernestleung. All rights reserved.
//

#ifndef NetworkManager_h
#define NetworkManager_h

@interface NetworkManager:NSObject

//! TODO: create singleton for session manager

+(void) getHomePageData:(void (^)(NSHTTPURLResponse *  response, NSString * data))success
                failure:(void (^)(NSError * error))failure;

+(void) getHomePageRollerData:(void (^)(NSHTTPURLResponse * response, NSString * data)) success
                      failure:(void (^)(NSError * error))failure;

@end

#endif /* NetworkManager_h */
