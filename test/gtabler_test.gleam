import gleam/io
import gtabler
import gtabler/color
import gtabler/style

pub fn main() {
  let headers = ["Name", "Age", "Country"]
  let rows = [
    ["Alice", "30", "USA"],
    ["Bob", "25", "UK"],
    ["Carlos", "35", "Guatemala"],
  ]

  io.println("=== Default Table ===")
  let default_table = gtabler.print_table(default_config(), headers, rows)
  io.println(default_table)

  io.println("=== Colored Headers ===")
  let colored_header_config =
    gtabler.TableConfig(
      separator: " | ",
      border_char: "-",
      header_color: fn(text) { color.blue(text) },
      cell_color: fn(text) { text },
    )
  let colored_header_table =
    gtabler.print_table(colored_header_config, headers, rows)
  io.println(colored_header_table)

  io.println("=== Bold Headers and Underlined Rows ===")
  let styled_table_config =
    gtabler.TableConfig(
      separator: " | ",
      border_char: "=",
      header_color: fn(text) { style.bold(text) },
      cell_color: fn(text) { style.underline(text) },
    )
  let styled_table = gtabler.print_table(styled_table_config, headers, rows)
  io.println(styled_table)

  io.println("=== Complex Table with Red Headers and Green Cells ===")
  let complex_table_config =
    gtabler.TableConfig(
      separator: " || ",
      border_char: "=",
      header_color: fn(text) { color.red(style.bold(text)) },
      cell_color: fn(text) { color.green(text) },
    )
  let complex_table = gtabler.print_table(complex_table_config, headers, rows)
  io.println(complex_table)
}

fn default_config() -> gtabler.TableConfig {
  gtabler.TableConfig(
    separator: " | ",
    border_char: "-",
    header_color: fn(text) { text },
    cell_color: fn(text) { text },
  )
}
