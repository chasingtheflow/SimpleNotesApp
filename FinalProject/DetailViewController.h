//
//  DetailViewController.h
//  FinalProject
//
//  Created by Billy Matthews on 4/25/11.
//  Copyright 2011 Bucknell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "MGSplitViewController.h"

@class RootViewController;
@class MGSplitViewController;
@class NotesTableViewController;

@interface DetailViewController : UIViewController <UIPopoverControllerDelegate, MGSplitViewControllerDelegate> {

}


@property (nonatomic, retain) IBOutlet UIToolbar *toolbar;
@property (nonatomic, retain) NSManagedObject *detailItem;
@property (nonatomic, retain) IBOutlet UITextView *textView;
@property (nonatomic, assign) IBOutlet RootViewController *rootViewController;
@property (nonatomic, assign) IBOutlet MGSplitViewController *splitViewController;
@property (nonatomic, assign) IBOutlet NotesTableViewController *notesTableViewController;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *showHideButton;


- (IBAction)insertNewObject:(id)sender;
- (IBAction)hideRootView: (id) sender;


@end
