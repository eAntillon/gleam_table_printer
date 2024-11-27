//// A Gleam module for pretty-printing tables.

import gleam/int
import gleam/list
import gleam/string

/// A type representing the configuration of a table.
pub type TableConfig {
  TableConfig(
    separator: String,
    border_char: String,
    header_color: fn(String) -> String,
    cell_color: fn(String) -> String,
  )
}

/// Print a table with the given configuration, headers, and rows.
pub fn print_table(
  config c: TableConfig,
  headers h: List(String),
  rows r: List(List(String)),
) {
  let column_widths = calculate_column_widths([h, ..r])
  let header_row = format_row(h, column_widths, c.header_color, c.separator)
  let separator = format_separator(column_widths, c.border_char, c.separator)
  let data_rows =
    r
    |> list.map(fn(row) {
      format_row(row, column_widths, c.cell_color, c.separator)
    })
  header_row <> "\n" <> separator <> "\n" <> string.join(data_rows, "\n")
}

fn calculate_column_widths(rows: List(List(String))) -> List(Int) {
  let rows_width = list.map(rows, fn(row) { list.map(row, string.length) })
  list.fold(over: rows_width, from: [], with: fn(acc, row) {
    case acc, row {
      [], [] -> list.repeat(0, list.length(row))
      [], row -> row
      row, acc ->
        list.zip(row, acc)
        |> list.map(fn(x) { int.max(x.0, x.1) })
    }
  })
}

fn format_row(
  row: List(String),
  widths: List(Int),
  color: fn(String) -> String,
  separator: String,
) -> String {
  list.zip(row, widths)
  |> list.map(fn(x) { color(pad_column(x.0, x.1)) })
  |> string.join(separator)
}

fn format_separator(
  widths: List(Int),
  border_char: String,
  separator: String,
) -> String {
  widths
  |> list.map(fn(width) { list.repeat(border_char, width) |> string.join("") })
  |> string.join(separator)
}

fn pad_column(value: String, width: Int) -> String {
  value <> { list.repeat(" ", width - string.length(value)) |> string.join("") }
}
