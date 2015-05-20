//
//  FeedController1.m
//  ADVFlatUI
//
//  Created by Tope on 03/06/2013.
//  Copyright (c) 2013 App Design Vault. All rights reserved.
//

#import "FeedController1.h"
#import "FeedCell1.h"
#import "FlatTheme.h"

@interface FeedController1 ()

@end

@implementation FeedController1

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    NSString* boldFontName = @"GillSans-Bold";

    [self styleNavigationBarWithFontName:boldFontName];
    
    self.title = @"Feed";
    
    self.feedTableView.dataSource = self;
    
    self.feedTableView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    self.feedTableView.separatorColor = [UIColor clearColor];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    FeedCell1* cell = [tableView dequeueReusableCellWithIdentifier:@"FeedCell1"];
    
    if(indexPath.row % 2){
        cell.nameLabel.text = @"Laura Leamington";
        cell.updateLabel.text = @"This is a pic I took while on holiday on Wales. The weather played along nicely which doesn't happen often";

        cell.dateLabel.text = @"1 hr ago";
        cell.likeCountLabel.text = @"293";
        cell.commentCountLabel.text = @"55";
        cell.picImageView.image = [UIImage imageNamed:@"feed-armchair.jpg"];
    }
    else{
        cell.nameLabel.text = @"John Keynetown";
        cell.updateLabel.text = @"On the trip to San Fransisco, the Golden gate bridge looked really magnificent. This is a city I would love to visit very often. Hope we get to do it again soon";
        
        cell.dateLabel.text = @"1 hr ago";
        cell.likeCountLabel.text = @"134";
        cell.commentCountLabel.text = @"21";
        cell.picImageView.image = [UIImage imageNamed:@"feed-bridge.jpg"];
    }
    
    return cell;
}

-(void)styleNavigationBarWithFontName:(NSString*)navigationTitleFont{
    
    UIColor* color = [UIColor colorWithRed:65.0/255 green:75.0/255 blue:89.0/255 alpha:1.0];
    
    [FlatTheme styleNavigationBar:self.navigationController.navigationBar withFontName:navigationTitleFont andColor:color];
    
    UIImageView* searchView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"search.png"]];
    searchView.frame = CGRectMake(0, 0, 20, 20);
    
    UIBarButtonItem* searchItem = [[UIBarButtonItem alloc] initWithCustomView:searchView];
    
    self.navigationItem.rightBarButtonItem = searchItem;
    
    UIButton* menuButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 28, 20)];
    [menuButton setImage:[UIImage imageNamed:@"menu.png"] forState:UIControlStateNormal];
    [menuButton addTarget:self action:@selector(dismissView:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem* menuItem = [[UIBarButtonItem alloc] initWithCustomView:menuButton];
    self.navigationItem.leftBarButtonItem = menuItem;
}

-(IBAction)dismissView:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
