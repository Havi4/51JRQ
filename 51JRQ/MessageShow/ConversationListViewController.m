//
//  ConversationListViewController.m
//  51JRQ
//
//  Created by HaviLee on 2017/3/19.
//  Copyright © 2017年 HaviLee. All rights reserved.
//

#import "ConversationListViewController.h"
#import "ContactListViewController.h"
#import "SearchResultTableViewController.h"
#import "PYSearchViewController.h"
#import "UIView+PYSearchExtension.h"
#import "NSBundle+PYSearchExtension.h"
#import "ChatViewController.h"
//#import "RobotManager.h"
//#import "RobotChatViewController.h"
//#import "UserProfileManager.h"
//#import "RealtimeSearchUtil.h"
//#import "RedPacketChatViewController.h"
//#import "ChatDemoHelper.h"

@interface ConversationListViewController ()<EaseConversationListViewControllerDelegate, EaseConversationListViewControllerDataSource,UISearchControllerDelegate,UISearchBarDelegate,PYSearchViewControllerDelegate>
@property (nonatomic, strong) UIView *networkStateView;
@property (nonatomic, strong) UISearchBar *searchBar;

@end

@implementation ConversationListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"消息";
    self.showRefreshHeader = YES;
    self.delegate = self;
    self.dataSource = self;
    [self setNaviBaritem];
    [self networkStateView];
    [self initNaviBar];
    [self tableViewDidTriggerHeaderRefresh];
    [self removeEmptyConversationsFromDB];
}

- (void)setNaviBaritem
{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"adress_book"] style:UIBarButtonItemStylePlain target:self action:@selector(showAdressBook)];
}

- (void)initNaviBar
{
    UIView *titleView = [[UIView alloc] init];
    titleView.py_x = 10 * 0.5;
    titleView.py_y = 7;
    titleView.py_width = kScreen_Width - 59 - 15;
    titleView.py_height = 30;
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:titleView.bounds];
    [titleView addSubview:searchBar];
    titleView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.navigationItem.titleView = titleView;
        // 关闭自动调整
    searchBar.translatesAutoresizingMaskIntoConstraints = NO;
        // 为titleView添加约束来调整搜索框
    NSLayoutConstraint *widthCons = [NSLayoutConstraint constraintWithItem:searchBar attribute:NSLayoutAttributeWidth  relatedBy:NSLayoutRelationEqual toItem:titleView attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0];
    NSLayoutConstraint *heightCons = [NSLayoutConstraint constraintWithItem:searchBar attribute:NSLayoutAttributeHeight  relatedBy:NSLayoutRelationEqual toItem:titleView attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0];
    NSLayoutConstraint *xCons = [NSLayoutConstraint constraintWithItem:searchBar attribute:NSLayoutAttributeTop  relatedBy:NSLayoutRelationEqual toItem:titleView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    NSLayoutConstraint *yCons = [NSLayoutConstraint constraintWithItem:searchBar attribute:NSLayoutAttributeLeft  relatedBy:NSLayoutRelationEqual toItem:titleView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
    [titleView addConstraint:widthCons];
    [titleView addConstraint:heightCons];
    [titleView addConstraint:xCons];
    [titleView addConstraint:yCons];
    searchBar.placeholder = @"搜索";
    searchBar.backgroundImage = [NSBundle py_imageNamed:@"clearImage"];
    searchBar.delegate = self;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"add_new"] style:UIBarButtonItemStylePlain target:self action:@selector(addNewFriend)];
}

- (UISearchBar *)searchBar
{
    if (!_searchBar) {
        _searchBar = [[UISearchBar alloc]init];
        _searchBar.placeholder = @"搜索资讯、活动、职位";
        _searchBar.frame = CGRectMake(15, 0, kScreen_Width-15-59, 44);
        _searchBar.delegate = self;
    }
    return _searchBar;
}

#pragma mark search Bar delegate

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    return YES;
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    DeBugLog(@"search bar done");
        // 1. 创建热门搜索
    NSArray *hotSeaches = @[@"HR大培训",@"理财师专场",@"金茂大厦"];
        // 2. 创建控制器
    PYSearchViewController *searchViewController = [PYSearchViewController searchViewControllerWithHotSearches:hotSeaches searchBarPlaceholder:@"搜索资讯、活动、职位" didSearchBlock:^(PYSearchViewController *searchViewController, UISearchBar *searchBar, NSString *searchText) {
            // 如：跳转到指定控制器
            //        [searchViewController.navigationController pushViewController:[[PYTempViewController alloc] init] animated:YES];
    }];
        // 3. 设置风格
    searchViewController.hotSearchStyle = PYHotSearchStyleARCBorderTag; // 热门搜索风格根据选择
    searchViewController.searchHistoryStyle = PYHotSearchStyleDefault; // 搜索历史风格为default
    searchViewController.hotSearchStyle = PYHotSearchStyleDefault; // 热门搜索风格为默认
    searchViewController.searchHistoryStyle = PYSearchHistoryStyleBorderTag; // 搜索历史风格根据选择
                                                                             // 4. 设置代理
    searchViewController.delegate = self;
        // 5. 跳转到搜索控制器
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:searchViewController];
    [self presentViewController:nav animated:NO completion:nil];
}


- (void)showAdressBook
{
    ContactListViewController *contactsVC = [[ContactListViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:contactsVC animated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self refresh];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
}

- (void)removeEmptyConversationsFromDB
{
    NSArray *conversations = [[EMClient sharedClient].chatManager getAllConversations];
    NSMutableArray *needRemoveConversations;
    for (EMConversation *conversation in conversations) {
        if (!conversation.latestMessage || (conversation.type == EMConversationTypeChatRoom)) {
            if (!needRemoveConversations) {
                needRemoveConversations = [[NSMutableArray alloc] initWithCapacity:0];
            }

            [needRemoveConversations addObject:conversation];
        }
    }

    if (needRemoveConversations && needRemoveConversations.count > 0) {
        [[EMClient sharedClient].chatManager deleteConversations:needRemoveConversations isDeleteMessages:YES completion:nil];
    }
}

#pragma mark - getter

- (UIView *)networkStateView
{
    if (_networkStateView == nil) {
        _networkStateView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 44)];
        _networkStateView.backgroundColor = [UIColor colorWithRed:255 / 255.0 green:199 / 255.0 blue:199 / 255.0 alpha:0.5];

        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, (_networkStateView.frame.size.height - 20) / 2, 20, 20)];
        imageView.image = [UIImage imageNamed:@"messageSendFail"];
        [_networkStateView addSubview:imageView];

        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(imageView.frame) + 5, 0, _networkStateView.frame.size.width - (CGRectGetMaxX(imageView.frame) + 15), _networkStateView.frame.size.height)];
        label.font = [UIFont systemFontOfSize:15.0];
        label.textColor = [UIColor grayColor];
        label.backgroundColor = [UIColor clearColor];
        label.text = NSLocalizedString(@"network.disconnection", @"Network disconnection");
        [_networkStateView addSubview:label];
    }

    return _networkStateView;
}

#pragma mark - EaseConversationListViewControllerDelegate

- (void)conversationListViewController:(EaseConversationListViewController *)conversationListViewController
            didSelectConversationModel:(id<IConversationModel>)conversationModel
{
    if (conversationModel) {
        EMConversation *conversation = conversationModel.conversation;
        if (conversation) {
            UIViewController *chatController = nil;
            chatController = [[ChatViewController alloc] initWithConversationChatter:conversation.conversationId conversationType:conversation.type];
            chatController.title = conversationModel.title;
            [self.navigationController pushViewController:chatController animated:YES];
        }
        [[NSNotificationCenter defaultCenter] postNotificationName:@"setupUnreadMessageCount" object:nil];
        [self.tableView reloadData];
    }
}

#pragma mark - EaseConversationListViewControllerDataSource

- (id<IConversationModel>)conversationListViewController:(EaseConversationListViewController *)conversationListViewController
                                    modelForConversation:(EMConversation *)conversation
{
    EaseConversationModel *model = [[EaseConversationModel alloc] initWithConversation:conversation];
//    if (model.conversation.type == EMConversationTypeChat) {
//        if ([[RobotManager sharedInstance] isRobotWithUsername:conversation.conversationId]) {
//            model.title = [[RobotManager sharedInstance] getRobotNickWithUsername:conversation.conversationId];
//        } else {
//            UserProfileEntity *profileEntity = [[UserProfileManager sharedInstance] getUserProfileByUsername:conversation.conversationId];
//            if (profileEntity) {
//                model.title = profileEntity.nickname == nil ? profileEntity.username : profileEntity.nickname;
//                model.avatarURLPath = profileEntity.imageUrl;
//            }
//        }
//    } else if (model.conversation.type == EMConversationTypeGroupChat) {
//        NSString *imageName = @"groupPublicHeader";
//        if (![conversation.ext objectForKey:@"subject"])
//        {
//            NSArray *groupArray = [[EMClient sharedClient].groupManager getJoinedGroups];
//            for (EMGroup *group in groupArray) {
//                if ([group.groupId isEqualToString:conversation.conversationId]) {
//                    NSMutableDictionary *ext = [NSMutableDictionary dictionaryWithDictionary:conversation.ext];
//                    [ext setObject:group.subject forKey:@"subject"];
//                    [ext setObject:[NSNumber numberWithBool:group.isPublic] forKey:@"isPublic"];
//                    conversation.ext = ext;
//                    break;
//                }
//            }
//        }
//        NSDictionary *ext = conversation.ext;
//        model.title = [ext objectForKey:@"subject"];
//        imageName = [[ext objectForKey:@"isPublic"] boolValue] ? @"groupPublicHeader" : @"groupPrivateHeader";
//        model.avatarImage = [UIImage imageNamed:imageName];
//    }
    return model;
}

- (NSAttributedString *)conversationListViewController:(EaseConversationListViewController *)conversationListViewController
                latestMessageTitleForConversationModel:(id<IConversationModel>)conversationModel
{
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:@""];
    EMMessage *lastMessage = [conversationModel.conversation latestMessage];
    if (lastMessage) {
        NSString *latestMessageTitle = @"";
        EMMessageBody *messageBody = lastMessage.body;
        switch (messageBody.type) {
                case EMMessageBodyTypeImage:{
                    latestMessageTitle = NSLocalizedString(@"message.image1", @"[image]");
                } break;
                case EMMessageBodyTypeText:{
                        // 表情映射。
                    NSString *didReceiveText = [EaseConvertToCommonEmoticonsHelper
                                                convertToSystemEmoticons:((EMTextMessageBody *)messageBody).text];
                    latestMessageTitle = didReceiveText;
                    if ([lastMessage.ext objectForKey:MESSAGE_ATTR_IS_BIG_EXPRESSION]) {
                        latestMessageTitle = @"[动画表情]";
                    }
                } break;
                case EMMessageBodyTypeVoice:{
                    latestMessageTitle = NSLocalizedString(@"message.voice1", @"[voice]");
                } break;
                case EMMessageBodyTypeLocation: {
                    latestMessageTitle = NSLocalizedString(@"message.location1", @"[location]");
                } break;
                case EMMessageBodyTypeVideo: {
                    latestMessageTitle = NSLocalizedString(@"message.video1", @"[video]");
                } break;
                case EMMessageBodyTypeFile: {
                    latestMessageTitle = NSLocalizedString(@"message.file1", @"[file]");
                } break;
            default: {
            } break;
        }

        if (lastMessage.direction == EMMessageDirectionReceive) {
//            NSString *from = lastMessage.from;
//            UserProfileEntity *profileEntity = [[UserProfileManager sharedInstance] getUserProfileByUsername:from];
//            if (profileEntity) {
//                from = profileEntity.nickname == nil ? profileEntity.username : profileEntity.nickname;
//            }
//            latestMessageTitle = [NSString stringWithFormat:@"%@: %@", from, latestMessageTitle];
        }

        NSDictionary *ext = conversationModel.conversation.ext;
//        if (ext && [ext[kHaveUnreadAtMessage] intValue] == kAtAllMessage) {
//            latestMessageTitle = [NSString stringWithFormat:@"%@ %@", NSLocalizedString(@"group.atAll", nil), latestMessageTitle];
//            attributedStr = [[NSMutableAttributedString alloc] initWithString:latestMessageTitle];
//            [attributedStr setAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithRed:1.0 green:.0 blue:.0 alpha:0.5]} range:NSMakeRange(0, NSLocalizedString(@"group.atAll", nil).length)];
//
//        }
//        else if (ext && [ext[kHaveUnreadAtMessage] intValue] == kAtYouMessage) {
//            latestMessageTitle = [NSString stringWithFormat:@"%@ %@", NSLocalizedString(@"group.atMe", @"[Somebody @ me]"), latestMessageTitle];
//            attributedStr = [[NSMutableAttributedString alloc] initWithString:latestMessageTitle];
//            [attributedStr setAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithRed:1.0 green:.0 blue:.0 alpha:0.5]} range:NSMakeRange(0, NSLocalizedString(@"group.atMe", @"[Somebody @ me]").length)];
//        }
//        else {
//            attributedStr = [[NSMutableAttributedString alloc] initWithString:latestMessageTitle];
//        }
    }

    return attributedStr;
}

- (NSString *)conversationListViewController:(EaseConversationListViewController *)conversationListViewController
       latestMessageTimeForConversationModel:(id<IConversationModel>)conversationModel
{
    NSString *latestMessageTime = @"";
    EMMessage *lastMessage = [conversationModel.conversation latestMessage];;
    if (lastMessage) {
        latestMessageTime = [NSDate formattedTimeFromTimeInterval:lastMessage.timestamp];
    }


    return latestMessageTime;
}

#pragma mark - EMSearchControllerDelegate

- (void)cancelButtonClicked
{
//    [[RealtimeSearchUtil currentUtil] realtimeSearchStop];
}

- (void)searchTextChangeWithString:(NSString *)aString
{
//    __weak typeof(self) weakSelf = self;
//    [[RealtimeSearchUtil currentUtil] realtimeSearchWithSource:self.dataArray searchText:aString collationStringSelector:@selector(title) resultBlock:^(NSArray *results) {
//        if (results) {
//            dispatch_async(dispatch_get_main_queue(), ^{
//                [weakSelf.resultController.displaySource removeAllObjects];
//                [weakSelf.resultController.displaySource addObjectsFromArray:results];
//                [weakSelf.resultController.tableView reloadData];
//            });
//        }
//    }];
}

#pragma mark - private

#pragma mark - public

-(void)refresh
{
    [self refreshAndSortView];
}

-(void)refreshDataSource
{
    [self tableViewDidTriggerHeaderRefresh];
}

- (void)isConnect:(BOOL)isConnect{
    if (!isConnect) {
        self.tableView.tableHeaderView = _networkStateView;
    }
    else{
        self.tableView.tableHeaderView = nil;
    }

}

- (void)networkChanged:(EMConnectionState)connectionState
{
    if (connectionState == EMConnectionDisconnected) {
        self.tableView.tableHeaderView = _networkStateView;
    }
    else{
        self.tableView.tableHeaderView = nil;
    }
}
@end
