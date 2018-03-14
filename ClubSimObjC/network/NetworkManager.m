//
//  NetworkManager.m
//  ClubSimObjC
//
//  Created by Ernest Leung on 9/3/2018.
//  Copyright © 2018 ernestleung. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NetworkManager.h"
#import "HomeModel.h"

@import AFNetworking;

@implementation NetworkManager

+(void) getHomePageData: (void (^)(NSHTTPURLResponse * response, NSString * data))success
                failure: (void (^)(NSError * error))failure{
    NSLog(@"get home page data");
    
    
    //! TODO configuration and manger should use singleton form
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];

    static NSString * const BaseURLString = @"https://www.clubsim.com.hk/clsmw/api/";

    NSDictionary *parameters = @{@"action": @"240", @"platform": @"ios", @"lang": @"eng"};
    
    //! although the api can be called in "GET" method, follow the call method as web
    NSURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"POST" URLString:BaseURLString parameters:parameters error:nil];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id _Nonnull responseObject, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error: %@", error);
            if (failure){
                failure(error);
            }
            
        } else {
            
            NSHTTPURLResponse *HTTPResponse = (NSHTTPURLResponse *)response;
            NSInteger statusCode = [HTTPResponse statusCode];
            NSString *responseString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];

            if (statusCode == 200){
                if (success) {
                    success((NSHTTPURLResponse *)response, responseString);
                }
            }
        }
        
    }];
    [dataTask resume];
}

+(void) getHomePageRollerData:(void (^)(NSHTTPURLResponse *, NSString *))success failure:(void (^)(NSError *))failure{
    
    //! TODO configuration and manger should use singleton form
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    ////////////
    static NSString * const BaseURLString = @"https://www.clubsim.com.hk/clsmw/api/";
    
    NSDictionary *parameters = @{@"action": @"-1", @"platform": @"ios", @"lang": @"eng", @"ver": @"1.0.0"};
    
    //! although the api can be called in "GET" method, follow the call method as web
    NSURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"POST" URLString:BaseURLString parameters:parameters error:nil];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id _Nonnull responseObject, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error: %@", error);
            if (failure){
                failure(error);
            }
            
        } else {
            
            NSHTTPURLResponse *HTTPResponse = (NSHTTPURLResponse *)response;
            NSInteger statusCode = [HTTPResponse statusCode];
            NSString *responseString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
            
            if (statusCode == 200){
                if (success) {
                    success((NSHTTPURLResponse *)response, responseString);
                }
            }
        }
        
    }];
    [dataTask resume];

}
@end
