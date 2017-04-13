class SplitPresenter < SimpleDelegator
  def variant_details
    details = __getobj__.detail.variant_details
    details.map do |detail|
      VariantPresenter.new(detail)
    end
  end
end
