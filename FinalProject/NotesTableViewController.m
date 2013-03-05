//
//  NotesTableViewController.m
//  
//
//  Created by Billy Matthews on 2011-04-29.
//  Copyright 2011 Bucknell University. All rights reserved.
//

#import "NotesTableViewController.h"
#import "DetailViewController.h"
#import "Note.h"

@implementation NotesTableViewController

@synthesize detailViewController;
@synthesize managedObjectContext;
//@synthesize fetchedResultsController;




//
// Initializes this table view controller with an ascending list of
// notes.
//
- (id) initInManagedObjectContext: (NSManagedObjectContext *) context {
    if ((self = [super initWithStyle: UITableViewStylePlain])) {
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        request.entity = [NSEntityDescription entityForName: @"Note"
                                     inManagedObjectContext: context];
        request.sortDescriptors = [NSArray arrayWithObject: [NSSortDescriptor sortDescriptorWithKey: @"timeStamp"
                                                                                          ascending: YES
                                                                                           selector: @selector(caseInsensitiveCompare:)]];
        request.predicate = nil;
        request.fetchBatchSize = 20;
        NSFetchedResultsController *resultsController = [[NSFetchedResultsController alloc] initWithFetchRequest: request 
                                                                                            managedObjectContext: context 
                                                                                              sectionNameKeyPath: nil 
                                                                                                       cacheName: nil];
        [request release];
        self.fetchedResultsController = resultsController;
        [resultsController release];
        self.titleKey = @"noteName";
        self.searchKey = @"noteName";
    }
    return self;
}


//
// called when a cell representing the specified managedObject is selected (does nothing by default)
//
- (void)managedObjectSelected:(NSManagedObject *)managedObject {
    // Navigation logic may go here. Create and push another view controller.
    // AnotherViewController *anotherViewController = [[AnotherViewController alloc] initWithNibName:@"AnotherView" bundle:nil];
    // [self.navigationController pushViewController:anotherViewController];
    // [anotherViewController release];
}

 
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (void)insertNewObject:(id)sender
{
    NSIndexPath *currentSelection = [self.tableView indexPathForSelectedRow];
    if (currentSelection != nil) {
        [self.tableView deselectRowAtIndexPath:currentSelection animated:NO];
    }    
    
    // Create a new instance of the entity managed by the fetched results controller.
    NSManagedObjectContext *context = [fetchedResultsController managedObjectContext];
    NSLog(@"Context: %@", context);
    NSEntityDescription *entity = [[fetchedResultsController fetchRequest] entity];
    NSLog(@"Entity: %@", entity);
    NSManagedObject *newManagedObject = [NSEntityDescription insertNewObjectForEntityForName:[entity name] inManagedObjectContext:context];
    
    // If appropriate, configure the new managed object.
    [newManagedObject setValue:[NSDate date] forKey:@"timeStamp"];
    
    // Save the context.
    NSError *error = nil;
    if (![context save:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    NSIndexPath *insertionPath = [fetchedResultsController indexPathForObject:newManagedObject];
    [self.tableView selectRowAtIndexPath:insertionPath animated:YES scrollPosition:UITableViewScrollPositionTop];
    detailViewController.detailItem = newManagedObject;
}




@end
