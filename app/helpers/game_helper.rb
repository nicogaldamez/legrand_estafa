module GameHelper

  def cell(row, col, game)
    css, content = cell_css_and_content(row, col, game)
    content_tag :div,
      class: "cell flex grow text-sm text-center text-white border-indigo-500 border-sky-500 border border-dashed #{css}" do
      content_tag :span, content, class: 'm-auto text-2xl'
    end
  end

  private

  def cell_css_and_content(row, col, game)
    if game.map.there_is_an_obstacle?(row: row, col: col)
      return ['bg-red-800', '☠️']
    end

    case [row, col]
    when game.map.initial_position
      ['bg-red-200', '👵']
    when game.map.flag_position
      ['bg-green-200', '💊']
    else
      ['bg-slate-700', '🔘']
    end
  end

end
