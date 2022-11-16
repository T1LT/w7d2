# == Schema Information
#
# Table name: albums
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  year       :integer          not null
#  band_id    :bigint           not null
#  album_type :boolean          default(TRUE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Album < ApplicationRecord
    ALBUM_TYPES = [true, false]
    validates :title, :year, presence: true
    validates :band_id, uniqueness: { scope: :title }
    validates :album_type, inclusion: { in: ALBUM_TYPES }

    belongs_to :band,
        foreign_key: :band_id,
        class_name: :Band
end
