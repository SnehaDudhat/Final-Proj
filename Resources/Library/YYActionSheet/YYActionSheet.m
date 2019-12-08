//
//  YYActionSheet.m
//  actionSheetDemo
//
//  Created by zouyingying on 2017/11/18.
//  Copyright © 2017年 zouyingying. All rights reserved.
//

#import "YYActionSheet.h"
#import "SheetActionModel.h"
#import "MainTableViewCell.h"


#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define Margin 10

@interface YYActionSheet ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UIView *maskView;
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UIView *headView;


@property (nonatomic,   copy) NSString *cancelTitle;
@property (nonatomic,   copy) UIColor *cancelColor;
@property (nonatomic,   copy) void(^cancelBlock)(void);

@property (nonatomic, strong) NSMutableArray *optionsArr;

@end

@implementation YYActionSheet

#pragma mark - init
- (instancetype)initWithoutCancelWithHeaderView:(UIView *)titleView {
    if (self = [super init]) {
        
        self.frame = [UIScreen mainScreen].bounds;

        _headView = titleView;
        
    }
    return self;
}

- (instancetype)initWithHeaderView:(UIView *)titleView cancelTitle:(NSString *)cancelTitle cancelColor:(UIColor *)color cancelBlock:(void(^)(void))cancelBlock{
    if (self = [super init]) {
        
        self.frame = [UIScreen mainScreen].bounds;
        
        _headView = titleView;
        
        _cancelTitle = cancelTitle;
        
        _cancelColor = color;
        
        _cancelBlock = cancelBlock;
  
    }
    return self;
}

#pragma mark - life cycle
- (void)willMoveToSuperview:(UIView *)newSuperview {
    [self addSubview:self.maskView];
    [self addSubview:self.tableView];
}


#pragma mark - public method
- (void)showInView:(UIView *)superView {
    [superView addSubview:self];
    [self show];
}

- (void)addActionWithTitle:(NSString *)title titlecColor:(UIColor *)color action:(void (^)(void))action {
    SheetActionModel *model = [[SheetActionModel alloc] initWithTitle:title titlecColor:color action:action];
    [self.optionsArr addObject:model];
}

#pragma mark - getter
- (NSMutableArray *)optionsArr {
    if (!_optionsArr) {
        _optionsArr = [NSMutableArray array];
    }
    return _optionsArr;
}

- (UIView*)maskView {
    if (!_maskView) {
        _maskView = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _maskView.backgroundColor = [UIColor blackColor];
        _maskView.alpha = 0;
        _maskView.userInteractionEnabled = YES;
    }
    return _maskView;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.layer.cornerRadius = 10;
        _tableView.clipsToBounds = YES;
        _tableView.rowHeight = 50.0;
        _tableView.bounces = NO;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.tableHeaderView = self.headView;
        _tableView.tableHeaderView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.height, 50);
        _tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.scrollEnabled = NO;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        [_tableView registerNib:[UINib nibWithNibName:@"MainTableViewCell" bundle:nil] forCellReuseIdentifier:@"MainTableViewCell"];
    }
    return _tableView;
}

#pragma mark - TableViewD
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _cancelTitle ? 2 : 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return (section == 0) ? _optionsArr.count : 1;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MainTableViewCell" forIndexPath:indexPath];
    if (indexPath.section == 0) {
        
        SheetActionModel *model = _optionsArr[indexPath.row];
        
        cell.lblTitle.text = model.title;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        if (indexPath.row == _selectedIndex) {
            cell.imgSelect.image = self.selectedImage;
            cell.lblTitle.textColor = _selectedIndexTextColor;
        }else{
            cell.imgSelect.image = self.unselectedImage;
            cell.lblTitle.textColor = _unSelectedIndexTextColor;
        }
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        SheetActionModel *model = _optionsArr[indexPath.row];
        if (model.action) {
            model.action();
        }
    } else {
        if (self.cancelBlock) {
            self.cancelBlock();
        }
    }
    [self dismiss];
    
    _selectedIndex = indexPath.row;
    [self.tableView reloadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return Margin;
}

- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, Margin)];
    footerView.backgroundColor = [UIColor clearColor];
    return footerView;
}

#pragma mark - private animate
- (void)show {
    
    CGFloat tableHeight;
    
    if (_cancelTitle) {
        tableHeight = _tableView.rowHeight * (_optionsArr.count + 1) + self.headView.frame.size.height ;
    } else {
        tableHeight = _tableView.rowHeight * _optionsArr.count + self.headView.frame.size.height;
    }
    
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    if (screenSize.height == 812){
        NSLog(@"iPhone X");
        _tableView.frame = CGRectMake(0, ScreenHeight, ScreenWidth, tableHeight + 130);
    }else{
        _tableView.frame = CGRectMake(0, ScreenHeight, ScreenWidth, tableHeight + 65);
    }

    
    [UIView animateWithDuration:.3 animations:^{
        _tableView.transform = CGAffineTransformMakeTranslation(0, -_tableView.frame.size.height);
        _maskView.alpha = 0.4;
    }];
}

- (void)dismiss {
    [UIView animateWithDuration:.3 animations:^{
        _tableView.transform = CGAffineTransformIdentity;
        _maskView.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismiss];
}



@end
