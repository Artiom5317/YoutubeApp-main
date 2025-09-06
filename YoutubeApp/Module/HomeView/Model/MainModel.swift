//
//  MainModel.swift
//  YoutubeApp
//
//  Created by Artiom on 22.08.25.
//

import Foundation


struct CollectionItem {
    var filterTitle: String?
    var isSelected: Bool?
    
    var category: String?
    
    var preview: String?
    var channelImage: String?
    
    var title: String?
    var views: String?
    var uploadDate: String?
    
    var channelName: String?
    var descriptionText: String?
    
    var likesCount: String?
    var commentsCount: String?
}

struct CollectiomSection {
    var items: [CollectionItem]
    
    static func mockData() -> [CollectiomSection] {
        
        let filterSection: [CollectionItem] = [
            CollectionItem(filterTitle: "All", isSelected: true),
            CollectionItem(filterTitle: "Mixes", isSelected: false),
            CollectionItem(filterTitle: "Music", isSelected: false),
            CollectionItem(filterTitle: "Graphic Design", isSelected: false),
            CollectionItem(filterTitle: "Graphic", isSelected: false),
            CollectionItem(filterTitle: "Movies", isSelected: false),
        ]
        
        let videosSection: [CollectionItem] = [
            CollectionItem(category: "All", preview: "preview1", channelImage: "profile1", title: "The Beauty of Existence - Heart Touching Nasheed Heart Touching Nasheed Heart Touching Nasheed ", views: "19,210,251", uploadDate: "Jul • 1, 2016"),
            
            CollectionItem(category: "Mixes", preview: "preview1", channelImage: "profile1", title: "The Beauty of Existence", views: "19,210,251", uploadDate: "Jul • 1, 2016"),
            
            
            CollectionItem(category: "Mixes", preview: "preview2", channelImage: "profile2", title: "The Beauty of Existence - Heart Touching Nasheed", views: "19,210,251", uploadDate: "Jul • 1, 2016"),
            
            CollectionItem(category: "All", preview: "preview1", channelImage: "profile1", title: "The Beauty of Existence - Heart Touching Nasheed", views: "19,210,251", uploadDate: "Jul • 1, 2016"),
            
            CollectionItem(category: "Music", preview: "preview2", channelImage: "profile2", title: "The Beauty of Existence - Heart Touching Nasheed", views: "19,210,251", uploadDate: "Jul • 1, 2016"),
        ]
        
        let shortsSection: [CollectionItem] = [
            CollectionItem(category: "Music", preview: "shortsPreview1", channelImage: "profile1", title: "DIY Toys | Satisfying And RelaxingIY DIY Toys | Satisfying And RelaxingIYDIY Toys", views: "24M", channelName: "SADEK Tuts123FOJAS:LKDJAS:KLDJASL", descriptionText: "Fidget Trading #SADEK #Shorts tiktok", likesCount: "245K", commentsCount: "952"),
            CollectionItem(category: "All", preview: "shortsPreview2", channelImage: "profile2", title: "DIY Toys | Satisfying And Relaxing | DIY Tiktok Compilation Satisfying And Relaxing | DIY Tiktok Compilation", views: "24M", channelName: "SADEK Tuts", descriptionText: "Fidget Trading #SADEK #Shorts tiktok", likesCount: "245K", commentsCount: "952"),
            CollectionItem(category: "Mixes", preview: "shortsPreview1", channelImage: "profile1", title: "DIY Toys | Satisfying And RelaxingIY DIY Toys | Satisfying And RelaxingIYDIY Toys | Satisfying And RelaxingIYDIY Toys | Satisfying And RelaxingIYDIY Toys | Satisfying And RelaxingIYDIY Toys | Satisfying And RelaxingIYDIY Toys | Satisfying And RelaxingIY Toys | Satisfying And Relaxing", views: "24M", channelName: "SADEK Tuts123FOJAS:LKDJAS:KLDJASL", descriptionText: "Fidget Trading #SADEK #Shorts tiktok", likesCount: "245K", commentsCount: "952"),
            CollectionItem(category: "All", preview: "shortsPreview2", channelImage: "profile2", title: "DIY Toys | Satisfying And Relaxing | DIY Tiktok Compilation Satisfying And Relaxing | DIY Tiktok Compilation", views: "24M", channelName: "SADEK Tuts", descriptionText: "Fidget Trading #SADEK #Shorts tiktok", likesCount: "245K", commentsCount: "952"),
            CollectionItem(category: "Graphic Design", preview: "shortsPreview1", channelImage: "profile1", title: "DIY Toys", views: "24M", channelName: "SADEK Tuts123FOJAS:LKDJAS:KLDJASL", descriptionText: "Fidget Trading #SADEK #Shorts tiktok", likesCount: "245K", commentsCount: "952"),
            CollectionItem(category: "All", preview: "shortsPreview2", channelImage: "profile2", title: "DIY Toys | Satisfying And Relaxing | DIY Tiktok Compilation Satisfying And Relaxing | DIY Tiktok Compilation", views: "24M", channelName: "SADEK Tuts", descriptionText: "Fidget Trading #SADEK #Shorts tiktok", likesCount: "245K", commentsCount: "952"),
            
            CollectionItem(category: "Mixes", preview: "shortsPreview1", channelImage: "profile1", title: "DIY Toys | Satisfying And RelaxingIY DIY Toys | Satisfying And RelaxingIYDIY Toys | Satisfying And RelaxingIYDIY Toys | Satisfying And RelaxingIYDIY Toys | Satisfying And RelaxingIYDIY Toys | Satisfying And RelaxingIYDIY Toys", views: "24M", channelName: "SADEK Tuts123FOJAS:LKDJAS:KLDJASL", descriptionText: "Fidget Trading #SADEK #Shorts tiktok", likesCount: "245K", commentsCount: "952"),
            
            CollectionItem(category: "Graphic", preview: "shortsPreview1", channelImage: "profile1", title: "DIY Toys | Satisfying And RelaxingIY DIY Toys | Satisfying And RelaxingIYDIY Toys | Satisfying And RelaxingIYDIY Toys | Satisfying And RelaxingIYDIY Toys | Satisfying And RelaxingIYDIY Toys | Satisfying And RelaxingIYDIY Toys | Satisfying And RelaxingIY Toys | Satisfying And Relaxing", views: "24M", channelName: "SADEK Tuts123FOJAS:LKDJAS:KLDJASL", descriptionText: "Fidget Trading #SADEK #Shorts tiktok", likesCount: "245K", commentsCount: "952"),
            
            CollectionItem(category: "Music", preview: "shortsPreview1", channelImage: "profile1", title: "DIY Toys | Satisfying And RelaxingIY DIY Toys | Satisfying And RelaxingIYDIY Toys | Satisfying And RelaxingIYDIY Toys | Satisfying And RelaxingIYDIY Toys | Satisfying And RelaxingIYDIY Toys | Satisfying And RelaxingIYDIY Toys | Satisfying And RelaxingIY Toys | Satisfying And Relaxing", views: "24M", channelName: "SADEK Tuts123FOJAS:LKDJAS:KLDJASL", descriptionText: "Fidget Trading #SADEK #Shorts tiktok", likesCount: "245K", commentsCount: "952"),
            CollectionItem(category: "Music", preview: "shortsPreview1", channelImage: "profile1", title: "DIY Toys | Satisfying And RelaxingIY DIY Toys | Satisfying And RelaxingIYDIY Toys | Satisfying And RelaxingIYDIY Toys | Satisfying And RelaxingIYDIY Toys | Satisfying And RelaxingIYDIY Toys | Satisfying And RelaxingIYDIY Toys | Satisfying And RelaxingIY Toys | Satisfying And Relaxing", views: "24M", channelName: "SADEK Tuts123FOJAS:LKDJAS:KLDJASL", descriptionText: "Fidget Trading #SADEK #Shorts tiktok", likesCount: "245K", commentsCount: "952"),
            
            CollectionItem(category: "Movies", preview: "shortsPreview1", channelImage: "profile1", title: "DIY Toys | Satisfying And RelaxingIY DIY Toys | Satisfying And RelaxingIYDIY Toys | Satisfying And RelaxingIYDIY Toys | Satisfying And RelaxingIYDIY Toys | Satisfying And RelaxingIYDIY Toys | Satisfying And RelaxingIYDIY Toys | Satisfying And RelaxingIY Toys | Satisfying And Relaxing", views: "24M", channelName: "SADEK Tuts123FOJAS:LKDJAS:KLDJASL", descriptionText: "Fidget Trading #SADEK #Shorts tiktok", likesCount: "245K", commentsCount: "952"),
            CollectionItem(category: "Movies", preview: "shortsPreview1", channelImage: "profile1", title: "DIY Toys | Satisfying And RelaxingIY DIY Toys | Satisfying And RelaxingIYDIY Toys | Satisfying And RelaxingIYDIY Toys | Satisfying And RelaxingIYDIY Toys | Satisfying And RelaxingIYDIY Toys | Satisfying And RelaxingIYDIY Toys | Satisfying And RelaxingIY Toys | Satisfying And Relaxing", views: "24M", channelName: "SADEK Tuts123FOJAS:LKDJAS:KLDJASL", descriptionText: "Fidget Trading #SADEK #Shorts tiktok", likesCount: "245K", commentsCount: "952"),
            
            
            CollectionItem(category: "All", preview: "shortsPreview2", channelImage: "profile2", title: "DIY Toys | Satisfying And Relaxing | DIY Tiktok Compilation Satisfying And Relaxing | DIY Tiktok Compilation", views: "24M", channelName: "SADEK Tuts", descriptionText: "Fidget Trading #SADEK #Shorts tiktok", likesCount: "245K", commentsCount: "952"),
            
            CollectionItem(category: "All", preview: "shortsPreview1", channelImage: "profile1", title: "DIY Toys | Satisfying And Relaxing | DIY Tiktok Compilation", views: "24M", channelName: "SADEK Tuts", descriptionText: "Fidget Trading #SADEK #Shorts tiktok", likesCount: "245K", commentsCount: "952"),
            
            CollectionItem(category: "Graphic Design", preview: "shortsPreview2", channelImage: "profile2", title: "DIY Toys | Satisfying And Relaxing | DIY Tiktok Compilation", views: "24M", channelName: "SADEK Tuts", descriptionText: "Fidget Trading #SADEK #Shorts tiktok", likesCount: "245K", commentsCount: "952"),
            
            CollectionItem(category: "Graphic Design", preview: "shortsPreview2", channelImage: "profile2", title: "DIY Toys | Satisfying And Relaxing | DIY Tiktok Compilation", views: "24M", channelName: "SADEK Tuts", descriptionText: "Fidget Trading #SADEK #Shorts tiktok", likesCount: "245K", commentsCount: "952"),
            
            CollectionItem(category: "All", preview: "shortsPreview2", channelImage: "profile2", title: "DIY Toys | Satisfying And Relaxing | DIY Tiktok Compilation", views: "24M", channelName: "SADEK Tuts", descriptionText: "Fidget Trading #SADEK #Shorts tiktok", likesCount: "245K", commentsCount: "952"),
            
            CollectionItem(category: "Music", preview: "shortsPreview2", channelImage: "profile2", title: "DIY Toys | Satisfying And Relaxing | DIY Tiktok Compilation", views: "24M", channelName: "SADEK Tuts", descriptionText: "Fidget Trading #SADEK #Shorts tiktok", likesCount: "245K", commentsCount: "952"),
            
            CollectionItem(category: "Graphic", preview: "shortsPreview2", channelImage: "profile2", title: "DIY Toys | Satisfying And Relaxing | DIY Tiktok Compilation", views: "24M", channelName: "SADEK Tuts", descriptionText: "Fidget Trading #SADEK #Shorts tiktok", likesCount: "245K", commentsCount: "952"),
            
            CollectionItem(category: "Graphic", preview: "shortsPreview2", channelImage: "profile2", title: "DIY Toys | Satisfying And Relaxing | DIY Tiktok Compilation", views: "24M", channelName: "SADEK Tuts", descriptionText: "Fidget Trading #SADEK #Shorts tiktok", likesCount: "245K", commentsCount: "952"),
        ]
        
        let filters = CollectiomSection(items: filterSection)
        let videos = CollectiomSection(items: videosSection)
        let shorts = CollectiomSection(items: shortsSection)
        let videos2 = CollectiomSection(items: videosSection)
        
        
        return [filters, videos, shorts, videos2]
    }
}
