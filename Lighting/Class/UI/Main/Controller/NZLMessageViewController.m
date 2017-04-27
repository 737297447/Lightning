//
//  NZLMessageViewController.m
//  Lighting
//
//  Created by longhy on 2017/4/18.
//  Copyright © 2017年 longhy. All rights reserved.
//

#import "NZLMessageViewController.h"
#import "NZLMessageCell.h"
#import "NZLMessageHandler.h"
#import "MessageData.h"
#import "NZLMessageDetailController.h"


@interface NZLMessageViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView* msTableView;
@property(nonatomic,strong)NSMutableArray* listData;
@property(nonatomic,assign)NSInteger page;
@property (nonatomic, strong) MJRefreshComponent *myRefreshView;


@property(nonatomic,strong)UIView* noView;
@property(nonatomic,strong)UIImageView* noImageView;
@property(nonatomic,strong)UILabel* noLabel;

@end

@implementation NZLMessageViewController


-(NSMutableArray *)listData
{
    if (!_listData) {
        _listData = [NSMutableArray array];
    }
    return _listData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
}

-(void)initUI
{
    
    
    self.title = @"消息";
    
    self.page = 1;
    
    
    self.msTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.msTableView.separatorColor = [UIColor clearColor];
    self.msTableView.delegate = self;
    self.msTableView.dataSource = self;
    self.msTableView.backgroundColor = [UIColor clearColor];
    
    __weak typeof(self) weakSelf = self;
    
    //..下拉刷新
    self.msTableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        weakSelf.myRefreshView = weakSelf.msTableView.header;
        weakSelf.page = 0;
        [weakSelf initData];
    }];
    
    // 马上进入刷新状态
    [self.msTableView.header beginRefreshing];
    
    //..上拉刷新
    self.msTableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        weakSelf.myRefreshView = weakSelf.msTableView.footer;
        self.page++;
        [weakSelf initData];
    }];
    
    self.msTableView.footer.hidden = YES;
    
    
    self.automaticallyAdjustsScrollViewInsets = YES;
    [self.view addSubview:self.msTableView];
    self.msTableView.sd_layout.spaceToSuperView(UIEdgeInsetsMake(0, 0, 10, 0));
    
}

-(void)initData
{
    NSLog(@"-----%ld",self.page);
    
    [NZLMessageHandler HDGetMessage:self.page userId:USERID success:^(id obj) {
        
        if (self.myRefreshView == self.msTableView.header) {
            self.listData = obj;
            if (self.listData.count==0) {
                self.msTableView.footer.hidden =YES;
                [self noContentUIWithImageNamed:@"no_massages"];
            }else{
                self.msTableView.footer.hidden =NO;
            }
            
            
        }else if(self.myRefreshView == self.msTableView.footer){
            NSInteger i1 = self.listData.count;
            [self.listData addObjectsFromArray:obj];
            NSInteger i2 = self.listData.count;
            
            if (i1 == i2) {
                self.msTableView.footer.hidden =YES;
            }
        }
        
        [self.msTableView reloadData];
        [self.myRefreshView  endRefreshing];
        
        
    } failed:^(id obj) {
        [self.myRefreshView  endRefreshing];
        NSLog(@"错误-----%@",obj);
    }];
    
}





-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.listData.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"SDDiscountCell";
    NZLMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (!cell) {
        cell = [[NZLMessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        
        cell.backgroundColor = RGB(240, 240, 240);
        
        cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:[UIImage imageWithBgColor:RGB(240, 240, 240)]];
    }
    
    
    
    cell.myData = self.listData[indexPath.row];
    
    ////// 此步设置用于实现cell的frame缓存，可以让tableview滑动更加流畅 //////
    [cell useCellFrameCacheWithIndexPath:indexPath tableView:tableView];
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"点击%ld行",indexPath.row);
    
    MessageData* data = self.listData[indexPath.row];
    NSString* ID =data.ID;

    NZLMessageDetailController* detailView = [[NZLMessageDetailController alloc]init];
    detailView.messageData = data;
    [self.navigationController pushViewController:detailView animated:YES];
    
    [NZLMessageHandler HDReadMessage:ID success:^(id obj) {
        NSLog(@"当前已读");
        data.status = 2;
        [self.listData replaceObjectAtIndex:indexPath.row withObject:data];
        [self.msTableView reloadData];
    } failed:^(id obj) {
        
    }];
    
}




-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat he = [self.msTableView cellHeightForIndexPath:indexPath model:self.listData[indexPath.row] keyPath:@"myData" cellClass:[NZLMessageCell class] contentViewWidth:SCREEN_WIDTH];
    
    return he;
    
}


- (CGFloat)cellContentViewWith
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    // 适配ios7横屏
    if ([UIApplication sharedApplication].statusBarOrientation != UIInterfaceOrientationPortrait && [[UIDevice currentDevice].systemVersion floatValue] < 8) {
        width = [UIScreen mainScreen].bounds.size.height;
    }
    return width;
}




-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"删除%ld行",indexPath.row);
    
    self.view.userInteractionEnabled = NO;
    
    [SVProgressHUD showWithStatus:@"正在删除消息"];
    
    
    MessageData* data = self.listData[indexPath.row];
    NSString* ID =data.ID;
    
    [NZLMessageHandler HDDeleteMessage:ID success:^(id obj) {
        self.view.userInteractionEnabled = YES;
        [FDReminderView showWithString:@"删除成功"];
        [SVProgressHUD dismiss];
        [self.listData removeObjectAtIndex:indexPath.row];
        [self.msTableView reloadData];
        
        if (self.listData.count==0) {
            self.msTableView.footer.hidden =YES;
            [self noContentUIWithImageNamed:@"no_massages"];
        }else{
            self.msTableView.footer.hidden =NO;
        }
        
    } failed:^(id obj) {
        self.view.userInteractionEnabled = YES;
        [FDReminderView showWithString:@"删除失败"];
        [SVProgressHUD dismiss];
        
    }];
    
}











- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
