//
//  YTMapViewController.m
//  YTproject
//
//  Created by suhuahao on 2018/8/2.
//  Copyright © 2018年 suhuahao. All rights reserved.
//

#import "YTMapViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MKAnnotationView.h>

@interface YTMapViewController ()<MKMapViewDelegate,CLLocationManagerDelegate>

@property (nonatomic ,strong) MKMapView *mapView;
@property (nonatomic ,strong) CLLocationManager *   locationManager;

@end

@implementation YTMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"工作地点";
    [self setMapView];
}

- (void)setMapView{
    MKMapView *mapView = [[MKMapView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height)];
    mapView.delegate = self;
    self.locationManager=[[CLLocationManager alloc]init];
    if(![CLLocationManager locationServicesEnabled]||[CLLocationManager authorizationStatus]!=kCLAuthorizationStatusAuthorizedWhenInUse){
        [self.locationManager requestWhenInUseAuthorization];
    }
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationManager.distanceFilter = 10.0;
    self.locationManager.delegate = self;
    mapView.userTrackingMode = MKUserTrackingModeFollow;
    mapView.mapType = MKMapTypeStandard;
    [self.locationManager startUpdatingLocation];
    [self.view addSubview:mapView];
    
    CLLocationCoordinate2D location=CLLocationCoordinate2DMake(23.064409, 113.400851);
    MKPointAnnotation *annotation=[[MKPointAnnotation alloc]init];
    annotation.title=@"";
    annotation.subtitle=@"";
    annotation.coordinate=location;
    [mapView addAnnotation:annotation];
    
    self.mapView = mapView;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    YTLog(@"Latitude = %f", manager.location.coordinate.latitude);
    YTLog(@"Longitude = %f", manager.location.coordinate.longitude);
}



- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
        
    }
    static NSString * kMKPinAnnotationViewIdentifier = @"identifier";
    // 大头针重用
    MKPinAnnotationView *annotationView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:kMKPinAnnotationViewIdentifier];
    if (!annotationView) {
        // 如果缓存池中不存在则新建
        annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:kMKPinAnnotationViewIdentifier];
    }
    // 修改大头针视图
    // 重新设置此类大头针视图的大头针模型(因为有可能是从缓存池中取出来的，位置是放到缓存池时的位置)
    annotationView.annotation = annotation;
    // 设置大头针图片
    annotationView.image = [UIImage imageNamed:@"company_icon_location"];
    // 设置大头针凋零效果
    annotationView.animatesDrop = YES;
    // 允许用户交互点击(弹框显示标注详情)
    annotationView.canShowCallout = YES;
    // 定义详情视图偏移量
    annotationView.calloutOffset = CGPointMake(0, 1);
    // 设置大头针颜色
    annotationView.pinTintColor = [UIColor blueColor];
    // 自定义大头针详情右侧视图
    UIButton *navigationBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    navigationBtn.bounds = CGRectMake(0, 0, 100, 60);
    navigationBtn.backgroundColor = [UIColor grayColor];
    [navigationBtn setTitle:@"导航" forState:UIControlStateNormal];
    annotationView.rightCalloutAccessoryView = navigationBtn;
    
    return annotationView;
    
}


@end
