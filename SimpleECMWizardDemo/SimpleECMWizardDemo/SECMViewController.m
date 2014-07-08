//
//  SECMViewController.m
//  SimpleECMWizardDemo
//
//  Created by Tsen Fong Chung Lee on 7/2/14.
//  Copyright (c) 2014 Document Capture Technologies Inc. All rights reserved.
//

#import "SECMViewController.h"
#import <SimpleECM Image Processing SDK/SECM_Image_Processing.h>

@interface SECMViewController ()

@end

@implementation SECMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    SECMCaptureDocumentWizardBuilder *builder = [[SECMCaptureDocumentWizardBuilder alloc] init];
    
   /** Uncomment this to customize the wizard's color scheme
    builder.dewarpQuadrangleColor = [UIColor colorWithRed:0.1f green:0.5f blue:0.8f alpha:1.0f];
    builder.navigationBarBarTintColor = [UIColor colorWithRed:0.1f green:0.5f blue:0.8f alpha:1.0f];
    builder.navigationBarTintColor = [UIColor whiteColor];
    
    builder.toolbarBarTintColor = [UIColor colorWithRed:0.1f green:0.5f blue:0.8f alpha:1.0f];
    builder.toolbarTintColor = [UIColor whiteColor];
    */
    UIViewController *wizard = [builder createDocumentWizardController];
    [self presentViewController:wizard animated:YES completion:NULL];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
