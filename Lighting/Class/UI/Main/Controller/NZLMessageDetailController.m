//
//  NZLMessageDetailController.m
//  Lighting
//
//  Created by longhy on 2017/4/20.
//  Copyright © 2017年 longhy. All rights reserved.
//

#import "NZLMessageDetailController.h"

@interface NZLMessageDetailController ()<UIScrollViewDelegate>

@property(nonatomic,strong)UILabel* topLabel;
@property(nonatomic,strong)UILabel* timeLabel;
@property(nonatomic,strong)UILabel* detailLabel;
@property(nonatomic,strong)UIView* topView;
@property(nonatomic,strong)UIView* lineView;
@property(nonatomic,strong)UIScrollView* scrollView;



@end

@implementation NZLMessageDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initUI];
    
}

-(void)initUI
{
    self.title = @"我的消息";
    
    NSString* topText;
    if ([self.messageData.pushType isEqualToString:@"1"]) {
        topText = @"系统消息";
    }else{
        topText= @"活动消息";
    }
    
    
    self.scrollView = [[UIScrollView alloc]init];
    self.scrollView.delegate = self;
    self.scrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.scrollView];
    
    self.topView = [[UIView alloc]init];
    self.topView.backgroundColor = RGB(240, 240, 240);
    [self.view addSubview:self.topView];
    
    self.lineView = [[UIView alloc]init];
    self.lineView.backgroundColor = RGB(240, 240, 240);
    [self.view addSubview:self.lineView];
    
    
    self.topLabel = [UILabel labelWithText:topText textColor:RGB(34, 34, 34) font:18 textAliment:NSTextAlignmentCenter];
    [self.view addSubview:self.topLabel];
    
    self.timeLabel = [UILabel labelWithText:[FDDateFormatter interceptTimeStampFromStr:self.messageData.gmtCreate] textColor:RGB(196, 196, 196) font:10 textAliment:NSTextAlignmentCenter];
    [self.view addSubview:self.timeLabel];
    
    NSString* detail = @"祭台以巨石砌成，很开阔，紧邻折断的老柳树而建，此时上面堆积满了猛兽，如同一座小山似的。鲜红的兽血染红了巨石台，沿着石面上的刻图而淌，红艳艳，加之巨兽粗长的兽毛、寒光闪烁的鳞片以及狰狞的巨角等，触目惊心，有一种惨烈的洪荒气息扑面而来。在老族长的带领下，石村的男女老少一起祷告，请求柳木庇护，这是一场严肃的祭祀过程，而这也是一种惯例，每次狩猎回来都要进行。焦黑的树体如同过去一样寂静，并没有一点反应，一如往日不曾取用祭品，但是很多村人却知道，它有灵！终于，祭祀完毕，人们都长出了一口气，重新浮上了喜悦的笑容，开始搬这些猛兽的尸体，准备去放血、切割。“很多年了，祭灵都没有动过一次供品，还需要每次都进行祭祀吗？”一个少年小声咕哝。“臭小子你乱说什么！”他的父亲怒瞪铜铃大眼，抡起蒲扇大的手就要揍他。老族长摆了摆手，制止了，轻声道：“祭灵，是我们祭祀与供养的灵，贵在心诚，我们虔诚待它，它才会守护与保佑我们的村子。”少年的脸憋的通红，慌忙道：“族长我不是心不诚，只是觉得，祭灵好像并不需要这些祭品，从来都没有动用过。”“心意到就好了。”石云峰拍了拍他的肩头，用心解释道。祭灵，也叫“祭之灵”，是一个部族“祭祀与供养之灵”的简称，它守护村落，震慑大荒中的凶兽。族中的老人还记得，几十年前的另一个祭灵可不这样，那是一块奇石，每次献上的祭品都会失去大半精血，被它吸收。直到有一日深夜，老柳树来了，那块奇石选择远去。一切因此而变。想到当年那个雨夜，老族长有些心神恍惚，那时他还是一个少年，曾经亲眼目睹了那副震撼性的可怕画面。在那个深夜，电闪雷鸣，大雨磅礴，暴风雨狂暴到极致，大山都被雷电劈塌了许多座，山洪如海，凶兽如潮狂奔，景象恐怖。就是在那时，一株通天的大柳树在云层中出现，沐浴雷海，缭绕山岳粗的闪电，万千柳条化成一条条炽盛的神链，刺透了整片天穹，像是在与什么东西战斗。最后，大柳树折断，浑身焦黑，缩小到现在这般大，坠落而下，扎根在了石村中，与此同时闪电消失，倾盆暴雨退去。当夜村中所祭祀与供养的那块奇石就离开了。每一次想起，老族长都阵阵心颤，老柳树不是从其他大部落或山川大泽中移根而至，而是自天穹降落，遭遇无尽雷霆电海而损，村中没有几人知道。最初的几十年，它通体焦黑，没有一点生机，像是彻底死去了，直到十年前才抽出一条嫩绿的新枝，而后再无变化。“臭小子，你们小心点，难得收获到了这些凶兽，它们的血精还有筋脉以及部分骨骼珍贵的惊人，别流失了精华。”老族长回过神来叮嘱道。族中的青壮年银刀霍霍，正在切割巨兽，不时发出铿锵声，火星四溅，巨兽的骸骨坚硬的惊人。有人早已准备好了陶制的大罐子，接取那保留在兽体特殊部位的血精，这是极佳的血补大药，非常稀珍。这堆兽尸又以貔貅最珍，虽然只是一个后裔，远远比不上血脉纯净的貔貅王族，但是一样蕴含有部分真血，价值惊人。距离上次捕捉到貔貅这种凶兽已经过去两年多了，它们太过凶残与强大，一爪子下去就能坏掉一个强者的性命，实在不好对付，凶戾惊人。可以说，这次收获之丰让人咋舌。“唔，这双头火犀的犀角中保留的真血也极其惊人啊，不比那只貔貅差！”一个老爷子亲自操刀，解开了犀角下坚硬如金石的血肉，淌出一股赤红如火光般的真血。忽然，那血液竟然化成了一团红芒，一只巴掌长的双头火犀浮现，浑身赤红，栩栩如生，愤怒咆哮。“好东西，这真血药性极强，不比那貔貅差！”操刀的老爷子哈哈大笑，快速用陶罐将那犀血收了进去，牢牢封住了罐口。“族长，这头龙角象的角也是好东西啊，我们寻到时它已经奄奄一息了，不然真收拾不了。”一个青年道。石云峰点头，道：“真是不多见，它头上的这对龙角生长有些年头了，小心地凿下来，是难得的补骨宝药。”“夔兽独腿的这条筋真坚韧，用斧头都砍不断啊。”“都是好东西。臭小子小心点，别将飞蟒双翼处的宝血糟蹋了！”族人欢喜，皆充满笑容。只有一群孩子都一缩脖子，一溜烟似的跑了，因为他们知道，这些所谓的血药、骨药大半都会用在他们的身上，又要开始“受罪”了。直到半个时辰后，猛兽身上生长的“宝药”才被采尽，族长与几位老人满意的点了点头，收走了那些陶罐，拿去处理。“这么多的猎物，一会儿腌制一部分，然后熏烤、制成肉干一部分。”有经验的老人开口。如此多的猛兽堆在一起跟小山似的，全村人很多天都吃不完，如果腐坏了实在是一种浪费，对于食物有些短缺的村人来说绝不能容许。各家各户的女人开始上前分肉，皆带着真心的笑容，早先担心外出的男人，现在不仅都平安回来了，还收获还这么丰，这是上天最好的恩赐。各户炊烟袅袅，半个时辰后阵阵肉香散开，各家铁锅中熬炖的肉块都快要烂了，孩子们早已等不及。而架在火堆上烤的兽肉也开始变得金黄油亮，在往下滴油脂，落在火堆中哧哧作响，那些壮硕的汉子也都忍不住了，开始动手撕肉，咬的满嘴流汁，胃口大开。“娃子，这是貔貅肉，多吃一些会长出大力气来，是难得的珍肉啊。”“臭小子多吃点，这可是双头犀的肉，多补一些可以让你的皮骨结实的跟铁块似的，别吃那最没用的树猪肉。”各种猛兽成为了村人晚间最丰盛的食物，诱人的肉香飘散向街上，引人食欲如潮，阵阵欢笑声传来，整个村子都一片喜庆。";
    
    
    self.detailLabel = [UILabel labelWithText:[self.messageData.content stringByAppendingString:detail]  textColor:RGB(34, 34, 34) font:12 textAliment:NSTextAlignmentLeft];
    [self.scrollView addSubview:self.detailLabel];
    
    
    self.topView.sd_layout.leftEqualToView(self.view).rightEqualToView(self.view)
    .topEqualToView(self.view).heightIs(10);
    
    self.topLabel.sd_layout.centerXEqualToView(self.view).topSpaceToView(self.topView, 30).autoHeightRatio(0);
    [self.topLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    self.timeLabel.sd_layout.centerXEqualToView(self.view).topSpaceToView(self.topLabel, 15).autoHeightRatio(0);
    [self.timeLabel setSingleLineAutoResizeWithMaxWidth:200];
    
    self.lineView.sd_layout.leftEqualToView(self.view).rightEqualToView(self.view)
    .topSpaceToView(self.timeLabel, 10).heightIs(0.5);
    
    self.scrollView.sd_layout.leftSpaceToView(self.view, 10).rightSpaceToView(self.view, 10).topSpaceToView(self.lineView, 10).bottomSpaceToView(self.view, 10);
    
    self.detailLabel.sd_layout.leftEqualToView(self.scrollView).rightEqualToView(self.scrollView).topEqualToView(self.scrollView).autoHeightRatio(0);
    
    [self.scrollView setupAutoContentSizeWithBottomView:self.detailLabel bottomMargin:0];
}



-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    // 由于scrollview在滚动时会不断调用layoutSubvies方法，这就会不断触发自动布局计算，而很多时候这种计算是不必要的，所以可以通过控制“sd_closeAutoLayout”属性来设置要不要触发自动布局计算
    self.detailLabel.sd_closeAotuLayout = YES;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    self.detailLabel.sd_closeAotuLayout = NO;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
