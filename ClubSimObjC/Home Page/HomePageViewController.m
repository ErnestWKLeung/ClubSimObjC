//
//  FirstViewController.m
//  ClubSimObjC
//
//  Created by Ernest Leung on 9/3/2018.
//  Copyright © 2018 ernestleung. All rights reserved.
//

#import "HomePageViewController.h"
#import "NetworkManager.h"
#import "HomeModel.h"
#import "HomePageTableViewCell.h"
#import "HomePageRollerViewCell.h"
#import "BannerListModel.h"

@interface HomePageViewController ()

@end

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:1.0]

@implementation HomePageViewController
{
    NSArray *tableData;
    NSArray *bannerData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
 
    [_tableView registerNib:[UINib nibWithNibName:@"HomePageTableViewCell" bundle:nil] forCellReuseIdentifier: @"homePageCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"HomePageRollerViewCell" bundle:nil] forCellReuseIdentifier: @"homePageRoller"];
    _tableView.estimatedRowHeight = 190;
    _tableView.rowHeight = UITableViewAutomaticDimension;
    _tableView.sectionHeaderHeight = 40;
    
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

//    bool needUpdate = false;
//    [needUpdate: NO];
    
    [NetworkManager getHomePageData: ^( NSHTTPURLResponse * response, NSString * data) {
        NSLog(@"Completion");
        
        NSError *error;
        HomeModel *homeModel = [[HomeModel alloc] initWithString: data error: &error];
        tableData = [homeModel category];
//        __block needUpdate = true;
        [_tableView reloadData];
    }
    failure: ^(NSError* error){
    }];
    
    [NetworkManager getHomePageRollerData: ^( NSHTTPURLResponse * response, NSString *data) {
        NSError *error;
        NSLog(@"getHomePagerollerData");
        BannerListModel *bannerListModel = [[BannerListModel alloc] initWithString: data error: &error];
        
        bannerData = [bannerListModel banners];
//        __block needUpdate = true;
        [_tableView reloadData];
    }
    failure: ^(NSError* error){
      
    }];
    
    
}

- (NSInteger) tableView: (UITableView *) tableView numberOfRowsInSection:(NSInteger)section {
    return [tableData count] + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    
    if (indexPath.row == 0){
        //! show image scroller
        return [self imageScrollView];
    }
    const NSInteger row = indexPath.row - 1;
    
    HomePageTableViewCell *cell = (HomePageTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"homePageCell"];
    
    if (cell == nil){
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"homePageCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    if (row >= tableData.count) {
        return cell;
    }

    const CategoryModel *category = [tableData objectAtIndex: row];
    cell.titleLbl.text = [category name];
    
    unsigned colorInt = 0;
    NSScanner *scanner = [NSScanner scannerWithString:[category color]];
    
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&colorInt];
    cell.titleLbl.textColor = UIColorFromRGB(colorInt);
    cell.descLbl.text = [category desc];
    
    NSString *imgStr = [NSString stringWithFormat: @"data:image/png;base64,%@", [category img]];
    NSURL *url = [NSURL URLWithString: imgStr];
    NSData *imageData = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:imageData];
    cell.imgIV.image = image;
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"selected %ld", (long)indexPath.row);
}

- (UITableViewCell *)imageScrollView{
    
    HomePageRollerViewCell *cell = (HomePageRollerViewCell *)[_tableView dequeueReusableCellWithIdentifier:@"homePageRoller"];
    
    if (cell == nil){
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"homePageCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
//    [cell configureCellWith:bannerData andSize:[bannerData count]];
    [cell configureCellWith:bannerData andSize:5];
//    int numberOfPages = 5;
//    UIScrollView *someScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
//    someScrollView.pagingEnabled = YES;
//    //set the scroll view delegate to self so that we can listen for changes
//    someScrollView.delegate = self;
//    someScrollView.contentSize = CGSizeMake(numberOfPages * someScrollView.frame.size.width, someScrollView.frame.size.height);
//    [self.view addSubview:someScrollView];
//
//    for (int i = 1; i <= numberOfPages; i++) {
//        //set the origin of the sub view
//        CGFloat myOrigin = i * self.view.frame.size.width;
//
//        //get the sub view and set the frame
//        UIImageView *imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(myOrigin, 0, self.view.frame.size.width, someScrollView.frame.size.height)];
//        imageView1.image = [UIImage imageNamed: [NSString stringWithFormat:@"openingScreen%d.png",i ]];
//
//
//        //add the subview to the scroll view
//        [someScrollView addSubview:imageView1];
//    }
////////////////////////////////
////    cell.imageScrollView.contentSize = CGSizeMake(bannerData.count * cell, <#CGFloat height#>)
//    for (int i = 0; i < bannerData.count; ++i){
//        const UIImageView *imageView = [[UIImageView alloc] init];
//        [imageView setContentMode:UIViewContentModeScaleAspectFill];
//        [imageView setClipsToBounds:YES];
//        [cell.imageScrollView addSubview:imageView];
//
//    }

    return cell;
}
    
@end
