//
//  ViewController.m
//  mapTest
//
//  Created by 三个爸爸 on 16/8/3.
//  Copyright © 2016年 张源远. All rights reserved.
//

#import "ViewController.h"
#import <MAMapKit/MAMapKit.h>
#import "CustomAnnotationView.h"

@interface ViewController ()<MAMapViewDelegate>
{

    MAMapView * _mapView;
    
}

@end

@implementation ViewController

-(void)viewDidAppear:(BOOL)animated{

    [super viewDidAppear:animated];
    

    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _mapView = [[MAMapView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    _mapView.delegate = self;
    
    _mapView.showsUserLocation = YES;
    
    [_mapView setUserTrackingMode:MAUserTrackingModeFollowWithHeading  animated:YES];
    
    [_mapView setZoomLevel:16.1 animated:YES];
    
    [self.view addSubview:_mapView];
    
    //大头针
    
    MAPointAnnotation * pointView = [[MAPointAnnotation alloc]init];
    
    pointView.coordinate = CLLocationCoordinate2DMake(39.989631, 116.481018);
    
    pointView.title = @"安富大厦";
    
    pointView.subtitle = @"南方庄2号院";
    
    [_mapView addAnnotation:pointView];
    
    
    UISegmentedControl * segment = [[UISegmentedControl alloc] initWithItems:@[@"普通地图",@"卫星地图",@"交通地图"]];
    
    segment.frame = CGRectMake(10, self.view.frame.size.height-70, 180, 40);
    
    [segment addTarget:self action:@selector(segmentClick:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:segment];
    
    
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)segmentClick:(UISegmentedControl *) segment{

    NSInteger index = segment.selectedSegmentIndex;
    if (index== 0) {
        _mapView.mapType = MAMapTypeStandard;
        _mapView.showTraffic = NO;
    }
    else if (index== 1){
        _mapView.mapType = MAMapTypeSatellite;
        _mapView.showTraffic = NO;
    }
    else if (index == 2){
        _mapView.mapType = MAMapTypeStandard;
        _mapView.showTraffic = YES;
    }
    
}

#pragma mark 大头针的代理，气泡
-(MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id<MAAnnotation>)annotation{

    if ([annotation isKindOfClass:[MAPointAnnotation class]]) {
        static NSString *pointReuseIndentifier = @"pointReuseIndentifier";
        
        CustomAnnotationView * annotationView = (CustomAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:pointReuseIndentifier];
        
        if (annotationView == nil)
        {
            annotationView = [[CustomAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pointReuseIndentifier];
        }
        
//        annotationView.canShowCallout= YES;       //设置气泡可以弹出，默认为NO  //设置气泡
//        annotationView.animatesDrop = YES;        //设置标注动画显示，默认为NO
//        annotationView.draggable = YES;        //设置标注可以拖动，默认为NO
//        annotationView.pinColor = MAPinAnnotationColorGreen;
        annotationView.image = [UIImage imageNamed:@"male.png"];
        //设置中心点偏移，使得标注底部中间点成为经纬度对应点
        annotationView.centerOffset = CGPointMake(0, -18);
        return annotationView;
    }
 
    return nil;
}

#pragma mark 定位圈的代理
- (void)mapView:(MAMapView *)mapView didAddAnnotationViews:(NSArray *)views
{
    MAAnnotationView *view = views[0];
    
    // 放到该方法中用以保证userlocation的annotationView已经添加到地图上了。
    if ([view.annotation isKindOfClass:[MAUserLocation class]])
    {
        MAUserLocationRepresentation *pre = [[MAUserLocationRepresentation alloc] init];
        pre.fillColor = [UIColor colorWithRed:0.9 green:0.1 blue:0.1 alpha:0.3];
        pre.strokeColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.9 alpha:1.0];
        pre.image = [UIImage imageNamed:@"location.png"];
        pre.lineWidth = 3;
        pre.lineDashPattern = @[@6, @3];
        
        [_mapView updateUserLocationRepresentation:pre];
        
        view.calloutOffset = CGPointMake(0, 0);
    } 
}

#pragma mark 移动的代理
-(void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation updatingLocation:(BOOL)updatingLocation{

    if (updatingLocation) {

//        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"地图" message:@"位置移动了" preferredStyle:UIAlertControllerStyleAlert];
//        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
//            
//        }];
//        
//        [alert addAction:cancelAction];
//        
//        [self presentViewController:alert animated:YES completion:^{
//            
//        }];

    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
