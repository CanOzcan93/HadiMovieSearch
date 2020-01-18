//
//  MainSheet-Main.swift
//  HadiMovieSearch
//
//  Created by Can Özcan on 15.01.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import UIKit
import SwiftyJSON
import PromiseKit
//import AlamofireImage

extension Main {
    
    public class MainSheet: Sheet<MainLayout> {
        
//        let backgroundQueue = DispatchQueue.global(qos: .background)
        
        public override func onLayoutReady(layout: MainLayout) {
            
            var movies = [Movie]()
            var items = [ListItemView]()
            
            self.apiManager.getList().then { (movieArray) -> Promise<[UIImage?]> in
                
                movies = movieArray
                return self.apiManager.getImages(movies: movieArray)
                
            }.done { (images) in
                var count = 0
                for movie in movies {
                    let item = ListItemView()
                    let poster = images[count]
                    item.changeLabels(item: movie, image: poster)
                    item.addAction {
                        self.demonstrator.toDetailSheet()
                        self.exchangeFlow.letSelectedMovie(place: movie)
                        self.exchangeFlow.letSelectedPoster(poster: poster)
                        print(movie.title)
                    }
                    items.append(item)
                    count += 1
                }
                layout.lv.addItems(items)
            }.catch { (error) in
                print(error.localizedDescription)
            }
            
            layout.lv.scrolledBottom = {
                self.apiManager.nextList().then { (movieArray) -> Promise<[UIImage?]> in
//                    layout.lv.stopAnimating()
                    movies = movieArray
                    return self.apiManager.getImages(movies: movieArray)
                }.done { (images) in
                    items = [ListItemView]()
                    var count = 0
                    for movie in movies {
                        let item = ListItemView()
                        let poster = images[count]
                        item.changeLabels(item: movie, image: poster)
                        item.addAction {
                            self.demonstrator.toDetailSheet()
                            self.exchangeFlow.letSelectedMovie(place: movie)
                            self.exchangeFlow.letSelectedPoster(poster: poster)
                            print(movie.title)
                        }
                        items.append(item)
                        count += 1
                    }
                    layout.lv.addItems(items)
                }
            }
            
            layout.ti.onEndEdit = {
                
                if !((layout.ti.text ?? "").isEmpty) {
                    let word = layout.ti.text!
                    self.apiManager.searchList(str: word).then { (movieArray) -> Promise<[UIImage?]> in
                        movies = movieArray
                        return self.apiManager.getImages(movies: movieArray)
                    }.done { (images) in
                        items = [ListItemView]()
                        layout.lv.reset()
                        var count = 0
                        for movie in movies {
                            let item = ListItemView()
                            item.changeLabels(item: movie, image: images[count])
                            let poster = images[count]
                            item.addAction {
                                self.demonstrator.toDetailSheet()
                                self.exchangeFlow.letSelectedMovie(place: movie)
                                self.exchangeFlow.letSelectedPoster(poster: poster)
                                print(movie.title)
                            }
                            items.append(item)
                            count += 1
                        }
                        layout.lv.addItems(items)
                    }.catch { (error) in
                        print(error.localizedDescription)
                    }
                }
                else {
                    self.apiManager.getList().then { (movieArray) -> Promise<[UIImage?]> in
                        movies = movieArray
                        return self.apiManager.getImages(movies: movieArray)
                    }.done { (images) in
                        items = [ListItemView]()
                        layout.lv.reset()
                        var count = 0
                        for movie in movies {
                            let item = ListItemView()
                            item.changeLabels(item: movie, image: images[count])
                            let poster = images[count]
                            item.addAction {
                                self.demonstrator.toDetailSheet()
                                self.exchangeFlow.letSelectedMovie(place: movie)
                                self.exchangeFlow.letSelectedPoster(poster: poster)
                                print(movie.title)
                            }
                            items.append(item)
                            count += 1
                        }
                        layout.lv.addItems(items)
                    }.catch { (error) in
                        print(error.localizedDescription)
                    }
                }
                
                
                
            }
            
        }
        
    }
    
}
