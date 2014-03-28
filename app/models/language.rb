class Language < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  has_many :snippets

  def self.extensions_map
    all.inject({}) do |hash, record|
      hash[record.extension] = record.id.to_s
      hash
    end
  end
end
