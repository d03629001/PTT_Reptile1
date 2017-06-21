## automate data + pttR
library(rvest)
library(tmcn)
library(bitops)
library(RCurl)
library(XML)
library(xml2)
library(stringr)
library(RCurl)
library(plyr)

url<-"https://www.ptt.cc/bbs/Reptile"
url

total_pages<-827
max_url<-(total_pages-1)
add_url<-str_c("/index",seq(1,max_url,1))
add_url

getPageURLs<-function(url){
  baseurl<-htmlParse(url)
  add_url<-str_c("/index",seq(1,max_url))
  urls_list<-as.list(str_c(url,add_url,".html"))
  return(urls_list)
}



  
url.main <-'https://www.ptt.cc/bbs/Reptile/index740.html'
href.title <- html_nodes(read_html(url.main), ".title a")
R.hrefs <- html_attr(href.title, 'href')
  
  article.data <- c()
  folder<-"C:/Users/william4ntu/Desktop/Rtest/Reptile4"
  for(i in 1:length(R.hrefs)){
    article.url <- paste0('https://www.ptt.cc', R.hrefs[i])
    article <- html_nodes(read_html(article.url), "#main-content")
    article.content <- html_text(article)
    article.utf8 <- iconv(article.content, 'utf8')
    article.data <- c(article.data, article.utf8)
    name <- strsplit(article.url, '/')[[1]][4]
    write(article.data, str_c(folder, '/', name))
    setwd("C:/Users/william4ntu/Desktop/Rtest/Reptile4")
    Sys.sleep(sample(3:5, 1))
    Sys.sleep(1)
}
  # OK
article.datwrite.table()
d(article.data)
#urls_list_all<-getPageURLs
#urls_list[1:3]

setwd("C:/Users/william4ntu/Desktop/Rtest/Reptile4")
folder<-"C:/Users/william4ntu/Desktop/Rtest"
