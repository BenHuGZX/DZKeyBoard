DZKeyBoard 是一个继承与UIView开发的一个身份证键盘，和系统纯数字键盘相比多了一个X按键，由于有些业务需要输入身份证，所以在这里使用了UIView自定义了一个这样的键盘；

![这是身份证键盘样式调用的展示](http://img.blog.csdn.net/20170306115315820?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvR1pYaW9z/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)


里面写的比较简单，主要是使用for来创建的button来实现这个效果的；在写的过程中发现了一个问题是，输入框里的光标消失掉了，所以这里使用的在输入框相应的时候，调用系统的键盘，之后把系统的键盘进行了隐藏，并刷新了键盘inputView；自定义的这个View加载到键盘inputView上的，这样子就可以解决光标的问题，使用起来也十分方便；下面是使用的方法：

在.h中描述下DZKeyBoard：

```
@property (nonatomic, strong) DZKeyBoard * dz_keyBoard;
```
之后的话使用懒加载给他加载，并且要实现代理方法：

```
-(DZKeyBoard *)dz_keyBoard{
    if (!_dz_keyBoard) {
        _dz_keyBoard = [[DZKeyBoard alloc]initWithFrame:CGRectMake(0, KHEIGHT-KWIDTH/3/2*4, KWIDTH, KWIDTH/3/2*4) KeyboardType:DZKeyBoardNumber];
        _dz_keyBoard.Keydelegate = self;
        _dz_keyBoard.hidden = YES;
        _dz_keyBoard.backgroundColor = [UIColor clearColor];
    }
    return _dz_keyBoard;
}
```
之后要实现代理方法，这里使用了判断，主要是我们要判断删除按钮和数字按钮的不同的操作

```
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
```
这里主要是要做的是在获取到输入框相应事件后进行的操作，移除系统的键盘，并刷新inputView；

```
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    _dz_keyBoard.hidden = NO;
    [_dz_textfield.inputView removeFromSuperview];
    [self.dz_textfield reloadInputViews];
    return YES;
}
```
我们需要用到点击空白处就进行隐藏消失，这里使用系统的方法给他进行操作：
```
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    _dz_keyBoard.hidden = YES;
    [_dz_textfield resignFirstResponder];
}
```

到这里就完成了键盘使用和操作了，如果有更好的建议，可以加QQ进行留言：1030554941
