class SplitDetail
  include ActiveModel::Model
  include ActiveRecord::AttributeAssignment
  include DelegateAttribute

  attr_accessor :split
  delegate :name, :owner_app, :variants, :assignments, :created_at, :finished?, :has_details?, to: :split
  delegate_attribute :hypothesis, :assignment_criteria, :description, :owner, :location, :platform, to: :split

  validates :hypothesis, :assignment_criteria, :description, :owner, :location, :platform, presence: true
  validates :platform, inclusion: { in: %w(mobile desktop) }

  def initialize(params)
    raise 'A split is required to create split details' unless params[:split].present?
    self.split = params.delete(:split)
    super
  end

  def variant_details
    variants.map do |variant|
      detail = VariantDetail.find_or_initialize_by(split: split, variant: variant)
      VariantPresenter.new(detail)
    end
  end

  def save
    if valid?
      split.save!
      true
    else
      false
    end
  end
end
