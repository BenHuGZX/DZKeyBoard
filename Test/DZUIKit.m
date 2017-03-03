//
//  DZUIKit.m
//  UIDemo
//
//  Created by 古智性 on 2017/3/1.
//  Copyright © 2017年 古智性. All rights reserved.
//

#import "DZUIKit.h"
#import "UIView+YVAdditions.h"

@implementation DZUILabel
+(UILabel *)DZLabelFrame:(CGRect)frame Text:(NSString *)text  Font:(NSInteger)font Color:(NSString *)color Alpha:(CGFloat)alpha Alignment:(NSTextAlignment)alignment{
    UILabel * dz_lable = [[UILabel alloc]initWithFrame:frame];  dz_lable.font = [UIFont systemFontOfSize:font];
    dz_lable.textColor = [UIColor colorWithHex:color alpha:alpha]; dz_lable.text = text; dz_lable.textAlignment = alignment; return dz_lable;
}

@end

@implementation DZUIButton
+(UIButton *)DZButtonFrame:(CGRect)frame Button:(UIButtonType)buttonType  Img:(NSString *)img Title:(NSString *)title Color:(NSString *)color Alpha:(CGFloat)alpha Target:(id)target Action:(SEL)action{
    UIButton * dz_button = [UIButton buttonWithType:buttonType]; dz_button.frame = frame;
    [dz_button setTitle:title forState:UIControlStateNormal];
    [dz_button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [dz_button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",img]] forState:UIControlStateNormal];
    [dz_button setTitleColor:[UIColor colorWithHex:color alpha:alpha] forState:UIControlStateNormal]; return dz_button;
}
+(UIButton *)DZButtonType:(UIButtonType)buttonType  Img:(NSString *)img Title:(NSString *)title Color:(NSString *)color Alpha:(CGFloat)alpha Target:(id)target Action:(SEL)action{
    UIButton * dz_button = [UIButton buttonWithType:buttonType]; [dz_button setTitle:title forState:UIControlStateNormal];
    [dz_button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside]; [dz_button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",img]] forState:UIControlStateNormal]; [dz_button setTitleColor:[UIColor colorWithHex:color alpha:alpha] forState:UIControlStateNormal]; return dz_button;
}

@end

@implementation DZUITextField
+(UITextField *)DZTextFieldFrame:(CGRect)frame BorderStyle:(UITextBorderStyle)borderStyle placeholder:(NSString *)placeholder clearButtonModel:(UITextFieldViewMode)clearButtonModel {
    UITextField * dz_textField = [[UITextField alloc]initWithFrame:frame]; dz_textField.placeholder = placeholder;  dz_textField.borderStyle = borderStyle; dz_textField.clearButtonMode = clearButtonModel; return dz_textField;
}
@end
