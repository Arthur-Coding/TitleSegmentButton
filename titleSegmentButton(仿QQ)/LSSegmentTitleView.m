//
//  LSSegmentTitleView.h
//
//  Created by ArthurShuai on 16/5/30.
//  Copyright © 2015年 ArthurShuai. All rights reserved.
//

#import "LSSegmentTitleView.h"

#define DefaultColor [UIColor colorWithRed:0 green:165/255.0 blue:224/255.0 alpha:1]
@interface LSSegmentTitleView()
@property (nonatomic,weak) UIButton *selectedBtn;
@end
@implementation LSSegmentTitleView
static NSString *firstBtnTitle;
-(instancetype)initWithFrame:(CGRect)frame andTitleArray:(NSArray *)titleArray andNormalImageArray:(NSArray *)nor andHightLightImageArray:(NSArray *)hight andSelectedImageArray:(NSArray *)selected{
    if (self = [super initWithFrame:frame]) {
        CGFloat btnW = 58;
        firstBtnTitle = titleArray.firstObject;
        for (int i=0; i<titleArray.count; i++) {
            UIButton *button = [self buttonWithTitle:titleArray[i] nor:nor[i] hight:hight[i] selected:selected[i]];
            button.frame = CGRectMake(btnW*i, 5, btnW, 30);
            button.tag = i+1;
            if (i == 0) {
                [self btnClick:button];//设置初始点击的button
            }
        }
    }
    return self;
}

-(UIButton *)buttonWithTitle:(NSString *)title nor:(NSString *)nol hight:(NSString *)hight selected:(NSString *)selected {
    UIEdgeInsets edge = UIEdgeInsetsMake(10, 15, 10, 15);
    
    UIImage *norImg = [[UIImage imageNamed:nol] resizableImageWithCapInsets:edge];
    UIImage *higImg = [[UIImage imageNamed:hight] resizableImageWithCapInsets:edge];
    UIImage *selImg = [[UIImage imageNamed:hight] resizableImageWithCapInsets:edge];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setBackgroundImage:norImg forState:UIControlStateNormal];
    [btn setBackgroundImage:higImg forState:UIControlStateHighlighted];
    [btn setBackgroundImage:selImg forState:UIControlStateSelected];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitleColor:DefaultColor forState:UIControlStateSelected];
    btn.titleLabel.font = [UIFont boldSystemFontOfSize:13];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
    return btn;
}

-(void)btnClick:(UIButton *)btn {
    if ([_selectedBtn isEqual:btn]) return;//防止重复点击
    
    _selectedBtn.selected = NO;
    btn.selected = YES;
    _selectedBtn = btn;
}
@end