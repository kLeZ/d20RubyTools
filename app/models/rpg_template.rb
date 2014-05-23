class RpgTemplate < ActiveRecord::Base
  has_many :feat_template, dependent: :destroy
  has_many :skill_template, dependent: :destroy
  has_many :stat_template, dependent: :destroy
  has_many :level_template, dependent: :destroy
  has_many :health_points_template, dependent: :destroy
end
