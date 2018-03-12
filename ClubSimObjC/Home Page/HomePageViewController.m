//
//  FirstViewController.m
//  ClubSimObjC
//
//  Created by Ernest Leung on 9/3/2018.
//  Copyright © 2018 ernestleung. All rights reserved.
//

#import "HomePageViewController.h"
#import "NetworkManager.h"

@interface HomePageViewController ()

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self getPageData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getPageData {
    
    printf("getPageData");
//    [NetworkManager getHomePageData: ^NSString * _Nonnull(NSHTTPURLResponse * _Nonnull response, NSString * _Nonnull responseObject) {
//    }
//                            failure: nil];
//    }

    [NetworkManager getHomePageData];
///////////
//    [self.webView
//     loadRequest:self.HTMLRequest
//     progress:nil
//     success:^NSString * _Nonnull(NSHTTPURLResponse * _Nonnull response, NSString * _Nonnull HTML) {
//         [expectation fulfill];
//         return HTML;
//     }
//     failure:nil];
    
    
}
@end
