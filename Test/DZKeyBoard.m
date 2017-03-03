//
//  DZKeyBoard.m
//  Demo
//
//  Created by 古智性 on 2017/3/1.
//  Copyright © 2017年 古智性. All rights reserved.
//



#import "DZKeyBoard.h"
#import "AppDelegate.h"

#define kWidth self.frame.size.width
#define kHeight self.frame.size.height

@interface DZKeyBoard()
@property (nonatomic,strong) NSArray * numberArray;//纯数字数组
@property (nonatomic,strong) NSArray * idcardArray;//身份证号数组
@property (nonatomic,strong) NSArray * typingArray;//正常26键数组
@end

@implementation DZKeyBoard

-(NSArray *)numberArray{
    if (!_numberArray) {
        _numberArray = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9", @"X",@"0",@"删除"];
    }
    return _numberArray;
}

-(instancetype)initWithFrame:(CGRect)frame KeyboardType:(DZKeyBoardStyle)KeyboardType{
   self = [super initWithFrame:frame];
    if (self) {
        [self CreactkeyBoard:KeyboardType];
    }
    return self;
}

-(void)CreactkeyBoard:(DZKeyBoardStyle)KeyboardType{
    switch (KeyboardType) {
        case DZKeyBoardNumber:{ //纯数字键盘
            [self CreactDZKeyBoardNumber:self.numberArray];
        }
            break;
        case DZKeyBoardIDCard:{ //身份证号键盘
            
        }
            break;
        case DZKeyBoardTyping:{ //打字键盘
            
        }
            break;
        default:
            break;
    }
}

-(void)CreactDZKeyBoardNumber:(NSArray *)array{
    NSLog(@"纯数字======%@======%lu",array,(unsigned long)array.count);
    NSInteger index = 0;
    for (NSInteger i = 0; i < 4; i++) { //先遍历行 x
        for (NSInteger j = 0; j < 3; j++) { //在遍历列 y
            UIButton *numberBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            numberBtn.backgroundColor = [UIColor colorWithRed:245 green:245 blue:245 alpha:1];
            numberBtn.frame = CGRectMake(kWidth/3*j, kWidth/3/2*i, kWidth/3, kWidth/3/2);
            [numberBtn setTitle:_numberArray[index] forState:UIControlStateNormal];
            numberBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
            numberBtn.tag = 1000+index;
            [numberBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
            [numberBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [self drawActionWithBtn:numberBtn];
            [numberBtn addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:numberBtn];
            index++;
        }
        
    }
}

-(void)CreactDZKeyBoardIDCard:(NSArray *)array{
    NSLog(@"身份证号======%@======%lu",array,(unsigned long)array.count);
}

-(void)CreactDZKeyBoardTyping:(NSArray *)array{
    NSLog(@"正常26键======%@======%lu",array,(unsigned long)array.count);
}

-(void)clickAction:(UIButton *)sender{
    NSLog(@"这里打印的是点击的那一个数字 =======%@",sender.titleLabel.text);
    if (self.Keydelegate && [self.Keydelegate respondsToSelector:@selector(dzBackValueWithButton:)]) {
        [self.Keydelegate dzBackValueWithButton:sender];
    }
}

// 划线方法
- (void)drawActionWithBtn:(UIButton *)sender
{
    UIBezierPath *bottomPath = [UIBezierPath bezierPath];
    if (sender.tag < 1009) {
        [bottomPath moveToPoint:CGPointMake(0, CGRectGetHeight(sender.frame))];
        [bottomPath addLineToPoint:CGPointMake(CGRectGetWidth(sender.frame), CGRectGetHeight(sender.frame))];
        [bottomPath addLineToPoint:CGPointMake(CGRectGetWidth(sender.frame), 0)];
        if (sender.tag < 1003) {
            [bottomPath addLineToPoint:CGPointMake(0, 0)];
        }
    }else{
        [bottomPath moveToPoint:CGPointMake(CGRectGetWidth(sender.frame), 0)];
        [bottomPath addLineToPoint:CGPointMake(CGRectGetWidth(sender.frame), CGRectGetHeight(sender.frame))];
        
    }
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.bounds = sender.bounds;
    layer.position = CGPointMake(sender.frame.size.width/2, sender.frame.size.height/2);
    layer.strokeColor = [UIColor colorWithRed:240/255.0 green:246/255.0 blue:243/255.0 alpha:1].CGColor;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.path = bottomPath.CGPath;
    [sender.layer addSublayer:layer];
    
}

@end
