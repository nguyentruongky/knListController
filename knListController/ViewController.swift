//
//  ViewController.swift
//  knListController
//
//  Created by Ky Nguyen on 3/13/19.
//  Copyright © 2019 Ky Nguyen. All rights reserved.
//

import UIKit

struct Book {
    var title: String?
    var author: String?

    init(title: String, author: String) {
        self.title = title
        self.author = author
    }
}

class BookCell: knListCell<Book> {
    override var data: Book? { didSet {
        titleLabel.text = data?.title
        authorLabel.text = data?.author
    }}

    let titleLabel = UIMaker.makeLabel(font: UIFont.boldSystemFont(ofSize: 17),
                                       color: UIColor.black)
    let authorLabel = UIMaker.makeLabel(font: UIFont.systemFont(ofSize: 14),
                                       color: UIColor.gray)
    override func setupView() {
        addSubviews(views: titleLabel, authorLabel)

        titleLabel.horizontal(toView: self, space: 24)
        titleLabel.bottom(toAnchor: centerYAnchor, space: -4)

        authorLabel.horizontal(toView: titleLabel)
        authorLabel.verticalSpacing(toView: titleLabel, space: 8)
    }
}


class ViewController: knListController<BookCell, Book> {

    override func setupView() {
        rowHeight = 72
        view.addFill(tableView)
        fetchData()
    }

    override func fetchData() {
        datasource = [
            Book(title: "Becoming", author: "Michelle Obama"),
            Book(title: "Girl, Wash Your Face: Stop Believing the Lies About Who You Are so You Can Become Who You Were Meant to Be", author: "Rachel Hollis"),
            Book(title: "The Wonky Donkey ", author: "Craig Smith"),
            Book(title: "Fire and Fury: Inside the Trump White House", author: "Michael Wolff"),
            Book(title: "Fear: Trump in the White House", author: "Bob Woodward"),
            Book(title: "12 Rules for Life: An Antidote to Chaos ", author: "Jordan B. Peterson"),
            Book(title: "Magnolia Table: A Collection of Recipes for Gathering", author: "Joanna Gaines"),
            Book(title: "Whose Boat Is This Boat?: Comments That Don't Help in the Aftermath of a Hurricane", author: "The Staff of The Late Show with Stephen Colbert"),
            Book(title: "The Subtle Art of Not Giving a F*ck: A Counterintuitive Approach to Living a Good Life", author: "Mark Manson"),
            Book(title: "A Higher Loyalty: Truth, Lies, and Leadership ", author: "James Comey"),
            Book(title: "The Complete Ketogenic Diet for Beginners: Your Essential Guide to Living the Keto Lifestyle ", author: "Amy Ramos"),
        ]
    }
}

