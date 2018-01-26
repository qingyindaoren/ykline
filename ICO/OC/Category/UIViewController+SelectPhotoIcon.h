//
//  UIViewController+SelectPhotoIcon.h
//  BBSelectUserIcon
//
//  Created by 项羽 on 16/9/21.
//  Copyright © 2016年 项羽. All rights reserved.
//

#import <UIKit/UIKit.h>




@interface UIViewController (SelectPhotoIcon)<UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIActionSheetDelegate>
@property (nonatomic,assign)BOOL isNoEdit;
- (UIImagePickerController *)imagePickerController;

/**
 *  调用相册
 */
- (void)showActionSheet;
- (void)useCamera;
- (void)usePhoto;
- (UIImage*)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize;


@end
