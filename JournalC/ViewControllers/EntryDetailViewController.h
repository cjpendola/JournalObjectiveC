//
//  EntryDetailViewController.h
//  JournalC
//
//  Created by Carlos Pendola on 2/11/19.
//  Copyright © 2019 Carlos Pendola. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DVMEntryController.h"


NS_ASSUME_NONNULL_BEGIN

@interface EntryDetailViewController : UIViewController  <UITextViewDelegate>

@property (nonatomic, strong) DVMEntry *entry;
- (void)textViewDidBeginEditing:(UITextView *)textView;
- (void)textViewDidEndEditing:(UITextView *)textView;


@end

NS_ASSUME_NONNULL_END
