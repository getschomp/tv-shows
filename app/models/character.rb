class Character < ActiveRecord::Base
  belongs_to :television_show

  validates :character_name,
  presence: true,
  uniqueness: { scope: :actor_name}
  validates :actor_name,
  presence: true,
  uniqueness: { scope: :character_name}
  # uniqueness: { scope: :network }
  validates :television_show_id,
  presence: true

end
