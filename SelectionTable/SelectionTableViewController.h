//
//  SelectionTableViewController.h
//  SelectionTable
//
//  Created by changhu on 13-8-14.
//  Copyright (c) 2013年 com.demo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectionTableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {

    NSDictionary *teams;
    NSArray *teamsname;
    
}

@property (nonatomic, retain) NSDictionary *teams;
@property (nonatomic, retain) NSArray *teamsname;

@end
