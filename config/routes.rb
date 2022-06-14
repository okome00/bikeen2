Rails.application.routes.draw do
  get 'notifications/index'
  devise_for :users

  root to: 'homes#top' ## topページルーディング
  get    '/post/hashtag/:name' => 'posts#hashtag'                     ## hashtagページルーディング
  get    '/post/hashtag'       => 'posts#hashtag'
  delete '/notifications/destroy_all' => 'notifications#destroy_all'  ## notification削除ルーディング
  resources :posts, only: [:new, :create, :index, :show, :destroy] do ## Postルーディング
    resources :post_comments, only: [:create, :destroy]               ## PostCommentルーディング
    resource  :favorites,     only: [:create, :destroy]               ## Favoriteルーディング
    collection do
      get    '/posts/search'       => 'posts#search', as: 'search'        ## searchページルーディング
    end
  end
  resources :users, only: [:show, :edit, :update] do                  ## Userルーディング
    resource :relationships, only: [:create, :destroy]                ## Relationshipルーディング
    get 'followings' => 'relationships#followings', as: 'followings'  ## フォロー一覧ルーディング
    get 'followers'  => 'relationships#followers',  as: 'followers'   ## フォロワー一覧ルーディング
  end
  resources :notifications, only: [:index]                            ## Notificationルーディング

end
