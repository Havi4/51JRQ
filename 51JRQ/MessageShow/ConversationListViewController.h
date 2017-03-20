//
//  ConversationListViewController.h
//  51JRQ
//
//  Created by HaviLee on 2017/3/19.
//  Copyright © 2017年 HaviLee. All rights reserved.
//

#import "EaseConversationListViewController.h"

@interface ConversationListViewController : EaseConversationListViewController

@property (strong, nonatomic) NSMutableArray *conversationsArray;

- (void)refresh;
- (void)refreshDataSource;

- (void)isConnect:(BOOL)isConnect;
- (void)networkChanged:(EMConnectionState)connectionState;

@end
