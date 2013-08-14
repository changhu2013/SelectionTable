//
//  SelectionTableViewController.m
//  SelectionTable
//
//  Created by changhu on 13-8-14.
//  Copyright (c) 2013年 com.demo. All rights reserved.
//

#import "SelectionTableViewController.h"

@interface SelectionTableViewController ()

@end

@implementation SelectionTableViewController

@synthesize teams;
@synthesize teamsname;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //读取文件
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *filePath = [bundle pathForResource:@"足球队dictionary" ofType:@"plist"];
    
    NSLog(@"file path : %@", filePath);
    NSDictionary *dict = [[NSDictionary alloc]initWithContentsOfFile:filePath];
    
    self.teams = dict;
    [dict release];
    
    self.teamsname = [[teams allKeys]sortedArrayUsingSelector:@selector(compare:)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma 表格
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSString *name = [teamsname objectAtIndex:section];
    NSArray *team = [teams objectForKey:name];
    return [team count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSUInteger section = [indexPath section];
    NSUInteger row = [indexPath row];
    NSString *name = [teamsname objectAtIndex:section];
    NSArray *team = [teams objectForKey:name];
    
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:cellIdentifier];
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [team objectAtIndex:row];
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [teamsname count];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{

    NSString *name = [teamsname objectAtIndex:section];
    return name;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

//实现索引
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    
    return teamsname;
}

-(void)dealloc{
    [teams release];
    [teamsname release];
    [super dealloc];
}

@end
