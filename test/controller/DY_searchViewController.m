
//
//  DY_searchViewController.m
//  test
//
//  Created by 12345 on 16/3/13.
//  Copyright © 2016年 12345. All rights reserved.
//

#import "DY_searchViewController.h"
#import "DY_searchHistoryDataBase.h"
@implementation DY_searchViewController



- (void)viewDidLoad{
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //初始化搜索Bar
    self.mb_searchBar = [[DY_newSearchBar alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 50)];
    self.mb_searchBar.mb_delegate = self;
    [self.view addSubview:self.mb_searchBar];
    
    //初始化历史记录列表
    [self loadHistoryTableView];
    
    //初始化搜索结果列表
    [self loadSearchResultTableView];

}


#pragma mark ------历史记录显示列表-------
- (void)loadHistoryTableView{
    
    self.mb_historyTableView = [[DY_historyTableView alloc]initWithFrame:CGRectMake(0, 70, self.view.frame.size.width, self.view.frame.size.height-70)];
    [self.view addSubview:self.mb_historyTableView];
    
    __weak typeof(self)weakSelf = self;
    self.mb_historyTableView.mb_beginDraggingBlock = ^(){
        [weakSelf.mb_searchBar.mb_searchTextField resignFirstResponder];
    };
    
    self.mb_historyTableView.mb_selectHistoryCell = ^(NSString *string){
        [weakSelf searchDataWithInputString:string];
    };
    
}


#pragma mark ------搜索结果显示列表-------
- (void)loadSearchResultTableView{
    
    self.mb_searchResultTableView = [[UILabel alloc]initWithFrame:CGRectMake(0, 70, self.view.frame.size.width, self.view.frame.size.height-70)];
    self.mb_searchResultTableView.hidden = YES;
    self.mb_searchResultTableView.text   = @"搜索结果列表";
    self.mb_searchResultTableView.textColor = [UIColor grayColor];
    self.mb_searchResultTableView.font = [UIFont systemFontOfSize:20];
    self.mb_searchResultTableView.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.mb_searchResultTableView];
    self.mb_searchResultTableView.backgroundColor = [UIColor whiteColor];
}


#pragma mark - DY_newSearchBarDelegate
//退出搜索界面
- (void)touchQuitButton{
    [self dismissViewControllerAnimated:YES completion:nil];
}


//隐藏搜索结果页，显示历史记录页（在点击输入框内的清除按钮或者用键盘把文字一个个删除后）
- (void)hideSearchResultTableView{
    
    //隐藏搜索结果列表，显示历史列表
    self.mb_searchResultTableView.hidden = YES;
    
}


//点击键盘上的搜索按钮后进行的搜索操作
- (void)searchDataWithInputString:(NSString *)string{
    if ([string isEqualToString:@""]) {
        return;
    }
    self.mb_searchBar.mb_searchTextField.text = string;
    //添加一条历史记录
    [self.mb_historyTableView addHistoryWithString:string];
    
    //开始搜索,显示搜索结果列表
    self.mb_searchResultTableView.hidden = NO;
    
    
}

- (void)dealloc
{
    
}


@end
