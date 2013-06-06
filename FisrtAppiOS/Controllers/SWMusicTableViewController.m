//
//  SWMusicTableViewController.m
//  FisrtAppiOS
//
//  Created by Pablo Formoso Estada on 05/06/13.
//  Copyright (c) 2013 Softwhipser. All rights reserved.
//

#import "SWPlayerViewController.h"
#import "SWMusicLibraryAccess.h"
#import "SWMusicTableViewController.h"

@interface SWMusicTableViewController ()
@property (nonatomic, strong) NSArray *artist;
@end

@implementation SWMusicTableViewController

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    SWMusicLibraryAccess *query = [[SWMusicLibraryAccess alloc] init];
    [query retriveSongsWithBlock:^(NSDictionary *result) {
        _artist = [result objectForKey:@"artists"];
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        [self.tableView reloadData];
    }];
     */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;//[_artist count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSDictionary *songs = [_artist objectAtIndex:section];
    return 1;//[[songs objectForKey:@"songs"] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    //NSDictionary *album = [_artist objectAtIndex:indexPath.section];
    //NSDictionary *song = [[album objectForKey:@"songs"] objectAtIndex:indexPath.row];
    
    cell.textLabel.text = @"Hola";//[song objectForKey:@"title"];
    cell.detailTextLabel.text = @"";//[song objectForKey:@"album"];
    
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
#ifndef NDEBUG
    NSLog(@"[%@] %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
#ifndef NDEBUG
    NSLog(@"[%@] %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif
    /*
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    
    NSDictionary *album = [_artist objectAtIndex:indexPath.section];
    NSDictionary *song = [[album objectForKey:@"songs"] objectAtIndex:indexPath.row];
    
    SWPlayerViewController *controller = [segue destinationViewController];
    controller.songTitle = [song objectForKey:@"title"];
    controller.artist = [song objectForKey:@"artist"];
    controller.album = [song objectForKey:@"album"];
    controller.songId = [song objectForKey:@"songId"];*/
}




@end
