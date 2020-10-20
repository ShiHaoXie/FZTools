//
//  ViewController.m
//  FZTools
//
//  Created by xsh on 2020/10/20.
//

#import "ViewController.h"
#import "AnimationViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSArray *itemArray;
@property (strong, nonatomic) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Object";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupView];
    [self setupData];
}


- (void)setupData {
    self.itemArray = @[
        @{@"AnimationViewController":@"动画"},
//        @{@"控制器2":@"标题2"},
//        @{@"控制器3":@"标题3"},
//        @{@"控制器4":@"标题4"},
//        @{@"控制器5":@"标题5"},
//        @{@"控制器6":@"标题6"},
//        @{@"控制器7":@"标题7"},
//        @{@"控制器8":@"标题8"},
//        @{@"控制器9":@"标题9"},
//        @{@"控制器10":@"标题10"},
    ];
}


- (void)setupView {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellID"];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.itemArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    
    NSDictionary *dic = self.itemArray[indexPath.row];
    NSString *descption = [dic allValues][0];
    cell.textLabel.text = descption;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dic = self.itemArray[indexPath.row];
    NSString *vcName = [dic allKeys][0];
    UIViewController *vc = [[NSClassFromString(vcName) alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
