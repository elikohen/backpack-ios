/*
 * Backpack - Skyscanner's Design System
 *
 * Copyright 2018-2019 Skyscanner Ltd
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#import "BPKLabel.h"
#import <Backpack/Color.h>
#import <Backpack/Common.h>

NS_ASSUME_NONNULL_BEGIN
@interface BPKLabel ()
- (void)setupWithStyle:(BPKFontStyle)style;
@end

@implementation BPKLabel

- (instancetype)initWithFontStyle:(BPKFontStyle)style {
    BPKAssertMainThread();
    self = [super initWithFrame:CGRectZero];

    if (self) {
        [self setupWithStyle:style];
    }

    return self;
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    BPKAssertMainThread();
    self = [super initWithCoder:aDecoder];

    if (self) {
        [self setupWithStyle:BPKFontStyleTextBase];
    }

    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    BPKAssertMainThread();
    self = [super initWithFrame:frame];

    if (self) {
        [self setupWithStyle:BPKFontStyleTextBase];
    }

    return self;
}

- (void)updateTextStyle {
    if (self.text == nil) {
        self.attributedText = nil;
        return;
    }

    NSAttributedString *_Nullable attributedString = nil;
    if (self.textColor) {
        attributedString = [BPKFont attributedStringWithFontStyle:self.fontStyle
                                                          content:self.text
                                                        textColor:self.textColor
                                                      fontMapping:_fontMapping];
    } else {
        attributedString = [BPKFont attributedStringWithFontStyle:self.fontStyle
                                                          content:self.text
                                                      fontMapping:_fontMapping];
    }
    super.attributedText = attributedString;
}

- (void)setText:(NSString *_Nullable)text {
    BPKAssertMainThread();

    [super setText:text];
    [self updateTextStyle];
}

- (void)setFontStyle:(BPKFontStyle)fontStyle {
    BPKAssertMainThread();
    _fontStyle = fontStyle;
    self.text = self.attributedText.string;
}

- (void)setFontMapping:(BPKFontMapping *_Nullable)fontMapping {
    if (_fontMapping != fontMapping) {
        _fontMapping = fontMapping;

        [self updateTextStyle];
    }
}

#pragma mark - Private

- (void)setupWithStyle:(BPKFontStyle)style {
    self.fontStyle = style;
    self.textColor = BPKColor.gray700;
}

@end
NS_ASSUME_NONNULL_END
