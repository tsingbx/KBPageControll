//
//  KBPageControll.h
//  WeiSh
//
//  Created by xulingjiao on 2017/12/22.
//  Copyright © 2017年 Kuaibao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KBPageControll;

/**
 分页控件数据源协议
 */
@protocol KBPageControllDataSource<NSObject>

/**
 总页数

 @param pageControll 分页控件
 @return 返回总页数
 */
- (NSInteger)totalOfPageControll:(KBPageControll *)pageControll;

/**
 当前页索引

 @param pageControll 分页控件
 @return 返回当前页索引
 */
- (NSInteger)currentPageOfPageControll:(KBPageControll *)pageControll;

@end

/**
 分页控件协议
 */
@protocol KBPageControllDelegate<NSObject>

/**
 页项之间的距离

 @param pageControll 分页控件
 @return 返回页项之间的距离
 */
- (CGFloat)itemSpaceOfPageControll:(KBPageControll *)pageControll;

/**
 页项的大小控制

 @param pageControll 分页控件
 @return 返回页项的大小
 */
- (CGSize)itemSizeOfPageControll:(KBPageControll *)pageControll;

/**
 页项定制视图

 @param pageControll 分页控件
 @param page 当前该定制的页项的索引
 @return 返回页项定制视图
 
 */
- (UIView *)viewOfPageControll:(KBPageControll *)pageControll
                          page:(NSInteger)page;

/**
 将高亮显示某页项视图

 @param pageControll 分页控件
 @param pageView 定制高亮显示的某页项视图的高亮样式
 */
- (void)pageControll:(KBPageControll *)pageControll
 willHilightPageView:(UIView *)pageView;

@end

/**
 分页控件
 */
@interface KBPageControll : UIView

/*!
 分页控件数据源代理
 @see KBPageControllDataSource
 */
@property (weak, nonatomic) id<KBPageControllDataSource> dataSource;

/*!
 分页控件代理
 @see KBPageControllDelegate
 */
@property (weak, nonatomic) id<KBPageControllDelegate> delegate;

/// 重新加载数据
- (void)reloadData;

@end
