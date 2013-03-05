//
//  CoreDataTableViewController.h
//
//  Created for Stanford CS193p Spring 2010
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface CoreDataTableViewController : UITableViewController <NSFetchedResultsControllerDelegate, UISearchDisplayDelegate> {
    NSPredicate *normalPredicate;
    NSString *currentSearchText;
    NSString *titleKey;
    NSString *subtitleKey;
    NSString *searchKey;
    NSFetchedResultsController *fetchedResultsController;
}

// the controller (this class does nothing if this is not set)
@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;

// key to use when displaying items in the table; defaults to the first sortDescriptor's key
@property (nonatomic, copy) NSString *titleKey;
// key to use when displaying items in the table for the subtitle; defaults to nil
@property (nonatomic, copy) NSString *subtitleKey;
// key to use when searching the table (should usually be the same as displayKey); if nil, no searching allowed
@property (nonatomic, copy) NSString *searchKey;

- (UITableViewCellAccessoryType)accessoryTypeForManagedObject:(NSManagedObject *)managedObject;
- (UIImage *)thumbnailImageForManagedObject:(NSManagedObject *)managedObject;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForManagedObject:(NSManagedObject *)managedObject;
- (void)managedObjectSelected:(NSManagedObject *)managedObject;
- (BOOL)canDeleteManagedObject:(NSManagedObject *)managedObject;
- (void)deleteManagedObject:(NSManagedObject *)managedObject;

@end
