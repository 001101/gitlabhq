class EnvironmentScaling < ActiveRecord::Base
  belongs_to :environment, required: true

  validates :replicas, numericality: { only_integer: true }, presence: true

  def self.available_for?(environment)
    if environment.project.group
      return false unless environment.project.group.variables.where(key: incompatible_variables_for(environment)).empty?
    end

    environment.project.variables.where(key: incompatible_variables_for(environment)).empty?
  end

  def self.incompatible_variables_for(environment)
    ["#{environment.variable_prefix}_REPLICAS"]
  end

  def available?
    self.class.available_for?(environment)
  end

  def predefined_variables
    Gitlab::Ci::Variables::Collection.new.tap do |variables|
      variables.append(key: "#{environment.variable_prefix}_REPLICAS", value: replicas)
    end
  end

  private

  def incompatible_variables
    self.class.incompatible_variables_for(environment)
  end
end
