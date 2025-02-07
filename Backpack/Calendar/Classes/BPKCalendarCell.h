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

#import <FSCalendar/FSCalendar.h>
#import <Backpack/Font.h>

typedef NS_ENUM(NSUInteger, SelectionType) {
    SelectionTypeNone,
    SelectionTypeSingle,
    SelectionTypeLeftBorder,
    SelectionTypeMiddle,
    SelectionTypeRightBorder,
    SelectionTypeSameDay
};

typedef NS_ENUM(NSUInteger, RowType) { RowTypeMiddle, RowTypeStart, RowTypeEnd, RowTypeBoth };

@interface BPKCalendarCell : FSCalendarCell

@property(nonatomic) SelectionType selectionType;
@property(nonatomic) RowType rowType;

@property(nullable, nonatomic, strong) BPKFontMapping *fontMapping UI_APPEARANCE_SELECTOR;

@end
