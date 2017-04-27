
#import "UIView+YAXExtension.h"

@interface UIView ()

@property (nonatomic, weak) UIButton *topButton;

@end

@implementation UIView (YAXExtension)

- (void)setX:(CGFloat)x {
    
    // 1.取出frame
    CGRect frame = self.frame;
    
    // 2.改x值
    frame.origin.x = x;
    
    // 3.赋值
    self.frame = frame;

}

- (CGFloat)x {
    
    return self.frame.origin.x;

}

- (void)setCenterX:(CGFloat)centerX{

    CGPoint center = self.center;
    
    center.x = centerX;
    
    self.center = center;
}

- (CGFloat)centerX{


    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY{
    
    CGPoint center = self.center;
    
    center.y = centerY;
    
    self.center = center;
}

- (CGFloat)centerY{
    
    
    return self.center.y;
}



- (void)setY:(CGFloat)y {
    
    // 1.取出frame
    CGRect frame = self.frame;
    
    // 2.改x值
    frame.origin.y = y;
    
    // 3.赋值
    self.frame = frame;
}

- (CGFloat)y {
    
    return self.frame.origin.y;
}

- (void)setWidth:(CGFloat)width {
    
    // 1.取出frame
    CGRect frame = self.frame;
    
    // 2.改width值
    frame.size.width = width;
    
    // 3.赋值
    self.frame = frame;

}

- (CGFloat)width {
    
    return self.frame.size.width;
    
}

- (void)setHeight:(CGFloat)height {

    // 1.取出frame
    CGRect frame = self.frame;
    
    // 2.改height
    frame.size.height = height;
    
    // 3.赋值
    self.frame = frame;

}

- (CGFloat)height {

    return self.frame.size.height;

}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

#pragma mark - 快速创建button的方法
+ (UIButton *)buttonWithTitle:(NSString *)title action:(SEL)action tag:(NSInteger)tag buttonWidth:(CGFloat)buttonWidth buttonHeight:(CGFloat)buttonHeight color:(NSInteger)color font:(NSInteger)font{
    
    UIButton *button = [[UIButton alloc] init];
    
    button.backgroundColor = [UIColor whiteColor];
    button.titleLabel.font = [UIFont systemFontOfSize:font];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:RGB(color, color, color) forState:UIControlStateNormal];
    button.tag = tag;
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(tag * buttonWidth, 0, buttonWidth, buttonHeight);
    
    return button;
}

//快速创建一个按钮
+ (UIButton *)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(NSInteger)font{
    
    UIButton *button = [[UIButton alloc] init];
    
    button.titleLabel.font = [UIFont systemFontOfSize:font];
    
//    button.backgroundColor = titleColor;
    
    [button setTitle:title forState:UIControlStateNormal];
    
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    
    return button;
    
}

//快速创建一个按钮 带图片
+ (UIButton *)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(NSInteger)font imageNamed:(NSString *)imageNamed{
    
    UIButton *button = [[UIButton alloc] init];
    
    button.titleLabel.font = [UIFont systemFontOfSize:font];
    
//    button.backgroundColor = [UIColor whiteColor];
    
    [button setTitle:title forState:UIControlStateNormal];
    
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    
    if (imageNamed) {
        
        [button setImage:[UIImage imageNamed:imageNamed] forState:UIControlStateNormal];
    }
    
    [button sizeToFit];
    
    return button;
    
}

//快速创建一个按钮带背景图
+ (UIButton *)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(NSInteger)font backImageNamed:(NSString *)name{
    
    UIButton *button = [[UIButton alloc] init];
    
    button.titleLabel.font = [UIFont systemFontOfSize:font];
    
    
    if (name) {
        
        [button setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    }
    
    button.backgroundColor = [UIColor whiteColor];
    
    [button setTitle:title forState:UIControlStateNormal];
    
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    
    return button;
    
}

//快速创建一个按钮带背景图
+ (UIButton *)buttonWithImage:(NSString *)imageName backImageNamed:(NSString *)backName{
    
    UIButton *button = [[UIButton alloc] init];
    
    if (imageName) {
        
        [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    
    if (backName) {
        
        [button setBackgroundImage:[UIImage imageNamed:backName] forState:UIControlStateNormal];
    }
    
//    button.backgroundColor = [UIColor whiteColor];
    
    [button sizeToFit];
    
    return button;
    
}

+ (UILabel *)labelWithText:(NSString *)text textColor:(UIColor *)color font:(NSInteger)font textAliment:(NSTextAlignment)textAliment{

    UILabel *label = [[UILabel alloc] init];
    
    label.text = text;
    
    label.textColor = color;
    
    label.font = [UIFont systemFontOfSize:font];
    
    if (textAliment) {
        
        label.textAlignment = textAliment;
    }
    
    return label;
}

//在导航栏上加一个按钮
+ (UIButton *)getTopButton{
    
    __block UIButton *topButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 20)];
    
    [[UIApplication sharedApplication].keyWindow.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        
        if (obj.tag == 123456) {
            
            topButton = (UIButton *)obj;
            
//            return topButton;
        }
    }];
    
    
    
    topButton.backgroundColor = FDRandomColor;
    
    topButton.tag = 123456;
    
    [[UIApplication sharedApplication].keyWindow addSubview:topButton];
    
    return topButton;
}

//创建一个圆角按钮
+ (UIButton *)roundButtonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(CGFloat)font backgroundColor:(UIColor *)backgroundColor frame:(CGRect)frame{
    
    UIButton *button = [UIButton buttonWithTitle:title titleColor:titleColor titleFont:font];
    
    button.backgroundColor = backgroundColor;
    
    button.frame = frame;
    
    button.layer.cornerRadius = button.height/2;
    button.clipsToBounds = YES;
    
    return button;
}

//输入框
+ (UITextField *)textFieldWithFont:(CGFloat)font color:(UIColor *)color placeholder:(NSString *)placeholder{

    UITextField *nameTextField = [[UITextField alloc] init];
    nameTextField.placeholder = placeholder;
    nameTextField.font = [UIFont systemFontOfSize:font];
    nameTextField.textColor = color;
    
    return nameTextField;
}

@end


















