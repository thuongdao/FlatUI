//
//  MainViewController.m
//  ADVFlatUI
//
//  Created by Tope on 03/06/2013.
//  Copyright (c) 2013 App Design Vault. All rights reserved.
//

#import "MainViewController.h"
#import "ControllerInfo.h"
#import "StoryboardInfo.h"
#import "MBProgressHUD.h"
#import <QuartzCore/QuartzCore.h>


@interface MainViewController ()

@property (nonatomic, strong) NSArray* storyboards;
@property (nonatomic, strong) NSArray* storyboardIds;
@property (nonatomic, strong) NSArray* titles;

@end

@implementation MainViewController

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
	
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.layout.minimumInteritemSpacing = 10;
    self.layout.minimumLineSpacing = 10;
    self.layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);

    UIColor* darkColor = [UIColor colorWithRed:10.0/255 green:78.0/255 blue:108.0/255 alpha:1.0f];
    self.collectionView.backgroundColor = darkColor;

    NSArray* loginControllers = @[@{@"name" : @"Login Design 1", @"controllerId" : @"LoginController1"},
     @{@"name" : @"Login Design 2", @"controllerId" : @"LoginController2"},
     @{@"name" : @"Login Design 3", @"controllerId" : @"LoginController3"},
     @{@"name" : @"Login Design 4", @"controllerId" : @"LoginController4"}];
    
    NSArray* profileControllers = @[@{@"name" : @"Profile Design 1", @"controllerId" : @"ProfileController1"},
                                    @{@"name" : @"Profile Design 2", @"controllerId" : @"ProfileController2"},
                                    @{@"name" : @"Profile Design 3", @"controllerId" : @"ProfileController3"}];
    NSArray* feedControllers = @[@{@"name" : @"Activity Feeds 1", @"controllerId" : @"FeedController1"},
                                 @{@"name" : @"Activity Feeds 2", @"controllerId" : @"FeedController2"},
                                 @{@"name" : @"Activity Feeds 3", @"controllerId" : @"FeedController3"},
                                 @{@"name" : @"Activity Feeds 4", @"controllerId" : @"FeedController4"}];
    
    NSArray* settingControllers = @[@{@"name" : @"Settings Design 1", @"controllerId" : @"SettingsController1"},
                                    @{@"name" : @"Settings Design 2", @"controllerId" : @"SettingsController2"}];
    
    
    self.storyboards = @[loginControllers, profileControllers, feedControllers ,settingControllers];
    self.storyboardIds = @[@"LoginStoryboard", @"ProfileStoryboard", @"FeedStoryboard", @"SettingsStoryboard"];
    self.titles = @[@"LOGIN VIEWS", @"USER PROFILES", @"ACTIVITY FEEDS", @"SETTINGS"];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSArray* controllers = self.storyboards[section];
    return controllers.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.storyboards.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSArray* controllers = self.storyboards[indexPath.section];
    
    NSDictionary* controllerInfo = controllers[indexPath.row];
    
    UILabel* label = (UILabel*)[cell viewWithTag:1];
    label.text = controllerInfo[@"name"];
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        
        UICollectionReusableView* headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header" forIndexPath:indexPath];
        
        UILabel* label = (UILabel*)[headerView viewWithTag:1];
        
        NSString* title = self.titles[indexPath.section];
        label.text = [title uppercaseString];
        label.font = [UIFont fontWithName:@"Avenir-Black" size:18.0f];
        label.textColor = [UIColor whiteColor];
        
        reusableview = headerView;
    }
    
    
    return reusableview;
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    NSArray* controllers = self.storyboards[indexPath.section];
    
    NSDictionary* controllerInfo = controllers[indexPath.row];
    NSString* storyboardId = self.storyboardIds[indexPath.section];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardId bundle:nil];
    self.currentViewController = [storyboard instantiateViewControllerWithIdentifier:controllerInfo[@"controllerId"]];
    
    UIViewController* controller = self.currentViewController;
    
    if([controller isKindOfClass:[UINavigationController class]]){
    
        [self presentViewController:controller animated:YES completion:nil];
    }else{
        
        [self.navigationController pushViewController:controller animated:YES];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
