//
//  BPXLViewController.m
//  Dynamics and Autolayout
//
//  Created by Brandon Alexander on 10/22/13.
//  Copyright (c) 2013 Black Pixel. All rights reserved.
//

#import "BPXLViewController.h"

@interface BPXLViewController ()<UIDynamicAnimatorDelegate>
@property (weak, nonatomic) IBOutlet UIView *centerView;
@property (strong, nonatomic) UIDynamicAnimator *animator;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *topConstraint;
@end

@implementation BPXLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)centerViewTapped:(id)sender {
	NSLog(@"Constraints before: %@", self.view.constraints);
	UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[self.centerView]];
	UICollisionBehavior *gravityBounds = [[UICollisionBehavior alloc] initWithItems:@[self.centerView]];
	gravityBounds.translatesReferenceBoundsIntoBoundary = YES;
	
	[self.animator addBehavior:gravityBounds];
	[self.animator addBehavior:gravity];
	NSLog(@"Constraints after: %@", self.view.constraints);
}
- (IBAction)leftViewTapped:(id)sender {
	self.topConstraint.constant = 50;
//	[self.view addConstraint:self.topConstraint];
}

- (UIDynamicAnimator *) animator {
	if(!_animator) {
		_animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
		_animator.delegate = self;
	}
	
	return _animator;
}

- (void)dynamicAnimatorDidPause:(UIDynamicAnimator*)animator {
	[self.animator removeAllBehaviors];
	self.animator = nil;
	
	self.topConstraint.constant = 70;
}

@end
