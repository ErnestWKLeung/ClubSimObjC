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

//
//- (void)loadRequest:(NSURLRequest *)request
//           MIMEType:(NSString *)MIMEType
//   textEncodingName:(NSString *)textEncodingName
//           progress:(NSProgress * _Nullable __autoreleasing * _Nullable)progress
//            success:(NSData * (^)(NSHTTPURLResponse *response, NSData *data))success
//            failure:(void (^)(NSError *error))failure


//+(void) getHomePageData: (nullable NSData * _Nullable (^)(NSHTTPURLResponse * _Nullable response, NSData * _Nullable data))success
//                failure:(nullable void (^)(NSError * _Nullable error))failure{
+(void) getHomePageData {
    NSLog(@"get home page data");
    
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
////////////
    static NSString * const BaseURLString = @"https://www.clubsim.com.hk/clsmw/api/?action=240&platform=web&lang=eng";
    
    NSURL *URL = [NSURL URLWithString:BaseURLString];

////////////
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id _Nonnull responseObject, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error: %@", error);
//            if (failure){
//                failure(error);
//            }
            
        } else {
//            NSLog(@"response: %@\n responseObject: %@", response, responseObject);
            
            NSHTTPURLResponse *HTTPResponse = (NSHTTPURLResponse *)response;
            NSInteger statusCode = [HTTPResponse statusCode];
            

//            if (statusCode == 200){
//                if (success) {
//                    success((NSHTTPURLResponse *)response, responseObject);
//                }
//            }
            NSString *responseString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
            NSLog(@"responseString: %@ \nendResponse", responseString);

            NSError *error;

            
            HomeModel *homeModel = [[HomeModel alloc] initWithString:responseString error:&error];
            CategoryModel *category = [[homeModel category] objectAtIndex:0];
            
//            NSLog(@"home model: %@ ", [category id]);
//            NSLog(@"home model: %@", homeModel.category.objectAtIndex(0).desc);
        }
        
    }];
    [dataTask resume];
}
@end
