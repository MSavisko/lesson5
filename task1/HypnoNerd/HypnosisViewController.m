//
//  HypnosisViewController.m
//  HypnoNerd
//
//  Created by Maksym Savisko on 11/5/15.
//  Copyright © 2015 Maksym Savisko. All rights reserved.
//

#import "HypnosisViewController.h"
#import "HypnosisView.h"

@implementation HypnosisViewController

- (void) loadView {
    HypnosisView * backgroundView = [[HypnosisView alloc]init];
    self.view = backgroundView;
}

@end
