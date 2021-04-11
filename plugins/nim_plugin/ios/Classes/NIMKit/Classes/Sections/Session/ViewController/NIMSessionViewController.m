//
//  NIMSessionViewController.m
//  NIMKit
//
//  Created by NetEase.
//  Copyright (c) 2015年 NetEase. All rights reserved.
//

#import "NIMSessionConfigurateProtocol.h"
#import "NIMKit.h"
#import "NIMMessageCellProtocol.h"
#import "NIMMessageModel.h"
#import "NIMKitUtil.h"
#import "NIMCustomLeftBarView.h"
#import "NIMBadgeView.h"
#import "UITableView+NIMScrollToBottom.h"
#import "NIMMessageMaker.h"
#import "UIView+NIM.h"
#import "NIMSessionConfigurator.h"
#import "NIMKitInfoFetchOption.h"
#import "NIMKitTitleView.h"
#import "NIMKitKeyboardInfo.h"
#import "ReportUserView.h"
#import "UIView+Toast.h"
#import "NTESFileTransSelectViewController.h"
#import "NTESSessionMsgConverter.h"
#import "ImageAndLableUD.h"
#import "FinishCourseView.h"
@interface NIMSessionViewController ()<NIMMediaManagerDelegate,NIMInputDelegate,FinishCourseViewDelegate>

@property (nonatomic,readwrite) NIMMessage *messageForMenu;

@property (nonatomic,strong)    UILabel *titleLabel;
@property(nonatomic,strong)    UIImageView *userSexImage;
@property(nonatomic,strong)    UIButton * toprightBtn;
@property(nonatomic,strong)UIButton * topback;
@property(nonatomic,strong)UIView * topView;
@property(nonatomic,strong)UILabel *infoLable;
@property(nonatomic,strong)UIView * infoView;
@property(nonatomic,strong)ImageAndLableUD * fileView;
@property(nonatomic,strong)ImageAndLableUD * mettingView;
@property(nonatomic,strong)ImageAndLableUD * tikuView;
@property(nonatomic,strong)ImageAndLableUD * shopView;
@property(nonatomic,strong)ImageAndLableUD * peopleView;


@property(nonatomic,strong)UIView * chatListView;
@property(nonatomic,strong)UIView * reportUserView;
@property(nonatomic,strong)UIView * reportSuccessView;
@property(nonatomic,strong)ReportUserView * reportUser;


@property (nonatomic,strong)    UILabel *subTitleLabel;

@property (nonatomic,strong)    NSIndexPath *lastVisibleIndexPathBeforeRotation;

@property (nonatomic,strong)  NIMSessionConfigurator *configurator;

@property (nonatomic,weak)    id<NIMSessionInteractor> interactor;

@end

@implementation NIMSessionViewController

- (instancetype)initWithSession:(NIMSession *)session{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        _session = session;
    }
    return self;
}

- (void)dealloc
{
    [self removeListener];
    [[NIMKit sharedKit].robotTemplateParser clean];
    
    _tableView.delegate = nil;
    _tableView.dataSource = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    tap1.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tap1];
    //消息 tableView
    [self setupTableView];
    //输入框 inputView
    [self setupInputView];
    //会话相关逻辑配置器安装
    [self setupConfigurator];
    //添加监听
    [self addListener];
    //进入会话时，标记所有消息已读，并发送已读回执
    [self markRead];
    //更新已读位置
    [self uiCheckReceipts:nil];
    //导航栏
    [self setupNav];
}
-(void)viewTapped:(UITapGestureRecognizer*)tap1
{
    [self.view endEditing:YES];
    
}
- (void)setupNav
{
    [self setUpTitleView];
    //    NIMCustomLeftBarView *leftBarView = [[NIMCustomLeftBarView alloc] init];
    //    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftBarView];
    //    if (@available(iOS 11.0, *)) {
    //        leftBarView.translatesAutoresizingMaskIntoConstraints = NO;
    //    }
    //    self.navigationItem.leftBarButtonItems = @[leftItem];
    //    self.navigationItem.leftItemsSupplementBackButton = YES;
    
    
    
    
}

- (void)setupTableView
{
    CGFloat topFloat;
    if ([self.userDic objectForKey:@"tic"]) {
        topFloat=84+70+LL_StatusBarHeight;
    }else{
        topFloat=44+LL_StatusBarHeight;
    }
    
    self.chatListView=[[UIView alloc]init];
    [self.view addSubview:self.chatListView];
    
    self.chatListView
    .sd_layout
    .widthIs(LL_ScreenWidth)
    .leftSpaceToView(self.view,0)
    .topSpaceToView(self.view,topFloat)
    .bottomSpaceToView(self.view, 0);
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    self.tableView = [[UITableView alloc] initWithFrame:self.chatListView.bounds style:UITableViewStylePlain];
    
    
    self.tableView.backgroundColor = NIMKit_UIColorFromRGB(0xffffff);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    if ([self.sessionConfig respondsToSelector:@selector(sessionBackgroundImage)] && [self.sessionConfig sessionBackgroundImage]) {
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:self.view.bounds];
        imgView.image = [self.sessionConfig sessionBackgroundImage];
        imgView.contentMode = UIViewContentModeScaleAspectFill;
        self.tableView.backgroundView = imgView;
    }
    [self.chatListView addSubview:self.tableView];
}


- (void)setupInputView
{
    if ([self shouldShowInputView])
    {
        self.sessionInputView = [[NIMInputView alloc] initWithFrame:CGRectMake(0, 0, self.view.nim_width,0) config:self.sessionConfig];
        self.sessionInputView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
        [self.sessionInputView setSession:self.session];
        [self.sessionInputView setInputDelegate:self];
        [self.sessionInputView setInputActionDelegate:self];
        [self.sessionInputView refreshStatus:NIMInputStatusText];
        [self.view addSubview:_sessionInputView];
    }
}


- (void)setupConfigurator
{
    _configurator = [[NIMSessionConfigurator alloc] init];
    [_configurator setup:self];
    
    BOOL needProximityMonitor = [self needProximityMonitor];
    [[NIMSDK sharedSDK].mediaManager setNeedProximityMonitor:needProximityMonitor];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.interactor onViewWillAppear];
}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.sessionInputView endEditing:YES];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self.interactor onViewDidDisappear];
}


- (void)viewDidLayoutSubviews
{
    [self changeLeftBarBadge:self.conversationManager.allUnreadCount];
    [self.interactor resetLayout];
}



#pragma mark - 消息收发接口
- (void)sendMessage:(NIMMessage *)message
{
    [self.interactor sendMessage:message];
}

- (void)sendMessage:(NIMMessage *)message completion:(void(^)(NSError * err))completion
{
    [self.interactor sendMessage:message completion:^(NSError *err) {
        if(completion) {
            completion(err);
        }
    }];
}


#pragma mark - Touch Event
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [_sessionInputView endEditing:YES];
}


#pragma mark - NIMSessionConfiguratorDelegate

- (void)didFetchMessageData
{
    [self uiCheckReceipts:nil];
    [self.tableView reloadData];
    [self.tableView nim_scrollToBottom:NO];
}

- (void)didRefreshMessageData
{
    [self refreshSessionTitle:self.sessionTitle];
    [self refreshSessionSubTitle:self.sessionSubTitle];
    [self.tableView reloadData];
}

- (void)didPullUpMessageData {}

#pragma mark - 会话title
- (NSString *)sessionTitle
{
    NSString *title = @"";
    NIMSessionType type = self.session.sessionType;
    switch (type) {
        case NIMSessionTypeTeam:{
            NIMTeam *team = [[[NIMSDK sharedSDK] teamManager] teamById:self.session.sessionId];
            title = [NSString stringWithFormat:@"%@(%zd)",[team teamName],[team memberNumber]];
        }
            break;
        case NIMSessionTypeP2P:{
            title = [NIMKitUtil showNick:self.session.sessionId inSession:self.session];
        }
            break;
        default:
            break;
    }
    return title;
}

- (NSString *)sessionSubTitle{return @"";};

#pragma mark - NIMChatManagerDelegate
//开始发送
- (void)willSendMessage:(NIMMessage *)message
{
    id<NIMSessionInteractor> interactor = self.interactor;
    
    if ([message.session isEqual:self.session]) {
        if ([interactor findMessageModel:message]) {
            [interactor updateMessage:message];
        }else{
            [interactor addMessages:@[message]];
        }
    }
}

//上传资源文件成功
- (void)uploadAttachmentSuccess:(NSString *)urlString
                     forMessage:(NIMMessage *)message
{
    //如果需要使用富文本推送，可以在这里进行 message apns payload 的设置
}


//发送结果
- (void)sendMessage:(NIMMessage *)message didCompleteWithError:(NSError *)error
{
    if ([message.session isEqual:_session])
    {
        [self.interactor updateMessage:message];
        if (message.session.sessionType == NIMSessionTypeTeam)
        {
            //如果是群的话需要检查一下回执显示情况
            NIMMessageReceipt *receipt = [[NIMMessageReceipt alloc] initWithMessage:message];
            [self.interactor checkReceipts:@[receipt]];
        }
    }
}

//发送进度
-(void)sendMessage:(NIMMessage *)message progress:(float)progress
{
    if ([message.session isEqual:_session]) {
        [self.interactor updateMessage:message];
    }
}

//接收消息
- (void)onRecvMessages:(NSArray *)messages
{
    if ([self shouldAddListenerForNewMsg])
    {
        NIMMessage *message = messages.firstObject;
        NIMSession *session = message.session;
        if (![session isEqual:self.session] || !messages.count)
        {
            return;
        }
        
        [self uiAddMessages:messages];
        [self.interactor markRead];
    }
}


- (void)fetchMessageAttachment:(NIMMessage *)message progress:(float)progress
{
    if ([message.session isEqual:_session])
    {
        [self.interactor updateMessage:message];
    }
}
-(void)openLocationController:(UIViewController *)controller{
    controller.modalPresentationStyle = 0;
    [self presentViewController:controller animated:NO completion:nil];
}

- (void)fetchMessageAttachment:(NIMMessage *)message didCompleteWithError:(NSError *)error
{
    if ([message.session isEqual:_session])
    {
        NIMMessageModel *model = [self.interactor findMessageModel:message];
        //下完缩略图之后，因为比例有变化，重新刷下宽高。
        [model cleanCache];
        [self.interactor updateMessage:message];
    }
}

- (void)onRecvMessageReceipts:(NSArray<NIMMessageReceipt *> *)receipts
{
    if ([self shouldAddListenerForNewMsg])
    {
        NSMutableArray *handledReceipts = [[NSMutableArray alloc] init];
        for (NIMMessageReceipt *receipt in receipts) {
            if ([receipt.session isEqual:self.session])
            {
                [handledReceipts addObject:receipt];
            }
        }
        if (handledReceipts.count)
        {
            [self uiCheckReceipts:handledReceipts];
        }
    }
}

#pragma mark - NIMConversationManagerDelegate
- (void)messagesDeletedInSession:(NIMSession *)session{
    [self.interactor resetMessages:nil];
    [self.tableView reloadData];
}

- (void)didAddRecentSession:(NIMRecentSession *)recentSession
           totalUnreadCount:(NSInteger)totalUnreadCount{
    [self changeUnreadCount:recentSession totalUnreadCount:totalUnreadCount];
}

- (void)didUpdateRecentSession:(NIMRecentSession *)recentSession
              totalUnreadCount:(NSInteger)totalUnreadCount{
    [self changeUnreadCount:recentSession totalUnreadCount:totalUnreadCount];
}

- (void)didRemoveRecentSession:(NIMRecentSession *)recentSession
              totalUnreadCount:(NSInteger)totalUnreadCount{
    [self changeUnreadCount:recentSession totalUnreadCount:totalUnreadCount];
}


- (void)changeUnreadCount:(NIMRecentSession *)recentSession
         totalUnreadCount:(NSInteger)totalUnreadCount{
    if ([recentSession.session isEqual:self.session]) {
        return;
    }
    [self changeLeftBarBadge:totalUnreadCount];
}

#pragma mark - NIMMediaManagerDelegate
- (void)recordAudio:(NSString *)filePath didBeganWithError:(NSError *)error {
    if (!filePath || error) {
        _sessionInputView.recording = NO;
        [self onRecordFailed:error];
    }
}

- (void)recordAudio:(NSString *)filePath didCompletedWithError:(NSError *)error {
    if(!error) {
        if ([self recordFileCanBeSend:filePath]) {
            [self sendMessage:[NIMMessageMaker msgWithAudio:filePath]];
        }else{
            [self showRecordFileNotSendReason];
        }
    } else {
        [self onRecordFailed:error];
    }
    _sessionInputView.recording = NO;
}

- (void)recordAudioDidCancelled {
    _sessionInputView.recording = NO;
}

- (void)recordAudioProgress:(NSTimeInterval)currentTime {
    [_sessionInputView updateAudioRecordTime:currentTime];
}

- (void)recordAudioInterruptionBegin {
    [[NIMSDK sharedSDK].mediaManager cancelRecord];
}

#pragma mark - 录音相关接口
- (void)onRecordFailed:(NSError *)error{}

- (BOOL)recordFileCanBeSend:(NSString *)filepath
{
    return YES;
}

- (void)showRecordFileNotSendReason{}

#pragma mark - NIMInputDelegate

- (void)didChangeInputHeight:(CGFloat)inputHeight
{
    [self.interactor changeLayout:inputHeight];
}

#pragma mark - NIMInputActionDelegate
- (BOOL)onTapMediaItem:(NIMMediaItem *)item{
    SEL sel = item.selctor;
    BOOL handled = sel && [self respondsToSelector:sel];
    if (handled) {
        NIMKit_SuppressPerformSelectorLeakWarning([self performSelector:sel withObject:item]);
        handled = YES;
    }
    return handled;
}

- (void)onTextChanged:(id)sender{}

- (void)onSendText:(NSString *)text atUsers:(NSArray *)atUsers
{
    NSMutableArray *users = [NSMutableArray arrayWithArray:atUsers];
    if (self.session.sessionType == NIMSessionTypeP2P)
    {
        [users addObject:self.session.sessionId];
    }
    NSString *robotsToSend = [self robotsToSend:users];
    
    NIMMessage *message = nil;
    if (robotsToSend.length)
    {
        message = [NIMMessageMaker msgWithRobotQuery:text toRobot:robotsToSend];
    }
    else
    {
        message = [NIMMessageMaker msgWithText:text];
    }
    
    if (atUsers.count)
    {
        NIMMessageApnsMemberOption *apnsOption = [[NIMMessageApnsMemberOption alloc] init];
        apnsOption.userIds = atUsers;
        apnsOption.forcePush = YES;
        
        NIMKitInfoFetchOption *option = [[NIMKitInfoFetchOption alloc] init];
        option.session = self.session;
        
        NSString *me = [[NIMKit sharedKit].provider infoByUser:[NIMSDK sharedSDK].loginManager.currentAccount option:option].showName;
        apnsOption.apnsContent = [NSString stringWithFormat:@"%@在群里@了你",me];
        message.apnsMemberOption = apnsOption;
    }
    [self sendMessage:message];
}

- (NSString *)robotsToSend:(NSArray *)atUsers
{
    for (NSString *userId in atUsers)
    {
        if ([[NIMSDK sharedSDK].robotManager isValidRobot:userId])
        {
            return userId;
        }
    }
    return nil;
}


- (void)onSelectChartlet:(NSString *)chartletId
                 catalog:(NSString *)catalogId{}

- (void)onCancelRecording
{
    [[NIMSDK sharedSDK].mediaManager cancelRecord];
}

- (void)onStopRecording
{
    [[NIMSDK sharedSDK].mediaManager stopRecord];
}

- (void)onStartRecording
{
    _sessionInputView.recording = YES;
    
    NIMAudioType type = [self recordAudioType];
    NSTimeInterval duration = [NIMKit sharedKit].config.recordMaxDuration;
    
    [[NIMSDK sharedSDK].mediaManager addDelegate:self];
    
    [[NIMSDK sharedSDK].mediaManager record:type
                                   duration:duration];
}

#pragma mark - NIMMessageCellDelegate
- (BOOL)onTapCell:(NIMKitEvent *)event{
    BOOL handle = NO;
    NSString *eventName = event.eventName;
    if ([eventName isEqualToString:NIMKitEventNameTapAudio])
    {
        [self.interactor mediaAudioPressed:event.messageModel];
        handle = YES;
    }
    if ([eventName isEqualToString:NIMKitEventNameTapRobotBlock]) {
        NSDictionary *param = event.data;
        NIMMessage *message = [NIMMessageMaker msgWithRobotSelect:param[@"text"] target:param[@"target"] params:param[@"param"] toRobot:param[@"robotId"]];
        [self sendMessage:message];
        handle = YES;
    }
    if ([eventName isEqualToString:NIMKitEventNameTapRobotContinueSession]) {
        NIMRobotObject *robotObject = (NIMRobotObject *)event.messageModel.message.messageObject;
        NIMRobot *robot = [[NIMSDK sharedSDK].robotManager robotInfo:robotObject.robotId];
        NSString *text = [NSString stringWithFormat:@"%@%@%@",NIMInputAtStartChar,robot.nickname,NIMInputAtEndChar];
        
        NIMInputAtItem *item = [[NIMInputAtItem alloc] init];
        item.uid  = robot.userId;
        item.name = robot.nickname;
        [self.sessionInputView.atCache addAtItem:item];
        
        [self.sessionInputView.toolBar insertText:text];
        
        handle = YES;
    }
    
    return handle;
}

- (void)onRetryMessage:(NIMMessage *)message
{
    if (message.isReceivedMsg) {
        [[[NIMSDK sharedSDK] chatManager] fetchMessageAttachment:message
                                                           error:nil];
    }else{
        [[[NIMSDK sharedSDK] chatManager] resendMessage:message
                                                  error:nil];
    }
}

- (BOOL)onLongPressCell:(NIMMessage *)message
                 inView:(UIView *)view
{
    BOOL handle = NO;
    NSArray *items = [self menusItems:message];
    if ([items count] && [self becomeFirstResponder]) {
        UIMenuController *controller = [UIMenuController sharedMenuController];
        controller.menuItems = items;
        _messageForMenu = message;
        [controller setTargetRect:view.bounds inView:view];
        [controller setMenuVisible:YES animated:YES];
        handle = YES;
    }
    return handle;
}

- (BOOL)disableAudioPlayedStatusIcon:(NIMMessage *)message
{
    BOOL disable = NO;
    if ([self.sessionConfig respondsToSelector:@selector(disableAudioPlayedStatusIcon)])
    {
        disable = [self.sessionConfig disableAudioPlayedStatusIcon];
    }
    return disable;
}

#pragma mark - 配置项
- (id<NIMSessionConfig>)sessionConfig
{
    return nil; //使用默认配置
}

#pragma mark - 配置项列表
//是否需要监听新消息通知 : 某些场景不需要监听新消息，如浏览服务器消息历史界面
- (BOOL)shouldAddListenerForNewMsg
{
    BOOL should = YES;
    if ([self.sessionConfig respondsToSelector:@selector(disableReceiveNewMessages)]) {
        should = ![self.sessionConfig disableReceiveNewMessages];
    }
    return should;
}



//是否需要显示输入框 : 某些场景不需要显示输入框，如使用 3D touch 的场景预览会话界面内容
- (BOOL)shouldShowInputView
{
    BOOL should = YES;
    if ([self.sessionConfig respondsToSelector:@selector(disableInputView)]) {
        should = ![self.sessionConfig disableInputView];
    }
    return should;
}


//当前录音格式 : NIMSDK 支持 aac 和 amr 两种格式
- (NIMAudioType)recordAudioType
{
    NIMAudioType type = NIMAudioTypeAAC;
    if ([self.sessionConfig respondsToSelector:@selector(recordType)]) {
        type = [self.sessionConfig recordType];
    }
    return type;
}

//是否需要监听感应器事件
- (BOOL)needProximityMonitor
{
    BOOL needProximityMonitor = YES;
    if ([self.sessionConfig respondsToSelector:@selector(disableProximityMonitor)]) {
        needProximityMonitor = !self.sessionConfig.disableProximityMonitor;
    }
    return needProximityMonitor;
}


#pragma mark - 菜单
- (NSArray *)menusItems:(NIMMessage *)message
{
    NSMutableArray *items = [NSMutableArray array];
    
    BOOL copyText = NO;
    if (message.messageType == NIMMessageTypeText)
    {
        copyText = YES;
    }
    if (message.messageType == NIMMessageTypeRobot)
    {
        NIMRobotObject *robotObject = (NIMRobotObject *)message.messageObject;
        copyText = !robotObject.isFromRobot;
    }
    if (copyText) {
        [items addObject:[[UIMenuItem alloc] initWithTitle:@"复制"
                                                    action:@selector(copyText:)]];
    }
    [items addObject:[[UIMenuItem alloc] initWithTitle:@"删除"
                                                action:@selector(deleteMsg:)]];
    
    if ([message.from isEqualToString:[self.userDic objectForKey:@"accid"]]) {
        [items addObject:[[UIMenuItem alloc] initWithTitle:@"举报"
                                                    action:@selector(reportUser:)]];
    }
    if (self.session.sessionType ==NIMSessionTypeTeam) {
         [items addObject:[[UIMenuItem alloc] initWithTitle:@"举报"
         action:@selector(reportUser:)]];
     }
     
         if ([self.userDic objectForKey:@"tic"]) {
         
         
         }
     
    
    return items;
    
}

- (NIMMessage *)messageForMenu
{
    return _messageForMenu;
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    NSArray *items = [[UIMenuController sharedMenuController] menuItems];
    for (UIMenuItem *item in items) {
        if (action == [item action]){
            return YES;
        }
    }
    return NO;
}


- (void)copyText:(id)sender
{
    NIMMessage *message = [self messageForMenu];
    if (message.text.length) {
        UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
        [pasteboard setString:message.text];
    }
}

- (void)deleteMsg:(id)sender
{
    NIMMessage *message    = [self messageForMenu];
    [self uiDeleteMessage:message];
    [self.conversationManager deleteMessage:message];
}

//举报用户
- (void)reportUser:(id)sender
{
    NSLog(@"点击举报");
    NIMMessage *message    = [self messageForMenu];
    [self showReportView];
    
}
- (void)menuDidHide:(NSNotification *)notification
{
    [UIMenuController sharedMenuController].menuItems = nil;
}


#pragma mark - 操作接口
- (void)uiAddMessages:(NSArray *)messages
{
    [self.interactor addMessages:messages];
}

- (void)uiInsertMessages:(NSArray *)messages
{
    [self.interactor insertMessages:messages];
}

- (NIMMessageModel *)uiDeleteMessage:(NIMMessage *)message{
    NIMMessageModel *model = [self.interactor deleteMessage:message];
    if (model.shouldShowReadLabel && model.message.session.sessionType == NIMSessionTypeP2P)
    {
        [self uiCheckReceipts:nil];
    }
    return model;
}

- (void)uiUpdateMessage:(NIMMessage *)message{
    [self.interactor updateMessage:message];
}

- (void)uiCheckReceipts:(NSArray<NIMMessageReceipt *> *)receipts
{
    [self.interactor checkReceipts:receipts];
}

#pragma mark - NIMMeidaButton
- (void)onTapMediaItemPicture:(NIMMediaItem *)item
{
    [self.interactor mediaPicturePressed];
}

- (void)onTapMediaItemShoot:(NIMMediaItem *)item
{
    [self.interactor mediaShootPressed];
}

- (void)onTapMediaItemLocation:(NIMMediaItem *)item
{
    [self.interactor mediaLocationPressed];
}

- (void)onTapMediaItemAsk:(NIMMediaItem *)item
{
    
//        [self.interactor mediaLocationPressed];
    if (self.delegate) {
        [self.delegate toAddQuestion];
    }
    [self toBackView];
    
}

#pragma mark - 文件传输
- (void)onTapMediaItemFileTrans:(NIMMediaItem *)item
{
    NTESFileTransSelectViewController *vc = [[NTESFileTransSelectViewController alloc]
                                             initWithNibName:nil bundle:nil];
    __weak typeof(self) wself = self;
    __weak typeof(vc)   wVC = vc;
    vc.completionBlock = ^void(id sender,NSString *ext){
        if ([sender isKindOfClass:[NSString class]]) {
            [wself sendMessage:[NTESSessionMsgConverter msgWithFilePath:sender] completion:^(NSError *err) {
                if(wVC) {
                    [wself.navigationController popViewControllerAnimated:YES];
                }
            }];
        }else if ([sender isKindOfClass:[NSData class]]){
            [wself sendMessage:[NTESSessionMsgConverter msgWithFileData:sender extension:ext]];
            if(wVC) {
                [wself.navigationController popViewControllerAnimated:YES];
            }
        }
    };
    //    [self.navigationController pushViewController:vc animated:YES];
    
    [self presentViewController:vc animated:NO completion:nil];
}


#pragma mark - 旋转处理 (iOS8 or above)
- (void)viewWillTransitionToSize:(CGSize)size
       withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    self.lastVisibleIndexPathBeforeRotation = [self.tableView indexPathsForVisibleRows].lastObject;
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    if (self.view.window) {
        __weak typeof(self) wself = self;
        [coordinator animateAlongsideTransition:^(id <UIViewControllerTransitionCoordinatorContext> context)
         {
            [[NIMSDK sharedSDK].mediaManager cancelRecord];
            [wself.interactor cleanCache];
            [wself.sessionInputView reset];
            [wself.tableView reloadData];
            [wself.tableView scrollToRowAtIndexPath:wself.lastVisibleIndexPathBeforeRotation atScrollPosition:UITableViewScrollPositionBottom animated:NO];
        } completion:nil];
    }
}


#pragma mark - 标记已读
- (void)markRead
{
    [self.interactor markRead];
}


#pragma mark - Private

- (void)addListener
{
    [[NIMSDK sharedSDK].chatManager addDelegate:self];
    [[NIMSDK sharedSDK].conversationManager addDelegate:self];
}

- (void)removeListener
{
    [[NIMSDK sharedSDK].chatManager removeDelegate:self];
    [[NIMSDK sharedSDK].conversationManager removeDelegate:self];
}

- (void)changeLeftBarBadge:(NSInteger)unreadCount
{
    NIMCustomLeftBarView *leftBarView = (NIMCustomLeftBarView *)self.navigationItem.leftBarButtonItem.customView;
    leftBarView.badgeView.badgeValue = @(unreadCount).stringValue;
    leftBarView.badgeView.hidden = !unreadCount;
}


- (id<NIMConversationManager>)conversationManager{
    switch (self.session.sessionType) {
        case NIMSessionTypeChatroom:
            return nil;
            break;
        case NIMSessionTypeP2P:
        case NIMSessionTypeTeam:
        default:
            return [NIMSDK sharedSDK].conversationManager;
    }
}


- (void)setUpTitleView
{
    
    //    NSLog(@"%@",LL_StatusBarHeight);
    
    self.topView=[[UIView alloc]init];
    [self.topView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.topView];
    
    self.topView
    .sd_layout
    .widthIs(LL_ScreenWidth)
    .heightIs(44+LL_StatusBarHeight)
    .leftSpaceToView(self.view,0)
    .topSpaceToView(self.view,0);
    
    self.topback=[[UIButton alloc] init];
    // [self.topback setContentMode:UIViewContentModeLeft];
    //[UIImage nim_imageInKit:@"icon_sender_text_node_normal"]
    [self.topback setImage:[UIImage nim_imageInKit:@"icon_top_back"] forState:UIControlStateNormal];
    [self.topView addSubview:self.topback];
    self.topback.sd_layout
    .widthIs(30)
    .heightIs(30)
    .topSpaceToView(self.topView,LL_ToTopHeight)
    .leftSpaceToView(self.topView,10);
    
    self.titleLabel=[[UILabel alloc]init];
    if ([self.userDic objectForKey:@"tic"]) {
        [self.titleLabel setText:[self.userDic objectForKey:@"name"]];
    }else{
        [self.titleLabel setText:[self.userDic objectForKey:@"nickname"]];
    }
    [self.titleLabel setTextColor:[UIColor colorWithHexString:@"#1D2037"]];
    self.titleLabel.font=[UIFont boldSystemFontOfSize:18];
    [self.topView addSubview:self.titleLabel];
    
    self.titleLabel
    .sd_layout
    .widthIs([UILabel getWidthWithTitle:self.titleLabel.text font:self.titleLabel.font])
    .heightIs(30)
    .topSpaceToView(self.topView,LL_ToTopHeight)
    .leftSpaceToView(self.topView,(LL_ScreenWidth-[UILabel getWidthWithTitle:self.titleLabel.text font:self.titleLabel.font])/2);
    
    
    self.toprightBtn=[[UIButton alloc]init];
    
    [self.toprightBtn setImage:[UIImage nim_imageInKit:@"icon_top_more"] forState:UIControlStateNormal];
    [self.topView addSubview:self.toprightBtn];
    self.toprightBtn.sd_layout
    .widthIs(60)
    .heightIs(30)
    .topSpaceToView(self.topView,LL_ToTopHeight)
    .rightSpaceToView(self.topView,5);
    
    [self.topback addTarget:self action:@selector(toBackView) forControlEvents:UIControlEventTouchUpInside];
    [self.toprightBtn addTarget:self action:@selector(openFriendInfo) forControlEvents:UIControlEventTouchUpInside];
    
    if ([self.userDic objectForKey:@"tic"]) {
        self.infoView=[[UIView alloc]init];
        [self.infoView setBackgroundColor:[UIColor whiteColor]];
        [self.view addSubview:self.infoView];
        self.infoView
        .sd_layout
        .widthIs(LL_ScreenWidth)
        .heightIs(40)
        .leftSpaceToView(self.view,0)
        .topSpaceToView(self.topView,0);
        self.infoLable=[[UILabel alloc]init];
        [self.infoLable setText:[self.userDic objectForKey:@"message"]];
        [self.infoLable setTextColor:[UIColor colorWithHexString:@"#ACAEBC"]];
        self.infoLable.font=[UIFont boldSystemFontOfSize:11];
        [self.infoView addSubview:self.infoLable];
        self.infoLable
        .sd_layout
        .widthIs([UILabel getWidthWithTitle:self.infoLable.text font:self.infoLable.font])
        .heightIs(30)
        .topSpaceToView(self.infoView,0)
        .leftSpaceToView(self.infoView,(LL_ScreenWidth-[UILabel getWidthWithTitle:self.infoLable.text font:self.infoLable.font])/2);
        
        UIView * lineView=[[UIView alloc]init];
        [lineView setBackgroundColor:[UIColor colorWithHexString:@"#ECF2F7"]];
        [self.view addSubview:lineView];
        lineView
        .sd_layout
        .widthIs(LL_ScreenWidth)
        .heightIs(1)
        .leftSpaceToView(self.view,0)
        .topSpaceToView(self.infoView,0);
        
        _fileView=[[ImageAndLableUD alloc]init];
        [self.view addSubview:_fileView];
        _fileView
        .sd_layout
        .widthIs(LL_ScreenWidth/5)
        .heightIs(39)
        .leftSpaceToView(self.view,0)
        .topSpaceToView(_infoView,18);
        [_fileView initView:11  nameFunt:11 labcolor:@"#ACAEBC" gap:9 imagewidth:19 imageheight:19 viewwidth:LL_ScreenWidth/5];
        [_fileView.name setText:@"文件"];
        [_fileView.image setImage:[UIImage nim_imageInKit:@"cp_chat_file"] ];
        
        
        _mettingView=[[ImageAndLableUD alloc]init];
        [self.view addSubview:_mettingView];
        _mettingView
        .sd_layout
        .widthIs(LL_ScreenWidth/5)
        .heightIs(39)
        .leftSpaceToView(_fileView,0)
        .topSpaceToView(_infoView,18);
        [_mettingView initView:11  nameFunt:11 labcolor:@"#ACAEBC" gap:9 imagewidth:19 imageheight:19 viewwidth:LL_ScreenWidth/5];
        [_mettingView.name setText:@"Meeting"];
        [_mettingView.image setImage:[UIImage nim_imageInKit:@"cp_chat_metting"] ];
        
        
        _tikuView=[[ImageAndLableUD alloc]init];
        [self.view addSubview:_tikuView];
        _tikuView
        .sd_layout
        .widthIs(LL_ScreenWidth/5)
        .heightIs(39)
        .leftSpaceToView(_mettingView,0)
        .topSpaceToView(_infoView,18);
        [_tikuView initView:11  nameFunt:11 labcolor:@"#ACAEBC" gap:9 imagewidth:19 imageheight:19 viewwidth:LL_ScreenWidth/5];
        [_tikuView.name setText:@"题库"];
        [_tikuView.image setImage:[UIImage nim_imageInKit:@"cp_chat_tiku"] ];
        
        _shopView=[[ImageAndLableUD alloc]init];
          [self.view addSubview:_shopView];
          _shopView
          .sd_layout
          .widthIs(LL_ScreenWidth/5)
          .heightIs(39)
          .leftSpaceToView(_tikuView,0)
          .topSpaceToView(_infoView,18);
          [_shopView initView:11  nameFunt:11 labcolor:@"#ACAEBC" gap:9 imagewidth:19 imageheight:19 viewwidth:LL_ScreenWidth/5];
          [_shopView.name setText:@"书店"];
          [_shopView.image setImage:[UIImage nim_imageInKit:@"cp_chat_shudian"] ];
        
        _peopleView=[[ImageAndLableUD alloc]init];
          [self.view addSubview:_peopleView];
          _peopleView
          .sd_layout
          .widthIs(LL_ScreenWidth/5)
          .heightIs(39)
          .leftSpaceToView(_shopView,0)
          .topSpaceToView(_infoView,18);
          [_peopleView initView:11  nameFunt:11 labcolor:@"#ACAEBC" gap:9 imagewidth:19 imageheight:19 viewwidth:LL_ScreenWidth/5];
          [_peopleView.name setText:@"全员"];
          [_peopleView.image setImage:[UIImage nim_imageInKit:@"cp_chat_qun"] ];
          
        
    }
    
    
    
    //    NIMKitTitleView *titleView = (NIMKitTitleView *)self.navigationItem.titleView;
    //    if (!titleView || ![titleView isKindOfClass:[NIMKitTitleView class]])
    //    {
    //        titleView = [[NIMKitTitleView alloc] initWithFrame:CGRectZero];
    //        self.navigationItem.titleView = titleView;
    //
    //        titleView.titleLabel.text = self.sessionTitle;
    //        titleView.subtitleLabel.text = self.sessionSubTitle;
    //
    //        self.titleLabel    = titleView.titleLabel;
    //        self.subTitleLabel = titleView.subtitleLabel;
    //    }
    //
    //    [titleView sizeToFit];
    
    if ([self.userDic objectForKey:@"tic"]) {
        NSString *ucstate=[self.userDic objectForKey:@"ucstate"];
        if ([ucstate isEqualToString:@"2"]) {
            [self.sessionInputView setHidden:YES];
        }
//         if ([self.userDic objectForKey:@"curendtime"]) {
//             NSString * curendtime=[self.userDic objectForKey:@"curendtime"];
//             NSString *ucstate=[self.userDic objectForKey:@"ucstate"];
//             if ([curendtime doubleValue]<=10&&[ucstate isEqualToString:@"1"]) {
//                  NSArray *  timeDatas = [curendtime componentsSeparatedByString:@"."];
//                 FinishCourseView *popView = [[FinishCourseView alloc] initWithDay:timeDatas[0]];
//                          popView.delegate=self;
//                          [popView showToView:self.view];
//             }
//
//         }
     
       
         
     }
    
    _fileView.userInteractionEnabled=YES;
    UITapGestureRecognizer *tapFileView=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(toSelectFile)];
    [_fileView addGestureRecognizer:tapFileView];
    
    _mettingView.userInteractionEnabled=YES;
    UITapGestureRecognizer *tapMettingView=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(toMetting)];
    [_mettingView addGestureRecognizer:tapMettingView];
    
    _tikuView.userInteractionEnabled=YES;
    UITapGestureRecognizer *tapTiku=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(toQuestionBank)];
    [_tikuView addGestureRecognizer:tapTiku];
    
    _shopView.userInteractionEnabled=YES;
    UITapGestureRecognizer *tapShop=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(toShopping)];
    [_shopView addGestureRecognizer:tapShop];
    
    _peopleView.userInteractionEnabled=YES;
    UITapGestureRecognizer *tapPeople=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(openFriendInfo)];
    [_peopleView addGestureRecognizer:tapPeople];
    
    
}
-(void)toFinishCourse{
    if (self.delegate) {
        [self.delegate toFinishCourse];
    }
    [self toBackView];
}
-(void)toSelectFile{
    if (self.delegate) {
        [self.delegate toSelectFile];
    }
    [self toBackView];
}
-(void)toMetting{
    if (self.delegate) {
        [self.delegate toMetting];
    }
    [self toBackView];
}
-(void)toShopping{
    if (self.delegate) {
        [self.delegate toShopping];
    }
    [self toBackView];
}
-(void)toQuestionBank{
    if (self.delegate) {
        [self.delegate toQuestionBank];
    }
    [self toBackView];
}
-(void)toAddQuestion{
    if (self.delegate) {
          [self.delegate toAddQuestion];
      }
      [self toBackView];
}



-(void)toBackView{
//    [self.view.window.layer addAnimation:[self getCATransitionsByType:kCATransitionPush andSubtype:kCATransitionFromLeft] forKey:nil];
    [self dismissViewControllerAnimated:NO completion:nil];
}

-(CATransition *) getCATransitionsByType:(NSString *)type andSubtype:(NSString *)subtype{
    CATransition *animation = [CATransition animation];
    animation.duration = 0.5;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    animation.type = type;
    animation.subtype = subtype;
    return animation;
}
- (void)refreshSessionTitle:(NSString *)title
{
    self.titleLabel.text = title;
    [self setUpTitleView];
}


- (void)refreshSessionSubTitle:(NSString *)title
{
    self.subTitleLabel.text = title;
    [self setUpTitleView];
}

-(void)openFriendInfo{
    
    if (self.delegate) {   //  判断block是否指向了某个block实体 ^(传入参数列){行为主体};
        [self.delegate toFriendInfo];  //  执行指向的block实体的代码块 ^{}
    }
    [self toBackView];
}


-(void)showReportView{
    if (self.reportUserView==nil) {
        self.reportUserView=[[UIView alloc]init];
        
        [self.view addSubview:self.reportUserView];
        
        self.reportUserView
        .sd_layout
        .widthIs(LL_ScreenWidth)
        .heightIs(LL_ScreenHeight)
        .leftSpaceToView(self.view,0)
        .topSpaceToView(self.view,0);
        
        
        UIView * clickView=[[UIView alloc]init];
        
        [self.reportUserView addSubview:clickView];
        
        clickView
        .sd_layout
        .widthIs(LL_ScreenWidth)
        .heightIs(LL_ScreenHeight)
        .leftSpaceToView(self.reportUserView,0)
        .topSpaceToView(self.reportUserView,0);
        
        self.reportUser=[[ReportUserView alloc]initWithFrame:CGRectMake(0, 0, LL_ScreenWidth, 342.5)];
        [self.reportUserView addSubview:self.reportUser];
        self.reportUser
        .sd_layout
        .widthIs(LL_ScreenWidth)
        .heightIs(342.5)
        .leftSpaceToView(self.reportUserView,0)
        .topSpaceToView(self.reportUserView,(LL_ScreenHeight-342.5)/2);
        clickView.userInteractionEnabled=YES;
        UITapGestureRecognizer *tapReport=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hiddenReportView)];
        [clickView addGestureRecognizer:tapReport];
        
        self.reportUser.queding.userInteractionEnabled=YES;
        UITapGestureRecognizer *tapQueding=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(toJuBao)];
        [self.reportUser.queding addGestureRecognizer:tapQueding];
    }
    [self.reportUserView setHidden:NO];
}
-(void)hiddenReportView{
    [self.reportUserView setHidden:YES];
}

-(void)toJuBao{
    
    if (self.reportUser.selected<1) {
        [self.view makeToast:@"请选择举报类型"];
        return;
    }
    
    if ([self isNullString:self.reportUser.yuanyin.text]) {
        [self.view makeToast:@"请输入举报原因"];
        return;
    }
    
    //    [self.view makeToast:@"举报成功"];
    [self hiddenReportView];
    [self showReportSuccess];
    //动态倒计时
    __block int timeout = 1; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if (timeout<0) { //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                //当倒计时到0时  重新获取验证码视图消失  加载获取验证码视图
                [self hiddenReportSuccessView];
            });
        } else {
            int seconds = timeout % 61; //对61取余 而不是对60取余 这样最开始不会显示00  而显示timeout的值
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
    
    
}
-(BOOL) isNullString:(NSString *)string {
    if (string == nil || string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}
-(void)showReportSuccess{
    //reportSuccessView
    if (self.reportSuccessView==nil) {
        self.reportSuccessView=[[UIView alloc] init];
        [self.view addSubview:self.reportSuccessView];
        self.reportSuccessView
        .sd_layout
        .widthIs(LL_ScreenWidth-20)
        .heightIs(134)
        .leftSpaceToView(self.view,10)
        .topSpaceToView(self.view,(LL_ScreenHeight-134)/2);
        
        UIImageView * backImage=[[UIImageView alloc]init];
        
        [backImage setImage:[UIImage nim_imageInKit:@"chat_report_success"]];
        
        [self.reportSuccessView addSubview:backImage];
        
        backImage
        .sd_layout
        .widthIs(LL_ScreenWidth-20)
        .heightIs(134)
        .leftSpaceToView(self.reportSuccessView,0)
        .topSpaceToView(self.reportSuccessView,0);
        
        UILabel * lable=[[UILabel alloc]init];
        
        [lable setFont:[UIFont boldSystemFontOfSize:16]];
        [lable setTextColor:[UIColor colorWithHexString:@"333333"]];
        [lable setText:[self pingString:@[@"成功举报",[self.userDic objectForKey:@"nickname"]]]];
        [lable setTextAlignment:NSTextAlignmentCenter];
        [self.reportSuccessView addSubview:lable];
        lable
        .sd_layout
        .widthIs(LL_ScreenWidth-20)
        .heightIs(16)
        .leftSpaceToView(self.reportSuccessView,0)
        .topSpaceToView(self.reportSuccessView,46);
    }
    [self.reportSuccessView setHidden:NO];
}

-(void)hiddenReportSuccessView{
    [self.reportSuccessView setHidden:YES];
}

-(NSString *) pingString :(NSArray *) array;{
    NSString * string =@"";
    @try {
        for (int i=0; i<array.count; i++) {
            if ([self isNullString:string]) {
                string=array[i];
            }else{
                string=[string stringByAppendingFormat:@"%@",array[i]];
            }
        }
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        return string;
    }
}
@end

