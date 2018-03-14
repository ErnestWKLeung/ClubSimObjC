//
//  HomePageRollerViewCell.m
//  ClubSimObjC
//
//  Created by Ernest Leung on 13/3/2018.
//  Copyright © 2018 ernestleung. All rights reserved.
//

#import "UIImageView+AFNetworking.h"
#import "HomePageRollerViewCell.h"
#import "BannerModel.h"

@implementation HomePageRollerViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) configureCellWith:(NSArray<BannerModel> *) imageData andSize: (int) size{
    
    _imageScrollView.contentSize = CGSizeMake( imageData.count * _imageScrollView.frame.size.width, 140);

    
    for (int i = 0; i < imageData.count; ++i){
        
        CGFloat origin = i * self.contentView.frame.size.width;
        
        UIImageView *image = [[UIImageView alloc] initWithFrame:
                              CGRectMake(origin, 0,
                                         self.contentView.frame.size.width,
                                         183)];
        
        NSString * const imgURLStr = [[imageData objectAtIndex:i] imagelink];
        NSURL *imgURL = [NSURL URLWithString:imgURLStr];
        [image setImageWithURL:imgURL];

        image.contentMode = UIViewContentModeScaleAspectFit;

        [_imageScrollView addSubview:image];
        
        UILabel *bannerLbl = [[UILabel alloc] initWithFrame:CGRectMake(origin + 5, 180, self.contentView.frame.size.width, 50)];
        bannerLbl.textAlignment = NSTextAlignmentLeft;
        bannerLbl.numberOfLines = 2;
        bannerLbl.text = [[imageData objectAtIndex:i] text];
        [bannerLbl setTextColor: [UIColor whiteColor]];
        [_imageScrollView addSubview:bannerLbl];
        
    }
    
    _imagePageControl.numberOfPages = imageData.count;
    _imagePageControl.currentPage = 0;
    _imageScrollView.delegate = self;
}

- (void) scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    
//    const int pageNumber = round(_imageScrollView.contentOffset.x / _imageScrollView.frame.size.width);
//
//    _imagePageControl.currentPage = pageNumber;

}

- (void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
//    CGFloat pageWidth = _imageScrollView.frame.size.width;
//    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
//
//    NSLog(@"Dragging - You are now on page %i",page);
    const int pageNumber = round(_imageScrollView.contentOffset.x / _imageScrollView.frame.size.width);
    
    _imagePageControl.currentPage = pageNumber;
}
@end
