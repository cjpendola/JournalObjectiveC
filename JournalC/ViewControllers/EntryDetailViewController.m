//
//  EntryDetailViewController.m
//  JournalC
//
//  Created by Carlos Pendola on 2/11/19.
//  Copyright © 2019 Carlos Pendola. All rights reserved.
//

#import "EntryDetailViewController.h"
#import "DVMEntry.h"

@interface EntryDetailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *bodyTextView;

@end

@implementation EntryDetailViewController

// MARK: - ViewLifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateViews];
    self.bodyTextView.delegate = self;
}

// MARK: - Setup
- (void)updateViews
{
    if (self.entry) {
        self.titleTextField.text = self.entry.title;
        self.bodyTextView.text = self.entry.text;
       
        if( [self.bodyTextView.text isEqual: @"Enter your text here..."] ){
            self.bodyTextView.textColor = [UIColor lightGrayColor];
        }
    }
    else{
        self.bodyTextView.text = @"Enter your text here...";
        self.bodyTextView.textColor = [UIColor lightGrayColor];
    }
}

// MARK: - Actions
- (IBAction)clearButtonTapped:(id)sender
{
    self.titleTextField.text = @"";
    self.bodyTextView.text = @"";
}

- (IBAction)saveButtonTapped:(id)sender
{
    if (self.entry) {
        [[DVMEntryController sharedController] modifyEntry:self.entry withTitle:self.titleTextField.text text:_bodyTextView.text];
    } else {
        DVMEntry *entry = [[DVMEntry alloc] initWithTitle:self.titleTextField.text text:self.bodyTextView.text timestamp:[NSDate date]];
        [[DVMEntryController sharedController] addEntry:entry];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if ([textView.text isEqualToString:@"Enter your text here..."]) {
        textView.text = @"";
        textView.textColor = [UIColor blackColor]; //optional
    }
    [textView becomeFirstResponder];
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    if ([textView.text isEqualToString:@""]) {
        textView.text = @"Enter your text here...";
        textView.textColor = [UIColor lightGrayColor]; //optional
    }
    [textView resignFirstResponder];
}

@end
