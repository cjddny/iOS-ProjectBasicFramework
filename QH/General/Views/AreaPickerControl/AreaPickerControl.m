//
//  AreaPickerControl.m
//  ZZB
//
//  Created by HuiYang on 15/4/22.
//  Copyright (c) 2015年 ZhangZheBang. All rights reserved.
//

#import "AreaPickerControl.h"
#import "ActionSheetPicker.h"
#import "ActionSheetCustomPickerDelegate.h"
#import "Province.h"
#import "City.h"
#import "FMDB.h"
#import "Area.h"


#define PROVINCE_COMPONENT 0
#define CITY_COMPONENT     1
#define AREA_COMPONENT     2

@interface AreaPickerControl ()<ActionSheetCustomPickerDelegate>
{
    int provinceIndex;
    int cityIndex;
}
@property (nonatomic , strong) UIPickerView *pickerView;
@property (nonatomic , strong) NSMutableArray *infoArray;
@property (nonatomic , strong) NSMutableArray *provincesArray,*citiesArray,*areasArray;
@property (nonatomic , strong) FMDatabase *db;
@property (nonatomic, strong)NSString *selectString;

@end

@implementation AreaPickerControl

-(instancetype)init
{
    self =[super init];
    if (self)
    {
        [self loadDataSourceFromDb];
    }
    return self;
}


-(void)showAreaPickerControlWithControl:(UIViewController *)control
{
    ActionSheetCustomPicker *picker =[[ActionSheetCustomPicker alloc]initWithTitle:@"" delegate:self showCancelButton:YES origin:control.view initialSelections:nil];
    
    UIButton *okButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [okButton setTitle:@"确定" forState:UIControlStateNormal];
    [okButton setTitleColor:kAppThemeColor forState:UIControlStateNormal];
    [okButton setFrame:CGRectMake(0, 0, 40, 32)];
    [picker setDoneButton:[[UIBarButtonItem alloc] initWithCustomView:okButton]];

    
    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancelButton setTitle:@"关闭" forState:UIControlStateNormal];
    [cancelButton setTitleColor:kAppThemeColor forState:UIControlStateNormal];
    [cancelButton setFrame:CGRectMake(0, 0, 40, 32)];
    [picker setCancelButton:[[UIBarButtonItem alloc] initWithCustomView:cancelButton]];
    
    [picker showActionSheetPicker];
    picker.toolbar.barTintColor=[FHColor colorWithHexStringN:@"eeeeee"];
}



- (void)actionSheetPicker:(AbstractActionSheetPicker *)actionSheetPicker configurePickerView:(UIPickerView *)pickerView
{
    actionSheetPicker.pickerView=nil;
    actionSheetPicker.pickerView=self.pickerView;
}

/**
 Success callback
 
 \param actionSheetPicker   .pickerView property accesses the picker.  Requires a cast to UIView subclass for the picker
 \param origin              The entity which launched the ActionSheetPicker
 */
- (void)actionSheetPickerDidSucceed:(AbstractActionSheetPicker *)actionSheetPicker origin:(id)origin
{
    if ([self.delegate respondsToSelector:@selector(selectDoneAreaAdress:)])
    {
        [self.delegate selectDoneAreaAdress:self.selectString];
    }
}

/** Cancel callback.  See actionSheetPickerDidSuccess:origin: */
- (void)actionSheetPickerDidCancel:(AbstractActionSheetPicker *)actionSheetPicker origin:(id)origin
{
    
}

#pragma mark- Picker Data Source Methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    switch (component) {
        case PROVINCE_COMPONENT:
        {
            return [self.provincesArray count];
        }
            break;
        case CITY_COMPONENT:
        {
            return [self.citiesArray count];
        }
            break;
        case AREA_COMPONENT:
        {
            return [self.areasArray count];
        }
            break;
        default:
            return 0;
            break;
    }
}

#pragma mark- Picker Delegate Methods

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    switch (component) {
        case PROVINCE_COMPONENT:
        {
            return [[self.provincesArray objectAtIndex:row] province];
        }
            break;
        case CITY_COMPONENT:
        {
            return [[self.citiesArray objectAtIndex:row] city];
        }
            break;
        case AREA_COMPONENT:
        {
            return [[self.areasArray objectAtIndex:row] area];
        }
            break;
        default:
            return @"";
            break;
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    switch (component)
    {
        case PROVINCE_COMPONENT:
        {
            provinceIndex = (int)row;
            if (row>[self.provincesArray count])
                return;
            
            Province *p = self.provincesArray[provinceIndex];
            [self.citiesArray removeAllObjects];
            [self.areasArray removeAllObjects];
            
            cityIndex=0;
            self.citiesArray=[self queryCityFromProvinceCode:p.provinceCode];
            
//            [pickerView reloadComponent: CITY_COMPONENT];
//            [pickerView reloadComponent: AREA_COMPONENT];
            
            
            NSString *cityString =@"";
            if ([self.citiesArray count] > 0) {
                City *curCity=[self.citiesArray objectAtIndex:cityIndex];
                self.areasArray=[self queryAreaFromCityCode:curCity.cityCode];
                [pickerView selectRow: 0 inComponent: CITY_COMPONENT animated: YES];
                cityString = [[self.citiesArray objectAtIndex:0] city];
            }
            
            NSString *areaString = @"";
            if ([self.areasArray count] > 0) {
                [pickerView selectRow: 0 inComponent: AREA_COMPONENT animated: YES];
                areaString = [[self.areasArray objectAtIndex:0] area];
//                areaString = [self pickerView:self.pickerView titleForRow:0 forComponent:2];
            }
            [pickerView reloadComponent: CITY_COMPONENT];
            [pickerView reloadComponent: AREA_COMPONENT];
            self.selectString = [NSString stringWithFormat:@"%@ %@ %@",p.province,cityString,areaString];
        }
            break;
        case CITY_COMPONENT:
        {
            
            Province *p = [self.provincesArray objectAtIndex: provinceIndex];
            cityIndex = (int)row;
            
            if (cityIndex>[self.citiesArray count])
            {
                return;
            }
            
            City *c = [self.citiesArray objectAtIndex: cityIndex];
            
            [self.areasArray removeAllObjects];
            
            self.areasArray=[self queryAreaFromCityCode:c.cityCode];

            [pickerView reloadComponent: AREA_COMPONENT];
            [pickerView selectRow: 0 inComponent: AREA_COMPONENT animated: YES];
            
            NSString *areaString = @"";
            if ([self.areasArray count] > 0) {
                areaString = [[self.areasArray objectAtIndex:0] area];
            }
            self.selectString = [NSString stringWithFormat:@"%@ %@ %@",p.province,c.city,areaString];
        }
            break;
        case AREA_COMPONENT:
        {
            
            Province *p = [self.provincesArray objectAtIndex: provinceIndex];
            int areaIndex = (int)row;
            
            if (areaIndex>[self.areasArray count])
            {
                return;
            }
            
            City *c =[self.citiesArray objectAtIndex: cityIndex];
            
            self.selectString = [NSString stringWithFormat:@"%@ %@ %@",p.province,c.city,[self.areasArray[row] area]];
        }
            break;
        default:
            break;
    }
}

-(UIPickerView*)pickerView
{
    if (_pickerView==nil)
    {
        CGRect pickerFrame = CGRectMake(0, 40, [UIScreen mainScreen].bounds.size.width, 216);
        UIPickerView *stringPicker = [[UIPickerView alloc] initWithFrame:pickerFrame];
        stringPicker.delegate = self;
        stringPicker.dataSource = self;
        [stringPicker selectRow:0 inComponent:0 animated:NO];
        if (self.provincesArray.count == 0)
        {
            stringPicker.showsSelectionIndicator = NO;
            stringPicker.userInteractionEnabled = NO;
        } else
        {
            stringPicker.showsSelectionIndicator = YES;
            stringPicker.userInteractionEnabled = YES;
        }
        
        //need to keep a reference to the picker so we can clear the DataSource / Delegate when dismissing
        
        //初始化内容
        NSString *cityString =@"";
        if ([self.citiesArray count] > 0) {
            cityString = [[self.citiesArray objectAtIndex:0] city];
        }
        
        NSString *areaString = @"";
        if ([self.areasArray count] > 0) {
            areaString = [[self.areasArray objectAtIndex:0] area];
        }
        //选中字符串
        self.selectString = [NSString stringWithFormat:@"%@ %@ %@",[[self.provincesArray objectAtIndex:0] province],cityString,areaString];

        _pickerView = stringPicker;
    }
    
    return _pickerView;
}

-(void)loadDataSource
{
    provinceIndex = 0;
    self.infoArray=nil;
    self.provincesArray=nil;
    self.citiesArray=nil;
    self.areasArray=nil;
    
    self.infoArray = [[NSMutableArray alloc] init];
    
    self.provincesArray = [[NSMutableArray alloc] init];
    self.citiesArray = [[NSMutableArray alloc] init];
    self.areasArray = [[NSMutableArray alloc] init];
    
    NSArray *temp = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"area" ofType:@"plist"]];
    [temp enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop)
     {
         Province *province = [[Province alloc] initWithDic:(NSDictionary *)obj];
         
         [self.infoArray addObject:province];
         [self.provincesArray addObject:province.province];
     }];
    
    Province *province = self.infoArray[provinceIndex];
    for (City *c in province.cityArray) {
        [self.citiesArray addObject:c.city];
        
        for (NSString *s in c.areaArray) {
            [self.areasArray addObject:s];
        }
    }
}

//初始化数据
-(void)loadDataSourceFromDb
{
    provinceIndex = 0;
    cityIndex = 0;
    self.infoArray=nil;
    self.provincesArray=nil;
    self.citiesArray=nil;
    self.areasArray=nil;
    
    self.infoArray = [[NSMutableArray alloc] init];
    
    self.provincesArray = [[NSMutableArray alloc] init];
    self.citiesArray = [[NSMutableArray alloc] init];
    self.areasArray = [[NSMutableArray alloc] init];
    
    NSString *dbPath = [[NSBundle mainBundle] pathForResource:@"city" ofType:@"db"];
    self.db = [FMDatabase databaseWithPath:dbPath] ;
    if (![self.db open]) {
        NSLog(@"Could not open db.");
        return ;
    }
    
    NSString *provinceSql =@"select * from province order by id";
    
    FMResultSet *s = [self.db executeQuery:provinceSql];
    while ([s next]) {
        Province *tempProvince=[Province new];
        tempProvince.province = [s stringForColumn:@"name"];
        tempProvince.provinceCode = [s stringForColumn:@"code"];
        [self.infoArray addObject:tempProvince];
        [self.provincesArray addObject:tempProvince];
    }
    
    Province *curProvice=[self.provincesArray objectAtIndex:provinceIndex];
    self.citiesArray=[self queryCityFromProvinceCode:curProvice.provinceCode];
    
    City *curCity=[self.citiesArray objectAtIndex:cityIndex];
    self.areasArray=[self queryAreaFromCityCode:curCity.cityCode];
    
    
}

-(NSMutableArray*)queryCityFromProvinceCode:(NSString*)code
{
    NSMutableArray *cityArr=[NSMutableArray array];
    
    NSString *cityFindSql =[NSString stringWithFormat:@"select * from city where pcode= %@ order by id asc",code];
    FMResultSet *s = [self.db executeQuery:cityFindSql];
    while ([s next]) {
        City *tempCity=[City new];
        tempCity.city = [s stringForColumn:@"name"];
        tempCity.cityCode = [s stringForColumn:@"code"];
        [cityArr addObject:tempCity];
    }
    return cityArr;
}

-(NSMutableArray*)queryAreaFromCityCode:(NSString*)code
{
    NSMutableArray *AreaArr=[NSMutableArray array];
    
    NSString *districtFindSql =[NSString stringWithFormat:@"select * from district where pcode= %@ order by id asc",code];
    FMResultSet *s = [self.db executeQuery:districtFindSql];
    while ([s next]) {
        Area *tempArea=[Area new];
        tempArea.area = [s stringForColumn:@"name"];
        tempArea.areaCode = [s stringForColumn:@"code"];
        [AreaArr addObject:tempArea];
    }
    return AreaArr;
}



@end
