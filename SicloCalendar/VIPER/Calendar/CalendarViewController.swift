//
//  CalendarViewController.swift
//  SicloCalendar
//
//  Created by Luis Fernando Bustos Ramírez on 12/06/20.
//  Copyright © 2020 gastandotenis. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class CalendarViewController: UIViewController,NVActivityIndicatorViewable {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var scheduleTableView: UITableView!
    
    var presenter:CalendarPresenterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.loadSchedules()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func setupUI(){
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        scheduleTableView.layer.cornerRadius = 5
        scheduleTableView.layer.masksToBounds = true
        scheduleTableView.backgroundColor = .clear
        scheduleTableView.translatesAutoresizingMaskIntoConstraints = false
        scheduleTableView.separatorStyle = .none
        scheduleTableView.dataSource = self
        scheduleTableView.delegate = self
        let scheduleNib = UINib(nibName: "TrainingScheduleTableViewCell", bundle: nil)
        scheduleTableView.register(scheduleNib, forCellReuseIdentifier: "TrainingScheduleTableViewCell")
        
        collectionView.dataSource = self
        collectionView.delegate = self
        let trainingNib = UINib(nibName: "InstructorCollectionViewCell", bundle: nil)
        self.collectionView.register(trainingNib, forCellWithReuseIdentifier: "InstructorCollectionViewCell")
    }
    
    func startLoader(){
        startAnimating(CGSize.init(width: 50, height: 50),
                       message: "Espera un momento",
                       messageFont: UIFont.boldSystemFont(ofSize: 12),
                       type: .ballRotate,
                       color: .white,
                       padding: 0.0,
                       displayTimeThreshold: 10,
                       minimumDisplayTime: 2,
                       backgroundColor: #colorLiteral(red: 0.1842391789, green: 0.1748405397, blue: 0.2493930459, alpha: 1),
                       textColor: .white)
    }
    
    func stopLoader(){
        self.stopAnimating()
    }
}

extension CalendarViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter?.countSchedules() ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let day = presenter?.getScheduleDayOf(index: section) ?? ""
        let headerView = UIView()
        headerView.backgroundColor = .black
        let headerLabel = UILabel(frame: CGRect(x: 10, y: 0, width: tableView.bounds.size.width-20, height: 28))
        headerLabel.textColor = UIColor.white
        headerLabel.backgroundColor = .black
        headerLabel.text = day
        headerLabel.textAlignment = .left
        headerView.addSubview(headerLabel)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let day = presenter?.getScheduleDayOf(index: section) ?? ""
        return presenter?.countScheduleBy(date: day) ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView2: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView2.dequeueReusableCell(withIdentifier: "TrainingScheduleTableViewCell", for: indexPath) as! TrainingScheduleTableViewCell
        cell.setupUI()
        let day = presenter?.getScheduleDayOf(index: indexPath.section) ?? ""
        if let schedule = presenter?.getSchedule(index: indexPath.row, of: day){
            cell.fillWith(schedule: schedule)
        }else{
            cell.fillEmpty()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let day = presenter?.getScheduleDayOf(index: indexPath.section) ?? ""
        if let schedule = presenter?.getSchedule(index: indexPath.row, of: day){
            let alert = UIAlertController(title: "Agendar sesión", message: "Te esperamos para tu sesión de \(schedule.tipo) este \(schedule.fecha.cuteDateFormat())", preferredStyle: .alert)
            let cancelar = UIAlertAction(title: "Cancelar", style: .default) { (_) in}
            let recordar = UIAlertAction(title: "Recordar", style: .default) { (_) in
                self.presenter?.registerToSession(schedule)
            }
            alert.addAction(cancelar)
            alert.addAction(recordar)
            present(alert, animated: true, completion: nil)
        }
    }
}

extension CalendarViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return presenter?.countInstructors() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InstructorCollectionViewCell", for: indexPath) as! InstructorCollectionViewCell
        cell.setupUI()
        if let instructor = presenter?.getInstructorOf(index: indexPath.row){
            cell.fillWith(instructor: instructor)
        }else{
            cell.fillEmpty()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width/4, height: collectionView.frame.height)
    }
}

extension CalendarViewController: CalendarViewProtocol{
    func showErrorDetail(error: String) {
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        let accept = UIAlertAction(title: "Aceptar", style: .default) { (_) in}
        alert.addAction(accept)
        present(alert, animated: true, completion: nil)
    }
    
    func updateCalendar() {
        scheduleTableView.reloadData()
        collectionView.reloadData()
    }
}
