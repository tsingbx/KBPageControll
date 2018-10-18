//
//  KBPageControll.m
//  WeiSh
//
//  Created by xulingjiao on 2017/12/22.
//  Copyright © 2017年 Kuaibao. All rights reserved.
//

#import <Masonry/Masonry.h>
#import "KBPageControll.h"

@interface KBPageControll()

@property (weak, nonatomic) UIView *backgroundView;

@end

@implementation KBPageControll

- (void)setupUI {
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    NSInteger totalPage = [self.dataSource totalOfPageControll:self];
    if (totalPage > 0) {
        CGSize itemSize = [self.delegate itemSizeOfPageControll:self];
        CGFloat itemSpace = [self.delegate itemSpaceOfPageControll:self];
        CGFloat totalWidth = totalPage * itemSize.width + (totalPage-1)*itemSpace;
        NSInteger currentPage = [self.dataSource currentPageOfPageControll:self];
        currentPage = ((currentPage>=0&&currentPage<totalPage) ? currentPage : 0);
        if (totalWidth > 0) {
            UIView *backgroundView = [[UIView alloc] init];
            backgroundView.backgroundColor = [UIColor clearColor];
            [self addSubview:backgroundView];
            [backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.bottom.equalTo(self).with.offset(0);
                make.centerX.equalTo(self).with.offset(0);
                make.width.equalTo(@(totalWidth));
            }];
            CGFloat x = 0;
            for (NSInteger i = 0; i<totalPage; ++i) {
                UIView *pageView = [self.delegate viewOfPageControll:self
                                                                page:i];
                [backgroundView addSubview:pageView];
                [pageView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(backgroundView).with.offset(x);
                    make.centerY.equalTo(backgroundView).with.offset(0);
                    make.size.mas_equalTo(itemSize);
                }];
                if (i == currentPage) {
                    [self.delegate pageControll:self
                            willHilightPageView:pageView];
                }
                x += itemSize.width;
                x += itemSpace;
            }
        }
    }
}

- (void)reloadData {
    [self setupUI];
}

@end
