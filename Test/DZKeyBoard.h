//
//  DZKeyBoard.h
//  Demo
//
//  Created by 古智性 on 2017/3/1.
//  Copyright © 2017年 古智性. All rights reserved.
//



#import <UIKit/UIKit.h>

typedef enum : NSInteger {
    DZKeyBoardNumber = 0, //纯数字键盘
    DZKeyBoardIDCard, //身份证号键盘
    DZKeyBoardTyping, //正常26键盘
} DZKeyBoardStyle;

@protocol DZKeyBoardDelegate <NSObject>
- (void)dzBackValueWithButton:(UIButton *)sender;
@end

@interface DZKeyBoard : UIView
@property (nonatomic,assign) DZKeyBoardStyle keyboardStyle; //枚举键盘类型
@property (nonatomic, assign)id<DZKeyBoardDelegate> Keydelegate; //键盘代理
-(instancetype)initWithFrame:(CGRect)frame KeyboardType:(DZKeyBoardStyle)KeyboardType;
@end
