//
//  ViewController.m
//  PeoplePicker
//
//  Created by 三个爸爸 on 16/8/3.
//  Copyright © 2016年 张源远. All rights reserved.
//

#import "ViewController.h"
#import <ContactsUI/ContactsUI.h>

@interface ViewController ()<CNContactPickerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
     进来应该授权，不用点击
     */

    
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button.frame = CGRectMake(100, 100, 100, 100);
    
    [button setTitle:@"没有UI电话谱" forState:UIControlStateNormal];
    
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
    
    UIButton * button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button1.frame = CGRectMake(100, 200, 100, 100);
    
    [button1 setTitle:@"UI电话谱" forState:UIControlStateNormal];
    
    [button1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    [button1 addTarget:self action:@selector(click1) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button1];
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)click1{

    CNContactPickerViewController * pickVc = [[CNContactPickerViewController alloc]init];
   
    pickVc.delegate = self;
    
    [self presentViewController:pickVc animated:YES completion:nil];
    
}

#pragma mark CNContactPickDelegate的方法
-(void)contactPickerDidCancel:(CNContactPickerViewController *)picker{
    NSLog(@"消失");
    [picker dismissViewControllerAnimated:YES completion:nil];
}

-(void)contactPicker:(CNContactPickerViewController *)picker didSelectContactProperty:(CNContactProperty *)contactProperty{

    CNContact * contact = contactProperty.contact;
    
    NSArray * phones = contact.phoneNumbers;
    
    NSString * string = contactProperty.label;
    
    NSString * key = contactProperty.key;
    
    NSString * identifier = contactProperty.identifier;
    
    NSLog(@"label===%@-----key===%@-----identifier%@",string,key,identifier);
    
    for (int i=0; i<phones.count; i++) {
        CNLabeledValue * phone = phones[i];
        
        NSString * label = phone.label;
        
        //获取电话号码
        CNPhoneNumber * phoneNum = phone.value;
        NSString * num = phoneNum.stringValue;
        
        NSLog(@"label==%@-------num==%@",label,num);

        
    }
    
}

-(void)click{

//    if ([CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts] == CNAuthorizationStatusAuthorized) {
//        return;
//    }
    
    CNContactStore * store = [[CNContactStore alloc]init];
    
    [store requestAccessForEntityType:CNEntityTypeContacts completionHandler:^(BOOL granted, NSError * _Nullable error) {
        if (granted) {
            NSLog(@"授权成功");
        }
        else{
            NSLog(@"授权失败");
        }
    }];
   
    
    NSArray * typeArray = @[CNContactGivenNameKey,CNContactFamilyNameKey,CNContactPhoneNumbersKey,CNContactEmailAddressesKey,CNContactBirthdayKey,CNContactDepartmentNameKey];
    
    //创建CNContactFetchRequest对象
    CNContactFetchRequest * request = [[CNContactFetchRequest alloc]initWithKeysToFetch:typeArray];
    
    
    //遍历所有的联系人
    [store enumerateContactsWithFetchRequest:request error:nil usingBlock:^(CNContact * _Nonnull contact, BOOL * _Nonnull stop) {
        //姓名
        NSString * firstName = contact.givenName;
        
        //姓氏
        NSString * lastName = contact.familyName;
        
        NSLog(@"11%@   ====%@",firstName,lastName);
        
        //获取电话信息
        NSArray * phones = contact.phoneNumbers;
        for (int i=0; i<phones.count ; i++) {
            CNLabeledValue * phone = phones[i];
            
            //获取电话号码的key
            NSString * label = phone.label;
            
            //获取电话号码
            CNPhoneNumber * phoneNum = phone.value;
            NSString * num = phoneNum.stringValue;
            
            NSLog(@"%@-------%@",label,num);
            
        }
        
        
    }];
    
//    ABPeoplePickerNavigationController * nav = [[ABPeoplePickerNavigationController alloc]init];
//    
//    nav.peoplePickerDelegate = self;
//    
//    if ([[UIDevice currentDevice].systemVersion integerValue] > 8.0) {
//        nav.predicateForSelectionOfPerson = [NSPredicate predicateWithValue:false];
//        
//    }
//    
//    [self presentViewController:nav animated:YES completion:nil];
    
}




























- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
