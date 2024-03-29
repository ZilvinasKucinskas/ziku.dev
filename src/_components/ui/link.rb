class Ui::Link < Ui::BoxComponent
  BUTTON_LINK_CLASSES =
    "inline-flex items-center justify-center p-2
    text-sm font-medium rounded-md
    text-zinc-700 dark:text-zinc-300
    bg-zinc-100 dark:bg-zinc-800
    hover:bg-zinc-300 hover:text-zinc-800 dark:hover:bg-zinc-700 dark:hover:text-zinc-300
    focus:outline-none focus:ring-2 focus:ring-inset focus:ring-zinc-50 dark:focus:ring-zinc-900
    ".freeze

  private

  def classes
    class_list = []
    class_list << opts.fetch(:hover, "hover:text-sky-500 dark:hover:text-sky-400")
    class_list << opts.fetch(:weight, "font-semibold")
    class_list << "!text-sky-500 dark:!text-sky-400" if opts[:active]

    list = button_link? ? BUTTON_LINK_CLASSES : class_list
    list = [] if variant == :none
    list
  end

  def button_link?
    opts.fetch(:button, false)
  end

  def add_options
    external = opts[:external] || opts[:href].to_s.starts_with?("https")
    opts[:target] = "_blank" if external
    opts[:rel] = "noopener noreferrer" if external
  end

  def remove_options
    [:hover, :weight, :active, :external]
  end

  def default_tag
    :a
  end
end
