class Song < ApplicationRecord
  validates :title, presence: true
  validates_uniqueness_of :title, scope: [:artist_name, :release_year]
  #validates :released, inclusion: { in: %w(true false) }
  validates :release_year,
            if: :released?,
            presence: true,
            inclusion: { in: 1900..Date.today.year }
  validates :artist_name, presence: true

  def released?
    released
  end
end
