class Friend < ApplicationRecord
  belongs_to :user
  validates :first_name, presence: true, length: { minimum: 1 }
  validates :last_name, presence: true, length: { minimum: 1}
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :user_id, :numericality => {:only_integer => true}
  validates_presence_of :dob

  scope :my_friends, -> (userId) { where("user_id = ?", userId) }

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  settings index: {number_of_shards: 1 } do
    mapping dynamic: 'false' do
      indexes :first_name
      indexes :last_name
    end
  end



  def self.search(query, user)
    __elasticsearch__.search(
      {
        query: {
          bool: {
            must: {
              multi_match: {
                query: query,
                fields: ['first_name', 'last_name'],
              }
            },
            filter: {
              term: { user_id: user.id }
            }
          }
        },
        # more blocks will go IN HERE. Keep reading!
      })
  end

  #def self.search(query, filters)
  #  return Freind.__elasticsearch__.search(query, filter)
  #end
end
