# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  has_many :artworks,
    foreign_key: :artist_id,
    dependent: :destroy,
    class_name: :Artwork
    

  has_many :artworkshares,
    foreign_key: :viewer_id,
    dependent: :destroy,
    class_name: :Artworkshare
    

  has_many :shared_artworks,
    through: :artworkshares,
    source: :artwork
end
