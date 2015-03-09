#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *answerLabel;
@property (weak, nonatomic) IBOutlet UITextField *numberTextField;
@property (weak, nonatomic) IBOutlet UILabel *multiplierLabel;
@property (weak, nonatomic) IBOutlet UISlider *theSlider;
@property (weak, nonatomic) IBOutlet UISegmentedControl *operatorSegmentControl;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.theSlider.minimumValue = 0;
    self.theSlider.maximumValue = 10;
//    self.multiplierLabel.text = [NSString stringWithFormat:@"%1.2f", self.theSlider.value];
}

- (IBAction)calculateButtonPressed:(id)sender {

    float inputAmount = [self.numberTextField.text floatValue];
    float multiplyAmount = [self.multiplierLabel.text floatValue];
    float finalAmount;

    if (self.operatorSegmentControl.selectedSegmentIndex == 0){
        finalAmount = inputAmount * multiplyAmount;
    }else if (self.operatorSegmentControl.selectedSegmentIndex ==1){
        finalAmount = inputAmount / multiplyAmount;
    }


    if (finalAmount > 20){
        self.view.backgroundColor = [UIColor greenColor];
    }
    else {
        self.view.backgroundColor = [UIColor whiteColor];
    }

    int finalAmountTemp = (int) finalAmount;

    if (finalAmountTemp % 3 == 0 && finalAmountTemp % 5 == 0){
        self.answerLabel.text = @"fizzbuzz";
    }
    else if (finalAmountTemp % 3 == 0){
        self.answerLabel.text = @"fizz";
    }
    else if (finalAmountTemp % 5 == 0){
        self.answerLabel.text = @"buzz";
    }
    else {
        self.answerLabel.text = [NSString stringWithFormat:@"%1.2f", finalAmount];
    }
}
- (IBAction)sliderAction:(id)sender {

    int temp = (int)self.theSlider.value;

    self.multiplierLabel.text = [NSString stringWithFormat:@"%d", temp];
}
- (IBAction)userHitEnterButttonDismissKeyboard:(id)sender {

    [self.numberTextField resignFirstResponder];
}

@end
