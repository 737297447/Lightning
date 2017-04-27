//
//  NZLMainViewController.m
//  Lighting
//
//  Created by longhy on 2017/4/11.
//  Copyright © 2017年 longhy. All rights reserved.
//

#import "NZLMainViewController.h"
#import "NZLLeftMenuViewController.h"
#import "DYLeftSlipManager.h"
#import "NZLBannerData.h"
#import "NZLPeopleCenterViewController.h"
#import "NZLSettingViewController.h"
#import "NZLMessageViewController.h"
#import "NZLMainView.h"
#import "NZLJiekuanController.h"


@interface NZLMainViewController ()<UIScrollViewDelegate>

@property(nonatomic,strong)SDCycleScrollView* cycleScrollView;
@property(nonatomic,strong)NZLMainView* mainView;
@property(nonatomic,strong)UIScrollView* scrollView;
@property(nonatomic,strong)UIButton* bottomBtn;


@end

@implementation NZLMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    NSLog(@"------%@",API_BASE_URL);
    
    [self initUI];
    [self initData];
    
}

-(void)initUI
{
    [self initNaverBar];
    self.cycleScrollView = [[SDCycleScrollView alloc]init];
    [self.view addSubview:self.cycleScrollView];
    self.cycleScrollView.sd_layout.leftEqualToView(self.view)
    .rightEqualToView(self.view).topEqualToView(self.view)
    .heightIs(150);
    
    
    self.bottomBtn = [UIButton buttonWithTitle:@"立即借钱" titleColor:[UIColor whiteColor] titleFont:18 imageNamed:@"btn_icon_normal"];
    self.bottomBtn.backgroundColor = RGB(70,151 ,251);
    [self.view addSubview:self.bottomBtn];
    self.bottomBtn.sd_layout.leftEqualToView(self.view).rightEqualToView(self.view)
    .bottomEqualToView(self.view).heightIs(50);
    [self.bottomBtn addTarget:self action:@selector(pressBotton) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    self.scrollView = [[UIScrollView alloc]init];
    self.scrollView.delegate = self;
    self.scrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.scrollView];
    
    self.scrollView.sd_layout.leftEqualToView(self.view).rightEqualToView(self.view)
    .topSpaceToView(self.cycleScrollView, 0).bottomSpaceToView(self.bottomBtn, 0);

    
    
    self.mainView = [[NZLMainView alloc]init];
    [self.scrollView addSubview:self.mainView];
    
    self.mainView.sd_layout.leftEqualToView(self.scrollView).rightEqualToView(self.scrollView).topEqualToView(self.scrollView).bottomEqualToView(self.scrollView);
    
    [self.scrollView setupAutoContentSizeWithBottomView:self.mainView bottomMargin:0];
    
    NSLog(@"mainview width%f",self.scrollView.width);
    
    
    //注册通知
    [NZLNotification addObserver:self selector:@selector(leftMenuTopClick:) name:LEFT_MENU_TOP object:nil];
    
    [NZLNotification addObserver:self selector:@selector(leftMenuBottomClick:) name:LEFT_MENU_BOTTOM object:nil];
    
    
}

-(void)initData
{
    NZLBannerData* data1 = [[NZLBannerData alloc]init];
    data1.imgUrl = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1492148749707&di=b873156bd66953ae61a5bc8280149360&imgtype=0&src=http%3A%2F%2Fpic18.nipic.com%2F20111221%2F7439876_134443857000_2.jpg";
    NZLBannerData* data2 = [[NZLBannerData alloc]init];
    data2.imgUrl = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1492148749796&di=97f22c42074dc763516e012aaa5a46dc&imgtype=0&src=http%3A%2F%2Fphoto.iyaxin.com%2Fattachement%2Fjpg%2Fsite2%2F20120402%2F001966720af110e381132c.jpg";
    
    
    NZLBannerData* data3 = [[NZLBannerData alloc]init];
    data3.imgUrl = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1492148749795&di=df8fc58e85ee01287efc2c026611a429&imgtype=0&src=http%3A%2F%2Fwww.wallcoo.com%2Fanimal%2FDogs_Summer_and_Winter%2Fwallpapers%2F1920x1200%2FDogsB10_Lucy.jpg";
    
    NSArray* list = [NSArray array];
    list = @[data1,data2,data3];
    self.banner.data = list;
    
    NSLog(@"%ld",list.count);
    // 获取滚动图片区数据
    NSMutableArray * imagesURLStrings = [NSMutableArray array];
    
    
    for (NSInteger i = 0; i < list.count; i++) {
        NZLBannerData * ads = (NZLBannerData*)list[i];
        [imagesURLStrings addObject:ads.imgUrl];
    }
    
    
    self.cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;// 分页控件位置
    self.cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;// 分页控件风格
    self.cycleScrollView.delegate = self;
    self.cycleScrollView.imageURLStringsGroup = imagesURLStrings;
    self.cycleScrollView.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
    
}

-(void)initNaverBar
{
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    self.title = @"闪贷侠";
    
    UIBarButtonItem* leftBtn = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icon_dh_normal"] style:UIBarButtonItemStylePlain target:self action:@selector(topPress:)];
    leftBtn.tag = 101;
    
    UIBarButtonItem* rightBtn = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icon_xx_normal"] style:UIBarButtonItemStylePlain target:self action:@selector(topPress:)];
    rightBtn.tag = 102;
    
    self.navigationItem.leftBarButtonItem = leftBtn;
    self.navigationItem.rightBarButtonItem = rightBtn;
    
}



-(void)topPress:(UIBarButtonItem*)btn
{
    if (btn.tag == 101) {
        [[DYLeftSlipManager sharedManager] showLeftView];
    }else if(btn.tag == 102){
        [self.navigationController pushViewController:[[NZLMessageViewController alloc]init] animated:YES];
    }
    
}




/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"点击了第%ld张",index);
}

/** 图片滚动回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index
{
    
}


-(void)leftMenuTopClick:(NSNotification*) notify
{
    [[DYLeftSlipManager sharedManager] dismissLeftView];
    
    NSInteger tag = (NSInteger) [(notify.userInfo[LEFT_MENU_TOP_KET]) integerValue];
    
    switch (tag) {
        case 101:
            [self.navigationController pushViewController:[[NZLPeopleCenterViewController alloc]init] animated:NO];
            break;
        case 102:
            
            break;
        case 103:
            [self.navigationController pushViewController:[[NZLPeopleCenterViewController alloc]init] animated:NO];
            break;
            
        default:
            break;
    }
}

-(void)leftMenuBottomClick:(NSNotification*) notify
{
    [[DYLeftSlipManager sharedManager] dismissLeftView];
    
    NSInteger tag = (NSInteger)[(notify.userInfo[LEFT_MENU_BOTTOM_KET]) integerValue];
    
    switch (tag) {
        case 101:
            
            break;
        case 102:
            
            break;
        case 103:
            
            break;
        case 104:
            
            break;
        case 105:
            [self.navigationController pushViewController:[[NZLSettingViewController alloc]init] animated:NO];
            
            break;
        case 106:
            
            break;
            
        default:
            break;
    }
    
}


-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    self.mainView.sd_closeAotuLayout = YES;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    self.mainView.sd_closeAotuLayout = NO;
}


-(void)pressBotton
{
    [self.navigationController pushViewController:[[NZLJiekuanController alloc]init] animated:YES];
}



-(void)dealloc
{
    //销毁通知,不可少
    [NZLNotification removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
