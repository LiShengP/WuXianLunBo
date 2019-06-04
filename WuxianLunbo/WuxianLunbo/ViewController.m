//
//  ViewController.m
//  WuxianLunbo
//
//  Created by lsp on 2019/6/4.
//  Copyright © 2019年 lishengpei. All rights reserved.
//

#import "ViewController.h"
#import <SDCycleScrollView.h>

@interface ViewController ()<SDCycleScrollViewDelegate>

@property (strong,nonatomic) NSArray *localImages;//本地图片
@property (strong,nonatomic) NSArray *netImages;  //网络图片
@property (strong,nonatomic) SDCycleScrollView *cycleScrollView;//轮播器

@end

@implementation ViewController


/**
 懒加载本地图片
 */
-(NSArray *)localImages
{
    if (_localImages == nil) {
        _localImages = @[@"h1.jpg",@"h2.jpg",@"h3.jpg",@"h4.jpg"];
    }
    return _localImages;
}

-(NSArray *)netImages
{
    if (_netImages == nil) {
        _netImages = @[@"http://d.hiphotos.baidu.com/zhidao/pic/item/72f082025aafa40f507b2e99aa64034f78f01930.jpg",@"http://b.hiphotos.baidu.com/zhidao/pic/item/4b90f603738da9770889666fb151f8198718e3d4.jpg",@"http://g.hiphotos.baidu.com/zhidao/pic/item/f2deb48f8c5494ee4e84ef5d2cf5e0fe98257ed4.jpg",@"http://d.hiphotos.baidu.com/zhidao/pic/item/9922720e0cf3d7ca104edf32f31fbe096b63a93e.jpg"];
    }
    return _netImages;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self ScrollLocalImages];
    [self ScrollNetWorkImages];
}


/**
 轮播本地图片
 */
-(void)ScrollLocalImages{
    
    /** 测试本地图片数据*/
    CGRect rect = CGRectMake(0,150, self.view.bounds.size.width, 400);
    self.cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:rect imageNamesGroup:self.localImages];
    
    //设置图片视图显示类型
    self.cycleScrollView.bannerImageViewContentMode = UIViewContentModeScaleToFill;
    
    //设置轮播视图的分页控件的显示
    self.cycleScrollView.showPageControl = YES;
    
    //设置轮播视图分也控件的位置
    self.cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    
    //当前分页控件小圆标颜色
    self.cycleScrollView.currentPageDotColor = [UIColor redColor];
    
    //其他分页控件小圆标颜色
    self.cycleScrollView.pageDotColor = [UIColor purpleColor];
    
    [self.view addSubview:self.cycleScrollView];
}

/**
 轮播网络图片
 */
-(void)ScrollNetWorkImages{
    
    /** 测试本地图片数据*/
    CGRect rect = CGRectMake(0,150, self.view.bounds.size.width, 400);
    self.cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:rect delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    //设置网络图片数组
    self.cycleScrollView.imageURLStringsGroup = self.netImages;
    
    //设置图片视图显示类型
    self.cycleScrollView.bannerImageViewContentMode = UIViewContentModeScaleToFill;
    
    //设置轮播视图的分页控件的显示
    self.cycleScrollView.showPageControl = YES;
    
    //设置轮播视图分也控件的位置
    self.cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    
    //当前分页控件小圆标图片
    self.cycleScrollView.pageDotImage = [UIImage imageNamed:@"pageControlDot"];
    
    //其他分页控件小圆标图片
    self.cycleScrollView.currentPageDotImage = [UIImage imageNamed:@"pageControlCurrentDot"];
    
    
    [self.view addSubview:self.cycleScrollView];
}

-(void)dealloc
{
    NSLog(@"%s",__func__);
}

/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"点击了图片%ld",index);
}

/** 图片滚动回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index
{
    NSLog(@"图片滚定到%ld",index);
}

@end
