class Ui::Container < Ui::BoxComponent
  private

  def classes
    [DEFAULT_PROSE_CONTAINER]
  end

  def remove_options
    [:spacing]
  end
end
