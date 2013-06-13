//
//  StickView.m
//  DivinationCarTemple
//
//  Created by SteveLai on 13年6月12日.
//  Copyright (c) 2013年 SteveLai. All rights reserved.
//

#import "StickView.h"

@implementation StickView

-(void)setStickSting:(NSString *)stickSting
{
    _stickSting = stickSting;
    [self setNeedsDisplay];
}
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:0.0];
    [roundedRect addClip];
    

    
    UIImage *stickImage = [UIImage imageNamed:@"paperBase.png"];
    if (stickImage) {
        [stickImage drawInRect:self.bounds];
    }else {
        NSLog(@"noImage");
    }
    [[UIColor blackColor] setStroke];
    [roundedRect stroke];
    
    

    [self drawHeader];
    [self drawString];
}
- (void)drawHeader;
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
    UIFont *headerFont = [UIFont systemFontOfSize:self.bounds.size.width / 15];
    
    NSAttributedString *cornerText = [[NSAttributedString alloc] initWithString:@"沙田神山" attributes:@{ NSParagraphStyleAttributeName : paragraphStyle, NSFontAttributeName : headerFont}];
    
    CGRect textBounds;
    textBounds.size = [cornerText size];
    textBounds.origin = CGPointMake((self.bounds.size.width / 2.0) - (textBounds.size.width / 2.0) ,self.bounds.size.height / 9.0);
    
    [cornerText drawInRect:textBounds];

}

-(void)drawString
{
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.alignment = NSTextAlignmentCenter;
    
    UIFont *stringFont = [UIFont systemFontOfSize:self.bounds.size.width / 20];
    
    NSArray *stringArray = [self.stickSting componentsSeparatedByString:@"\n"];
    
    NSString *peom1 = [stringArray objectAtIndex:1];
    NSString *peom2 = [stringArray objectAtIndex:2];
    NSString *peom = [NSString stringWithFormat:@"%@\n%@", peom1, peom2];
    
    
    NSAttributedString *mainText = [[NSAttributedString alloc] initWithString:peom attributes:@{NSParagraphStyleAttributeName: paraStyle, NSFontAttributeName : stringFont}];
    
    CGRect textBounds;
    textBounds.size = [mainText size];
    textBounds.origin = CGPointMake((self.bounds.size.width / 2.0) - (textBounds.size.width / 2.0) ,self.bounds.size.height / 5.0);
    
    [mainText drawInRect:textBounds];
    
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


@end
