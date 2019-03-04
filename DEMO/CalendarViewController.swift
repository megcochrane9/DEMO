import UIKit
import FSCalendar

class CalendarViewController: UIViewController, FSCalendarDelegate {
    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return DaysInMonths[month]
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Calendar", for: indexPath) as! DataCollectionViewCell
//        cell.backgroundColor = UIColor.clear
//        cell.DateLabel.text = "\(indexPath.row + 1)"
//
//        return cell
//
//    }
//
//
//
//    @IBOutlet weak var Calendar: UICollectionView!
//    @IBOutlet weak var MonthLabel: UILabel!
//
//    let Months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
//
//    let DaysOfMonth = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
//
//    var DaysInMonths = [31,28,31,30,31,30,31,31,30,31,30,31]
//
//    var currentMonth = String()
//
//    var NumberOfEmptyBox = Int() //The number of "empty boxes" at the start of the current month
//
//    var NextNumberOfEmptyBox = Int() // the same with above but with the next month
//
//    var PreviousNumberOfEmptyBox = 0 // the same with above with the previous month
//
//    var Direction = 0 // =0 if we are at the the current month , = 1 if we are in a future month , = -1 if we are in a past month
//
//    var PositionIndex = 0 // here we will store the above vars of the empty boxes
//
//
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        currentMonth = Months[month]
//
//        MonthLabel.text = "\(currentMonth) \(year)"
//
//
//    }
//
//
//
//
//    @IBAction func Next(_ sender: Any) {
//        switch currentMonth {
//        case "December":
//            month = 0
//            year += 1
//
//            currentMonth = Months[month]
//
//            MonthLabel.text = "\(currentMonth) \(year)"
//            Calendar.reloadData()
//
//        default:
//            month += 1
//
//            currentMonth = Months[month]
//
//            MonthLabel.text = "\(currentMonth) \(year)"
//            Calendar.reloadData()
//        }
//    }
//
//
//    @IBAction func Back(_ sender: Any) {
//        switch currentMonth {
//        case "January":
//            month = 11
//            year -= 1
//
//            currentMonth = Months[month]
//
//            MonthLabel.text = "\(currentMonth) \(year)"
//            Calendar.reloadData()
//
//        default:
//            month -= 1
//
//            currentMonth = Months[month]
//
//            MonthLabel.text = "\(currentMonth) \(year)"
//            Calendar.reloadData()
//    }
//
//        func GetStartDateDayPosition() {
//            switch Direction {
//            case 0:
//                switch currentDay{
//                case 1...7:
//                    NumberOfEmptyBox = currentWeekDay - currentDay
//                case 8...14:
//                    NumberOfEmptyBox = currentWeekDay - currentDay - 7
//                case 15...21:
//                    NumberOfEmptyBox = currentWeekDay - currentDay - 14
//                case 22...28:
//                    NumberOfEmptyBox = currentWeekDay - currentDay - 21
//                case 29...21:
//                    NumberOfEmptyBox = currentWeekDay - currentDay - 2
//            default:
//                break
//            }
//
//
//                }
//        }
//
//
//
//
//
//
//
//
//
//
//
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return DaysInMonths[month]
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Calendar", for: indexPath) as! DataCollectionViewCell
//        cell.backgroundColor = UIColor.clear
//        cell.DateLabel.text = "\(indexPath.row + 1)"
//
//        return cell
//
//        }
//}
}
