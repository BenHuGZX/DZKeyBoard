//
//  DZUIKit.h
//  UIDemo
//
//  Created by 古智性 on 2017/3/1.
//  Copyright © 2017年 古智性. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#pragma mark =========CommonlyUI==========

@interface DZUILabel : UILabel
+(UILabel *)DZLabelFrame:(CGRect)frame Text:(NSString *)text  Font:(NSInteger)font Color:(NSString *)color Alpha:(CGFloat)alpha Alignment:(NSTextAlignment)alignment;

@end


@interface DZUIButton : UIButton
+(UIButton *)DZButtonFrame:(CGRect)frame Button:(UIButtonType)buttonType  Img:(NSString *)img Title:(NSString *)title Color:(NSString *)color Alpha:(CGFloat)alpha Target:(id)target Action:(SEL)action;

+(UIButton *)DZButtonType:(UIButtonType)buttonType  Img:(NSString *)img Title:(NSString *)title Color:(NSString *)color Alpha:(CGFloat)alpha Target:(id)target Action:(SEL)action;

@end

@interface DZUITextField : UITextField
+(UITextField *)DZTextFieldFrame:(CGRect)frame BorderStyle:(UITextBorderStyle)borderStyle placeholder:(NSString *)placeholder clearButtonModel:(UITextFieldViewMode)clearButtonModel;

@end
