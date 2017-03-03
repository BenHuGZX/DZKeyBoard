//
//  ViewController.m
//  Test
//
//  Created by 古智性 on 2017/3/2.
//  Copyright © 2017年 古智性. All rights reserved.
//

#import "ViewController.h"
#import "DZUIKit.h"
#import "DZKeyBoard.h"
#define KWIDTH [UIScreen mainScreen].bounds.size.width
#define KHEIGHT [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UITextFieldDelegate,DZKeyBoardDelegate>
@property (nonatomic, strong) DZKeyBoard * dz_keyBoard;
@property (nonatomic, strong) UITextField * dz_textfield;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupBtn];
}

- (void)setupBtn{
    UIButton * btn = [DZUIButton DZButtonFrame:CGRectMake(0, 20, 20, 20) Button:UIButtonTypeCustom Img:nil Title:@"点我" Color:nil Alpha:1 Target:self Action:@selector(gotoVC:)];
    [self.view addSubview:btn];
    [self.view addSubview:self.dz_textfield];
    [self.view addSubview:self.dz_keyBoard];
}


-(UITextField *)dz_textfield{
    if (!_dz_textfield) {
        _dz_textfield = [DZUITextField DZTextFieldFrame:CGRectMake(50, 100, 300, 40) BorderStyle:UITextBorderStyleRoundedRect placeholder:@"请输入密码" clearButtonModel:UITextFieldViewModeAlways];
        _dz_textfield.tintColor = [UIColor redColor];
        [_dz_textfield.inputView removeFromSuperview];
        _dz_textfield.inputView = self.dz_keyBoard;
        _dz_textfield.delegate = self;
    }
    return _dz_textfield;
}

-(DZKeyBoard *)dz_keyBoard{
    if (!_dz_keyBoard) {
        _dz_keyBoard = [[DZKeyBoard alloc]initWithFrame:CGRectMake(0, KHEIGHT-KWIDTH/3/2*4, KWIDTH, KWIDTH/3/2*4) KeyboardType:DZKeyBoardNumber];
        _dz_keyBoard.Keydelegate = self;
        _dz_keyBoard.hidden = YES;
        _dz_keyBoard.backgroundColor = [UIColor clearColor];
    }
    return _dz_keyBoard;
}

- (void)gotoVC:(UIButton *)sender{
    NSLog(@"%ld",(long)sender.tag);
}

- (void)dzBackValueWithButton:(UIButton *)sender{
    [sender setHighlighted:YES];
    if (!(sender.tag == 1011)) {
        _dz_textfield.text = [NSString stringWithFormat:@"%@%@", _dz_textfield.text, sender.titleLabel.text];
    }else{
        if ([_dz_textfield.text length] != 0) {
            [_dz_textfield deleteBackward];
        }else{
            _dz_keyBoard.hidden = YES;
            [_dz_textfield resignFirstResponder];
        }
    }
    [self.dz_textfield reloadInputViews];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    _dz_keyBoard.hidden = YES;
    [_dz_textfield resignFirstResponder];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    _dz_keyBoard.hidden = NO;
    [_dz_textfield.inputView removeFromSuperview];
    [self.dz_textfield reloadInputViews];
    return YES;
}


@end
