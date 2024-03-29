class Ui::Stack < Ui::BoxComponent
  private

  def classes
    [opts.fetch(:spacing, "space-y-4 md:space-y-8"), DEFAULT_FLEX_COL]
  end

  def remove_options
    [:spacing]
  end
end
