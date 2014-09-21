//
//  CRViewController.m
//  CRTabBarDemo
//
//  Created by Joe Shang on 9/21/14.
//  Copyright (c) 2014 Shang Chuanren. All rights reserved.
//

#import "CRViewController.h"
#import "CRTabBar.h"
#import "CRTabBarItem.h"

@interface CRViewController ()

@end

@implementation CRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSArray *titles = @[@"Zero", @"One", @"Two", @"Three"];
    NSArray *badges = @[@"00", @"1", @"2", @""];
    NSMutableArray *items = [[NSMutableArray alloc] initWithCapacity:[titles count]];
    for (int i = 0; i < [titles count]; i++)
    {
        UIImage *normalImage = [UIImage imageNamed:[NSString stringWithFormat:@"%d-normal", i]];
        UIImage *selectedImage = [UIImage imageNamed:[NSString stringWithFormat:@"%d-selected", i]];
        CRTabBarItem *item = [[CRTabBarItem alloc] initWithTitle:[titles objectAtIndex:i]
                                                     normalImage:normalImage
                                                   selectedImage:selectedImage];
        item.backgroundColor = [UIColor clearColor];
        item.badgeValue = [badges objectAtIndex:i];
        if (i == 2)
        {
            CGSize imageSize = [normalImage size];
            item.badgePositionAdjustment = UIOffsetMake(-imageSize.width / 2, imageSize.height / 2);
        }
        [items addObject:item];
    }
    
    CRTabBar *tabbar = [[CRTabBar alloc] initWithFrame:CGRectMake(0,
                                                                  self.view.bounds.size.height - 70,
                                                                  self.view.bounds.size.width,
                                                                  70)];
    tabbar.backgroundImage = [[UIImage imageNamed:@"tabbar_background"] resizableImageWithCapInsets:UIEdgeInsetsMake(15, 15, 15, 15)];
    tabbar.delegate = self;
    tabbar.items = items;
    tabbar.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:tabbar];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)tabBar:(CRTabBar *)tabBar shouldSelecteItemAtIndex:(NSInteger)index
{
    if (index == 3)
    {
        return NO;
    }
    
    return YES;
}

- (void)tabBar:(CRTabBar *)tabBar didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"tab bar selected at index: %d", index);
}

@end
