module ViewBasedModel
  extend ActiveSupport::Concern

  # View Models are made out of database views, so they are read only
  def readonly? = true
end
