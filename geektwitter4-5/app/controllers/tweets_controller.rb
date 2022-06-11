class TweetsController < ApplicationController
  
  impressionist :actions => [:show], :unique => [:impressionable_id, :ip_address]

  before_action :authenticate_user!

  def index
    if params[:search] == nil
      @tweets= Tweet.all
    elsif params[:search] == ''
      @tweets= Tweet.all
    else
      #部分検索
      @tweets = Tweet.where("body1 LIKE ? ",'%' + params[:search] + '%')
      
      
      
    end
  end

    def new
        @tweet = Tweet.new
    end

    def create
        tweet = Tweet.new(tweet_params)

        tweet.user_id = current_user.id
        
        if tweet.save
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
    end

    def show

      @tweet = Tweet.find(params[:id])
      impressionist(@tweet, nil, unique: [:session_hash])

      @tweets = Tweet.find_by(id: params[:id])
      @views = @tweets.impressions.size
    end

    def edit
      @tweet = Tweet.find(params[:id])
    end

    def update
      tweet = Tweet.find(params[:id])
      if tweet.update(tweet_params)
        redirect_to :action => "show", :id => tweet.id
      else
        redirect_to :action => "new"
      end
    end

    def destroy
      tweet = Tweet.find(params[:id])
      tweet.destroy
      redirect_to action: :index
    end

    def pv_ranking
      @pv_ranking = Tweet.find(Impression.group(:impressionable_id).order('count(impressionable_id) desc').limit(3).pluck(:impressionable_id))
    end

    def page1
      @kitchens = Tweet.where(place: "キッチン")
    end
    def page2
      @desks = Tweet.where(place: "机")
    end
    def page3
      @shelfs = Tweet.where(place: "棚")
    end
    def page4
      @airconditioners = Tweet.where(place: "エアコン")
    end
    def page5
      @bathrooms = Tweet.where(place: "風呂場")
    end
    def page6
      @floors = Tweet.where(place: "床")
    end

    def article
      @tweets = Tweet.all
    end

    private
    def tweet_params
        params.require(:tweet).permit(:body1,:image1,:body2,:body3,:body4,:image2,:image3,:image4,:time,:item,:title,:place)
    end

end
