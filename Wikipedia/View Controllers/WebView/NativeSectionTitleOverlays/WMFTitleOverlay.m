//  Created by Monte Hurd on 8/4/15.
//  Copyright (c) 2015 Wikimedia Foundation. Provided under MIT-style license; please copy and modify!

#import "WMFTitleOverlay.h"
#import "UIButton+WMFButton.h"

@interface WMFTitleOverlay ()

@property (nonatomic, strong) IBOutlet UIButton* button;
@property (nonatomic, strong) IBOutlet UILabel* label;

@end

@implementation WMFTitleOverlay

- (void)setTitle:(NSString*)title {
    _title          = title;
    self.label.text = title;

    // Force layout to prevent bug detailed here:
    // https://github.com/wikimedia/wikipedia-ios/commit/8d963d40a91476958933d9e5973f5f56b7531653
    [self.label layoutIfNeeded];
    [self layoutIfNeeded];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.button wmf_setButtonType:WMFButtonTypePencil];
}

- (IBAction)editPencilTapped:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"EditSection" object:self userInfo:nil];
}

@end
