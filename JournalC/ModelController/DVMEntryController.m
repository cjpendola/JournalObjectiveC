//
//  EntryController.m
//  JournalC
//
//  Created by Carlos Pendola on 2/11/19.
//  Copyright © 2019 Carlos Pendola. All rights reserved.
//

#import "DVMEntryController.h"

@implementation DVMEntryController


// MARK: - Properties
+ (DVMEntryController *)sharedController // Singleton
{
    static DVMEntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[DVMEntryController alloc] init];
        sharedInstance.entries = [NSMutableArray new];
        [sharedInstance loadFromPersistentStorage];
    });
    return sharedInstance;
}

// MARK: - CRUD
- (void)addEntry:(DVMEntry *)entry
{
    [self.entries addObject:entry];
    [self saveToPersistentStorage];
}

- (void)removeEntry:(DVMEntry *)entry
{
    [self.entries removeObject:entry];
    [self saveToPersistentStorage];
}

- (void)modifyEntry:(DVMEntry *)entry withTitle:(NSString *)title text:(NSString *)text
{
    entry.title = title;
    entry.text = text;
    [self saveToPersistentStorage];
}

- (void)saveToPersistentStorage
{
    NSMutableArray *entryDictionaries = [NSMutableArray new];
    
    for (DVMEntry *entry in self.entries) {
        [entryDictionaries addObject:entry.dictionaryRepresentation];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:entryDictionaries forKey:@"Entries"];
}

- (void)loadFromPersistentStorage
{
    NSArray *entryDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:@"Entries"];
    for (NSDictionary *dictionary in entryDictionaries) {
        DVMEntry *entry = [[DVMEntry new] initWithDictionary:dictionary];
        [self addEntry:entry];
    }
    
}

@end
