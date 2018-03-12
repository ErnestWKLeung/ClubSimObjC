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

//+(void) getHomePageData:(nullable NSData * _Nullable (^)(NSHTTPURLResponse * _Nullable response, NSData * _Nullable data))success
//                failure:(nullable void (^)(NSError * _Nullable error))failure;

+(void) getHomePageData;

@end

#endif /* NetworkManager_h */
