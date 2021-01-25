# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
    
    #For all users
    can :index, Article
    can :index, User
    #Read public articles
    can :show, Article, public: true

    #Create user
    can :new, User
    can :create, User
    can :show, User
    
    if user.present?
      #Read private articles
      if user.private_articles_remaining != 0
        can :show, Article, public:false
      end

      #Create new articles
      can :new, Article
      can :create, Article

      # Edit own articles
      can :edit, Article, user_id: user.id
      can :update, Article, user_id: user.id
      
      # Destroy own article
      can :destroy, Article, user_id: user.id 

      # Edit own profile
      can :edit, User, user_id: user.id
      can :update, User, user_id: user.id

      can :edit, User, email: user.email
      can :update, User, email: user.email

      #Delete own profile
      can :destroy, User, user_id: user.id

      if user.admin
        can :edit, Article
        can :update, Article

        can :edit, User
        can :update, User
 
        can :destroy, Article
        can :destroy, User
      end
    end
  end
end

