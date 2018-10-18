# KBPageControll

@interface KBV2ImportOrderView()<KBPageControllDelegate, KBPageControllDataSource>

@property (weak, nonatomic) KBPageControll *pageControll;

@end

@implementation KBV2ImportOrderView

- (void)setupUI {


KBPageControll *pageControll = [[KBPageControll alloc] init];

pageControll.delegate = self;

pageControll.dataSource = self;

pageControll.backgroundColor = [UIColor whiteColor];

[self addSubview:pageControll];


[pageControll mas_makeConstraints:^(MASConstraintMaker *make) {

make.left.right.bottom.equalTo(headView).with.offset(0);

make.top.equalTo(selectionView.mas_bottom).with.offset(0);

}];

self.pageControll = pageControll;

[self.pageControll reloadData];

}


#pragma mark - KBPageControllDataSource


- (NSInteger)totalOfPageControll:(KBPageControll *)pageControll {
   
    return 2;
}


- (NSInteger)currentPageOfPageControll:(KBPageControll *)pageControll {

    return 1;

}


#pragma mark - KBPageControllDelegate


- (CGFloat)itemSpaceOfPageControll:(KBPageControll *)pageControll {

    return 10;

}


- (CGSize)itemSizeOfPageControll:(KBPageControll *)pageControll {
    
    return CGSizeMake(15, 3);

}


- (UIView *)viewOfPageControll:(KBPageControll *)pageControll page:(NSInteger)page {

UIImage *image = [UIImage imageWithColor:kYellowColor size:CGSizeMake(1, 1)];

UIImage *hilightImage = [UIImage imageWithColor:kLoginAccountInputTextColor size:CGSizeMake(1, 1)];

UIButton *pageBtn = [UIButton buttonWithType:UIButtonTypeCustom];

[pageBtn setBackgroundImage:image

forState:UIControlStateNormal];

[pageBtn setBackgroundImage:hilightImage

forState:UIControlStateHighlighted];

[pageBtn setBackgroundImage:hilightImage

forState:UIControlStateSelected];

pageBtn.selected = NO;

return pageBtn;

}


- (void)pageControll:(KBPageControll *)pageControll willHilightPageView:(UIView *)pageView {

UIButton *pageBtn = [pageView safeCastForClass:[UIButton class]];

pageBtn.selected = YES;

}

@end
