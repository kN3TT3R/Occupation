//
//  ViewController.swift
//  Occupation
//
//  Created by Kenneth Debruyn on 8/02/17.
//  Copyright © 2017 kN3TT3R. All rights reserved.
//

/*
 Did the citizen work in 2016? Filter
 Did the citizen ever work as Trainer? For in
 Did the citizen ever work at the VDAB? Reduce
 Did the citizen work at the VDAB in 2016? Reduce
 */

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    
    // MARK: - IBOutlets
    @IBOutlet weak var personNameTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var jobDescription: UITextField!
    @IBOutlet weak var companyTextField: UITextField!
    @IBOutlet weak var outputTextView: UITextView!
    @IBOutlet weak var addPersonButton: UIButton!
    
    
    
    // MARK: - Properties
    var personName: String?
    var job = Job(year: "", description: "", company: "")
    var currentPerson = Person(name: "", jobs: [])
    var personCounter = 0
    var outputString = String()
    
    
    
    // MARK: - IBActions
    @IBAction func addPersonButton(_ sender: UIButton) {
        if sender.tag == 1 {
            personName = personNameTextField.text
            currentPerson.name = personName!
        }
        personNameTextField.text?.removeAll()
    }
    
    @IBAction func addJob(_ sender: UIButton) {
        let job = Job(year: "", description: "", company: "")
        if sender.tag == 2 {
            job.year = yearTextField.text!
            job.description = jobDescription.text!
            job.company = companyTextField.text!
        }
        yearTextField.text?.removeAll()
        jobDescription.text?.removeAll()
        companyTextField.text?.removeAll()

        currentPerson.jobs.append(job)
    }

    @IBAction func workedIn2016(_ sender: UIButton) {
        let workedIn2016 = currentPerson.jobs.filter({ $0.year == "2016" })
        for job in workedIn2016 {
            outputString = "Comp: \(job.company) - Descr: \(job.description) - Year: \(job.year)"
            outputTextView.text.append(outputString)
        }
    }
    
    @IBAction func workedForVDAB(_ sender: UIButton) {
        for job in currentPerson.jobs {
            var workedAtVDAB = false
            workedAtVDAB = didWorkedAtVDAB(jobs: job)
            if workedAtVDAB {
                outputString = "Comp: \(job.company) - Descr: \(job.description) - Year: \(job.year)\n"
                print("Comp: \(job.company) - Descr: \(job.description) - Year: \(job.year)\n")
            }
        }
        outputTextView.text.append(outputString)
    }
    
    @IBAction func workedAsTrainer(_ sender: UIButton) {
        let workedAsTrainer = currentPerson.jobs.filter({ $0.description == "Trainer" })
        for job in workedAsTrainer {
            outputString = "Comp: \(job.company) - Descr: \(job.description) - Year: \(job.year)"
            outputTextView.text.append(outputString)
        }
    }
    
    @IBAction func workedForVDABIn2016(_ sender: UIButton) {
        for job in currentPerson.jobs {
            var workedAtVDABIn2016 = false
            workedAtVDABIn2016 = didWorkedAtVDABIn2016(jobs: job)
            if workedAtVDABIn2016 {
                outputString = "Comp: \(job.company) - Descr: \(job.description) - Year: \(job.year)\n"
                print("Comp: \(job.company) - Descr: \(job.description) - Year: \(job.year)\n")
            }
        }
        outputTextView.text.append(outputString)
    }
    
    
    @IBAction func printPerson(_ sender: UIButton) {
        printPerson(person: currentPerson)
    }
    
    
    
    // MARK: - Functions
    func didWorkedAtVDAB(jobs: Job) -> Bool {
        return currentPerson.jobs.reduce(false) { $1.company == "VDAB" || $0 == true }
    }
    
    func didWorkedAtVDABIn2016(jobs: Job) -> Bool {
        return currentPerson.jobs.reduce(false) { ($1.company == "VDAB" && $1.year == "2016") || $0 == true }
    }
    
    func printPerson(person: Person) {
        print("\(person.name)")
        outputString += "\(person.name)\n"
        
        for job in person.jobs {
            outputString += "Comp: \(job.company) - Descr: \(job.description) - Year: \(job.year)\n"
        }
        outputTextView.text.append(outputString)
    }
    
    
    
    // MARK: - Overridden Functions
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

