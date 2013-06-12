//This file is part of SphereView.
//
//SphereView is free software: you can redistribute it and/or modify
//it under the terms of the GNU General Public License as published by
//the Free Software Foundation, either version 3 of the License, or
//(at your option) any later version.
//
//SphereView is distributed in the hope that it will be useful,
//but WITHOUT ANY WARRANTY; without even the implied warranty of
//MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//GNU General Public License for more details.
//
//You should have received a copy of the GNU General Public License
//along with SphereView.  If not, see <http://www.gnu.org/licenses/>.

#import "SampleViewController.h"
#import "PFSphereView.h"
#import <QuartzCore/QuartzCore.h>

@implementation SampleViewController


- (void)viewDidLoad {
	self.view.backgroundColor = [UIColor yellowColor];

	PFSphereView *sphereView = [[PFSphereView alloc] initWithFrame:self.view.frame];

	NSMutableArray *labels = [[NSMutableArray alloc] init];
	for (int i = 0; i < 15; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [[button layer] setBorderColor: [[UIColor blackColor] CGColor]];
        [[button layer] setBorderWidth:2.75];
        
        button.frame = CGRectMake(0, 0, 80, 80);
		button.backgroundColor = [UIColor redColor];
		button.titleLabel.textColor = [UIColor blackColor];
		button.titleLabel.font = [UIFont systemFontOfSize:13];
		button.titleLabel.text = [NSString stringWithFormat:@"Label %i", i];

		[labels addObject:button];
        
        [button addTarget:self action:@selector(processTouch:) forControlEvents:UIControlEventTouchUpInside];
	}

	[sphereView setItems:labels];


	[self.view addSubview:sphereView];
	
	[super viewDidLoad];
}


-(void)processTouch:(id) sender {
    UIButton *button = (UIButton*)sender;
    [button setBackgroundColor:[UIColor brownColor]];
    
    [UIView animateWithDuration:0.5
                     animations:^{
                         CGRect frame = button.frame;
                         frame.size.height = self.view.frame.size.height - 350;
                         frame.size.width = self.view.frame.size.width - 350;
                         
                         int x = self.view.frame.size.width - frame.size.width;
                         int y = self.view.frame.size.height - frame.size.height;
                         
                         frame.origin.x = x/2;
                         frame.origin.x = y/2;
                         
                         button.frame = frame;
                     }
                     completion:^(BOOL finished){
                         
                     }];   
}

@end
