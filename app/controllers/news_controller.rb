class NewsController < ApplicationController
    def index
        require 'news-api'
        newsapi = News.new(ENV['NEWS_API_KEY'])
        begin
          response = newsapi.get_top_headlines(country: 'jp')
          @news = response['articles']
        rescue StandardError => e
          @news = []
          Rails.logger.error "ニュースAPIエラー: #{e.message}"
        end
      end
end
