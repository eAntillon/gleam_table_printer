# gtabler

[![Package Version](https://img.shields.io/hexpm/v/gtabler)](https://hex.pm/packages/gtabler)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/gtabler/)

```sh
gleam add gtabler
```

```gleam
import gleam/io
import gtabler

pub fn main() {
  let config =
    gtabler.TableConfig(
      separator: " | ",
      border_char: "-",
      header_color: fn(text) { text },
      cell_color: fn(text) { text },
    )

  let headers = ["Name", "Age", "Country"]
  let rows = [
    ["Alice", "30", "USA"],
    ["Bob", "25", "UK"],
    ["Carlos", "35", "Guatemala"],
  ]

  gtabler.print_table(config, headers, rows)
  |> io.print
}

```

```shell
$ gleam run
Name   | Age | Country
------ | --- | ---------
Alice  | 30  | USA
Bob    | 25  | UK
Carlos | 35  | Guatemala
```

### Customization

```gleam
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
```

```shell
$ gleam run
=== Default Table ===
Name   | Age | Country
------ | --- | ---------
Alice  | 30  | USA
Bob    | 25  | UK
Carlos | 35  | Guatemala
=== Colored Headers ===
Name   | Age | Country    // Blue headers
------ | --- | ---------
Alice  | 30  | USA
Bob    | 25  | UK
Carlos | 35  | Guatemala
=== Bold Headers and Underlined Rows ===
Name   | Age | Country    // Bold headers
====== | === | =========
Alice  | 30  | USA        // Underlined rows
Bob    | 25  | UK         
Carlos | 35  | Guatemala  
=== Complex Table with Red Headers and Green Cells ===
Name   || Age || Country    // Red bold headers and custom column separator
====== || === || =========
Alice  || 30  || USA        // Green cells
Bob    || 25  || UK         
Carlos || 35  || Guatemala  

```



Further documentation can be found at <https://hexdocs.pm/gtabler>.

## Development

```sh
gleam run   # Run the project
gleam test  # Run the tests
```
